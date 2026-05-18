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
    \ 'AutoTRAH', 'AutoTRAHIter', 'AutoTRAHNInter', 'BFCut', 'ConvCheckMode',
    \ 'Convergence', 'ConvForced', 'D3Thresh', 'D4Thresh', 'D5Thresh',
    \ 'Damp', 'DampErr', 'DIIS', 'DIISBfac', 'DIISMaxEq', 'DIISMaxIt', 'DIISStart',
    \ 'EasyConv', 'ETol', 'FOD', 'FracOcc', 'GTol', 'GuessMode', 'HCore', 'KDIIS',
    \ 'LSCFbeta', 'LSD', 'LShift', 'MaxIter', 'NoDamp', 'NoDIIS', 'NoLShift',
    \ 'NormalConv', 'NoSmear', 'NoSOSCF', 'NoTRAH', 'Precond', 'ROKS', 'Rotate',
    \ 'RTol', 'ShiftErr', 'SlowConv', 'SMD', 'Smear', 'SOSCF', 'SOSCFMaxIt',
    \ 'SOSCFStart', 'STol', 'TCut', 'TCutInt', 'Thresh', 'TolE', 'TolErr',
    \ 'TolFacMicro', 'TolG', 'TolMAXP', 'TolRMSP', 'TolX', 'TRAH', 'VerySlowConv',
    \ 'Z_Tol']

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
    \ 'AddExtraBonds', 'AddExtraBonds_MaxDist', 'AddExtraBonds_MaxLength', 'Almloef',
    \ 'AUTOFRAG', 'BFGS', 'BIAS', 'Bofill', 'BOXPOT', 'Calc_Hess',
    \ 'ConnectFragments', 'ConstrainFragments', 'Constraints', 'Convergence',
    \ 'COpt', 'ELLIPSEPOT', 'EV_Reverse', 'Ext_Params', 'EXTOPTEXE', 'FixFrags',
    \ 'Frags', 'GFNFF', 'Hess_Internal', 'HESS_MinEV', 'HESS_Modification',
    \ 'Hueckel', 'Hybrid_Hess', 'InHess', 'InHessName', 'Lindh', 'LooseOpt',
    \ 'MaxIter', 'MaxStep', 'MORead', 'NormalOpt', 'NResetHess', 'NStepsInResetHess',
    \ 'NumFreq', 'NumHess', 'Opt', 'OptElement', 'OptGuess', 'PAtom', 'PModel',
    \ 'Powell', 'PrintInternalHess', 'ProjectTR', 'Read', 'Recalc_Hess',
    \ 'ReducePrint', 'ReduceRedInts', 'RelaxFrags', 'RelaxHFrags', 'RigidFrags',
    \ 'RunTyp', 'Scan', 'Schlegel', 'Shift_Diag', 'SPHEREPOT', 'Step', 'Swart',
    \ 'TightOpt', 'TightSCF', 'TolE', 'TolMaxD', 'TolMaxG', 'TolRMSD', 'TolRMSG',
    \ 'Trust', 'Update', 'UseSOSCF', 'VeryTightOpt', 'XTB0', 'XTB1', 'XTB2']

  let g:orca_block_params['method'] = [
    \ 'CIM', 'DFT', 'Docker', 'EDA', 'Energy', 'EnergyGrad', 'EnGrad',
    \ 'GeometryOpt', 'Gradient', 'HF', 'MD', 'Method', 'MM', 'ModeTrajectory',
    \ 'MTR', 'NMGrad', 'NMGradient', 'NMScan', 'NormalModeGradient', 'NormalModeScan',
    \ 'Opt', 'PrintThermoChem', 'PropertiesOnly', 'ROHF', 'ROKS', 'RunTyp', 'Scan',
    \ 'SP', 'Trajectory']

  let g:orca_block_params['freq'] = [
    \ 'AnFreq', 'CutOffFreq', 'NumFreq', 'NumGrad', 'ProjectTR']

  let g:orca_block_params['mp2'] = [
    \ 'Direct', 'FCut', 'IntAccX', 'LoosePNO', 'NormalPNO', 'NoIter', 'Q1Opt',
    \ 'RI', 'TCutPNO', 'TightPNO', 'Z_GridX', 'Z_IntAccX']

  let g:orca_block_params['mdci'] = [
    \ 'CCSD', 'Conv', 'Direct', 'FB', 'IAOBOYS', 'IAOIBO', 'LMP2ScaleTCutPNO',
    \ 'LocTol', 'LoosePNO', 'MaxDIIS', 'MP3', 'NormalPNO', 'QCISD', 'TightPNO',
    \ 'TightSCF', 'TolG']

  let g:orca_block_params['casscf'] = [
    \ 'ActConstraints', 'AutoTRAH', 'CIStep', 'DIIS', 'DoFullSemiclassical',
    \ 'DoubleShellMO', 'DThresh', 'ETol', 'FlipSpin', 'FreezeActive', 'FreezeGrad',
    \ 'FreezeIE', 'GradScaling', 'GTol', 'KDIIS', 'MaxIter', 'MaxM', 'MaxRot',
    \ 'MinShift', 'NOrb', 'PrintGState', 'PrintLevel', 'RIJCOSX', 'ShiftDn', 'SOSCF',
    \ 'SuperCI_PT', 'SwitchIter', 'SwitchStep', 'SymThresh', 'TightSCF', 'TrafoStep',
    \ 'TRAH']

  let g:orca_block_params['tddft'] = [
    \ 'CPCMEQ', 'DecomposeFosc', 'DoNTO', 'DoSoc', 'DOTRANS', 'EnStep', 'EThresh',
    \ 'ETol', 'EWin', 'FIR', 'FOLLOWIROOT', 'IRoot', 'IROOTLIST', 'IRootMult',
    \ 'IROOTMULT', 'MaxCore', 'MaxDim', 'MaxIter', 'Mode', 'NRoots', 'NTOStates',
    \ 'NTOThresh', 'OrbWin', 'PThresh', 'PTLimit', 'RTol', 'TDA', 'TPrint', 'TROOTLIST']

  let g:orca_block_params['cis'] = [
    \ 'CPCMEQ', 'DecomposeFosc', 'DoNTO', 'DoSoc', 'EnStep', 'EThresh', 'ETol',
    \ 'EWin', 'IRoot', 'IROOTLIST', 'IRootMult', 'IROOTMULT', 'MaxCore', 'MaxDim',
    \ 'MaxIter', 'Mode', 'NRoots', 'NTOStates', 'NTOThresh', 'OrbWin', 'PThresh',
    \ 'PTLimit', 'RTol', 'TDA', 'TPrint', 'TROOTLIST']

  let g:orca_block_params['eprnmr'] = [
    \ 'GIAO_2el', 'LocOrbGBW', 'Mass2016', 'NMRCoal', 'NMREquiv', 'NMRSpecFreq',
    \ 'SpinSpinAtomPairs', 'SpinSpinRThresh']

  let g:orca_block_params['pal'] = ['nprocs', 'nprocs_world', 'nprocs_group']

  let g:orca_block_params['xtb'] = [
    \ 'ACCURACY', 'ALPBSOLVENT', 'DOALPB', 'DOCPCMX', 'DODDCOSMO', 'DoMP2',
    \ 'EPSILON', 'ETEMP', 'MAXCORE', 'METHOD', 'NPROCS', 'READXTBPARAM', 'SmearTemp',
    \ 'UseXTBMixer', 'VERSION', 'XTB', 'XTB0', 'XTB1', 'XTB2', 'XTBFF', 'XTBFOD',
    \ 'XTBINPUTSTRING', 'XTBINPUTSTRING2', 'XTBPARAMFILE', 'WRITEXTBPARAM']

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
    \ 'DKH', 'DKH1', 'DLU', 'FiniteNuc', 'IntAcc', 'IORA', 'LightAtomThresh',
    \ 'Method', 'ModelDens', 'ModelPot', 'OneCenter', 'Order', 'PictureChange',
    \ 'PrintLevel', 'Rel1C', 'RelDLU', 'RelFull', 'ScaleZORA', 'SpecialGridIntAcc',
    \ 'StorageLevel', 'VELOCITY', 'X2C', 'Xalpha', 'ZORA']

  let g:orca_block_params['cpcm'] = [
    \ 'Corrected', 'COUPLED', 'CPCMccm', 'Final', 'Outlying', 'SMD18']

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
    \ 'TempConv', 'Temperature', 'Thermostat', 'Thermostats', 'Timecon', 'Timestep',
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
    \ 'AllSingles', 'CIType', 'DavidsonOpt', 'DIIS', 'EUnselOpt', 'EWin', 'IntMode',
    \ 'MaxMemVec', 'MRACPF', 'MRAQCC', 'MRCI', 'MRDDCI1', 'MRDDCI2', 'MRDDCI3',
    \ 'NoIter', 'RefWeight', 'RITrafo', 'Second', 'SORCI', 'Tnat', 'Tpre', 'TPrint',
    \ 'Tsel', 'UseIVOs']

  let g:orca_block_params['rocis'] = [
    \ 'DecomposeFosc', 'Do_HM_ia', 'Do_HM_is', 'Do_HM_sa', 'Do_ia', 'Do_is',
    \ 'Do_isa', 'Do_ista', 'Do_LM_ia', 'Do_LM_is', 'Do_LM_sa', 'Do_LM_ss', 'Do_sa',
    \ 'DoCD', 'DoDipoleLength', 'DoDipoleVelocity', 'DoElastic', 'DoFullSemiclassical',
    \ 'DoGenROCIS', 'DoHigherMult', 'DoLoc', 'DoLowerMult', 'DoMCD', 'DoNDO', 'DoNTO',
    \ 'DoPNO', 'DoRIXS', 'DoRIXSSOC', 'DoSOC', 'ETol', 'EWin', 'LocMet', 'LocOrbWin',
    \ 'MaxCore', 'MaxDim', 'MaxIter', 'NDOStates', 'NDOThresh', 'NRoots', 'NTOStates',
    \ 'NTOThresh', 'OrbWin', 'PlotDiffDens', 'PlotSOCDiffDens', 'PrintLevel',
    \ 'ReferenceMult', 'RTol', 'TCutPNO', 'Temperature', 'TPrint', 'XASelems']

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

  let g:orca_block_params['esd'] = ['IROOT', 'ORCA_ESD']

  let g:orca_block_params['frag'] = [
    \ 'AABackbone', 'AASCFineGrained', 'AASideChains', 'Aminoacids', 'Atomic',
    \ 'Backbone', 'Connectivity', 'Definition', 'Deleted', 'DoInterFragBonds',
    \ 'Ext_lib', 'Extend', 'Extlib', 'FragProc', 'FunctionalGroups', 'FuseAtomPairs',
    \ 'FuseByAtoms', 'NABackbone', 'NABBFineGrained', 'NASideChains', 'NAME',
    \ 'NotAssigned', 'NucleoticAcid', 'Printlevel', 'SeqBackbone', 'SEQNABackbone',
    \ 'Solvents', 'STOREFRAGS', 'TopolFile', 'Usetopology', 'Water']

  let g:orca_block_params['eda'] = [
    \ 'EDA', 'FRAG1', 'FRAG1_C', 'FRAG1_FS', 'FRAG1_M', 'FRAG1_METHODFILE',
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

let &cpo = s:save_cpo
unlet s:save_cpo
