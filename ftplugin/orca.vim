if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal commentstring=#\ %s
setlocal comments=:#
setlocal omnifunc=OrcaComplete
setlocal nosmartindent

" Tab/S-Tab: navigate popup when open, else normal indent
inoremap <buffer> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Auto-trigger omni completion; suppress the sub-mode message inside insert only
augroup OrcaAutoComplete
  autocmd InsertEnter  <buffer> set shortmess+=c
  autocmd InsertLeave  <buffer> set shortmess-=c
  autocmd TextChangedI <buffer> call OrcaAutoTrigger()
augroup END

function! OrcaAutoTrigger()
  if pumvisible() | return | endif
  if col('.') > 1 && getline('.')[col('.')-2] =~# '\w'
    call feedkeys("\<C-x>\<C-o>", "n")
  endif
endfunction

" Block parameter lists (from ORCA 6.1 manual, section 2.1.6).
" This dict is the single source of truth: it drives both omni-completion and
" syntax highlighting (see population loop below).
if !exists("g:orca_block_params")
  let g:orca_block_params = {}

  let g:orca_block_params['scf'] = [
    \ 'AlphaConf', 'AutoStart', 'AutoTRAH', 'AutoTRAHIter', 'AutoTRAHNInter',
    \ 'AutoTRAHTol', 'BetaConf', 'BFCut', 'CNVDIIS', 'ConvCheckMode',
    \ 'Convergence', 'ConvForced', 'D3Thresh', 'D4Thresh', 'D5Thresh',
    \ 'Damp', 'DampErr', 'DeltaSCFFromGS', 'DIIS', 'DIISBfac', 'DIISMaxEq',
    \ 'DIISMaxIt', 'DIISStart', 'DirectResetFreq', 'DoMOM',
    \ 'EasyConv', 'EField', 'EFieldOrigin', 'ETol', 'FOD', 'FracOcc',
    \ 'GTol', 'Guess', 'GuessMix', 'GuessMode', 'HCore', 'HFTyp',
    \ 'IonizeAlpha', 'IonizeBeta', 'KeepInitialRef', 'KeepInts', 'KDIIS',
    \ 'LSCFalpha', 'LSCFbeta', 'LSD', 'LShift', 'MaxC', 'MaxDisk',
    \ 'MaxIntMem', 'MaxIter', 'MOInp', 'NoDamp', 'NoDIIS', 'NoLShift',
    \ 'NormalConv', 'NoSmear', 'NoSOSCF', 'NoTRAH', 'PMOM', 'Precond',
    \ 'QField', 'ROKS', 'Rotate', 'RTol', 'SCFMode', 'ShiftErr', 'SlowConv',
    \ 'SMD', 'Smear', 'SOSCFBlockDiag', 'SOSCFConstrainedMaxStep',
    \ 'SOSCFConstraints', 'SOSCFConvFactor', 'SOSCFHessUp', 'SOSCFMaxIt',
    \ 'SOSCFMaxStep', 'SOSCFStart', 'SOSCF',
    \ 'STABDTol', 'STABEWIN', 'STABlambda', 'STABMaxDim', 'STABMaxIter',
    \ 'STABNGuess', 'STABNRoots', 'STABORBWin', 'STABPerform',
    \ 'STABRestartUHFifUnstable', 'STABRTol',
    \ 'STol', 'TCut', 'TCutInt', 'Thresh', 'TolE', 'TolErr',
    \ 'TolFacMicro', 'TolG', 'TolMAXP', 'TolRMSP', 'TolX', 'TRAH',
    \ 'VerySlowConv', 'Z_Tol']

  let g:orca_block_params['basis'] = [
    \ 'AddAuxCGTO', 'AddAuxJGTO', 'AddAuxJKGTO', 'AddCABSGTO', 'AddGTO',
    \ 'AllowGhostECP', 'AutoAux', 'AutoAuxLLimit', 'AutoAuxLmax', 'AutoAuxSize',
    \ 'AutoAuxTightB', 'AuxC', 'AuxJ', 'AuxJC', 'AuxJK', 'Basis', 'CABS',
    \ 'Decontract', 'DecontractAuxC', 'DecontractAuxJ', 'DecontractAuxJK',
    \ 'DecontractBas', 'DecontractCABS', 'DelECP', 'ECP', 'FragAuxC', 'FragAuxJ',
    \ 'FragAuxJK', 'FragBasis', 'FragCABS', 'FragECP', 'GhostECP', 'GTOAuxCName',
    \ 'GTOAuxJKName', 'GTOAuxJName', 'GTOAuxName', 'GTOCABSName', 'GTOName',
    \ 'NewAuxCGTO', 'NewAuxJGTO', 'NewAuxJKGTO', 'NewCABSGTO', 'NewECP', 'NewGTO',
    \ 'NoDecontractAuxC', 'NoDecontractAuxJ', 'NoDecontractAuxJK', 'NoDecontractBas',
    \ 'NoECP', 'OldAutoAux', 'PCDThresh', 'PCDTrimAuxC', 'PCDTrimAuxJ',
    \ 'PCDTrimAuxJK', 'PCDTrimBas', 'ReadFragAuxC', 'ReadFragAuxJ', 'ReadFragAuxJK',
    \ 'ReadFragBasis', 'ReadFragCABS', 'ReadFragECP', 'SThresh']

  let g:orca_block_params['geom'] = [
    \ 'AddExtraBonds', 'AddExtraBonds_MaxDist',
    \ 'AddExtraBonds_MaxLength', 'Almloef', 'AUTOFRAG', 'BFGS', 'BIAS',
    \ 'Bofill', 'BOXPOT', 'Calc_Hess', 'cartfallback',
    \ 'ConnectFragments', 'ConstrainFragments', 'Constraints',
    \ 'Convergence', 'coordsys', 'COpt', 'ELLIPSEPOT', 'EV_Reverse',
    \ 'Ext_Params', 'EXTOPTEXE', 'FixFrags', 'Frags', 'freezeHydrogens',
    \ 'GFNFF', 'Hess_Internal', 'HESS_MinEV', 'HESS_Modification',
    \ 'Hueckel', 'Hybrid_Hess', 'InHess', 'inhess', 'InHessName',
    \ 'invertConstraints', 'Lindh', 'LooseOpt', 'MaxIter', 'MaxStep',
    \ 'modify_internal', 'MORead', 'NormalOpt', 'NResetHess',
    \ 'NStepsInResetHess', 'NumFreq', 'NumHess', 'Opt', 'OptElement',
    \ 'OptGuess', 'optimizeHydrogens', 'PAtom', 'PModel', 'Powell',
    \ 'PrintInternalHess', 'ProjectTR', 'Read', 'Recalc_Hess',
    \ 'ReducePrint', 'ReduceRedInts', 'RelaxFrags', 'RelaxHFrags',
    \ 'RigidFrags', 'RunTyp', 'Scan', 'Schlegel', 'Shift_Diag',
    \ 'Simul_Scan', 'SPHEREPOT', 'Step', 'Swart', 'TightOpt',
    \ 'TightSCF', 'TolE', 'TolMaxD', 'TolMaxG', 'TolRMSD', 'TolRMSG',
    \ 'Trust', 'Update', 'UseSOSCF', 'VeryTightOpt', 'XTB0', 'XTB1',
    \ 'XTB2']

  let g:orca_block_params['method'] = [
    \ 'ACM', 'ACM_A', 'ACM_B', 'ACM_C',
    \ 'CASDFT', 'CBetaPBE', 'CheckFrozenCore', 'CIM', 'ComplexTranslation',
    \ 'CorrectFrozenCore', 'Correlation', 'COSX_IntSymmetry', 'COSX_PartialContraction',
    \ 'D3A1', 'D3A2', 'D3alpha6', 'D3RS6', 'D3S6', 'D3S8',
    \ 'D4A1', 'D4A2', 'D4S6', 'D4S8', 'D4S9',
    \ 'DFT', 'DFTDOpt', 'DFTDScaleC6', 'Docker', 'DoGCP', 'DoMP2',
    \ 'EDA', 'Energy', 'EnergyGrad', 'EnGrad',
    \ 'Exchange', 'Functional', 'FrozenCore',
    \ 'GCPMethod', 'GeometryOpt', 'Gradient', 'GridX',
    \ 'HF', 'IntAccX',
    \ 'LDAOpt', 'MD', 'Method', 'MM', 'ModeTrajectory', 'MTR',
    \ 'NMGrad', 'NMGradient', 'NMScan', 'NormalModeGradient', 'NormalModeScan',
    \ 'Opt', 'OrthogonalCI',
    \ 'PrintThermoChem', 'PropertiesOnly',
    \ 'RangeSepEXX', 'RangeSepMu', 'RangeSepScal', 'RI', 'ROHF', 'ROKS', 'RunTyp',
    \ 'ScalDFX', 'ScalGGAC', 'ScalHFX', 'ScalLDAC', 'ScalMP2C',
    \ 'Scan', 'SFitInvertType', 'SInvThresh', 'SP',
    \ 'Trajectory', 'UseSFitting', 'UseQGradFit',
    \ 'XAlpha', 'XBeta', 'XKappa', 'XMuePBE']

  let g:orca_block_params['freq'] = [
    \ 'AnFreq', 'CentralDiff', 'CutOffFreq', 'Delq', 'DX',
    \ 'Hybrid_Hess', 'Increment', 'NumFreq', 'NumGrad',
    \ 'NumHessTransInvar', 'Partial_Hess', 'ProjectTR',
    \ 'QRRHORefFreq', 'QuasiRRHO', 'Restart', 'ScalFreq', 'T',
    \ 'Temp', 'TransInvar', 'XTBVPT2']

  let g:orca_block_params['mp2'] = [
    \ 'CalcS2', 'Density', 'Direct', 'DLPNO', 'DoRegMP2', 'DoSCS',
    \ 'EMax', 'EMin', 'EWin', 'F12', 'FCut', 'ForceDirect',
    \ 'GridX', 'IntAccX', 'KC_GridX', 'KC_IntAccX', 'KCOpt',
    \ 'LoosePNO', 'MaxCore', 'MaxOrbIter', 'MP2Shift', 'NatOrbs',
    \ 'NoIter', 'NormalPNO', 'OrbOpt', 'PertCan_EThresh',
    \ 'PertCan_UThresh', 'PrintLevel', 'Ps', 'Pt', 'Q1Opt',
    \ 'RegMP2Kappa', 'RegMP2Sigma', 'RegMP2Type', 'RespDijConv',
    \ 'RespStoreT', 'RI', 'TCutPNO', 'TightPNO', 'TNat',
    \ 'UsePertCanOrbs', 'Z_GridX', 'Z_IntAccX', 'ZLoc_Solver']

  let g:orca_block_params['mdci'] = [
    \ 'AD_Loewdin', 'AD_Mulliken', 'AD_SpinResolved',
    \ 'Brueckner', 'CCSD2', 'CheckEachRoot', 'citype', 'CoreHole', 'CoreThresh',
    \ 'Covalent', 'CovalPOL', 'CVSEP', 'Denmat', 'DoDIDplot', 'DoEOM',
    \ 'DoLanczos', 'DoLEDHF', 'Doleft', 'DoOlsen', 'DoRootwise', 'DoSDiagnostic',
    \ 'DoSingularPT', 'DoTDM', 'DoAlpha', 'DoBeta', 'DoCore',
    \ 'DOAOX3E', 'DOCOSXEOM', 'DRESS3ED', 'DRESS3ES', 'DTol',
    \ 'ewin', 'FB', 'FOLLOWCIS', 'IAOBOYS', 'IAOIBO', 'InCore', 'KCOpt',
    \ 'LED', 'LMP2ScaleTCutPNO', 'LShift', 'Localize', 'LocMaxIter',
    \ 'LocMaxIterLed', 'LocTocLed', 'LocTol', 'LoosePNO',
    \ 'MaxCore', 'MaxDIIS', 'MaxIter', 'NatOrbIters', 'NDav',
    \ 'NInits', 'NormalPNO', 'NRoots', 'NRootsPerBatch',
    \ 'OTol', 'pCCSDAB', 'pCCSDCD', 'pCCSDEF', 'PrintLevel', 'PrintOrbSelect',
    \ 'RootHoming', 'Singles', 'SingularPTThresh', 'STol',
    \ 'TCutDO', 'TCutMKN', 'TCutPairs', 'TCutPNO', 'TightPNO',
    \ 'TrafoType', 'Triples', 'UseEOMOptD', 'UseEOMOptS',
    \ 'UseCISUpdate', 'UseFullLMP2Guess', 'UseQROs',
    \ 'VirtualThresh', 'ZSimple']

  let g:orca_block_params['casscf'] = [
    \ 'ActConstraints', 'ActOrbs', 'AutoTRAH', 'bweight',
    \ 'CIPSIType', 'CIStep', 'DIIS', 'DIISThresh', 'dOrbs',
    \ 'DoFullSemiclassical', 'DoNDO', 'DoNTO', 'DOI', 'DoubleShell', 'DoubleShellMO',
    \ 'DThresh', 'ETol', 'ExactDiagSwitch', 'ExtOrbs',
    \ 'FlipSpin', 'fOrbs', 'FreezeActive', 'FreezeGrad', 'FreezeIE',
    \ 'GradScaling', 'GTol', 'ICEType', 'imult', 'IntOrbs', 'irrep', 'iroot',
    \ 'KDIIS', 'LMORBS', 'MaxDim', 'MaxDIIS', 'MaxIter', 'MaxM', 'MaxRot',
    \ 'MinShift', 'mult', 'NDOStates', 'nel', 'NGuessMat', 'norb', 'NRoots',
    \ 'NTOStates', 'NTOThresh', 'orbstep', 'OSZ', 'PMOS', 'PrintGState',
    \ 'PrintLevel', 'PrintWF', 'RefMO', 'ResetFreq', 'RIJCOSX', 'RTol',
    \ 'SDO', 'ShiftDn', 'ShiftUp', 'SOSCF', 'SuperCI_PT', 'switchdens',
    \ 'SwitchConv', 'SwitchIter', 'switchstep', 'SymThresh',
    \ 'TGen', 'TightSCF', 'TPrint', 'TrafoStep', 'TRAH', 'TVar',
    \ 'weights']

  let g:orca_block_params['tddft'] = [
    \ 'B', 'CPCMEQ', 'DecomposeFosc', 'DoDipoleLength',
    \ 'DoDipoleVelocity', 'DoFullSemiClassical', 'DoMCD', 'DoNTO',
    \ 'DoSoc', 'DOTRANS', 'EnStep', 'EThresh', 'ETol', 'EWin', 'FIR',
    \ 'FOLLOWIROOT', 'IRoot', 'IROOTLIST', 'IRootMult', 'LRCPCM',
    \ 'MaxCore', 'MaxDim', 'MaxIter', 'Mode', 'NGuessMat', 'NRoots',
    \ 'NTOStates', 'NTOThresh', 'OrbWin', 'PThresh', 'PTLimit', 'RTol',
    \ 'SaveUnrNatOrb', 'SocGrad', 'TDA', 'TPrint', 'triplets',
    \ 'TROOTLIST']

  let g:orca_block_params['cis'] = [
    \ 'B', 'CPCMEQ', 'DecomposeFosc', 'DoMCD', 'DoNTO', 'DoSoc',
    \ 'EnStep', 'EThresh', 'ETol', 'EWin', 'IRoot', 'IROOTLIST',
    \ 'IRootMult', 'LRCPCM', 'MaxCore', 'MaxDim', 'MaxIter', 'Mode',
    \ 'NGuessMat', 'NRoots', 'NTOStates', 'NTOThresh', 'OrbWin',
    \ 'PThresh', 'PTLimit', 'RTol', 'SaveUnrNatOrb', 'SocGrad', 'TDA',
    \ 'TPrint', 'triplets', 'TROOTLIST']

  let g:orca_block_params['eprnmr'] = [
    \ 'do_giao_soc2el', 'DSOC', 'DSS', 'dtensor', 'GIAO_2el',
    \ 'gtensor', 'gtensor_1el2el',
    \ 'hfcgaugecorrection_angulargrid',
    \ 'hfcgaugecorrection_bfcutoff', 'hfcgaugecorrection_intacc',
    \ 'hfcgaugecorrection_numeric', 'hfcgaugecorrection_prunegrid',
    \ 'hfcgaugecorrection_wcutoff', 'hfcgaugecorrection_zeff',
    \ 'LevelShift', 'LocOrbGBW', 'Mass2016', 'MaxDIIS', 'MaxIter',
    \ 'NMRCoal', 'NMREquiv', 'NMRSpecFreq', 'nuclei', 'ori',
    \ 'printEuler', 'Solver', 'SpinSpinAtomPairs',
    \ 'SpinSpinRThresh', 'Tol']

  let g:orca_block_params['pal'] = ['nprocs', 'nprocs_world', 'nprocs_group']

  let g:orca_block_params['xtb'] = [
    \ 'ACCURACY', 'ALPBSOLVENT', 'CPCMXSOLVENT', 'DDCOSMOSOLVENT',
    \ 'DOALPB', 'DOCPCMX', 'DODDCOSMO', 'DoMP2', 'EPSILON', 'ETEMP',
    \ 'MAXCORE', 'METHOD', 'NPROCS', 'READXTBPARAM', 'SmearTemp',
    \ 'UseXTBMixer', 'VERSION', 'WRITEXTBPARAM', 'XTB', 'XTB0', 'XTB1',
    \ 'XTB2', 'XTBFF', 'XTBFOD', 'XTBINPUTSTRING', 'XTBINPUTSTRING2',
    \ 'XTBPARAMFILE']

  let g:orca_block_params['output'] = [
    \ 'AIM', 'KeepTransDensity', 'LargePrint', 'MiniPrint', 'NoPrintMOs', 'NoPropFile',
    \ 'NoReducedPop', 'NormalPrint', 'PDBFILE', 'Print', 'PrintBasis', 'PrintGap',
    \ 'PrintLevel', 'PrintMOs', 'ReducedPop', 'SmallPrint', 'UNO', 'XYZFILE',
    \ 'P_AtCharges_L', 'P_AtCharges_M', 'P_AtomBasis', 'P_AtomDensFit', 'P_AtomExpVal',
    \ 'P_AtPopMO_L', 'P_AtPopMO_M', 'P_Basis', 'P_BondOrder_L', 'P_BondOrder_M',
    \ 'P_Cartesian', 'P_Density', 'P_DFTD', 'P_DFTD_GRAD', 'P_DIISError', 'P_DIISMat',
    \ 'P_Fockian', 'P_FragBondOrder_L', 'P_FragBondOrder_M', 'P_FragCharges_L',
    \ 'P_FragCharges_M', 'P_Fragments', 'P_FragOvlMO_L', 'P_FragOvlMO_M',
    \ 'P_FragPopMO_L', 'P_FragPopMO_M', 'P_G1EL2EL', 'P_GuessOrb', 'P_Hirshfeld',
    \ 'P_InputFile', 'P_Internal', 'P_Iter_C', 'P_Iter_F', 'P_Iter_P', 'P_KinEn',
    \ 'P_Loewdin', 'P_Mayer', 'P_MBIS', 'P_MOs', 'P_Mulliken', 'P_NatPop', 'P_NPA',
    \ 'P_OneElec', 'P_OrbCharges_L', 'P_OrbCharges_M', 'P_OrbEn', 'P_OrbPopMO_L',
    \ 'P_OrbPopMO_M', 'P_Overlap', 'P_ReducedOrbPop_L', 'P_ReducedOrbPop_M',
    \ 'P_ReducedOrbPopMO_L', 'P_ReducedOrbPopMO_M', 'P_S12', 'P_SCFInfo',
    \ 'P_SCFIterInfo', 'P_SCFMemInfo', 'P_SCFSTABANA', 'P_SpinDensity', 'P_Sym_Salc',
    \ 'P_Symmetry', 'P_UNO_AtPopMO_L', 'P_UNO_AtPopMO_M', 'P_UNO_FragPopMO_L',
    \ 'P_UNO_FragPopMO_M', 'P_UNO_OccNum', 'P_UNO_OrbPopMO_L', 'P_UNO_OrbPopMO_M',
    \ 'P_UNO_ReducedOrbPopMO_L', 'P_UNO_ReducedOrbPopMO_M']

  let g:orca_block_params['rel'] = [
    \ 'C', 'DKH', 'DKH1', 'DLU', 'FiniteNuc', 'fpFWtrafo',
    \ 'IntAcc', 'IORA', 'LightAtomThresh', 'Method', 'ModelDens',
    \ 'ModelPot', 'OneCenter', 'Order', 'PictureChange',
    \ 'PrintLevel', 'Rel1C', 'RelDLU', 'RelFull', 'ScaleZORA',
    \ 'SOCFlags', 'SOCMaxCenter', 'SOCOff', 'SOCType',
    \ 'SpecialGridIntAcc', 'StorageLevel', 'VELOCITY', 'X2C',
    \ 'Xalpha', 'Zeff', 'ZORA']

  let g:orca_block_params['cpcm'] = [
    \ 'AtomRadii', 'cds_cpcm', 'Corrected', 'COUPLED', 'CPCMccm',
    \ 'cut_area', 'cut_swf', 'draco', 'draco_charges', 'dracoisodens',
    \ 'epsilon', 'fepstype', 'Final', 'fopt',
    \ 'ndiv', 'num_leb', 'Outlying', 'pmin', 'radius', 'refrac', 'rmin', 'rsolv',
    \ 'scale_gauss', 'smd', 'SMD18', 'smdsolvent', 'sola', 'solb', 'solc',
    \ 'solg', 'solh', 'soln', 'soln25', 'solvent', 'surfacetype',
    \ 'thresh_h', 'thresh_noth', 'vopt', 'xfeps']

  let g:orca_block_params['md'] = [
    \ 'Accel', 'Anneal', 'Append', 'Atom', 'Cell', 'Celsius', 'CenterCOM',
    \ 'Colvar', 'Colvars', 'Constraint', 'CoordNumber', 'Cube', 'Cutoff', 'Damp',
    \ 'DCD', 'Define', 'Define_Region', 'Dihedral', 'Distance', 'Dump', 'Each',
    \ 'EnGrad', 'Fixed', 'Format', 'Gaussian', 'Group', 'Harmonic', 'Height',
    \ 'HillSpawn', 'History', 'Initvel', 'Kelvin', 'Last', 'List', 'Lower',
    \ 'Manage_Colvar', 'Manage_Colvars', 'Manage_Region', 'Massive', 'MaxGrad',
    \ 'Metadynamics', 'Minimize', 'MTS', 'Noise', 'Noprint', 'Position', 'Pressure',
    \ 'PrintLevel', 'Rad', 'Ramp', 'Randomize', 'Range', 'Rect', 'Region', 'Remove',
    \ 'RemoveAtoms', 'Replace', 'Reset', 'Restart', 'Restraint', 'Restraints',
    \ 'Rhomb', 'Rigid', 'RMSGrad', 'Run', 'Scale', 'SCFLog', 'Screendump', 'Sigma',
    \ 'Sphere', 'Spring', 'StepLimit', 'Steps', 'Store', 'Stride', 'Target',
    \ 'Temp', 'TempConv', 'Temperature', 'Thermostat', 'Thermostats', 'Timecon', 'Timestep',
    \ 'Upper', 'Vectors', 'Velocity', 'Wall', 'Weights', 'WellTempered', 'Yoshida']

  let g:orca_block_params['qmmm'] = [
    \ 'ActiveAtoms', 'ActiveCoreAtoms', 'ActiveCoreExtension_Type',
    \ 'ActiveCore_Extension', 'ActiveCore_Type', 'ChargeAlteration',
    \ 'CheckAutoFragBoundaries', 'CheckAutoFragForQMGaps', 'COV_BONDS',
    \ 'Dist_AtomsAroundOpt', 'Do_NB_For_Fixed_Fixed', 'Electrostatic', 'Embedding',
    \ 'ExtendActiveRegion', 'Frag', 'Fragments', 'Mechanical', 'OptRegion_FixedAtoms',
    \ 'ORCAFFFilename', 'PrintOptRegion', 'PrintOptRegionExt', 'PrintPDB', 'QMAtoms',
    \ 'QMCore_Extension', 'QMCore_Type', 'QMCoreAtoms', 'QMCoreExtension_Type',
    \ 'QMGap_MinLength', 'RCD', 'RIGID_MM_WATER', 'Scale_CS', 'Scale_RCD',
    \ 'Use_Active_InfoFromPDB']

  let g:orca_block_params['mm'] = [
    \ 'Coulomb14Scaling', 'CoulombCutOff', 'DielecConst', 'Dist_AtomsAroundOpt',
    \ 'Do_NB_For_Fixed_Fixed', 'ExtendActiveRegion', 'LJCutOffInner', 'LJCutOffOuter',
    \ 'OptRegion_FixedAtoms', 'ORCAFFFilename', 'PrintLevel', 'PrintOptRegion',
    \ 'PrintOptRegionExt', 'PrintPDB', 'RIGID_MM_WATER', 'ShiftForceCoulomb',
    \ 'SwitchForceLJ']

  let g:orca_block_params['loc'] = [
    \ 'ABS', 'ABSQ', 'ABSV', 'Algebraic', 'Available', 'CD', 'CellVolumeFraction',
    \ 'DoHemiSphereSC', 'DoSymetricSC', 'DOTRANS', 'FB', 'FFMIO', 'IAOBasis',
    \ 'IAOIBO', 'KeepDens', 'LIVVO', 'LoadQCCluster', 'LocMet', 'NEWBOYS', 'ORBITAL',
    \ 'RIXS', 'SOC', 'SOCABS', 'SOCABSQ', 'SOCCD', 'SymmetryOperations', 'TRANSABS',
    \ 'VIRT', 'XAS', 'XASS', 'XASSOC', 'XES', 'XESSOC', 'ZETA_D']

  let g:orca_block_params['mrci'] = [
    \ 'AllSingles', 'CIType', 'DavidsonOpt', 'Densities', 'DIIS',
    \ 'DoDDCIMP2', 'Etol', 'EUnselOpt', 'EunselOpt', 'EWin',
    \ 'EWIN', 'Excitations', 'Flags', 'Fopt', 'FourIndexInts',
    \ 'H0Opt', 'IntMode', 'KeepFiles', 'LevelShift',
    \ 'LinearResponse', 'Loc', 'MaxDIIS', 'MaxDim', 'MaxIter',
    \ 'MaxMemInt', 'MaxMemVec', 'MORanges', 'MRACPF', 'MRAQCC',
    \ 'MRCI', 'MRDDCI1', 'MRDDCI2', 'MRDDCI3', 'MRPT_b',
    \ 'MRPT_shift', 'NatOrbIters', 'NelCorr', 'NewBlock',
    \ 'NGuessMat', 'NGuessMatRefCI', 'NoIter', 'NRoots', 'Otol',
    \ 'Partitioning', 'PrintLevel', 'PrintWF', 'refs', 'RefWeight',
    \ 'RejectInvalidRefs', 'RelaxRefs', 'RITrafo', 'Rtol',
    \ 'Second', 'Solver', 'SORCI', 'Tnat', 'Tnat2', 'Tpre',
    \ 'Tpre_fi', 'Tpre_in', 'TPrint', 'TPrintWF', 'Tsel',
    \ 'Tsel_fi', 'Tsel_in', 'UseIVOs', 'UsePartialTrafo', 'XASMOs']

  let g:orca_block_params['rocis'] = [
    \ 'B', 'DecomposeFosc', 'Do_HM_ia', 'Do_HM_is', 'Do_HM_sa', 'Do_ia',
    \ 'Do_is', 'Do_isa', 'Do_ista', 'Do_LM_ia', 'Do_LM_is', 'Do_LM_sa',
    \ 'Do_LM_ss', 'Do_sa', 'DoCD', 'DoDipoleLength', 'DoDipoleVelocity',
    \ 'DoElastic', 'DoFullSemiclassical', 'DoGenROCIS', 'DoHigherMult',
    \ 'DoLoc', 'DoLowerMult', 'DoMCD', 'DoNDO', 'DoNTO', 'DoPNO',
    \ 'DoRIXS', 'DoRIXSSOC', 'DoSOC', 'ETol', 'EWin', 'LocMet',
    \ 'LocOrbWin', 'MaxCore', 'MaxDim', 'MaxIter', 'NDOStates',
    \ 'NDOThresh', 'NGuessMat', 'NRoots', 'NTOStates', 'NTOThresh',
    \ 'OrbWin', 'PlotDiffDens', 'PlotSOCDiffDens', 'PrintLevel',
    \ 'ReferenceMult', 'rel', 'RTol', 'TCutPNO', 'Temperature',
    \ 'TPrint', 'XASelems']

  let g:orca_block_params['casresp'] = [
    \ 'DoLocking', 'DoOlsen', 'DoOrbResp', 'MaxIter', 'MaxRed', 'NRoots',
    \ 'PreCondMaxRed', 'PreCondType', 'PrintRHSVec', 'PrintRspVec', 'PrintWF',
    \ 'TolPrintVec', 'TolR']

  let g:orca_block_params['mcrpa'] = [
    \ 'Conventional', 'DoNTO', 'DoOrbResp', 'NRoots', 'NTOThresh', 'OrbWin',
    \ 'Precond', 'PreConMaxRed', 'TolR']

  let g:orca_block_params['autoci'] = [
    \ 'CC2', 'CC3', 'CCD', 'CCSD', 'CCSDT', 'CID', 'CISD', 'CISDT', 'CIType',
    \ 'D3TPre', 'D4TPre', 'Density', 'Density2', 'DIISStartIter',
    \ 'ExcludeHigherExcDIIS', 'Irrep', 'KeepInts', 'LevelShift', 'MaxDiis',
    \ 'MaxIter', 'MDCI', 'MP2', 'MP3', 'MP4', 'MP5', 'Mult', 'NatOrbs', 'NEl',
    \ 'NOrb', 'NoRI', 'NRoots', 'NThresh', 'PrintLevel', 'QCISD', 'RITrafo',
    \ 'RunROHFasUHF', 'SOCoptions', 'STol', 'TrafoType', 'UseOldInts']

  let g:orca_block_params['rr'] = [
    \ 'CAR', 'CWAF', 'CWAR', 'EnStep', 'FreqAlter', 'MWAD', 'NMList', 'NRRPPoints',
    \ 'NTr', 'RamanOrder', 'RRPRange', 'States', 'TK']

  let g:orca_block_params['goat'] = [
    \ 'ALIGN', 'AUTOWALL', 'BONDFACTOR', 'CONFDEGEN', 'CONFTEMP', 'ENDIFF',
    \ 'EnforceStrictConvergence', 'FREEFRAGMENTS', 'FREEHETEROATOMS', 'FREENONHATOMS',
    \ 'FREEZEAMIDES', 'FREEZEANGLES', 'FREEZEBONDS', 'FREEZECISTRANS', 'GFNUPHILL',
    \ 'KEEPWORKERDATA', 'MAXCOORDNUMBER', 'MAXCORESOPT', 'MAXEN', 'MAXENPERATOM',
    \ 'MAXENTROPY', 'MAXGLOBALITER', 'MAXITER', 'MAXITERMULT', 'MAXOPTITER',
    \ 'MAXTOPODIFF', 'MINDELS', 'MINGLOBALITER', 'NPROCS', 'NWorkers', 'NWORKERS',
    \ 'PRINTINTERNALS', 'RANDOMSEED', 'READENSEMBLE', 'RMSD', 'RMSDMETRIC',
    \ 'ROTCONSTDIFF', 'SKIPINITIALOPT', 'SLOPPYOPT', 'TEMPLIST', 'TOPOBREAK',
    \ 'UPHILLATOMS', 'WORKERRANDOMSTART']

  let g:orca_block_params['docker'] = [
    \ 'ALLOWMETALCOORD', 'AUTOCOORDSYS', 'CHECKTOPO', 'COMPLETEDOCK', 'CUMULATIVE',
    \ 'DOCKLEVEL', 'EVPES', 'FIXHOST', 'GRIDCENTER', 'GRIDCENTERATOMS', 'GRIDEXTENT',
    \ 'GUEST', 'GUESTCHARGE', 'GUESTMULT', 'HOST', 'MBONDFAC', 'NOOPT', 'NOPT',
    \ 'NORMALDOCK', 'NREPEATGUEST', 'OPTLEVEL', 'POPDENSITY', 'POPSIZE', 'PREOPT',
    \ 'PRINTLEVEL', 'QUICKDOCK', 'SWARMMAXITER', 'SWARMMINITER', 'SWARMPES',
    \ 'SWARMPOPDENSITY', 'SWARMPOPSIZE']

  let g:orca_block_params['solvator'] = [
    \ 'ALPB', 'CLUSTERMODE', 'DROPLET', 'Einter', 'FIXSOLUTE', 'NSOLV', 'PRINTLEVEL',
    \ 'RADIUS', 'RANDOMSOLV', 'SOLVENTFILE', 'STOCHASTIC', 'Target', 'USEEEQCHARGES',
    \ 'VACUUMSEARCH', 'WALLFAC']

  let g:orca_block_params['symmetry'] = [
    \ 'CleanUpCoords', 'CleanUpGeom', 'CleanUpGrad', 'CleanUpGradient', 'PointGroup',
    \ 'PreferC2v', 'Print', 'PrtSALC', 'SymRelaxOpt', 'SymRelaxSCF', 'SymThresh',
    \ 'UseSym', 'UseSymmetry']

  let g:orca_block_params['plots'] = [
    \ 'Cube', 'ELDENSMP2UR', 'Gaussian_Cube', 'HPGL', 'MO', 'Molekel', 'Origin',
    \ 'SPINDENS', 'SPINDENSAUTOCIRE', 'SPINDENSAUTOCIUR', 'SPINDENSMDCI',
    \ 'SPINDENSMP2RE', 'SPINDENSMP2UR', 'SPINDENSOO', 'UCO', 'UNO']

  let g:orca_block_params['chelpg'] = [
    \ 'AllPop', 'BW', 'CenterOfCoords', 'CenterOfEachAtom', 'CenterOfMass',
    \ 'CenterOfNucCharge', 'CenterXYZ', 'COSMO', 'DIPOLE', 'FMOPop', 'GRID',
    \ 'Loewdin', 'Mayer', 'MBIS', 'MBIS_CHARGETHRESH', 'MBIS_LARGEPRINT',
    \ 'MBIS_ORIGIN_MULT', 'MBIS_ORIMULT_XYZ', 'Mulliken', 'NBO', 'NPA', 'RMAX',
    \ 'SmearTemp', 'VDWRADII']

  let g:orca_block_params['nbo'] = ['DELKEYLIST', 'MO', 'NCS']

  let g:orca_block_params['elprop'] = ['Polar']

  let g:orca_block_params['qgprop'] = [
    \ 'COORDSTYPE', 'DERHSOC', 'HESSIAN', 'MODE', 'STEPSIZE']

  let g:orca_block_params['magrelax'] = [
    \ 'degenThresh', 'doRaman', 'gridMax', 'gridMin', 'HESSIAN',
    \ 'inputfile', 'keepData', 'magfld', 'nGrid', 'temperature']

  let g:orca_block_params['esd'] = [
    \ 'APPROXADEN', 'B', 'CENTRALDIFF', 'CONVDER', 'COORDSYS', 'DELE', 'DELQ',
    \ 'DELTA', 'DOHT', 'ESDFLAG', 'ESHESSIAN', 'FASTDER', 'FCWL', 'FCWS',
    \ 'GEOMSTEP', 'GSHESSIAN', 'HESSFLAG', 'IFREQFLAG', 'INLINEW', 'IROOT',
    \ 'ISCFSHESSIAN', 'ISCISHESSIAN', 'LASERE', 'LEBEDEVINTEGRATIONPOINTS',
    \ 'LINEW', 'MAXTIME', 'MODELIST', 'NPOINTS', 'ORCA_ESD', 'PRINTLEVEL',
    \ 'PRINTVIB', 'RORDER', 'RRINTENS', 'RRSLINEW', 'RRTCUTDER', 'RRTCUTJ',
    \ 'SAMEFREQ', 'SCALING', 'SINGLEMODE', 'SOCME', 'SPECRANGE', 'SPECRES',
    \ 'STATES', 'STDA', 'STEPCONSTR', 'STEPSCALING', 'TCUTFREQ', 'TDIP',
    \ 'TDIPSCALING', 'TEMP', 'TMDIP', 'TSHESSIAN', 'UF_DELE', 'UFFREQERR',
    \ 'UNIT', 'USEB', 'USEJ', 'WRITEHESS']

  let g:orca_block_params['frag'] = [
    \ 'AABackbone', 'AASCFineGrained', 'AASideChains', 'Aminoacids', 'Atomic',
    \ 'Backbone', 'Connectivity', 'Definition', 'Deleted', 'DoInterFragBonds',
    \ 'Ext_lib', 'Extend', 'Extlib', 'FragProc', 'FunctionalGroups', 'FuseAtomPairs',
    \ 'FuseByAtoms', 'NABackbone', 'NABBFineGrained', 'NASideChains', 'NAME',
    \ 'NotAssigned', 'NucleoticAcid', 'Printlevel', 'SeqBackbone', 'SEQNABackbone',
    \ 'Solvents', 'STOREFRAGS', 'TopolFile', 'Usetopology', 'Water']

  let g:orca_block_params['eda'] = [
    \ 'DoEDA', 'EDA', 'FRAG1', 'FRAG1_C', 'FRAG1_FS', 'FRAG1_M', 'FRAG1_METHODFILE',
    \ 'FRAG1_SF', 'FRAG2', 'FRAG2_C', 'FRAG2_M', 'FRAG2_METHODFILE', 'FRAG2_SF',
    \ 'MO2', 'MP2', 'Pauli', 'Rotate']

