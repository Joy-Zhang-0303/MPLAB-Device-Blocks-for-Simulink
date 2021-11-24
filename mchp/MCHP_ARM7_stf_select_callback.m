function MCHP_ARM7_stf_select_callback(varargin)
% MCHP_ARM7_stf_select_callback callback handler for dspic real-time options

hDlg = varargin{1};
hSrc = varargin{2};

Configuration = {...
    { 'GenerateSampleERTMain',    'off'   , false},...
    { 'ERTCustomFileTemplate',    'MCHP_main.tlc'   , false},...
    { 'TargetLang',               'C'   , false},...
    { 'SuppressErrorStatus',      'on'   , true},...		%% This generates errors (traps) with Stateflow, but is required for External mode.
    { 'MatFileLogging',           'off'   , false},...
    { 'GRTInterface',             'off'   , false},...
    { 'SupportNonInlinedSFcns',   'on'   , false},...
    { 'UtilityFuncGeneration',    'Auto'   , false},...
    { 'IncludeMdlTerminateFcn',   'off'   , false},...
    { 'ERTDataHdrFileTemplate',   'MCHP_dsPIC_code_template.cgt'   , false},...
    { 'ERTDataSrcFileTemplate',   'MCHP_dsPIC_code_template.cgt'   , false},...
    { 'ERTHdrFileBannerTemplate',   'MCHP_dsPIC_code_template.cgt'   , false},...
    { 'ERTSrcFileBannerTemplate',   'MCHP_dsPIC_code_template.cgt'   , false},...
    ...
    { 'ExtModeStaticAllocSize',   2000   , true},...         % Default Static size
    ...
    { 'ModelReferenceCompliant',  'on'   , false},...
    { 'ParMdlRefBuildCompliant',  'off'   , true},...
    ...
    { 'ProdHWDeviceType',         'ARM Compatible->ARM Cortex'   , true},...    %% New name is ARM Cortex-M . Might be an error as atomic size for floating-point is float, not double.
    ...
    { 'MaxIdLength',			255, true},...	% Identifier length must be more than 31 (default) for PIL
    { 'ModelReferenceNumInstancesAllowed',			'Single', true},...	%  for PIL
    ...
    {'CombineSignalStateStructs','on',true},...
    ...
    {'BooleansAsBitfields','on',true},... %% December 2017
    {'DefaultUnderspecifiedDataType','single',true},... %% December 2017
    {'TargetLangStandard','C89/C90 (ANSI)',true},... %% December 2017 'C89/C90 (ANSI)' or 'C99 (ISO)'. XC16 not compatible with C99, cause possible issue with floating point calculation (converting float to integer with convergent rounding trig an error due to missing function "trunc") 
    {'WideLines','on',true},... %% December 2017
    {'SampleTimeColors','on',true},... %% December 2017
    {'MaxLineWidth',110,'on'}... % November 2020   from R2018b
    };

    % { 'ProdEqTarget',             'on'   , false},...        % Prod and Target hardware are equal (Target code running on prod hardware...)
    % { 'ProdBitPerChar',           8   ,  false},...
    % { 'ProdBitPerShort',          16   , false},...
    % { 'ProdBitPerInt',            32   ,  false},...
    % { 'ProdBitPerLong',           32   , false},...           % to be checked
    % { 'ProdBitPerLongLong',       64   , false},...
    % { 'ProdBitPerPointer',        32   , false},...
    % { 'ProdWordSize',             32   ,   false},...       % Target wordsize
    % { 'ProdLongLongMode',       'on' , false},...     % to check, does not work when set to off !
    % { 'ProdShiftRightIntArith',   'on'   , false},...
%     { 'ProdEndianess',            'LittleEndian'   , false},...
%     { 'ProdIntDivRoundTo',        'Zero'   , false},... % 'Floor' | 'Zero' | {'Undefined'}  <== Should be confirmed
    % { 'ProdLargestAtomicInteger', 'Long'   , false},...
    % { 'ProdLargestAtomicFloat',   'Float'   , false},...
%    ...
%    { 'ProdBitPerSizeT',             32   , true},...  % Size for size_t introduced within Matlab R2016b, return of sizeof operator.
%    { 'ProdBitPerPtrDiffT',          32   , true},...  % result of the subtracting two pointer; introdice with Matlab R2016b
%    ...

%    { 'TargetLibSuffix',          '_lib.a'   , ''},... %% not compatible with toolchain compliant

% Optimisation :
% set_param(cs,'MatFileLogging','off');
% set_param(cs,'SupportNonFinite','off');
% set_param(cs,'RTWCompilerOptimization','on');
% set_param(cs,'OptimizeBlockIOStorage','on');
% set_param(cs,'EnhancedBackFolding','on');
% set_param(cs,'ConditionallyExecuteInputs','on')
% set_param(cs,'InlineParams','on');
% set_param(cs,'BooleanDataType','on');
% set_param(cs,'BlockReduction','on');
% set_param(cs,'ExpressionFolding','on');
% set_param(cs,'LocalBlockOutputs','on');
% set_param(cs,'EfficientFloat2IntCast','on');
% set_param(cs,'BufferReuse','on')

