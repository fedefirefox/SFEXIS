function tests = test_original_scripts
% Run the user's full scripts, then check the original matrix formula.
tests = functiontests(localfunctions);
end

function setupOnce(testCase)
root = fileparts(fileparts(mfilename('fullpath')));
testCase.TestData.root = root;
testCase.TestData.oldPath = path;
testCase.TestData.visibility = get(groot,'DefaultFigureVisible');
set(groot,'DefaultFigureVisible','off');
scripts = {'SFEXIS.m','examples/SFEXIS_rabbitt.m', ...
    'examples/SFEXIS_streaking.m','examples/SFEXIS_field_free.m'};
for k = 1:numel(scripts)
    filename = fullfile(root,scripts{k});
    started = tic;
    % Scripts deliberately clear their workspace, as the original did.
    % Execute in the base workspace so the test harness remains intact.
    evalin('base',sprintf('run(''%s'');',strrep(filename,'''','''''')));
    folder = evalin('base','SavingDirectory');
    data = load(fullfile(folder,'Wetot.mat'));
    testCase.TestData.runs{k} = data;
    testCase.TestData.folders{k} = folder;
    fprintf('Full script %s: %.2f s, %d delays x %d energies\n', ...
        scripts{k},toc(started),numel(data.delay),numel(data.E_fin));
end
end

function teardownOnce(testCase)
evalin('base','clearvars; close all;');
set(groot,'DefaultFigureVisible',testCase.TestData.visibility);
path(testCase.TestData.oldPath);
end

function testAllScriptsRunAndSave(testCase)
for k = 1:4
    r = testCase.TestData.runs{k};
    verifySize(testCase,r.WE,[numel(r.delay) numel(r.E_fin)]);
    verifyTrue(testCase,all(isfinite(r.WE(:))) && all(r.WE(:)>=0));
    verifyEqual(testCase,max(r.fp(:)),1,'AbsTol',eps);
    verifyTrue(testCase,contains(r.Citation,'10.1088/2515-7647/ac7991'));
    folder = testCase.TestData.folders{k};
    verifyTrue(testCase,isfile(fullfile(folder,'XUVIRField.fig')));
    verifyTrue(testCase,isfile(fullfile(folder,'WeFINALE.fig')));
    info = imfinfo(fullfile(folder,'WeFINALE.png'));
    verifyGreaterThan(testCase,info.Width,500);
end
end

function testDefaultAndRabbittExampleAgree(testCase)
verifyEqual(testCase,testCase.TestData.runs{1}.WE,testCase.TestData.runs{2}.WE);
end

function testOriginalMatrixIntegralAgreement(testCase)
for example = 1:4
    r = testCase.TestData.runs{example};
    rows = unique(round(linspace(1,numel(r.delay),7)));
    columns = unique(round(linspace(1,numel(r.E_fin),5)));
    xuv = zeros(numel(rows),numel(r.tSim));
    for k = 1:numel(rows)
        shift = round(r.delay(rows(k))/r.dt);
        xuv(k,:) = circshift(r.Esim_XUV,shift);
        if shift<0
            xuv(k,end+shift+1:end)=0;
        elseif shift>0
            xuv(k,1:shift)=0;
        end
    end
    % Direct unoptimized matrix calculation from legacy/SFEXIS.m.
    time = min(r.tSim):r.dt:max(r.tSim);
    T = ones(numel(rows),numel(time)).*(time/r.timeau);
    A_IR_trace = ones(numel(rows),numel(r.Asim_IR)).*r.Asim_IR;
    original = complex(zeros(numel(rows),numel(columns)));
    for j = 1:numel(columns)
        momentum = sqrt(2*r.E_fin(columns(j))/r.EAu);
        tempIR = A_IR_trace(:,1:numel(time));
        Saux = -tempIR(:,1)+tempIR+momentum;
        Saux = 0.5*flip(cumsum(flip(Saux.^2,2),2),2)*r.dt/r.timeau;
        arg = exp(-1i*Saux).*exp(1i*r.Ip/r.EAu*(T-min(time)/r.timeau)).*xuv;
        original(:,j) = -1i*sum(arg,2)*r.dt/r.timeau;
    end
    relative = norm(original-r.av(rows,columns),'fro')/norm(original,'fro');
    fprintf('Original matrix formula, example %d: relative amplitude error %.3g\n',example,relative);
    verifyLessThan(testCase,relative,1e-12);
end
end

function testFieldFreeDelayInvariance(testCase)
r = testCase.TestData.runs{4};
relative = max(abs(r.WE-r.WE(ceil(end/2),:)),[],'all')/max(r.WE(:));
fprintf('Original-field zero-IR delay-invariance error: %.3g\n',relative);
verifyLessThan(testCase,relative,1e-8);
verifyEqual(testCase,max(abs(r.Asim_IR)),0);
end

function testStreakingVariesWithDelay(testCase)
r = testCase.TestData.runs{3};
centroid = sum(r.WE.*r.E_fin,2)./sum(r.WE,2);
verifyGreaterThan(testCase,max(centroid)-min(centroid),2);
end
