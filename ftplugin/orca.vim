if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

" Capture plugin root at source time (<sfile> is undefined inside functions)
let s:plugin_root = expand('<sfile>:p:h:h')

setlocal commentstring=#\ %s
setlocal comments=:#
setlocal nosmartindent
setlocal completeopt=menu,menuone,noinsert

" Tab: accept highlighted item and close; S-Tab: navigate backwards.
" s:AcceptCompletion sets a flag before returning <C-y> so that the
" TextChangedI fired by the insertion doesn't immediately reopen the popup.
let s:just_accepted = 0
function! s:AcceptCompletion()
  let s:just_accepted = 1
  return "\<C-y>"
endfunction
inoremap <buffer> <expr> <Tab>   pumvisible() ? <SID>AcceptCompletion() : "\<Tab>"
inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ─── Block parameter data ────────────────────────────────────────────────────
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
    \ 'FixFrags', 'Frags', 'freezeHydrogens', 'FullScan',
    \ 'GFNFF', 'Hess_Internal', 'HESS_MinEV', 'HESS_Modification',
    \ 'Hueckel', 'Hybrid_Hess', 'InHess', 'inhess', 'InHessName',
    \ 'invertConstraints', 'Lindh', 'LooseOpt', 'MaxIter', 'MaxStep',
    \ 'modify_internal', 'MORead', 'NormalOpt', 'NResetHess',
    \ 'NStepsInResetHess', 'NumHess', 'OneElec', 'Opt', 'OptElement',
    \ 'OptGuess', 'optimizeHydrogens', 'PAtom', 'PModel', 'POTENTIALS',
    \ 'Powell', 'PrintInternalHess', 'ProjectTR', 'Read', 'Recalc_Hess',
    \ 'ReducePrint', 'ReduceRedInts', 'RelaxFrags', 'RelaxHFrags',
    \ 'RigidFrags', 'RunTyp', 'Scan', 'Schlegel', 'Shift_Diag',
    \ 'Simul_Scan', 'SPHEREPOT', 'Step', 'Swart', 'TightOpt',
    \ 'TolE', 'TolMaxD', 'TolMaxG', 'TolRMSD', 'TolRMSG',
    \ 'Trust', 'TS_Active_Atoms', 'TS_Active_Atoms_Factor', 'TS_Mode',
    \ 'TS_search', 'Update', 'UseSOSCF', 'VeryTightOpt', 'XTB0', 'XTB1',
    \ 'XTB2']

  let g:orca_block_params['method'] = [
    \ 'ACM', 'ACM_A', 'ACM_B', 'ACM_C',
    \ 'CASDFT', 'CBetaPBE', 'CheckFrozenCore', 'CIM', 'ComplexTranslation',
    \ 'CorrectFrozenCore', 'Correlation', 'COSX_IntSymmetry', 'COSX_PartialContraction',
    \ 'D3A1', 'D3A2', 'D3alpha6', 'D3RS6', 'D3S6', 'D3S8',
    \ 'D4A1', 'D4A2', 'D4S6', 'D4S8', 'D4S9',
    \ 'DFT', 'DFTDOpt', 'DFTDScaleC6', 'Docker', 'DoGCP', 'DoMP2',
    \ 'EDA', 'Energy', 'EnergyGrad', 'EnGrad', 'Ext_Params',
    \ 'Exchange', 'Functional', 'FrozenCore',
    \ 'GCPMethod', 'GeometryOpt', 'Gradient', 'GridX',
    \ 'HF', 'IntAccX',
    \ 'LDAOpt', 'MD', 'Method', 'MM', 'ModeTrajectory', 'MTR',
    \ 'NMGrad', 'NMGradient', 'NMScan', 'NormalModeGradient', 'NormalModeScan',
    \ 'Opt', 'OrthogonalCI',
    \ 'PrintThermoChem', 'ProgExt', 'PropertiesOnly',
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

  let g:orca_block_params['irc'] = [
    \ 'Adapt_Scale_Displ', 'DE_Init_Displ', 'Direction', 'Do_SD_Corr',
    \ 'Follow_CoordType', 'Hess_Filename', 'hessMode', 'Init_Displ_DE',
    \ 'InitHess', 'Interpolate_only', 'MaxIter', 'Monitor_Internals',
    \ 'PrintLevel', 'Scale_Displ_SD', 'Scale_Displ_SD_Corr', 'Scale_Init_Displ',
    \ 'SD_Corr_ParabolicFit', 'SD_ParabolicFit', 'TolMaxG', 'TolRMSG']

  let g:orca_block_params['neb'] = [
    \ 'Product', 'NImages', 'PrintLevel', 'TS', 'NEB_TS_Image', 'Restart_ALLXYZFile',
    \ 'Restart_GBW_BaseName', 'CheckSCFConv', 'Product_PDBFile', 'TS_PDBFile',
    \ 'Free_End', 'PreOpt', 'NSteps_FoundIntermediate', 'AbortIf_FoundIntermediate',
    \ 'NPTS_Interpol', 'Interpolation', 'Prepare_Frags', 'Max_Frag_Dist', 'Bond_Cutoff',
    \ 'Tangent', 'SpringType', 'SpringConst', 'SpringConst2', 'Energy_Weighted',
    \ 'PerpSpring', 'LLT_Cos', 'Quatern', 'Fix_center', 'Remove_extern_Force',
    \ 'Free_End_Type', 'Free_End_EC', 'Free_End_EC_End', 'Free_End_Kappa', 'ConvType',
    \ 'CI', 'NEB_TS', 'Tol_MaxFP_I', 'Tol_RMSFP_I', 'Tol_MaxF_CI', 'Tol_RMSF_CI',
    \ 'Tol_Turn_On_CI', 'Tol_Scale', 'Reparam_type', 'Reparam', 'Tol_Reparam',
    \ 'Opt_Method', 'Maxmove', 'Stepsize', 'MaxIter', 'Local', 'LBFGS_Mem', 'LBFGS_DR',
    \ 'LBFGS_Restart_On_Maxmove', 'LBFGS_Reparam_On_Restart', 'LBFGS_Precondition',
    \ 'FIRE_INITIAL_DAMP', 'FIRE_DAMP_DECR', 'FIRE_STEP_INCR', 'FIRE_STEP_DECR',
    \ 'FIRE_MAX_STEP', 'FIRE_RETENTION', 'Tol_Turn_On_Zoom', 'Zoom_Offset',
    \ 'Zoom_Auto', 'Zoom_Alpha', 'Zoom_Interpolation', 'Zoom_PrintFullTrj',
    \ 'IDPP_NMax', 'IDPP_Tol_MaxF', 'IDPP_ksp', 'IDPP_Alpha', 'IDPP_MaxMove',
    \ 'IDPP_Debug', 'IDPP_Quatern', 'IDPP_Dist_Interpolation', 'IDPP_Bilinear_Partition',
    \ 'SIDPP', 'SIDPP_Tol_MaxF', 'SIDPP_Reparam', 'SIDPP_Energy_Weighted_Tangent',
    \ 'SIDPP_Even_NIm', 'SIDPP_Double_NIm', 'SIDPP_Ideal_Springconst',
    \ 'SIDPP_HyperSearch', 'SIDPP_HyperSearch_StrictConnectivity', 'Monitor_Internals',
    \ 'neb_end_xyzfile']

  let g:orca_block_params['mecp'] = [
    \ 'SurfCrossOpt', 'SurfCrossNumFreq', 'moinp', 'Mult', 'brokenSym',
    \ 'casscf_nel', 'casscf_norb', 'casscf_mult', 'casscf_nroots',
    \ 'casscf_bweight', 'casscf_weights']

  let g:orca_block_params['conical'] = ['Method', 'ETol']

  let g:orca_block_params['numgrad'] = ['CentralDiff', 'DX', 'TransInvar', 'Accuracy']

  let g:orca_block_params['ice'] = [
    \ 'nel', 'norb', 'nroots', 'integrals', 'icetype', 'Tgen', 'Tvar',
    \ 'etol', 'cimode', 'UseMP2nat', 'UseIVOs', 'refs']

  let g:orca_block_params['vpt2'] = [
    \ 'VPT2', 'AnharmDisp', 'HessianCutoff', 'PrintLevel', 'MinimiseOrcaPrint',
    \ 'AvgProp', 'PropDisp']

  let g:orca_block_params['cim'] = ['CIMTHRESH']

  let g:orca_block_params['mtr'] = [
    \ 'HessName', 'modetype', 'MList', 'RSteps', 'LSteps', 'ddnc', 'dxyz', 'EnStep']

  let g:orca_block_params['xes'] = [
    \ 'CoreOrb', 'OrbOp', 'CoreOrbSOC', 'RIXSOrb', 'RIXSOrbOp', 'RIXSOrbSOC',
    \ 'MaxNVirt', 'DoXAS', 'DoSOC', 'DoRIXS', 'DoDipoleLength', 'DoFullSemiclassical']

  let g:orca_block_params['mrcc'] = ['method', 'ETol']

  let g:orca_block_params['lft'] = ['NEl', 'Shell_PQN', 'Mult', 'NRoots']

  let g:orca_block_params['shark'] = [
    \ 'UseGeneralContraction', 'Printlevel', 'PartialGCFlag', 'FockFlag',
    \ 'RIJFlag', 'Prescreening', 'ExtentOpt']

endif

" ─── Simple keyword list (! line) ────────────────────────────────────────────
" Parsed once per session from syntax/orca.vim. Only `syn keyword` lines are
" extracted; `syn match` entries that use regex are intentionally skipped.
function! s:LoadSimpleKeywords()
  if exists('g:orca_simple_keywords') | return | endif
  let syn_file = s:plugin_root . '/syntax/orca.vim'
  if !filereadable(syn_file)
    let g:orca_simple_keywords = []
    return
  endif
  let keywords = []
  for l in readfile(syn_file)
    if l =~# '^syn keyword orca\(Keyword\|Basis\) contained '
      let rest = substitute(l, '^syn keyword orca\(Keyword\|Basis\) contained\s\+', '', '')
      call extend(keywords, split(rest, '\s\+'))
    elseif l =~# '^syn match orca\(Keyword\|Basis\) contained '
      " Extract literal keyword from \<WORD\> patterns. Patterns containing
      " Vim regex metacharacters (e.g. \( \| ) have backslashes inside the
      " word, so [^\\]* stops immediately and matchstr returns '', which we skip.
      let kw = matchstr(l, '"\\<\zs[^\\]*\ze\\>"')
      if !empty(kw)
        call add(keywords, kw)
      endif
    endif
  endfor
  let g:orca_simple_keywords = uniq(sort(keywords))
endfunction

" ─── Completion helpers ───────────────────────────────────────────────────────

function! s:FilterList(list, base)
  if a:base ==# ''
    return copy(a:list)
  endif
  let base_lc = tolower(a:base)
  let n = len(a:base)
  return filter(copy(a:list), {_, w -> strpart(tolower(w), 0, n) ==# base_lc})
endfunction

" Walk backwards from cursor to find the enclosing %block name.
function! s:DetectBlock()
  let lnum = line('.')
  let depth = 0
  while lnum > 0
    let l = getline(lnum)
    if l =~? '^\s*end\>'
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

" Inline directives that look like blocks but have no 'end' and no skeleton.
let s:inline_directives = ['maxcore', 'moinp', 'moread']

" Completion items for block names. Full blocks carry user_data so MaybeSkeleton
" inserts the skeleton; inline directives don't.
function! s:BlockNameItems(base)
  let block_names = sort(keys(g:orca_block_params))
  let all_names = block_names + s:inline_directives
  call sort(all_names)
  if !empty(a:base)
    let n = len(a:base)
    let base_lc = tolower(a:base)
    call filter(all_names, {_, w -> strpart(w, 0, n) ==# base_lc})
  endif
  return map(all_names, {_, w ->
    \ has_key(g:orca_block_params, w)
    \ ? {'word': w, 'user_data': 'block:' . w}
    \ : {'word': w}})
endfunction

" True when cursor is in the filename position of a "* xyzfile charge mult" line.
function! s:IsXyzFileLine()
  let before = strpart(getline('.'), 0, col('.') - 1)
  return before =~? '^\s*\*\s\+xyzfile\s\+\S\+\s\+\S\+\s'
endfunction

" True when cursor is past %moinp (ready for the .gbw filename).
function! s:IsMOInpLine()
  let before = strpart(getline('.'), 0, col('.') - 1)
  return before =~? '^\s*%moinp\s'
endfunction

" Candidates for the current cursor context (bang line or inside a block).
function! s:Candidates(base)
  let line = getline('.')

  if line =~# '^\s*!'
    call s:LoadSimpleKeywords()
    return s:FilterList(g:orca_simple_keywords, a:base)
  endif

  if s:IsMOInpLine()
    let dir = expand('%:p:h')
    return map(glob(dir . '/' . a:base . '*.gbw', 0, 1), {_, f -> fnamemodify(f, ':t')})
  endif

  let block = s:DetectBlock()
  if !empty(block) && has_key(g:orca_block_params, block)
    return s:FilterList(g:orca_block_params[block], a:base)
  endif

  return []
endfunction

" ─── Auto-trigger ─────────────────────────────────────────────────────────────

" s:completing_block is set during findstart so OrcaComplete's second call
" knows to return block names without re-inspecting the line.
let s:completing_block = 0

function! s:AutoTrigger()
  if pumvisible() | return | endif
  if s:just_accepted | let s:just_accepted = 0 | return | endif
  let col = col('.') - 1
  if col < 1 | return | endif
  let line = getline('.')
  if strpart(line, 0, col) =~# '#' | return | endif
  let ch = line[col - 1]

  " % just typed: show all block names
  if ch ==# '%'
    let items = s:BlockNameItems('')
    if !empty(items)
      call complete(col + 1, items)
    endif
    return
  endif

  " On ! lines use whitespace-delimited tokens so that hyphenated names like
  " def2-SVP are treated as one unit rather than split at the hyphen.
  if line =~# '^\s*!'
    if ch =~# '\s' | return | endif
    let start = col - 1
    while start > 0 && line[start - 1] =~# '\S'
      let start -= 1
    endwhile
    let base = strpart(line, start, col - start)
    if base ==# '!' | return | endif
    let matches = s:Candidates(base)
    if !empty(matches)
      call complete(start + 1, matches)
    endif
    return
  endif

  " * xyzfile line: complete .xyz filenames from the buffer's directory
  if s:IsXyzFileLine()
    let dir = expand('%:p:h')
    if ch =~# '\s'
      " Space typed right after the multiplicity: show all xyz files
      let files = map(glob(dir . '/*.xyz', 0, 1), {_, f -> fnamemodify(f, ':t')})
      if !empty(files)
        call complete(col + 1, files)
      endif
    else
      " Partial filename already being typed: filter by prefix
      let start = col - 1
      while start > 0 && line[start - 1] =~# '\S'
        let start -= 1
      endwhile
      let base = strpart(line, start, col - start)
      let files = map(glob(dir . '/' . base . '*.xyz', 0, 1), {_, f -> fnamemodify(f, ':t')})
      if !empty(files)
        call complete(start + 1, files)
      endif
    endif
    return
  endif

  " %moinp line: auto-insert "" on first space, then complete .gbw inside them
  if s:IsMOInpLine()
    if ch ==# ' ' && getline('.') =~? '^\s*%moinp\s*$'
      " First space after %moinp: insert "", park cursor inside, trigger omni
      call feedkeys('""' . "\<Left>" . "\<C-x>\<C-o>", 'n')
      return
    endif
    if ch ==# '"'
      " Opening quote typed manually: show all gbw files
      let matches = s:Candidates('')
      if !empty(matches)
        call complete(col + 1, matches)
      endif
      return
    endif
    " \w chars inside quotes fall through to the general handler below,
    " which calls s:Candidates → s:IsMOInpLine path for prefix filtering
  endif

  if ch !~# '\w' | return | endif

  " Walk back to the start of the current word
  let start = col - 1
  while start > 0 && line[start - 1] =~# '\w'
    let start -= 1
  endwhile
  let base = strpart(line, start, col - start)

  " Word is immediately after %: filter block names
  if start > 0 && line[start - 1] ==# '%'
    let items = s:BlockNameItems(base)
    if !empty(items)
      call complete(start + 1, items)
    endif
    return
  endif

  " Inside a block
  let matches = s:Candidates(base)
  if !empty(matches)
    call complete(start + 1, matches)
  endif
endfunction

" ─── Skeleton insertion on block completion ───────────────────────────────────

function! s:MaybeSkeleton()
  let item = v:completed_item
  if empty(item) | return | endif

  " After a .gbw completion on a %moinp line, add closing " if not present
  if getline('.') =~? '^\s*%moinp\s'
    if !empty(get(item, 'word', '')) && getline('.')[col('.') - 1] !=# '"'
      call feedkeys('"', 'n')
    endif
    return
  endif

  if get(item, 'user_data', '') !~# '^block:' | return | endif
  let lnum = line('.')
  call append(lnum, [repeat(' ', shiftwidth()), 'end'])
  call feedkeys("\<Esc>jA", 'n')
endfunction

" ─── Omni-completion entry point (<C-x><C-o>) ─────────────────────────────────

function! OrcaComplete(findstart, base)
  if a:findstart
    let s:completing_block = 0
    let col = col('.') - 1
    let line = getline('.')
    " On ! lines use whitespace as the word boundary (same as auto-trigger)
    if line =~# '^\s*!'
      while col > 0 && line[col - 1] =~# '\S'
        let col -= 1
      endwhile
      return col
    endif
    while col > 0 && line[col - 1] =~# '\w'
      let col -= 1
    endwhile
    if col > 0 && line[col - 1] ==# '%'
      let s:completing_block = 1
    endif
    return col
  endif

  if s:completing_block
    return s:BlockNameItems(a:base)
  endif
  return s:Candidates(a:base)
endfunction

" ─── Buffer-local wiring ──────────────────────────────────────────────────────

setlocal omnifunc=OrcaComplete

augroup OrcaCompletion
  autocmd! * <buffer>
  autocmd TextChangedI <buffer> call s:AutoTrigger()
  autocmd CompleteDone <buffer> call s:MaybeSkeleton()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