endif


function! OrcaComplete(findstart, base)
  if a:findstart
    let line = getline('.')
    let col = col('.') - 1
    while col > 0 && line[col - 1] =~# '\w'
      let col -= 1
    endwhile
    return col
  endif

  let block = OrcaDetectBlock()
  let candidates = []
  if !empty(block) && has_key(g:orca_block_params, block)
    let candidates = copy(g:orca_block_params[block])
  else
    for params in values(g:orca_block_params)
      call extend(candidates, params)
    endfor
    call uniq(sort(candidates))
  endif

  if a:base ==# ''
    return candidates
  endif

  let base_lc = tolower(a:base)
  let n = len(a:base)
  let matches = []
  for word in candidates
    if strpart(tolower(word), 0, n) ==# base_lc
      call add(matches, word)
    endif
  endfor
  return matches
endfunction

function! OrcaDetectBlock()
  let lnum = line('.')
  let depth = 0
  while lnum > 0
    let l = getline(lnum)
    if l =~? '^end\>'
      let depth += 1
    else
      let m = matchstr(l, '^\s*%\zs\w\+')
      if !empty(m)
        if depth > 0
          let depth -= 1
        else
          return tolower(m)
        endif
      endif
    endif
    let lnum -= 1
  endwhile
  return ''
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