% Setup these options as desired and gray them out
waitbarMax = length(Configuration);
h = waitbar(0,'Set-up Simulink parameters for Microchip Cortex-M7');
ListParam = slConfigUIGetVal(hDlg, hSrc, 'ObjectParameters');
for i=1:length(Configuration)
    if isfield(ListParam,Configuration{i}{1})
        try
            tmp = slConfigUIGetVal(hDlg, hSrc, Configuration{i}{1});
            if strcmp(tmp,Configuration{i}{2}) ~= 1
                slConfigUISetVal(hDlg, hSrc, Configuration{i}{1}, Configuration{i}{2});
%                disp([Configuration{i}{1} ' was -> ' tmp ' set -> ' Configuration{i}{2}]);  % debug
            end
            if ~isempty(Configuration{i}{3})
                slConfigUISetEnabled(hDlg, hSrc, Configuration{i}{1},Configuration{i}{3});
            end
        catch
            disp([ 'Warning: ' Configuration{i}{1} ' options could not be set.']);
        end
    else
        % disp([ 'Warning: ' Configuration{i}{1} ' options does not exist on this Matlab version.']);
    end
    
    if ishghandle(handle(h))   % Check that progress bar not closed by user
        h = waitbar(i/(waitbarMax+3),h);
    end
    
end

if verLessThan('Simulink','8.3')
    try
        CodeReplacementLibrary = slConfigUIGetVal(hDlg, hSrc, 'CodeReplacementLibrary');
        if strcmpi(CodeReplacementLibrary,'None') || strcmpi(CodeReplacementLibrary,'NOT IN USE')
            slConfigUIGetVal(hDlg, hSrc, 'CodeReplacementLibrary','ANSI_C');
            disp('Warning: Problem with the code Replacement Library selected. This issue can occurs when the simulink model has been saved with another Matlab release. Code replacement is set to default value.');
        end
    catch
        %% CodeReplacementLibrary does not exist on older Matlab release.
    end
end


%Matalb Version : no 'PostCodeGenCommand' in verson previous to 2006 !
%  MCHP_dsPIC_stf_select_callback(gcs,'PostCodeGenCommand','dsPIC_Compile()');
% On d�tourne ici la fonction de generation du makefile (make_rtw) vers notre propre fonction qui apelle make_rtw, puis g�n�re le projet MPLAB (mcp)
%;dsPIC_CreateMPLAB(''dsPIC'') % appele juste avant la generatino du makefile : problem !

% Detourne la fonction de generation du makefile pour la faire suivre de la creation du projet MPLAB
% set_param(gcs,'RTWMakeCommand','make_CreateMPLAB') Should replace the make_rtw in top of file instead of redefining it there !

tmp = get_param(bdroot(gcs),'PostCodeGenCommand');
if strcmp(tmp,'MplabGetBuildinfo(buildInfo)') == 1
    disp('model using an old blockset. updated with current blockset info.');
    set_param(bdroot(gcs),'PostCodeGenCommand','');	% Might create a problem if defined with an older function like: MplabGetBuildinfo(buildInfo)
end


enableToolchainCompliant(hSrc, hDlg);


% Check Solver is Fixed Step DiscreteSolver Configuration
MCHP_CheckSolver_stf(hDlg,hSrc)
%  slConfigUISetVal(hDlg, hSrc, 'SolverType','Fixed-step');
%  slConfigUISetVal(hDlg, hSrc, 'Solver','FixedStepDiscrete');
%  slConfigUISetVal(hDlg, hSrc, 'Solver','FixedStep');


%    slConfigUISetVal(hDlg, hSrc,'ModelStepFunctionPrototypeControlCompliant','on');	% to configure custom time step call, very usefull for new target !

if ishghandle(handle(h))   % Check that progress bar not closed by user
    close(h);
    drawnow expose;
end

end


function enableToolchainCompliant(hSrc, hDlg)
  hCS = hSrc.getConfigSet();
  
  % The following parameters enable toolchain compliance.
  slConfigUISetVal(hDlg, hSrc, 'UseToolchainInfoCompliant', 'on');
  hCS.setProp('GenerateMakefile','on');
  
  % The following parameters are not required for toolchain compliance.
  % But, it is recommended practice to set these default values and 
  % disable the parameters (as shown).
  hCS.setProp('RTWCompilerOptimization','off');
  hCS.setProp('MakeCommand','make_rtw');
  hCS.setPropEnabled('RTWCompilerOptimization',false);
  hCS.setPropEnabled('MakeCommand',false);
  
  
  config = reg_xc32_SAMx70_tc();    % list registered compilers
  if numel(config) > 0    
    slConfigUISetVal(hDlg, hSrc, 'Toolchain', config(1).Name);  % Set compiler
  else
      warning('No compiler found for selected chip. Please download XC32 compiler at https://www.microchip.com/compilers');
  end
    % get_param(gcs,'Toolchain') ==> 'XC32 2.15 for Mirochip SAMx7 device'
    % get_param(gcs,'CustomToolchainOptions')
    % get_param(gcs,'BuildConfiguration') : 'Specify'

end



