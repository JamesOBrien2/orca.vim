" Language: Orca input file

if exists("b:current_syntax")
  finish
endif

syn case ignore
syn iskeyword @,48-57,_,-

" ============================================================
" Simple keyword line (! ...)
" ============================================================
syn match simpleKeyword "!.*$" transparent
         \ contains=orcaKeyword,orcaComment,misplacedBang,simpleBang,orcaBasis
syn match simpleBang contained "!.*$"me=s+1

" ============================================================
" Keywords: computational methods, SCF options, grids, output
" Add new ! line keywords here.
" ============================================================
syn keyword orcaKeyword contained FLOAT CFLOAT UCFLOAT DOUBLE CDOUBLE UCDOUBLE
syn match orcaKeyword contained "\<\(R\|U\|RO\)\(HF\|KS\)\>"
syn keyword orcaKeyword contained CASSCF MM
syn match orcaKeyword contained "\<\(XTB1\|GFN-XTB\)\>"
syn match orcaKeyword contained "\<\(XTB2\?\|GFN2-XTB\)\>"
syn match orcaKeyword contained "\<\(XTB-\?FF\|GFN-FF\)\>"
syn match orcaKeyword contained "\<USESYM\(METRY\)\?\>"
syn match orcaKeyword contained "\<NOSYM\(METRY\)\?\>"
syn match orcaKeyword contained "\<NOUSESYM\(METRY\)\?\>"
syn match orcaKeyword contained "\<PREFER\(C2V\|D2\)\>"
syn keyword orcaKeyword contained NOPREFERC2V
syn match orcaKeyword contained "\<\(NO\)\?RI\>"
syn match orcaKeyword contained "\<RI-\?J-\?XC\>"
syn match orcaKeyword contained "\<SPLIT\(-RI-J-\|RI-J-\|RI-J\|RIJ\)XC\>"
syn keyword orcaKeyword contained RIJONX RIJDX
syn match orcaKeyword contained "\<\(NO\)\?RIJCOSX\>"
syn match orcaKeyword contained "\<RI-\?JK\>"
syn match orcaKeyword contained "\<RI-\?AO\>"
syn keyword orcaKeyword contained RA RUEDAPP SPLITJ
syn match orcaKeyword contained "\<\(NO\)\?SPLIT\(-RI-J\|-RIJ\|RIJ\)\>"
syn match orcaKeyword contained "\<\(NO\)\?LIBINT\>"
syn match orcaKeyword contained "\<\(NO\)\?\(USE\)\?SHARK\>"
syn keyword orcaKeyword contained RITRAFO
syn match orcaKeyword contained "\<\(SEMI\)\?DIRECT\>"
syn keyword orcaKeyword contained CONV
syn match orcaKeyword contained "\<\(NO\|USE\)\?INCREMENTAL\>"
syn keyword orcaKeyword contained NOITER NOSCFITER NOPROPFILE WRITEONLYINITIALPROPFILE
syn match orcaKeyword contained "\<QUICK-\?DFT\>"
syn match orcaKeyword contained "\<QUICK-\?OPT\>"
syn match orcaKeyword contained "\<MEDIUM-\?OPT\>"
syn match orcaKeyword contained "\<GOOD-\?OPT\>"
syn match orcaKeyword contained "\<ACC-\?OPT\>"
syn match orcaKeyword contained "\<DFT-\?ENERGY\>"
syn match orcaKeyword contained "\<DFT-\?ENERGY+\>"
syn match orcaKeyword contained "\<\(NO\)\?DIIS\>"
syn keyword orcaKeyword contained KDIIS
syn match orcaKeyword contained "\<\(NO\)\?SOSCF\>"
syn match orcaKeyword contained "\<\(NO\)\?TRAH\>"
syn match orcaKeyword contained "\<\(NO\)\?RICO\>"
syn match orcaKeyword contained "\<\(NO\)\?DAMP\>"
syn match orcaKeyword contained "\<\(NO\)\?LSHIFT\>"
syn match orcaKeyword contained "\<\(\(VERY\)\?SLOW\|NORMAL\|EASY\)CONV\>"
syn keyword orcaKeyword contained PATOM EHTANO PMODEL HCORE HUECKEL UNITMATRIXGUESS MOREAD
syn match orcaKeyword contained "\<\(NO\)\?AUTOSTART\>"
syn keyword orcaKeyword contained USEGRAMSCHMIDT
syn match orcaKeyword contained "\<AVAS(TM3D)\>"
syn keyword orcaKeyword contained HF
syn match orcaKeyword contained "\<\(SOS-\|SCS-\)\?MP2\>"
syn match orcaKeyword contained "\<\(OO-\)\?\(MP2RI\|RI-\?MP2\)\>"
syn keyword orcaKeyword contained SOS-RIMP2 SOS-RI-MP2 RI-SOS-MP2 SCS-RIMP2 SCS-RI-MP2 RI-SCS-MP2 OO-SOS-RIMP2 OO-SOS-RI-MP2
syn keyword orcaKeyword contained OO-RI-SOS-MP2 OO-SCS-RIMP2 OO-SCS-RI-MP2 OO-RI-SCS-MP2 F12-MP2 MP2-F12 F12-RI-MP2 MP2-F12-RI
syn keyword orcaKeyword contained RI-MP2-F12
syn match orcaKeyword contained "\<F12/D-RI-MP2\>"
syn match orcaKeyword contained "\<MP2-F12/D-RI\>"
syn match orcaKeyword contained "\<RI-MP2-F12/D\>"
syn keyword orcaKeyword contained F12D-RI-MP2 MP2-F12D-RI RI-MP2-F12D DLPNO-MP2 DLPNO-SCS-MP2 SCS-DLPNO-MP2 DLPNO-SOS-MP2 SOS-DLPNO-MP2
syn keyword orcaKeyword contained F12-DLPNO-MP2 DLPNO-MP2-F12
syn match orcaKeyword contained "\<F12/D-DLPNO-MP2\>"
syn match orcaKeyword contained "\<DLPNO-MP2-F12/D\>"
syn keyword orcaKeyword contained F12D-DLPNO-MP2 DLPNO-MP2-F12D CASPT2 RI-CASPT2 CASPT2K RI-CASPT2K NEVPT2 SC-NEVPT2
syn keyword orcaKeyword contained FIC-NEVPT2 PC-NEVPT2 RI-NEVPT2 DLPNO-NEVPT2 DMRG MOLMPS FCIDUMP
syn match orcaKeyword contained "\<DCD-CAS(2)\>"
syn match orcaKeyword contained "\<RI-DCD-CAS(2)\>"
syn keyword orcaKeyword contained AUTO-ICE AUTO-CIPSI
syn match orcaKeyword contained "\<IEPA(LOC)\>"
syn match orcaKeyword contained "\<IEPA(NOLOC)\>"
syn match orcaKeyword contained "\<IEPA0(LOC)\>"
syn match orcaKeyword contained "\<IEPA0(NOLOC)\>"
syn keyword orcaKeyword contained CISD DDCI3 MO-CISD RI-CISD RI34-CISD
syn match orcaKeyword contained "\<CISD(T)\>"
syn match orcaKeyword contained "\<RI34-CISD(T)\>"
syn match orcaKeyword contained "\<RI-CISD(T)\>"
syn keyword orcaKeyword contained QCISD MO-QCISD AO-QCISD AOX-QCISD RI-QCISD RI34-QCISD SL-QCISD LPNO-QCISD
syn keyword orcaKeyword contained LPNO1-QCISD F12-LPNO-QCISD F12-LPNO1-QCISD LPNO-QCISD-F12 LPNO1-QCISD-F12
syn match orcaKeyword contained "\<LPNO-QCISD(T)\>"
syn match orcaKeyword contained "\<LPNO1-QCISD(T)\>"
syn keyword orcaKeyword contained LPNO2-QCISD
syn match orcaKeyword contained "\<LPNO2-QCISD(T)\>"
syn match orcaKeyword contained "\<QCISD(T)\>"
syn match orcaKeyword contained "\<MO-QCISD(T)\>"
syn match orcaKeyword contained "\<AO-QCISD(T)\>"
syn match orcaKeyword contained "\<AOX-QCISD(T)\>"
syn match orcaKeyword contained "\<RI34-QCISD(T)\>"
syn match orcaKeyword contained "\<RI-QCISD(T)\>"
syn keyword orcaKeyword contained F12-QCISD QCISD-F12
syn match orcaKeyword contained "\<F12-QCISD(T)\>"
syn match orcaKeyword contained "\<QCISD(T)-F12\>"
syn match orcaKeyword contained "\<F12/RI-QCISD\>"
syn match orcaKeyword contained "\<QCISD-F12/RI\>"
syn match orcaKeyword contained "\<F12/RI-QCISD(T)\>"
syn match orcaKeyword contained "\<QCISD(T)-F12/RI\>"
syn match orcaKeyword contained "\<RI-QCISD-F12/RI\>"
syn match orcaKeyword contained "\<RI-QCISD(T)-F12/RI\>"
syn keyword orcaKeyword contained CCSD MO-CCSD RI-CCSD RI34-CCSD AOX-CCSD AO-CCSD SL-CCSD CC2
syn keyword orcaKeyword contained LPNO-CCSD LPNO1-CCSD DLPNO2013-CCSD DLPNO-CCSD
syn match orcaKeyword contained "\<DLPNO2013-CCSD(T)\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T)\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T1)\>"
syn match orcaKeyword contained "\<DLPNO2013-PCCSD/1A\>"
syn match orcaKeyword contained "\<DLPNO-PCCSD/1A\>"
syn keyword orcaKeyword contained DLPNO2013-CISD DLPNO-CISD DLPNO2013-QCISD DLPNO-QCISD
syn match orcaKeyword contained "\<DLPNO2013-QCISD(T)\>"
syn match orcaKeyword contained "\<DLPNO-QCISD(T)\>"
syn match orcaKeyword contained "\<DLPNO2013-CEPA/1\>"
syn match orcaKeyword contained "\<DLPNO-CEPA/1\>"
syn match orcaKeyword contained "\<DLPNO-CEPA/0\>"
syn match orcaKeyword contained "\<DLPNO-CEPA/2\>"
syn match orcaKeyword contained "\<DLPNO-CEPA/3\>"
syn keyword orcaKeyword contained LED PNOEXTRAPOLATION LPNO-DDCI3 F12-LPNO-CCSD F12-LPNO1-CCSD LPNO-CCSD-F12 LPNO1-CCSD-F12 DLPNO2013-CCSD-F12
syn keyword orcaKeyword contained F12-DLPNO2013-CCSD DLPNO-CCSD-F12 F12-DLPNO-CCSD
syn match orcaKeyword contained "\<F12/D-DLPNO-CCSD\>"
syn match orcaKeyword contained "\<DLPNO-CCSD-F12/D\>"
syn keyword orcaKeyword contained F12D-DLPNO-CCSD DLPNO-CCSD-F12D HFLD
syn match orcaKeyword contained "\<DLPNO-CCSD(T)-F12\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T)-F12D\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T)-F12/D\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T1)-F12\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T1)-F12D\>"
syn match orcaKeyword contained "\<DLPNO-CCSD(T1)-F12/D\>"
syn keyword orcaKeyword contained F12-LPNO-MBPT2 LPNO-MBPT2-F12
syn match orcaKeyword contained "\<LPNO-CCSD(T)\>"
syn match orcaKeyword contained "\<LPNO3-CCSD(T)\>"
syn keyword orcaKeyword contained LPNO2-CCSD LPNO3-CCSD
syn match orcaKeyword contained "\<LPNO1-CCSD(T)\>"
syn match orcaKeyword contained "\<LPNO2-CCSD(T)\>"
syn match orcaKeyword contained "\<CCSD(T)\>"
syn match orcaKeyword contained "\<MO-CCSD(T)\>"
syn match orcaKeyword contained "\<RI34-CCSD(T)\>"
syn match orcaKeyword contained "\<RI-CCSD(T)\>"
syn match orcaKeyword contained "\<AOX-CCSD(T)\>"
syn match orcaKeyword contained "\<AO-CCSD(T)\>"
syn keyword orcaKeyword contained F12-CCSD CCSD-F12
syn match orcaKeyword contained "\<F12-CCSD(T)\>"
syn match orcaKeyword contained "\<CCSD(T)-F12\>"
syn match orcaKeyword contained "\<F12/RI-CCSD\>"
syn match orcaKeyword contained "\<CCSD-F12/RI\>"
syn match orcaKeyword contained "\<F12/D/RI-CCSD\>"
syn match orcaKeyword contained "\<CCSD-F12/D/RI\>"
syn match orcaKeyword contained "\<F12D/RI-CCSD\>"
syn match orcaKeyword contained "\<CCSD-F12D/RI\>"
syn match orcaKeyword contained "\<F12/RI-CCSD(T)\>"
syn match orcaKeyword contained "\<CCSD(T)-F12/RI\>"
syn match orcaKeyword contained "\<F12/D/RI-CCSD(T)\>"
syn match orcaKeyword contained "\<CCSD(T)-F12D/RI\>"
syn match orcaKeyword contained "\<RI-CCSD-F12/RI\>"
syn match orcaKeyword contained "\<RI-CCSD(T)-F12/RI\>"
syn keyword orcaKeyword contained EOM-CCSD EE-EOM-CCSD EOM-CC2 IP-EOM-CCSD EA-EOM-CCSD ADC2 EE-ADC2 IP-ADC2
syn keyword orcaKeyword contained EA-ADC2 STEOM-CCSD IH-FSMR-CCSD BT-PNO-EOM-CCSD BT-PNO-EE-EOM-CCSD BT-PNO-IP-EOM-CCSD BT-PNO-EA-EOM-CCSD BT-PNO-STEOM-CCSD
syn keyword orcaKeyword contained BT-PNO-IH-FSMR-CCSD IP-EOM-DLPNO-CCSD EA-EOM-DLPNO-CCSD EOM-DLPNO-CCSD EE-EOM-DLPNO-CCSD STEOM-DLPNO-CCSD DLPNO-STEOM-CCSD
syn match orcaKeyword contained "\<PCCSD/1A\>"
syn match orcaKeyword contained "\<PCCSD/1B\>"
syn match orcaKeyword contained "\<PCCSD/2A\>"
syn match orcaKeyword contained "\<PCCSD/2B\>"
syn match orcaKeyword contained "\<MO-PCCSD/1A\>"
syn match orcaKeyword contained "\<MO-PCCSD/1B\>"
syn match orcaKeyword contained "\<MO-PCCSD/2A\>"
syn match orcaKeyword contained "\<MO-PCCSD/2B\>"
syn match orcaKeyword contained "\<RI-PCCSD/1A\>"
syn match orcaKeyword contained "\<RI-PCCSD/1B\>"
syn match orcaKeyword contained "\<RI-PCCSD/2A\>"
syn match orcaKeyword contained "\<RI-PCCSD/2B\>"
syn match orcaKeyword contained "\<RI34-PCCSD/1A\>"
syn match orcaKeyword contained "\<RI34-PCCSD/1B\>"
syn match orcaKeyword contained "\<RI34-PCCSD/2A\>"
syn match orcaKeyword contained "\<RI34-PCCSD/2B\>"
syn match orcaKeyword contained "\<AOX-PCCSD/1A\>"
syn match orcaKeyword contained "\<AOX-PCCSD/1B\>"
syn match orcaKeyword contained "\<AOX-PCCSD/2A\>"
syn match orcaKeyword contained "\<AOX-PCCSD/2B\>"
syn match orcaKeyword contained "\<AO-PCCSD/1A\>"
syn match orcaKeyword contained "\<AO-PCCSD/1B\>"
syn match orcaKeyword contained "\<AO-PCCSD/2A\>"
syn match orcaKeyword contained "\<AO-PCCSD/2B\>"
syn match orcaKeyword contained "\<SL-PCCSD/1A\>"
syn match orcaKeyword contained "\<SL-PCCSD/1B\>"
syn match orcaKeyword contained "\<SL-PCCSD/2A\>"
syn match orcaKeyword contained "\<SL-PCCSD/2B\>"
syn match orcaKeyword contained "\<LPNO-PCCSD/1A\>"
syn match orcaKeyword contained "\<LPNO1-PCCSD/1A\>"
syn match orcaKeyword contained "\<LPNO-PCCSD/1B\>"
syn match orcaKeyword contained "\<LPNO1-PCCSD/1B\>"
syn match orcaKeyword contained "\<LPNO-PCCSD/2A\>"
syn match orcaKeyword contained "\<LPNO1-PCCSD/2A\>"
syn match orcaKeyword contained "\<LPNO-PCCSD/2B\>"
syn match orcaKeyword contained "\<LPNO1-PCCSD/2B\>"
syn match orcaKeyword contained "\<LPNO2-PCCSD/1A\>"
syn match orcaKeyword contained "\<LPNO2-PCCSD/1B\>"
syn match orcaKeyword contained "\<LPNO2-PCCSD/2A\>"
syn match orcaKeyword contained "\<LPNO2-PCCSD/2B\>"
syn match orcaKeyword contained "\<LPNO3-PCCSD/1A\>"
syn match orcaKeyword contained "\<LPNO3-PCCSD/1B\>"
syn match orcaKeyword contained "\<LPNO3-PCCSD/2A\>"
syn match orcaKeyword contained "\<LPNO3-PCCSD/2B\>"
syn keyword orcaKeyword contained CCD
syn match orcaKeyword contained "\<CCD(MO)\>"
syn keyword orcaKeyword contained RI34-CCD RI-CCD
syn match orcaKeyword contained "\<CEPA/2\>"
syn match orcaKeyword contained "\<MO-CEPA/2\>"
syn match orcaKeyword contained "\<AO-CEPA/2\>"
syn match orcaKeyword contained "\<AOX-CEPA/2\>"
syn match orcaKeyword contained "\<RI34-CEPA/2\>"
syn match orcaKeyword contained "\<RI-CEPA/2\>"
syn match orcaKeyword contained "\<RI-CEPA/2-F12\>"
syn match orcaKeyword contained "\<SL-CEPA/2\>"
syn match orcaKeyword contained "\<RI-PNO-CEPA/2\>"
syn match orcaKeyword contained "\<LPNO-CEPA/2\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/2\>"
syn match orcaKeyword contained "\<LPNO-CEPA/2-F12\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/2-F12\>"
syn match orcaKeyword contained "\<LPNO2-CEPA/2\>"
syn match orcaKeyword contained "\<CEPA/0\>"
syn match orcaKeyword contained "\<CEPA/1\>"
syn match orcaKeyword contained "\<MO-CEPA/1\>"
syn match orcaKeyword contained "\<AO-CEPA/1\>"
syn match orcaKeyword contained "\<AOX-CEPA/1\>"
syn match orcaKeyword contained "\<RI34-CEPA/1\>"
syn match orcaKeyword contained "\<RI-CEPA/1\>"
syn match orcaKeyword contained "\<RI-CEPA/1-F12\>"
syn match orcaKeyword contained "\<SL-CEPA/1\>"
syn match orcaKeyword contained "\<RI-PNO-CEPA/1\>"
syn match orcaKeyword contained "\<LPNO-CEPA/1\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/1\>"
syn match orcaKeyword contained "\<LPNO-CEPA/1-F12\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/1-F12\>"
syn match orcaKeyword contained "\<LPNO2-CEPA/1\>"
syn match orcaKeyword contained "\<CEPA/3\>"
syn match orcaKeyword contained "\<MO-CEPA/3\>"
syn match orcaKeyword contained "\<AO-CEPA/3\>"
syn match orcaKeyword contained "\<AOX-CEPA/3\>"
syn match orcaKeyword contained "\<RI34-CEPA/3\>"
syn match orcaKeyword contained "\<RI-CEPA/3\>"
syn match orcaKeyword contained "\<RI-CEPA/3-F12\>"
syn match orcaKeyword contained "\<RI-PNO-CEPA/3\>"
syn match orcaKeyword contained "\<LPNO-CEPA/3\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/3\>"
syn match orcaKeyword contained "\<LPNO-CEPA/3-F12\>"
syn match orcaKeyword contained "\<LPNO1-CEPA/3-F12\>"
syn match orcaKeyword contained "\<LPNO2-CEPA/3\>"
syn match orcaKeyword contained "\<CPF/2\>"
syn match orcaKeyword contained "\<MO-CPF/2\>"
syn match orcaKeyword contained "\<AO-CPF/2\>"
syn match orcaKeyword contained "\<AOX-CPF/2\>"
syn match orcaKeyword contained "\<RI34-CPF/2\>"
syn match orcaKeyword contained "\<RI-CPF/2\>"
syn match orcaKeyword contained "\<RI-PNO-CPF/2\>"
syn match orcaKeyword contained "\<LPNO-CPF/2\>"
syn match orcaKeyword contained "\<CPF/1\>"
syn keyword orcaKeyword contained CPF
syn match orcaKeyword contained "\<MO-CPF/1\>"
syn keyword orcaKeyword contained MO-CPF
syn match orcaKeyword contained "\<AO-CPF/1\>"
syn match orcaKeyword contained "\<AOX-CPF/1\>"
syn match orcaKeyword contained "\<RI34-CPF/1\>"
syn match orcaKeyword contained "\<RI-CPF/1\>"
syn match orcaKeyword contained "\<SL-CPF/1\>"
syn match orcaKeyword contained "\<RI-PNO-CPF/1\>"
syn match orcaKeyword contained "\<LPNO-CPF/1\>"
syn match orcaKeyword contained "\<CPF/3\>"
syn match orcaKeyword contained "\<MO-CPF/3\>"
syn match orcaKeyword contained "\<AO-CPF/3\>"
syn match orcaKeyword contained "\<AOX-CPF/3\>"
syn match orcaKeyword contained "\<RI34-CPF/3\>"
syn match orcaKeyword contained "\<RI-CPF/3\>"
syn match orcaKeyword contained "\<RI-PNO-CPF/3\>"
syn match orcaKeyword contained "\<LPNO-CPF/3\>"
syn match orcaKeyword contained "\<NCEPA/2\>"
syn match orcaKeyword contained "\<MO-NCEPA/2\>"
syn match orcaKeyword contained "\<AO-NCEPA/2\>"
syn match orcaKeyword contained "\<AOX-NCEPA/2\>"
syn match orcaKeyword contained "\<RI34-NCEPA/2\>"
syn match orcaKeyword contained "\<RI-NCEPA/2\>"
syn match orcaKeyword contained "\<SL-NCEPA/2\>"
syn match orcaKeyword contained "\<RI-PNO-NCEPA/2\>"
syn match orcaKeyword contained "\<LPNO-NCEPA/2\>"
syn match orcaKeyword contained "\<NCEPA/1\>"
syn match orcaKeyword contained "\<MO-NCEPA/1\>"
syn match orcaKeyword contained "\<AO-NCEPA/1\>"
syn match orcaKeyword contained "\<AOX-NCEPA/1\>"
syn match orcaKeyword contained "\<RI34-NCEPA/1\>"
syn match orcaKeyword contained "\<RI-NCEPA/1\>"
syn match orcaKeyword contained "\<SL-NCEPA/1\>"
syn match orcaKeyword contained "\<RI-PNO-NCEPA/1\>"
syn match orcaKeyword contained "\<LPNO-NCEPA/1\>"
syn match orcaKeyword contained "\<NCEPA/3\>"
syn match orcaKeyword contained "\<MO-NCEPA/3\>"
syn match orcaKeyword contained "\<AO-NCEPA/3\>"
syn match orcaKeyword contained "\<AOX-NCEPA/3\>"
syn match orcaKeyword contained "\<RI34-NCEPA/3\>"
syn match orcaKeyword contained "\<RI-NCEPA/3\>"
syn match orcaKeyword contained "\<RI-PNO-NCEPA/3\>"
syn match orcaKeyword contained "\<LPNO-NCEPA/3\>"
syn match orcaKeyword contained "\<NCPF/2\>"
syn match orcaKeyword contained "\<MO-NCPF/2\>"
syn match orcaKeyword contained "\<AO-NCPF/2\>"
syn match orcaKeyword contained "\<AOX-NCPF/2\>"
syn match orcaKeyword contained "\<RI34-NCPF/2\>"
syn match orcaKeyword contained "\<RI-NCPF/2\>"
syn match orcaKeyword contained "\<SL-NCPF/2\>"
syn match orcaKeyword contained "\<RI-PNO-NCPF/2\>"
syn match orcaKeyword contained "\<LPNO-NCPF/2\>"
syn match orcaKeyword contained "\<NCPF/1\>"
syn match orcaKeyword contained "\<MO-NCPF/1\>"
syn match orcaKeyword contained "\<AO-NCPF/1\>"
syn match orcaKeyword contained "\<AOX-NCPF/1\>"
syn match orcaKeyword contained "\<RI34-NCPF/1\>"
syn match orcaKeyword contained "\<RI-NCPF/1\>"
syn match orcaKeyword contained "\<SL-NCPF/1\>"
syn match orcaKeyword contained "\<RI-PNO-NCPF/1\>"
syn match orcaKeyword contained "\<LPNO-NCPF/1\>"
syn match orcaKeyword contained "\<NCPF/3\>"
syn match orcaKeyword contained "\<MO-NCPF/3\>"
syn match orcaKeyword contained "\<AO-NCPF/3\>"
syn match orcaKeyword contained "\<AOX-NCPF/3\>"
syn match orcaKeyword contained "\<RI34-NCPF/3\>"
syn match orcaKeyword contained "\<RI-NCPF/3\>"
syn match orcaKeyword contained "\<RI-PNO-NCPF/3\>"
syn match orcaKeyword contained "\<LPNO-NCPF/3\>"
syn match orcaKeyword contained "\<VCEPA/1\>"
syn keyword orcaKeyword contained VCEPA
syn match orcaKeyword contained "\<MO-VCEPA/1\>"
syn keyword orcaKeyword contained MO-VCEPA
syn match orcaKeyword contained "\<AO-VCEPA/1\>"
syn match orcaKeyword contained "\<AOX-VCEPA/1\>"
syn match orcaKeyword contained "\<RI34-VCEPA/1\>"
syn match orcaKeyword contained "\<RI-VCEPA/1\>"
syn match orcaKeyword contained "\<SL-VCEPA/1\>"
syn match orcaKeyword contained "\<RI-PNO-VCEPA/1\>"
syn match orcaKeyword contained "\<LPNO-VCEPA/1\>"
syn match orcaKeyword contained "\<VNCEPA/1\>"
syn keyword orcaKeyword contained VNCEPA
syn match orcaKeyword contained "\<MO-VNCEPA/1\>"
syn match orcaKeyword contained "\<AO-VNCEPA/1\>"
syn match orcaKeyword contained "\<AOX-VNCEPA/1\>"
syn match orcaKeyword contained "\<RI34-VNCEPA/1\>"
syn match orcaKeyword contained "\<RI-VNCEPA/1\>"
syn match orcaKeyword contained "\<SL-VNCEPA/1\>"
syn match orcaKeyword contained "\<RI-PNO-VNCEPA/1\>"
syn match orcaKeyword contained "\<LPNO-VNCEPA/1\>"
syn keyword orcaKeyword contained ACPF MO-ACPF AO-ACPF AOX-ACPF RI-ACPF RI23-ACPF SL-ACPF RI-PNO-ACPF
syn keyword orcaKeyword contained LPNO-ACPF NACPF MO-NACPF AO-NACPF AOX-NACPF RI-NACPF RI23-NACPF SL-NACPF
syn keyword orcaKeyword contained RI-PNO-NACPF LPNO-NACPF AQCC MO-AQCC AO-AQCC AOX-AQCC RI-AQCC RI23-AQCC
syn keyword orcaKeyword contained BCID BCCD
syn match orcaKeyword contained "\<BCCD(T)\>"
syn keyword orcaKeyword contained BCEPA
syn match orcaKeyword contained "\<BCEPA(T)\>"
syn keyword orcaKeyword contained BVCEPA
syn match orcaKeyword contained "\<BVCEPA(T)\>"
syn keyword orcaKeyword contained BCPF
syn match orcaKeyword contained "\<BCPF(T)\>"
syn keyword orcaKeyword contained BACPF
syn match orcaKeyword contained "\<BACPF(T)\>"
syn keyword orcaKeyword contained BAQCC
syn match orcaKeyword contained "\<BAQCC(T)\>"
syn keyword orcaKeyword contained OOCID OOVCEPA
syn match orcaKeyword contained "\<OOVCEPA(T)\>"
syn keyword orcaKeyword contained OOCPF
syn match orcaKeyword contained "\<OOCPF(T)\>"
syn keyword orcaKeyword contained OOACPF
syn match orcaKeyword contained "\<OOACPF(T)\>"
syn keyword orcaKeyword contained OOAQCC
syn match orcaKeyword contained "\<OOAQCC(T)\>"
syn keyword orcaKeyword contained OOCCD
syn match orcaKeyword contained "\<OOCCD(T)\>"
syn keyword orcaKeyword contained MP3 SCS-MP3 MO-MP3 AO-MP3 AOX-MP3 RI34-MP3 RI-MP3
syn match orcaKeyword contained "\<SL-NCEPA/1\>"
syn keyword orcaKeyword contained FIC-MRCI FIC-CEPA0 FIC-CEPA1 FIC-ACPF FIC-AQCC FIC-DDCI3 FIC-QSDDCI3 FIC-BMRCI
syn keyword orcaKeyword contained FIC-DDCI3-C0 FIC-MRCC MRCC MR-EOM MREOM MR-EOM-U2H MREOM-U2H
syn match orcaKeyword contained "\<MR-EOM-T|TD|SXD\>"
syn match orcaKeyword contained "\<MREOM-T|TD|SXD\>"
syn match orcaKeyword contained "\<MR-EOM-T|TD\>"
syn match orcaKeyword contained "\<MREOM-T|TD\>"
syn keyword orcaKeyword contained ORBITALSELECTION LOOSEPNO NORMALPNO TIGHTPNO DLPNO-HFC1 DLPNO-HFC2 MRCI
syn match orcaKeyword contained "\<MRCI+Q\>"
syn keyword orcaKeyword contained MRACPF MRAQCC MRDDCI1 MRDDCI2 MRDDCI3
syn match orcaKeyword contained "\<MRDDCI1+Q\>"
syn match orcaKeyword contained "\<MRDDCI2+Q\>"
syn match orcaKeyword contained "\<MRDDCI3+Q\>"
syn keyword orcaKeyword contained MRMP2
syn match orcaKeyword contained "\<MRMP2(G0)\>"
syn match orcaKeyword contained "\<MRMP2(G3)\>"
syn keyword orcaKeyword contained SORCI SORCP RI-MRCI
syn match orcaKeyword contained "\<RI-MRCI+Q\>"
syn keyword orcaKeyword contained RI-MRACPF RI-MRAQCC RI-MRDDCI1 RI-MRDDCI2 RI-MRDDCI3
syn match orcaKeyword contained "\<RI-MRDDCI1+Q\>"
syn match orcaKeyword contained "\<RI-MRDDCI2+Q\>"
syn match orcaKeyword contained "\<RI-MRDDCI3+Q\>"
syn keyword orcaKeyword contained RI-MRMP2
syn match orcaKeyword contained "\<RI-MRMP2(G0)\>"
syn match orcaKeyword contained "\<RI-MRMP2(G3)\>"
syn keyword orcaKeyword contained RI-SORCI RI-SORCP DFT
syn match orcaKeyword contained "\<ZINDO/S\>"
syn match orcaKeyword contained "\<ZINDO/1\>"
syn match orcaKeyword contained "\<ZINDO/2\>"
syn match orcaKeyword contained "\<NDDO/1\>"
syn match orcaKeyword contained "\<NDDO/2\>"
syn match orcaKeyword contained "\<NDDO/MK\>"
syn match orcaKeyword contained "\<ZNDDO/1\>"
syn match orcaKeyword contained "\<ZNDDO/2\>"
syn keyword orcaKeyword contained MNDO AM1 PM3 NOTCH NONOTCH ADFT
syn match orcaKeyword contained "\<ADFT(CC)\>"
syn match orcaKeyword contained "\<ADFT(HF)\>"
syn match orcaKeyword contained "\<ADFT(XALPHA)\>"
syn keyword orcaKeyword contained NOADFT ENERGY SINGLEPOINT SP OPT MD CIM SCANTS
syn keyword orcaKeyword contained OPTTS OPTH L-OPT L-OPTH CALCESTHESS QMMMOPT
syn match orcaKeyword contained "\<QMMMOPT/PDYNAMO\>"
syn keyword orcaKeyword contained SURFCROSSOPT MECP-OPT CI-OPT CONICALINTERSECT-OPT SCALEPC DOEQ NOEQ GDIIS-OPT
syn keyword orcaKeyword contained GEDIISOPT IPESOPT GOAT C-GOAT COPT GDIIS-COPT ZOPT GDIIS-ZOPT
syn keyword orcaKeyword contained ANCOPT NEB ZOOM-NEB NEB-IDPP NEB-CI ZOOM-NEB-CI NEB-TS ZOOM-NEB-TS
syn keyword orcaKeyword contained FLAT-NEB-TS TIGHT-NEB-TS LOOSE-NEB-TS IDPP-TS FAST-NEB-TS IRC ORCAEXT EXTOPT
syn keyword orcaKeyword contained QMMM
syn match orcaKeyword contained "\<QM/MM\>"
syn keyword orcaKeyword contained QMMMSETUP
syn match orcaKeyword contained "\<QM/XTB2/GFN-FF\>"
syn match orcaKeyword contained "\<QM/XTB/GFN-FF\>"
syn match orcaKeyword contained "\<QM/XTB\>"
syn match orcaKeyword contained "\<QM/XTB2\>"
syn match orcaKeyword contained "\<QM/XTB1\>"
syn match orcaKeyword contained "\<QM/GFN-FF\>"
syn match orcaKeyword contained "\<QM/HF-3C\>"
syn match orcaKeyword contained "\<QM/PBEH-3C\>"
syn match orcaKeyword contained "\<QM/R2SCAN3C\>"
syn match orcaKeyword contained "\<QM/R2SCAN-3C\>"
syn match orcaKeyword contained "\<QM/PM3\>"
syn match orcaKeyword contained "\<QM/AM1\>"
syn match orcaKeyword contained "\<QM/QM2\>"
syn match orcaKeyword contained "\<QM/XTB/MM\>"
syn match orcaKeyword contained "\<QM/XTB2/MM\>"
syn match orcaKeyword contained "\<QM/XTB1/MM\>"
syn match orcaKeyword contained "\<QM/GFN-FF/MM\>"
syn match orcaKeyword contained "\<QM/HF-3C/MM\>"
syn match orcaKeyword contained "\<QM/PBEH-3C/MM\>"
syn match orcaKeyword contained "\<QM/R2SCAN-3C/MM\>"
syn match orcaKeyword contained "\<QM/R2SCAN3C/MM\>"
syn match orcaKeyword contained "\<QM/PM3/MM\>"
syn match orcaKeyword contained "\<QM/AM1/MM\>"
syn match orcaKeyword contained "\<QM/QM2/MM\>"
syn keyword orcaKeyword contained IONIC-CRYSTAL-QMMM MOLECULAR-CRYSTAL-QMMM MOL-CRYSTAL-QMMM ENERGYGRAD ENGRAD NMSCAN NORMALMODESCAN FCNMSCAN
syn keyword orcaKeyword contained FCNORMALMODESCAN MODETRAJECTORY MTRAJECTORY MTR MT ENERGYNORMALMODEGRAD ENERGYNMGRAD ENNMGRAD
syn keyword orcaKeyword contained ENMGRAD NMGRAD NOGDIIS GDIIS NUMGRAD NUMNAC NUMNACME SURFCROSSNUMFREQ
syn keyword orcaKeyword contained MECP-NUMFREQ PRINTTHERMOCHEM PROPERTIESONLY ANMR CREGEN CONFSCRIPT HF-3C PBEH-3C
syn keyword orcaKeyword contained PBEH3C B97-3C B973C
syn match orcaKeyword contained "\<B3LYP-GCP-D3/6-31G\*\>"
syn match orcaKeyword contained "\<B3LYP-GCP-D3/6-31G(D)\>"
syn match orcaKeyword contained "\<GCP(HF/SV(P/H,C))\>"
syn match orcaKeyword contained "\<GCP(HF/SVX)\>"
syn match orcaKeyword contained "\<GCP(HF/SV(P))\>"
syn match orcaKeyword contained "\<GCP(DFT/SV(P/H,C))\>"
syn match orcaKeyword contained "\<GCP(DFT/SVX)\>"
syn match orcaKeyword contained "\<GCP(DFT/SV(P))\>"
syn match orcaKeyword contained "\<GCP(DFT/LANL)\>"
syn match orcaKeyword contained "\<GCP(HF/631G\*)\>"
syn match orcaKeyword contained "\<GCP(HF/631G(d))\>"
syn match orcaKeyword contained "\<GCP(DFT/631G\*)\>"
syn match orcaKeyword contained "\<GCP(DFT/631G(d))\>"
syn match orcaKeyword contained "\<GCP(HF/MINIS)\>"
syn match orcaKeyword contained "\<GCP(HF/MINIX)\>"
syn match orcaKeyword contained "\<GCP(HF/SV)\>"
syn match orcaKeyword contained "\<GCP(HF/SVP)\>"
syn match orcaKeyword contained "\<GCP(HF/631GD)\>"
syn match orcaKeyword contained "\<GCP(HF/TZ)\>"
syn match orcaKeyword contained "\<GCP(DFT/MINIS)\>"
syn match orcaKeyword contained "\<GCP(DFT/SV)\>"
syn match orcaKeyword contained "\<GCP(DFT/SVP)\>"
syn match orcaKeyword contained "\<GCP(DFT/631GD)\>"
syn match orcaKeyword contained "\<GCP(DFT/TZ)\>"
syn match orcaKeyword contained "\<GCP(FILE)\>"
syn keyword orcaKeyword contained USERSCF XTB BPOP ANMR CREGEN CONFSCRIPT HFS LSD
syn keyword orcaKeyword contained LDA VWN VWN5 VWN3 PWLDA BP86 BP BLYP
syn keyword orcaKeyword contained GLYP OLYP O3LYP XLYP PW91 MPWPW MPWLYP BPW91
syn keyword orcaKeyword contained BPW B1PW91 B1PW PBE RPW86PBE PW86PBE XHF REVPBE38
syn keyword orcaKeyword contained REVPBE0 HFLDA BPBE RPBE REVPBE PWP LB94 M06L
syn keyword orcaKeyword contained M06 M062X TPSS REVTPSS X3LYP PWP1 B1LYP
syn match orcaKeyword contained "\<B3LYP/G\>"
syn keyword orcaKeyword contained B3LYP B3LYP_G BHANDHLYP BHLYP B1P B1P86 B3P86 B3P
syn keyword orcaKeyword contained B3PW B3PW91 PBE0 OPBE TPSSH TPSS0 PW1PW MPW1PW
syn keyword orcaKeyword contained MPW1LYP PW6B95 WB97 WB97X WB97X-V B97M-V WB97M-V B97M-D3BJ
syn keyword orcaKeyword contained WB97X-D3BJ WB97M-D3BJ B97M-D4 WB97M-D4 WB97X-D4 CAM-B3LYP LC-BLYP LC-PBE
syn keyword orcaKeyword contained LRC-PBE B97 B97-D B97-D3 B97-D4 WB97X-D3 SCANFUNC RSCAN
syn keyword orcaKeyword contained R2SCAN R2SCAN-3C R2SCAN0 B2PLYP RI-B2PLYP DLPNO-B2PLYP MPW2PLYP RI-MPW2PLYP
syn keyword orcaKeyword contained DLPNO-MPW2PLYP B2GP-PLYP RI-B2GP-PLYP DLPNO-B2GP-PLYP B2T-PLYP RI-B2T-PLYP DLPNO-B2T-PLYP B2K-PLYP
syn keyword orcaKeyword contained RI-B2K-PLYP DLPNO-B2K-PLYP PBE0-DH RI-PBE0-DH DLPNO-PBE0-DH PBE0-2 RI-PBE0-2 DLPNO-PBE0-2
syn keyword orcaKeyword contained PBE-QIDH RI-PBE-QIDH DLPNO-PBE-QIDH PWPB95 RI-PWPB95 DLPNO-PWPB95 DSD-BLYP RI-DSD-BLYP
syn keyword orcaKeyword contained DLPNO-DSD-BLYP DSD-PBEP86 RI-DSD-PBEP86 DLPNO-DSD-PBEP86 DSD-PBEB95
syn match orcaKeyword contained "\<DSD-PBEB95/2013\>"
syn keyword orcaKeyword contained RI-DSD-PBEB95
syn match orcaKeyword contained "\<RI-DSD-PBEB95/2013\>"
syn keyword orcaKeyword contained DLPNO-DSD-PBEB95
syn match orcaKeyword contained "\<DLPNO-DSD-PBEB95/2013\>"
syn match orcaKeyword contained "\<DSD-BLYP/2013\>"
syn match orcaKeyword contained "\<RI-DSD-BLYP/2013\>"
syn match orcaKeyword contained "\<DLPNO-DSD-BLYP/2013\>"
syn match orcaKeyword contained "\<DSD-PBEP86/2013\>"
syn match orcaKeyword contained "\<RI-DSD-PBEP86/2013\>"
syn match orcaKeyword contained "\<DLPNO-DSD-PBEP86/2013\>"
syn keyword orcaKeyword contained WB2PLYP RI-WB2PLYP DLPNO-WB2PLYP WB2GP-PLYP RI-WB2GP-PLYP DLPNO-WB2GP-PLYP RSX-QIDH RI-RSX-QIDH
syn keyword orcaKeyword contained DLPNO-RSX-QIDH RSX-0DH RI-RSX-0DH DLPNO-RSX-0DH WB97X-2
syn match orcaKeyword contained "\<WB97X-2(TQZ)\>"
syn keyword orcaKeyword contained RI-WB97X-2
syn match orcaKeyword contained "\<RI-WB97X-2(TQZ)\>"
syn keyword orcaKeyword contained DLPNO-WB97X-2
syn match orcaKeyword contained "\<DLPNO-WB97X-2(TQZ)\>"
syn keyword orcaKeyword contained WB88PP86 RI-WB88PP86 DLPNO-WB88PP86 SCS-WB88PP86 RI-SCS-WB88PP86 DLPNO-SCS-WB88PP86 SOS-WB88PP86 RI-SOS-WB88PP86
syn keyword orcaKeyword contained DLPNO-SOS-WB88PP86 WPBEPP86 RI-WPBEPP86 DLPNO-WPBEPP86 SCS-WPBEPP86 RI-SCS-WPBEPP86 DLPNO-SCS-WPBEPP86 SOS-WPBEPP86
syn keyword orcaKeyword contained RI-SOS-WPBEPP86 DLPNO-SOS-WPBEPP86
syn match orcaKeyword contained "\<SCS/SOS-WB2PLYP\>"
syn match orcaKeyword contained "\<RI-SCS/SOS-WB2PLYP\>"
syn match orcaKeyword contained "\<DLPNO-SCS/SOS-WB2PLYP\>"
syn keyword orcaKeyword contained SCS-WB2GP-PLYP RI-SCS-WB2GP-PLYP DLPNO-SCS-WB2GP-PLYP SOS-WB2GP-PLYP RI-SOS-WB2GP-PLYP DLPNO-SOS-WB2GP-PLYP
syn match orcaKeyword contained "\<SCS/SOS-B2PLYP21\>"
syn match orcaKeyword contained "\<RI-SCS/SOS-B2PLYP21\>"
syn match orcaKeyword contained "\<DLPNO-SCS/SOS-B2PLYP21\>"
syn keyword orcaKeyword contained SCS-B2GP-PLYP21 RI-SCS-B2GP-PLYP21 DLPNO-SCS-B2GP-PLYP21 SOS-B2GP-PLYP21 RI-SOS-B2GP-PLYP21 DLPNO-SOS-B2GP-PLYP21 SCS-PBE-QIDH RI-SCS-PBE-QIDH
syn keyword orcaKeyword contained DLPNO-SCS-PBE-QIDH SOS-PBE-QIDH RI-SOS-PBE-QIDH DLPNO-SOS-PBE-QIDH SCS-RSX-QIDH RI-SCS-RSX-QIDH DLPNO-SCS-RSX-QIDH SOS-RSX-QIDH
syn keyword orcaKeyword contained RI-SOS-RSX-QIDH DLPNO-SOS-RSX-QIDH FOD NOCOSX SRLDA SRPBE FROZENCORE NOFROZENCORE
syn match orcaKeyword contained "\<GRID0\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID4\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID5\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID6\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRID7\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID0\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID4\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID5\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID6\(_OLD\)\?\>"
syn match orcaKeyword contained "\<FINALGRID7\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID0\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID4\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID5\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID6\(_OLD\)\?\>"
syn match orcaKeyword contained "\<VDWGRID7\(_OLD\)\?\>"
syn keyword orcaKeyword contained ROTINVGRID RIG
syn match orcaKeyword contained "\<GRIDX1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX4\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX5\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX6\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX7\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX8\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDX9\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDXOLD\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDXS1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<GRIDXS2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<MP2GRIDX1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<MP2GRIDX2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<MP2GRIDX3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<KCGRID1\(_OLD\)\?\>"
syn match orcaKeyword contained "\<KCGRID2\(_OLD\)\?\>"
syn match orcaKeyword contained "\<KCGRID3\(_OLD\)\?\>"
syn match orcaKeyword contained "\<KCGRID4\(_OLD\)\?\>"
syn match orcaKeyword contained "\<NOFINALGRID\(_OLD\)\?\>"
syn keyword orcaKeyword contained NOFINALGRIDX USEFINALGRIDX USESFITTING NOSFITTING RIJKSINGLESFOCK NORIJKSINGLESFOCK RCSINGLESFOCK NORCSINGLESFOCK
syn match orcaKeyword contained "\<DEFGRID\(1\|2\|3\)\>"
syn keyword orcaKeyword contained REFGRID
syn match orcaKeyword contained "\<\(NO\)\?XCFUN\>"
syn keyword orcaKeyword contained NL
syn match orcaKeyword contained "\<SCNL\(_OLD\)\?\>"
syn keyword orcaKeyword contained NOVDW VDW VDW10 VDW3 VDW06 VDW04 VDW10BJ VDW3BJ
syn keyword orcaKeyword contained VDWTZ D DFTD3 DFTD3BJ D30 D3ZERO D2 D3
syn keyword orcaKeyword contained D3BJ ABC D3TZ D4 DECONTRACTBAS UNCONTRACTBAS NODECONTRACTBAS NOUNCONTRACTBAS
syn keyword orcaKeyword contained DECONTRACTAUXJ UNCONTRACTAUXJ DECONTRACTAUX UNCONTRACTAUX NODECONTRACTAUXJ NOUNCONTRACTAUXJ NODECONTRACTAUX NOUNCONTRACTAUX
syn keyword orcaKeyword contained DECONTRACTAUXC UNCONTRACTAUXC NODECONTRACTAUXC NOUNCONTRACTAUXC DECONTRACTAUXJK UNCONTRACTAUXJK NODECONTRACTAUXJK NOUNCONTRACTAUXJK
syn keyword orcaKeyword contained DECONTRACTCABS UNCONTRACTCABS NODECONTRACTCABS NOUNCONTRACTCABS DECONTRACT UNCONTRACT NODECONTRACT NOUNCONTRACT
syn keyword orcaKeyword contained ANOBASIS NOECP READINTS KEEPINTS NOREADINTS NOKEEPINTS CHEAPINTS NOCHEAPINTS
syn keyword orcaKeyword contained KEEPDENS NOKEEPDENS KEEPDENSITY NOKEEPDENSITY KEEPFOCK NOKEEPFOCK SMALLPRINT MINIPRINT
syn keyword orcaKeyword contained LARGEPRINT NORMALPRINT NOMOPRINT PRINTBAS PRINTBASIS PRINTGAP TIGHTSCF LOOSESCF
syn keyword orcaKeyword contained SLOPPYSCF VERYTIGHTSCF STRONGSCF NORMALSCF EXTREMESCF SLOPPYSCFCHECK SLOPPYSCFCHECK NOSLOPPYSCFCHECK
syn keyword orcaKeyword contained SCFCONV6 SCFCONV7 SCFCONV8 SCFCONV9 SCFCONV10 SCFCONV11 SCFCONV12 SCFCONVERGENCEFORCED
syn keyword orcaKeyword contained SCFCONVFORCED VERYTIGHTOPT TIGHTOPT NORMALOPT LOOSEOPT PRINTMOS NOPRINTMOS MULLIKEN
syn keyword orcaKeyword contained NOMULLIKEN HIRSHFELD NOHIRSHFELD LOEWDIN NOLOEWDIN MAYER NOMAYER REDUCEDPOP
syn keyword orcaKeyword contained NOREDUCEDPOP NOPOP ALLPOP FMOPOP FMOPOPULATIONS NOFMOPOP NOFMOPOPULATIONS DKH
syn keyword orcaKeyword contained DKH2 DKH1 DKH3 DKH4 DKH5 ZORA IORA NESC
syn match orcaKeyword contained "\<ZORA/RI\>"
syn match orcaKeyword contained "\<IORA/RI\>"
syn match orcaKeyword contained "\<IORAMM/RI\>"
syn keyword orcaKeyword contained X2C REL1C RELFULL NPA NONPA NBO NONBO UNO
syn keyword orcaKeyword contained NOUNO UCO NOUCO ANGS BOHRS FRACOCC SMEAR NOSMEAR
syn keyword orcaKeyword contained XYZFILE PDBFILE ALLOWRHF NOALLOWRHF PAL PAL2 PAL3 PAL4
syn keyword orcaKeyword contained PAL5 PAL6 PAL7 PAL8 PAL16 NMR ZEFF-SOC SOMF
syn match orcaKeyword contained "\<SOMF(1X)\>"
syn keyword orcaKeyword contained RI-SOMF
syn match orcaKeyword contained "\<RI-SOMF(1X)\>"
syn keyword orcaKeyword contained VEFF-SOC
syn match orcaKeyword contained "\<VEFF(-2X)-SOC\>"
syn keyword orcaKeyword contained AMFI
syn match orcaKeyword contained "\<SOMF(4X)\>"
syn match orcaKeyword contained "\<RI-SOMF(4X)\>"
syn match orcaKeyword contained "\<SOMF(4XS)\>"
syn match orcaKeyword contained "\<RI-SOMF(4XS)\>"
syn keyword orcaKeyword contained G-TENSOR COSMO DDCOSMO CPCMC NOCOSMO COSMO-RS
syn match orcaKeyword contained "\<COSMO(WATER)\>"
syn match orcaKeyword contained "\<COSMO(DMSO)\>"
syn match orcaKeyword contained "\<COSMO(DMF)\>"
syn match orcaKeyword contained "\<COSMO(CH3CN)\>"
syn match orcaKeyword contained "\<COSMO(H3CCN)\>"
syn match orcaKeyword contained "\<COSMO(ACETONITRILE)\>"
syn match orcaKeyword contained "\<COSMO(METHANOL)\>"
syn match orcaKeyword contained "\<COSMO(ETHANOL)\>"
syn match orcaKeyword contained "\<COSMO(ACETONE)\>"
syn match orcaKeyword contained "\<COSMO(AMMONIA)\>"
syn match orcaKeyword contained "\<COSMO(PYRIDINE)\>"
syn match orcaKeyword contained "\<COSMO(CH2CL2)\>"
syn match orcaKeyword contained "\<COSMO(DCM)\>"
syn match orcaKeyword contained "\<COSMO(THF)\>"
syn match orcaKeyword contained "\<COSMO(CHLOROFORM)\>"
syn match orcaKeyword contained "\<COSMO(TOLUENE)\>"
syn match orcaKeyword contained "\<COSMO(CCL4)\>"
syn match orcaKeyword contained "\<COSMO(HEXANE)\>"
syn match orcaKeyword contained "\<COSMO(BENZENE)\>"
syn match orcaKeyword contained "\<COSMO(OCTANOL)\>"
syn match orcaKeyword contained "\<COSMO(CYCLOHEXANE)\>"
syn keyword orcaKeyword contained CPCM NOCPCM
syn match orcaKeyword contained "\<CPCM(WATER)\>"
syn match orcaKeyword contained "\<CPCM(DMSO)\>"
syn match orcaKeyword contained "\<CPCM(DMF)\>"
syn match orcaKeyword contained "\<CPCM(CH3CN)\>"
syn match orcaKeyword contained "\<CPCM(H3CCN)\>"
syn match orcaKeyword contained "\<CPCM(ACETONITRILE)\>"
syn match orcaKeyword contained "\<CPCM(METHANOL)\>"
syn match orcaKeyword contained "\<CPCM(ETHANOL)\>"
syn match orcaKeyword contained "\<CPCM(ACETONE)\>"
syn match orcaKeyword contained "\<CPCM(AMMONIA)\>"
syn match orcaKeyword contained "\<CPCM(PYRIDINE)\>"
syn match orcaKeyword contained "\<CPCM(OCTANOL)\>"
syn match orcaKeyword contained "\<CPCM(CH2CL2)\>"
syn match orcaKeyword contained "\<CPCM(DCM)\>"
syn match orcaKeyword contained "\<CPCM(THF)\>"
syn match orcaKeyword contained "\<CPCM(CHLOROFORM)\>"
syn match orcaKeyword contained "\<CPCM(TOLUENE)\>"
syn match orcaKeyword contained "\<CPCM(BENZENE)\>"
syn match orcaKeyword contained "\<CPCM(CCL4)\>"
syn match orcaKeyword contained "\<CPCM(CYCLOHEXANE)\>"
syn match orcaKeyword contained "\<CPCM(HEXANE)\>"
syn match orcaKeyword contained "\<CPCMC(WATER)\>"
syn match orcaKeyword contained "\<CPCMC(DMSO)\>"
syn match orcaKeyword contained "\<CPCMC(DMF)\>"
syn match orcaKeyword contained "\<CPCMC(CH3CN)\>"
syn match orcaKeyword contained "\<CPCMC(H3CCN)\>"
syn match orcaKeyword contained "\<CPCMC(ACETONITRILE)\>"
syn match orcaKeyword contained "\<CPCMC(METHANOL)\>"
syn match orcaKeyword contained "\<CPCMC(ETHANOL)\>"
syn match orcaKeyword contained "\<CPCMC(ACETONE)\>"
syn match orcaKeyword contained "\<CPCMC(AMMONIA)\>"
syn match orcaKeyword contained "\<CPCMC(PYRIDINE)\>"
syn match orcaKeyword contained "\<CPCMC(OCTANOL)\>"
syn match orcaKeyword contained "\<CPCMC(CH2CL2)\>"
syn match orcaKeyword contained "\<CPCMC(DCM)\>"
syn match orcaKeyword contained "\<CPCMC(THF)\>"
syn match orcaKeyword contained "\<CPCMC(CHLOROFORM)\>"
syn match orcaKeyword contained "\<CPCMC(TOLUENE)\>"
syn match orcaKeyword contained "\<CPCMC(BENZENE)\>"
syn match orcaKeyword contained "\<CPCMC(CCL4)\>"
syn match orcaKeyword contained "\<CPCMC(CYCLOHEXANE)\>"
syn match orcaKeyword contained "\<CPCMC(HEXANE)\>"
syn keyword orcaKeyword contained ECRISM
syn match orcaKeyword contained "\<ALPB(ACETONE)\>"
syn match orcaKeyword contained "\<ALPB(ACETONITRILE)\>"
syn match orcaKeyword contained "\<ALPB(ANILINE)\>"
syn match orcaKeyword contained "\<ALPB(BENZALDEHYDE)\>"
syn match orcaKeyword contained "\<ALPB(BENZENE)\>"
syn match orcaKeyword contained "\<ALPB(CH2CL2)\>"
syn match orcaKeyword contained "\<ALPB(CHCL3)\>"
syn match orcaKeyword contained "\<ALPB(CS2)\>"
syn match orcaKeyword contained "\<ALPB(DIOXANE)\>"
syn match orcaKeyword contained "\<ALPB(DMF)\>"
syn match orcaKeyword contained "\<ALPB(DMSO)\>"
syn match orcaKeyword contained "\<ALPB(ETHANOL)\>"
syn match orcaKeyword contained "\<ALPB(ETHER)\>"
syn match orcaKeyword contained "\<ALPB(ETHYLACETATE)\>"
syn match orcaKeyword contained "\<ALPB(FURANE)\>"
syn match orcaKeyword contained "\<ALPB(HEXADECANE)\>"
syn match orcaKeyword contained "\<ALPB(HEXANE)\>"
syn match orcaKeyword contained "\<ALPB(METHANOL)\>"
syn match orcaKeyword contained "\<ALPB(NITROMETHANE)\>"
syn match orcaKeyword contained "\<ALPB(OCTANOL)\>"
syn match orcaKeyword contained "\<ALPB(OCTANOL(WET))\>"
syn match orcaKeyword contained "\<ALPB(PHENOL)\>"
syn match orcaKeyword contained "\<ALPB(TOLUENE)\>"
syn match orcaKeyword contained "\<ALPB(THF)\>"
syn match orcaKeyword contained "\<ALPB(WATER)\>"
syn match orcaKeyword contained "\<ALPB(H2O)\>"
syn keyword orcaKeyword contained CHELPG
syn match orcaKeyword contained "\<CHELPG(LARGE)\>"
syn keyword orcaKeyword contained DENSITYANALYSIS AIM NOAIM RESCUE READCFILE MASS2016 VPT2 PAF
syn keyword orcaKeyword contained NUMFREQ ANFREQ FREQ NEARIR ESD
syn match orcaKeyword contained "\<ESD(ABS)\>"
syn match orcaKeyword contained "\<ESD(FLUOR)\>"
syn match orcaKeyword contained "\<ESD(PHOSP)\>"
syn match orcaKeyword contained "\<ESD(ISC)\>"
syn match orcaKeyword contained "\<ESD(IC)\>"
syn match orcaKeyword contained "\<ESD(RR)\>"
syn match orcaKeyword contained "\<ESD(RRAMAN)\>"
syn keyword orcaKeyword contained DFTMRCI DFET EXTRAPOLATE
syn match orcaKeyword contained "\<EXTRAPOLATE(CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(6)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(6,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5/6)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5/6,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5/6,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5/6,CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(5/6,AUG-CC-CORE)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(4/5,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,DEF2_D)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(DEF2_D)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,DEF2_D)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(2/3,MA-DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(MA-DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATE(3/4,MA-DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn keyword orcaKeyword contained EXTRAPOLATEEP2
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,DLPNO-CCSD(T)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2_D)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(SAUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,SAUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,SAUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2_D,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(SAUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,SAUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,SAUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2_D,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(AUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,AUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,AUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,AUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(SAUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,SAUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,SAUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(4/5,SAUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(2/3,DEF2_D,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(DEF2_D,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP2(3/4,DEF2_D,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,DLPNO-CCSD(T),LOOSEPNO)\>"
syn keyword orcaKeyword contained EXTRAPOLATEEP3
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,DLPNO-CCSD(T))\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,DLPNO-CCSD(T),NORMALPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,DLPNO-CCSD(T),TIGHTPNO)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(CC,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-CC,RI-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(AUG-ANO,DLPNO-MP2)\>"
syn match orcaKeyword contained "\<EXTRAPOLATEEP3(SAUG-ANO,DLPNO-MP2)\>"

" ORCA 6.x new DFT functionals (r2SCAN hybrids and double-hybrids)
syn keyword orcaKeyword contained R2SCANH R2SCAN50 PR2SCAN50 RI-PR2SCAN50 DLPNO-PR2SCAN50 PR2SCAN69 RI-PR2SCAN69 DLPNO-PR2SCAN69
syn keyword orcaKeyword contained WPR2SCAN50 RI-WPR2SCAN50 DLPNO-WPR2SCAN50 KPR2SCAN50 RI-KPR2SCAN50 DLPNO-KPR2SCAN50 R2SCAN-CIDH RI-R2SCAN-CIDH
syn keyword orcaKeyword contained DLPNO-R2SCAN-CIDH R2SCAN-QIDH RI-R2SCAN-QIDH DLPNO-R2SCAN-QIDH R2SCAN0-DH RI-R2SCAN0-DH DLPNO-R2SCAN0-DH R2SCAN0-2
syn keyword orcaKeyword contained RI-R2SCAN0-2 DLPNO-R2SCAN0-2

" ORCA 6.x composite 3C methods
syn keyword orcaKeyword contained WB97X-3C B3LYP-3C
syn match orcaKeyword contained "\<QM/WB97X-3C\>"
syn match orcaKeyword contained "\<QM/B3LYP-3C\>"
syn match orcaKeyword contained "\<QM/WB97X-3C/MM\>"
syn match orcaKeyword contained "\<QM/B3LYP-3C/MM\>"

" ORCA 6.x revised dispersion functionals
syn match orcaKeyword contained "\<WB97M(2)\>"
syn match orcaKeyword contained "\<RI-WB97M(2)\>"
syn match orcaKeyword contained "\<DLPNO-WB97M(2)\>"
syn keyword orcaKeyword contained WB97X-D4REV WB97M-D4REV REVDSD-PBEP86-D4 RI-REVDSD-PBEP86-D4 DLPNO-REVDSD-PBEP86-D4 REVDOD-PBEP86-D4 RI-REVDOD-PBEP86-D4 DLPNO-REVDOD-PBEP86-D4

" ORCA 6.x non-covalent double-hybrid
syn keyword orcaKeyword contained B2NC-PLYP RI-B2NC-PLYP DLPNO-B2NC-PLYP

" ORCA 6.x new correlated wavefunction methods
syn keyword orcaKeyword contained NEVPT3 RI-NEVPT3 DLPNO-NEVPT2 ICE-FR-NEVPT2 CCSDTQ RPAC UHF-IP-EOM-CCSD UHF-EA-EOM-CCSD
syn keyword orcaKeyword contained UHF-STEOM-CCSD

" ORCA 6.x optimization and structure keywords
syn keyword orcaKeyword contained GOAT-ENTROPY GOAT-EXPLORE GOAT-REACT GOAT-DIVERSITY GOAT-COARSE RIGIDBODYOPT S-IDPP

" ORCA 6.x docking keywords
syn keyword orcaKeyword contained QUICKDOCK NORMALDOCK COMPLETEDOCK
syn match orcaKeyword contained "\<DOCK(GFN-FF)\>"
syn match orcaKeyword contained "\<DOCK(GFN0-XTB)\>"
syn match orcaKeyword contained "\<DOCK(GFN1-XTB)\>"
syn match orcaKeyword contained "\<DOCK(GFN2-XTB)\>"

" ORCA 6.x CASDFT / srDFT / MCPDFT functionals (! line keywords)
syn keyword orcaKeyword contained ctLDA ctPBE ctPBE0
syn keyword orcaKeyword contained srLDA srPBE srPBE0
syn keyword orcaKeyword contained sr-ctLDA sr-ctPBE sr-ctPBE0
syn keyword orcaKeyword contained CI-ctLDA CI-ctPBE CI-ctPBE0
syn keyword orcaKeyword contained CI-srLDA CI-srPBE CI-srPBE0
syn keyword orcaKeyword contained CI-sr-ctLDA CI-sr-ctPBE CI-sr-ctPBE0

" ORCA 6.x SCF and analysis keywords
syn keyword orcaKeyword contained DELTASCF LEANSCF NOLEANSCF MIXGUESS BUPO
syn match orcaKeyword contained "\<\(NO\)\?AUTOTRAH\>"
syn keyword orcaKeyword contained ADLD ADEX MBIS RESP DRACO DBOC VCD SMD
syn keyword orcaKeyword contained SMD18
syn match orcaKeyword contained "\<SMD(1,1,1-TRICHLOROETHANE)\>"
syn match orcaKeyword contained "\<SMD(1,1,2-TRICHLOROETHANE)\>"
syn match orcaKeyword contained "\<SMD(1,2,4-TRIMETHYLBENZENE)\>"
syn match orcaKeyword contained "\<SMD(1,2-DIBROMOETHANE)\>"
syn match orcaKeyword contained "\<SMD(1,2-DICHLOROETHANE)\>"
syn match orcaKeyword contained "\<SMD(1,2-ETHANEDIOL)\>"
syn match orcaKeyword contained "\<SMD(1,4-DIOXANE)\>"
syn match orcaKeyword contained "\<SMD(1-BROMO-2-METHYLPROPANE)\>"
syn match orcaKeyword contained "\<SMD(1-BROMOOCTANE)\>"
syn match orcaKeyword contained "\<SMD(1-BROMOPENTANE)\>"
syn match orcaKeyword contained "\<SMD(1-BROMOPROPANE)\>"
syn match orcaKeyword contained "\<SMD(1-BUTANOL)\>"
syn match orcaKeyword contained "\<SMD(1-CHLOROHEXANE)\>"
syn match orcaKeyword contained "\<SMD(1-CHLOROPENTANE)\>"
syn match orcaKeyword contained "\<SMD(1-CHLOROPROPANE)\>"
syn match orcaKeyword contained "\<SMD(1-DECANOL)\>"
syn match orcaKeyword contained "\<SMD(1-FLUOROOCTANE)\>"
syn match orcaKeyword contained "\<SMD(1-HEPTANOL)\>"
syn match orcaKeyword contained "\<SMD(1-HEXANOL)\>"
syn match orcaKeyword contained "\<SMD(1-HEXENE)\>"
syn match orcaKeyword contained "\<SMD(1-HEXYNE)\>"
syn match orcaKeyword contained "\<SMD(1-IODOBUTANE)\>"
syn match orcaKeyword contained "\<SMD(1-IODOHEXADECANE)\>"
syn match orcaKeyword contained "\<SMD(1-IODOPENTANE)\>"
syn match orcaKeyword contained "\<SMD(1-IODOPROPANE)\>"
syn match orcaKeyword contained "\<SMD(1-NITROPROPANE)\>"
syn match orcaKeyword contained "\<SMD(1-NONANOL)\>"
syn match orcaKeyword contained "\<SMD(1-OCTANOL)\>"
syn match orcaKeyword contained "\<SMD(1-PENTANOL)\>"
syn match orcaKeyword contained "\<SMD(1-PENTENE)\>"
syn match orcaKeyword contained "\<SMD(1-PROPANOL)\>"
syn match orcaKeyword contained "\<SMD(2,2,2-TRIFLUOROETHANOL)\>"
syn match orcaKeyword contained "\<SMD(2,2,4-TRIMETHYLPENTANE)\>"
syn match orcaKeyword contained "\<SMD(2,4-DIMETHYLPENTANE)\>"
syn match orcaKeyword contained "\<SMD(2,4-DIMETHYLPYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(2,6-DIMETHYLPYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(2-BROMOPROPANE)\>"
syn match orcaKeyword contained "\<SMD(2-BUTANOL)\>"
syn match orcaKeyword contained "\<SMD(2-CHLOROBUTANE)\>"
syn match orcaKeyword contained "\<SMD(2-HEPTANONE)\>"
syn match orcaKeyword contained "\<SMD(2-HEXANONE)\>"
syn match orcaKeyword contained "\<SMD(2-METHOXYETHANOL)\>"
syn match orcaKeyword contained "\<SMD(2-METHYL-1-PROPANOL)\>"
syn match orcaKeyword contained "\<SMD(2-METHYL-2-PROPANOL)\>"
syn match orcaKeyword contained "\<SMD(2-METHYLPENTANE)\>"
syn match orcaKeyword contained "\<SMD(2-METHYLPYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(2-NITROPROPANE)\>"
syn match orcaKeyword contained "\<SMD(2-OCTANONE)\>"
syn match orcaKeyword contained "\<SMD(2-PENTANONE)\>"
syn match orcaKeyword contained "\<SMD(2-PROPANOL)\>"
syn match orcaKeyword contained "\<SMD(2-PROPEN-1-OL)\>"
syn match orcaKeyword contained "\<SMD(E-2-PENTENE)\>"
syn match orcaKeyword contained "\<SMD(3-METHYLPYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(3-PENTANONE)\>"
syn match orcaKeyword contained "\<SMD(4-HEPTANONE)\>"
syn match orcaKeyword contained "\<SMD(4-METHYL-2-PENTANONE)\>"
syn match orcaKeyword contained "\<SMD(4-METHYLPYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(5-NONANONE)\>"
syn match orcaKeyword contained "\<SMD(ACETICACID)\>"
syn match orcaKeyword contained "\<SMD(ACETONE)\>"
syn match orcaKeyword contained "\<SMD(ACETONITRILE)\>"
syn match orcaKeyword contained "\<SMD(CH3CN)\>"
syn match orcaKeyword contained "\<SMD(MECN)\>"
syn match orcaKeyword contained "\<SMD(ACETOPHENONE)\>"
syn match orcaKeyword contained "\<SMD(AMMONIA)\>"
syn match orcaKeyword contained "\<SMD(ANILINE)\>"
syn match orcaKeyword contained "\<SMD(ANISOLE)\>"
syn match orcaKeyword contained "\<SMD(BENZALDEHYDE)\>"
syn match orcaKeyword contained "\<SMD(BENZENE)\>"
syn match orcaKeyword contained "\<SMD(BENZONITRILE)\>"
syn match orcaKeyword contained "\<SMD(BENZYLALCOHOL)\>"
syn match orcaKeyword contained "\<SMD(BROMOBENZENE)\>"
syn match orcaKeyword contained "\<SMD(BROMOETHANE)\>"
syn match orcaKeyword contained "\<SMD(BROMOFORM)\>"
syn match orcaKeyword contained "\<SMD(BUTANAL)\>"
syn match orcaKeyword contained "\<SMD(BUTANOICACID)\>"
syn match orcaKeyword contained "\<SMD(BUTANONE)\>"
syn match orcaKeyword contained "\<SMD(BUTANONITRILE)\>"
syn match orcaKeyword contained "\<SMD(BUTYLACETATE)\>"
syn match orcaKeyword contained "\<SMD(BUTYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(BUTYLBENZENE)\>"
syn match orcaKeyword contained "\<SMD(CARBONDISULFIDE)\>"
syn match orcaKeyword contained "\<SMD(CS2)\>"
syn match orcaKeyword contained "\<SMD(CARBONTETRACHLORIDE)\>"
syn match orcaKeyword contained "\<SMD(CCL4)\>"
syn match orcaKeyword contained "\<SMD(CHLOROBENZENE)\>"
syn match orcaKeyword contained "\<SMD(CHLOROFORM)\>"
syn match orcaKeyword contained "\<SMD(CHCL3)\>"
syn match orcaKeyword contained "\<SMD(CHLOROTOLUENE)\>"
syn match orcaKeyword contained "\<SMD(CONDUCTOR)\>"
syn match orcaKeyword contained "\<SMD(CRESOL)\>"
syn match orcaKeyword contained "\<SMD(CYCLOHEXANE)\>"
syn match orcaKeyword contained "\<SMD(CYCLOHEXANONE)\>"
syn match orcaKeyword contained "\<SMD(CYCLOPENTANE)\>"
syn match orcaKeyword contained "\<SMD(CYCLOPENTANOL)\>"
syn match orcaKeyword contained "\<SMD(CYCLOPENTANONE)\>"
syn match orcaKeyword contained "\<SMD(DECALIN)\>"
syn match orcaKeyword contained "\<SMD(DECANE)\>"
syn match orcaKeyword contained "\<SMD(DIBROMOMETHANE)\>"
syn match orcaKeyword contained "\<SMD(DIBUTYLETHER)\>"
syn match orcaKeyword contained "\<SMD(DICHLOROBENZENE)\>"
syn match orcaKeyword contained "\<SMD(DICHLOROETHENE)\>"
syn match orcaKeyword contained "\<SMD(DICHLOROMETHANE)\>"
syn match orcaKeyword contained "\<SMD(DCM)\>"
syn match orcaKeyword contained "\<SMD(CH2CL2)\>"
syn match orcaKeyword contained "\<SMD(DIETHYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(DIETHYLETHER)\>"
syn match orcaKeyword contained "\<SMD(DIETHYLSULFIDE)\>"
syn match orcaKeyword contained "\<SMD(DIIODOMETHANE)\>"
syn match orcaKeyword contained "\<SMD(DIISOPROPYLETHER)\>"
syn match orcaKeyword contained "\<SMD(DIMETHYLACETAMIDE)\>"
syn match orcaKeyword contained "\<SMD(DIMETHYLCYCLOHEXANE)\>"
syn match orcaKeyword contained "\<SMD(DIMETHYLDISULFIDE)\>"
syn match orcaKeyword contained "\<SMD(DIMETHYLFORMAMIDE)\>"
syn match orcaKeyword contained "\<SMD(DMF)\>"
syn match orcaKeyword contained "\<SMD(DIMETHYLSULFOXIDE)\>"
syn match orcaKeyword contained "\<SMD(DMSO)\>"
syn match orcaKeyword contained "\<SMD(DIPHENYLETHER)\>"
syn match orcaKeyword contained "\<SMD(DIPROPYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(DODECANE)\>"
syn match orcaKeyword contained "\<SMD(ETHANETHIOL)\>"
syn match orcaKeyword contained "\<SMD(ETHANOL)\>"
syn match orcaKeyword contained "\<SMD(ETHOXYBENZENE)\>"
syn match orcaKeyword contained "\<SMD(ETHYLACETATE)\>"
syn match orcaKeyword contained "\<SMD(ETHYLBENZENE)\>"
syn match orcaKeyword contained "\<SMD(ETHYLMETHANOATE)\>"
syn match orcaKeyword contained "\<SMD(FLUOROBENZENE)\>"
syn match orcaKeyword contained "\<SMD(FORMAMIDE)\>"
syn match orcaKeyword contained "\<SMD(FORMICACID)\>"
syn match orcaKeyword contained "\<SMD(FURAN)\>"
syn match orcaKeyword contained "\<SMD(HEPTANE)\>"
syn match orcaKeyword contained "\<SMD(HEXADECANE)\>"
syn match orcaKeyword contained "\<SMD(HEXANE)\>"
syn match orcaKeyword contained "\<SMD(HEXANOICACID)\>"
syn match orcaKeyword contained "\<SMD(IODOBENZENE)\>"
syn match orcaKeyword contained "\<SMD(IODOETHANE)\>"
syn match orcaKeyword contained "\<SMD(IODOMETHANE)\>"
syn match orcaKeyword contained "\<SMD(ISOPROPYLBENZENE)\>"
syn match orcaKeyword contained "\<SMD(ISOPROPYLTOLUENE)\>"
syn match orcaKeyword contained "\<SMD(MESITYLENE)\>"
syn match orcaKeyword contained "\<SMD(METHANOL)\>"
syn match orcaKeyword contained "\<SMD(METHYLANILINE)\>"
syn match orcaKeyword contained "\<SMD(METHYLBENZOATE)\>"
syn match orcaKeyword contained "\<SMD(METHYLBUTANOATE)\>"
syn match orcaKeyword contained "\<SMD(METHYLCYCLOHEXANE)\>"
syn match orcaKeyword contained "\<SMD(METHYLETHANOATE)\>"
syn match orcaKeyword contained "\<SMD(METHYLFORMAMIDE)\>"
syn match orcaKeyword contained "\<SMD(METHYLMETHANOATE)\>"
syn match orcaKeyword contained "\<SMD(METHYLPROPANOATE)\>"
syn match orcaKeyword contained "\<SMD(NITROBENZENE)\>"
syn match orcaKeyword contained "\<SMD(NITROETHANE)\>"
syn match orcaKeyword contained "\<SMD(NITROMETHANE)\>"
syn match orcaKeyword contained "\<SMD(NITROTOLUENE)\>"
syn match orcaKeyword contained "\<SMD(NONANE)\>"
syn match orcaKeyword contained "\<SMD(OCTANE)\>"
syn match orcaKeyword contained "\<SMD(OCTANOL)\>"
syn match orcaKeyword contained "\<SMD(1-OCTANOL)\>"
syn match orcaKeyword contained "\<SMD(PENTADECANE)\>"
syn match orcaKeyword contained "\<SMD(PENTANAL)\>"
syn match orcaKeyword contained "\<SMD(PENTANE)\>"
syn match orcaKeyword contained "\<SMD(PENTANOICACID)\>"
syn match orcaKeyword contained "\<SMD(PENTYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(PENTYLETHANOATE)\>"
syn match orcaKeyword contained "\<SMD(PERFLUOROBENZENE)\>"
syn match orcaKeyword contained "\<SMD(PHENOL)\>"
syn match orcaKeyword contained "\<SMD(PROPANAL)\>"
syn match orcaKeyword contained "\<SMD(PROPANOICACID)\>"
syn match orcaKeyword contained "\<SMD(PROPANONITRILE)\>"
syn match orcaKeyword contained "\<SMD(PROPYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(PROPYLETHANOATE)\>"
syn match orcaKeyword contained "\<SMD(PYRIDINE)\>"
syn match orcaKeyword contained "\<SMD(TETRACHLOROETHENE)\>"
syn match orcaKeyword contained "\<SMD(TETRAHYDROFURAN)\>"
syn match orcaKeyword contained "\<SMD(THF)\>"
syn match orcaKeyword contained "\<SMD(SULFOLANE)\>"
syn match orcaKeyword contained "\<SMD(TETRALIN)\>"
syn match orcaKeyword contained "\<SMD(THIOPHENE)\>"
syn match orcaKeyword contained "\<SMD(THIOPHENOL)\>"
syn match orcaKeyword contained "\<SMD(TOLUENE)\>"
syn match orcaKeyword contained "\<SMD(TRIBUTYLPHOSPHATE)\>"
syn match orcaKeyword contained "\<SMD(TRICHLOROETHENE)\>"
syn match orcaKeyword contained "\<SMD(TRIETHYLAMINE)\>"
syn match orcaKeyword contained "\<SMD(UNDECANE)\>"
syn match orcaKeyword contained "\<SMD(WATER)\>"
syn match orcaKeyword contained "\<SMD(H2O)\>"
syn match orcaKeyword contained "\<SMD(XYLENE)\>"
syn match orcaKeyword contained "\<SMD(M-XYLENE)\>"
syn match orcaKeyword contained "\<SMD(O-XYLENE)\>"
syn match orcaKeyword contained "\<SMD(P-XYLENE)\>"
syn keyword orcaKeyword contained COVALED


" ============================================================
" Basis sets
" Add new basis set names here.
" ============================================================
syn keyword orcaBasis contained DEF2-SD SDD LANL1 LANL2 DEF2ECP SK-MCDHF-RSC DEFECP DHFECP
syn keyword orcaBasis contained HAYWADT 3-21G 3-21GSP 4-22GSP
syn match orcaBasis contained "\<6-311G(2D,2P)\>"
syn match orcaBasis contained "\<6-311G(2D)\>"
syn match orcaBasis contained "\<6-311G(2DF,2P)\>"
syn match orcaBasis contained "\<6-311G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-311G(2DF)\>"
syn match orcaBasis contained "\<6-311G(2D,P)\>"
syn match orcaBasis contained "\<6-311G(3DF,3PD)\>"
syn match orcaBasis contained "\<6-311G(3DF)\>"
syn keyword orcaBasis contained 6-311G
syn match orcaBasis contained "\<6-311G(D)\>"
syn match orcaBasis contained "\<6-311G(D,P)\>"
syn match orcaBasis contained "\<6-311G\*\>"
syn match orcaBasis contained "\<6-311G\*\*\>"
syn match orcaBasis contained "\<6-311+G(2D,2P)\>"
syn match orcaBasis contained "\<6-311+G(2D)\>"
syn match orcaBasis contained "\<6-311+G(2DF,2P)\>"
syn match orcaBasis contained "\<6-311+G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-311+G(2DF)\>"
syn match orcaBasis contained "\<6-311+G(2D,P)\>"
syn match orcaBasis contained "\<6-311+G(3DF,2P)\>"
syn match orcaBasis contained "\<6-311+G(3DF,3PD)\>"
syn match orcaBasis contained "\<6-311+G(3DF)\>"
syn match orcaBasis contained "\<6-311+G(D)\>"
syn match orcaBasis contained "\<6-311+G(D,P)\>"
syn match orcaBasis contained "\<6-311+G\*\>"
syn match orcaBasis contained "\<6-311+G\*\*\>"
syn match orcaBasis contained "\<6-311++G(2D,2P)\>"
syn match orcaBasis contained "\<6-311++G(2DF,2P)\>"
syn match orcaBasis contained "\<6-311++G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-311++G(2D,P)\>"
syn match orcaBasis contained "\<6-311++G(3DF,3PD)\>"
syn match orcaBasis contained "\<6-311++G(D,P)\>"
syn match orcaBasis contained "\<6-311++G\*\*\>"
syn match orcaBasis contained "\<6-31G(2D,2P)\>"
syn match orcaBasis contained "\<6-31G(2D)\>"
syn match orcaBasis contained "\<6-31G(2DF,2P)\>"
syn match orcaBasis contained "\<6-31G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-31G(2DF)\>"
syn match orcaBasis contained "\<6-31G(2D,P)\>"
syn keyword orcaBasis contained 6-31G
syn match orcaBasis contained "\<6-31G(D)\>"
syn match orcaBasis contained "\<6-31G(D,P)\>"
syn match orcaBasis contained "\<6-31G\*\>"
syn match orcaBasis contained "\<6-31G\*\*\>"
syn match orcaBasis contained "\<6-31+G(2D,2P)\>"
syn match orcaBasis contained "\<6-31+G(2D)\>"
syn match orcaBasis contained "\<6-31+G(2DF,2P)\>"
syn match orcaBasis contained "\<6-31+G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-31+G(2DF)\>"
syn match orcaBasis contained "\<6-31+G(2D,P)\>"
syn match orcaBasis contained "\<6-31+G(D)\>"
syn match orcaBasis contained "\<6-31+G(D,P)\>"
syn match orcaBasis contained "\<6-31+G\*\>"
syn match orcaBasis contained "\<6-31+G\*\*\>"
syn match orcaBasis contained "\<6-31++G(2D,2P)\>"
syn match orcaBasis contained "\<6-31++G(2DF,2P)\>"
syn match orcaBasis contained "\<6-31++G(2DF,2PD)\>"
syn match orcaBasis contained "\<6-31++G(2D,P)\>"
syn match orcaBasis contained "\<6-31++G(D,P)\>"
syn match orcaBasis contained "\<6-31++G\*\*\>"
syn keyword orcaBasis contained M6-31G
syn match orcaBasis contained "\<M6-31G\*\>"
syn keyword orcaBasis contained D95 D95P
syn match orcaBasis contained "\<WACHTERS+F\>"
syn keyword orcaBasis contained STO-3G MIDI MINI MINAO MINIS MINIX PARTRIDGE-1 PARTRIDGE-2
syn keyword orcaBasis contained PARTRIDGE-3 PARTRIDGE-4 UGBS LANL08
syn match orcaBasis contained "\<LANL08(F)\>"
syn keyword orcaBasis contained LANL2DZ LANL2TZ
syn match orcaBasis contained "\<LANL2TZ(F)\>"
syn keyword orcaBasis contained EPR-II EPR-III IGLO-II IGLO-III CP
syn match orcaBasis contained "\<CP(PPP)\>"
syn keyword orcaBasis contained ANO-SZ ANO-SZ-DKH-SMALL ANO-PVDZ ANO-PVTZ ANO-PVQZ ANO-PV5Z ANO-PV6Z AUG-ANO-PVDZ
syn keyword orcaBasis contained AUG-ANO-PVTZ AUG-ANO-PVQZ AUG-ANO-PV5Z SAUG-ANO-PVDZ SAUG-ANO-PVTZ SAUG-ANO-PVQZ SAUG-ANO-PV5Z ANO-RCC-MB
syn keyword orcaBasis contained ANO-RCC-DZP ANO-RCC-TZP ANO-RCC-QZP ANO-RCC-FULL DEF2-SVP DEF2-MSVP DEF2-MTZVP DEF2-MTZVPP
syn keyword orcaBasis contained DEF2-QZVP DEF2-QZVPD DEF2-QZVPP DEF2-QZVPPD
syn match orcaBasis contained "\<DEF2-SV(P)\>"
syn keyword orcaBasis contained DEF2-SVPD DEF2-TZVP DEF2-TZVPD
syn match orcaBasis contained "\<DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained DEF2-TZVPP DEF2-TZVPPD
syn match orcaBasis contained "\<DHF-SV(P)\>"
syn keyword orcaBasis contained DHF-SVP DHF-TZVP DHF-TZVPP DHF-QZVP DHF-QZVPP
syn match orcaBasis contained "\<DHF-SV(P)-2C\>"
syn keyword orcaBasis contained DHF-SVP-2C DHF-TZVP-2C DHF-TZVPP-2C DHF-QZVP-2C DHF-QZVPP-2C
syn match orcaBasis contained "\<X2C-SV(P)ALL\>"
syn keyword orcaBasis contained X2C-SVPALL X2C-TZVPALL X2C-TZVPPALL X2C-QZVPALL X2C-QZVPPALL
syn match orcaBasis contained "\<X2C-SV(P)ALL-2C\>"
syn keyword orcaBasis contained X2C-SVPALL-2C X2C-TZVPALL-2C X2C-TZVPPALL-2C X2C-QZVPALL-2C X2C-QZVPPALL-2C
syn match orcaBasis contained "\<X2C-SV(P)ALL-S\>"
syn keyword orcaBasis contained X2C-SVPALL-S X2C-TZVPALL-S X2C-TZVPPALL-S X2C-QZVPALL-S X2C-QZVPPALL-S X2C-QZVPALL-2C-S X2C-QZVPPALL-2C-S
syn match orcaBasis contained "\<DEF2/J\>"
syn match orcaBasis contained "\<DEF2/JK\>"
syn match orcaBasis contained "\<DEF2/JKSMALL\>"
syn match orcaBasis contained "\<DEF2-MTZVP/J\>"
syn match orcaBasis contained "\<DEF2-MTZVPP/J\>"
syn match orcaBasis contained "\<X2C/J\>"
syn match orcaBasis contained "\<DEF2-QZVPP/C\>"
syn match orcaBasis contained "\<DEF2-QZVPPD/C\>"
syn match orcaBasis contained "\<DEF2-SVP/C\>"
syn match orcaBasis contained "\<DEF2-SVPD/C\>"
syn match orcaBasis contained "\<DEF2-TZVP/C\>"
syn match orcaBasis contained "\<DEF2-TZVPD/C\>"
syn match orcaBasis contained "\<DEF2-TZVPP/C\>"
syn match orcaBasis contained "\<DEF2-TZVPPD/C\>"
syn keyword orcaBasis contained DKH-DEF2-QZVPP
syn match orcaBasis contained "\<DKH-DEF2-SV(P)\>"
syn keyword orcaBasis contained DKH-DEF2-SVP DKH-DEF2-TZVP
syn match orcaBasis contained "\<DKH-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained DKH-DEF2-TZVPP ZORA-DEF2-QZVPP
syn match orcaBasis contained "\<ZORA-DEF2-SV(P)\>"
syn keyword orcaBasis contained ZORA-DEF2-SVP ZORA-DEF2-TZVP
syn match orcaBasis contained "\<ZORA-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained ZORA-DEF2-TZVPP SV
syn match orcaBasis contained "\<SV(P)\>"
syn keyword orcaBasis contained SVP TZV
syn match orcaBasis contained "\<TZV(P)\>"
syn keyword orcaBasis contained TZVP TZVPP QZVP QZVPP
syn match orcaBasis contained "\<DKH-SV(P)\>"
syn keyword orcaBasis contained DKH-SVP
syn match orcaBasis contained "\<DKH-TZV(P)\>"
syn keyword orcaBasis contained DKH-TZVP DKH-TZVPP DKH-QZVP DKH-QZVPP
syn match orcaBasis contained "\<ZORA-SV(P)\>"
syn keyword orcaBasis contained ZORA-SVP
syn match orcaBasis contained "\<ZORA-TZV(P)\>"
syn keyword orcaBasis contained ZORA-TZVP ZORA-TZVPP ZORA-QZVP ZORA-QZVPP OLD-SV
syn match orcaBasis contained "\<OLD-SV(P)\>"
syn keyword orcaBasis contained OLD-SVP OLD-TZV
syn match orcaBasis contained "\<OLD-TZV(P)\>"
syn keyword orcaBasis contained OLD-TZVP OLD-TZVPP
syn match orcaBasis contained "\<OLD-DKH-SV(P)\>"
syn keyword orcaBasis contained OLD-DKH-SVP
syn match orcaBasis contained "\<OLD-DKH-TZV(P)\>"
syn keyword orcaBasis contained OLD-DKH-TZVP OLD-DKH-TZVPP
syn match orcaBasis contained "\<OLD-ZORA-SV(P)\>"
syn keyword orcaBasis contained OLD-ZORA-SVP
syn match orcaBasis contained "\<OLD-ZORA-TZV(P)\>"
syn keyword orcaBasis contained OLD-ZORA-TZVP OLD-ZORA-TZVPP MA-DEF2-MSVP MA-DEF2-QZVP MA-DEF2-QZVPP
syn match orcaBasis contained "\<MA-DEF2-SV(P)\>"
syn keyword orcaBasis contained MA-DEF2-SVP MA-DEF2-TZVP
syn match orcaBasis contained "\<MA-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained MA-DEF2-TZVPP MA-DKH-DEF2-QZVPP
syn match orcaBasis contained "\<MA-DKH-DEF2-SV(P)\>"
syn keyword orcaBasis contained MA-DKH-DEF2-SVP MA-DKH-DEF2-TZVP
syn match orcaBasis contained "\<MA-DKH-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained MA-DKH-DEF2-TZVPP MA-ZORA-DEF2-QZVPP
syn match orcaBasis contained "\<MA-ZORA-DEF2-SV(P)\>"
syn keyword orcaBasis contained MA-ZORA-DEF2-SVP MA-ZORA-DEF2-TZVP
syn match orcaBasis contained "\<MA-ZORA-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained MA-ZORA-DEF2-TZVPP DKH-MA-DEF2-QZVPP
syn match orcaBasis contained "\<DKH-MA-DEF2-SV(P)\>"
syn keyword orcaBasis contained DKH-MA-DEF2-SVP DKH-MA-DEF2-TZVP
syn match orcaBasis contained "\<DKH-MA-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained DKH-MA-DEF2-TZVPP ZORA-MA-DEF2-QZVPP
syn match orcaBasis contained "\<ZORA-MA-DEF2-SV(P)\>"
syn keyword orcaBasis contained ZORA-MA-DEF2-SVP ZORA-MA-DEF2-TZVP
syn match orcaBasis contained "\<ZORA-MA-DEF2-TZVP(-F)\>"
syn keyword orcaBasis contained ZORA-MA-DEF2-TZVPP SARC-DKH-SVP SARC-DKH-TZVP SARC-DKH-TZVPP SARC-ZORA-SVP SARC-ZORA-TZVP SARC-ZORA-TZVPP SARC2-DKH-QZV
syn keyword orcaBasis contained SARC2-DKH-QZVP SARC2-ZORA-QZV SARC2-ZORA-QZVP
syn match orcaBasis contained "\<SARC2-DKH-QZV/JK\>"
syn match orcaBasis contained "\<SARC2-DKH-QZVP/JK\>"
syn match orcaBasis contained "\<SARC2-ZORA-QZV/JK\>"
syn match orcaBasis contained "\<SARC2-ZORA-QZVP/JK\>"
syn match orcaBasis contained "\<SARC/J\>"
syn keyword orcaBasis contained PC-0 PC-1 PC-2 PC-3 PC-4 PCSEG-0 PCSEG-1 PCSEG-2
syn keyword orcaBasis contained PCSEG-3 PCSEG-4 PCSSEG-0 PCSSEG-1 PCSSEG-2 PCSSEG-3 PCSSEG-4 PCJ-0
syn keyword orcaBasis contained PCJ-1 PCJ-2 PCJ-3 PCJ-4 AUG-PC-0 AUG-PC-1 AUG-PC-2 AUG-PC-3
syn keyword orcaBasis contained AUG-PC-4 AUG-PCSEG-0 AUG-PCSEG-1 AUG-PCSEG-2 AUG-PCSEG-3 AUG-PCSEG-4 AUG-PCSSEG-0 AUG-PCSSEG-1
syn keyword orcaBasis contained AUG-PCSSEG-2 AUG-PCSSEG-3 AUG-PCSSEG-4 AUG-PCJ-0 AUG-PCJ-1 AUG-PCJ-2 AUG-PCJ-3 AUG-PCJ-4
syn keyword orcaBasis contained AUG-CC-PVTZ-J SAPPORO-DZP-2012 SAPPORO-TZP-2012 SAPPORO-QZP-2012 SAPPORO-DKH3-DZP-2012 SAPPORO-DKH3-TZP-2012 SAPPORO-DKH3-QZP-2012 CC-PVDZ
syn keyword orcaBasis contained CC-PVTZ CC-PVQZ CC-PV5Z CC-PV6Z AUG-CC-PVDZ AUG-CC-PVTZ AUG-CC-PVQZ AUG-CC-PV5Z
syn keyword orcaBasis contained AUG-CC-PV6Z
syn match orcaBasis contained "\<AUG-CC-PVD(+D)Z\>"
syn match orcaBasis contained "\<AUG-CC-PVT(+D)Z\>"
syn match orcaBasis contained "\<AUG-CC-PVQ(+D)Z\>"
syn match orcaBasis contained "\<AUG-CC-PV5(+D)Z\>"
syn match orcaBasis contained "\<AUG-CC-PV6(+D)Z\>"
syn keyword orcaBasis contained CC-PCVDZ CC-PCVTZ CC-PCVQZ CC-PCV5Z CC-PCV6Z
syn match orcaBasis contained "\<AUG-CC-PCVDZ  \>"
syn match orcaBasis contained "\<AUG-CC-PCVTZ  \>"
syn match orcaBasis contained "\<AUG-CC-PCVQZ  \>"
syn match orcaBasis contained "\<AUG-CC-PCV5Z  \>"
syn match orcaBasis contained "\<AUG-CC-PCV6Z  \>"
syn keyword orcaBasis contained CC-PWCVDZ CC-PWCVTZ CC-PWCVQZ CC-PWCV5Z
syn match orcaBasis contained "\<AUG-CC-PWCVDZ \>"
syn match orcaBasis contained "\<AUG-CC-PWCVTZ \>"
syn match orcaBasis contained "\<AUG-CC-PWCVQZ \>"
syn match orcaBasis contained "\<AUG-CC-PWCV5Z \>"
syn match orcaBasis contained "\<CC-PVD(+D)Z\>"
syn match orcaBasis contained "\<CC-PVT(+D)Z\>"
syn match orcaBasis contained "\<CC-PVQ(+D)Z\>"
syn match orcaBasis contained "\<CC-PV5(+D)Z\>"
syn match orcaBasis contained "\<APR-CC-PV(Q+D)Z\>"
syn match orcaBasis contained "\<MAY-CC-PV(T+D)Z\>"
syn match orcaBasis contained "\<MAY-CC-PV(Q+D)Z\>"
syn match orcaBasis contained "\<JUN-CC-PV(D+D)Z\>"
syn match orcaBasis contained "\<JUN-CC-PV(T+D)Z\>"
syn match orcaBasis contained "\<JUN-CC-PV(Q+D)Z\>"
syn match orcaBasis contained "\<JUL-CC-PV(D+D)Z\>"
syn match orcaBasis contained "\<JUL-CC-PV(T+D)Z\>"
syn match orcaBasis contained "\<JUL-CC-PV(Q+D)Z\>"
syn match orcaBasis contained "\<MAUG-CC-PV(Q+D)Z\>"
syn match orcaBasis contained "\<MAUG-CC-PV(T+D)Z\>"
syn match orcaBasis contained "\<MAUG-CC-PV(D+D)Z\>"
syn keyword orcaBasis contained W1-DZ W1-TZ W1-QZ W1-OPT W1-MTSMALL
syn match orcaBasis contained "\<HAVTZ(+D)\>"
syn match orcaBasis contained "\<HAVQZ(+D)\>"
syn match orcaBasis contained "\<HAV5Z(+D)\>"
syn keyword orcaBasis contained CC-PVDZ-DK CC-PVTZ-DK CC-PVQZ-DK CC-PV5Z-DK AUG-CC-PVDZ-DK AUG-CC-PVTZ-DK AUG-CC-PVQZ-DK AUG-CC-PV5Z-DK
syn keyword orcaBasis contained CC-PWCVDZ-DK CC-PWCVTZ-DK CC-PWCVQZ-DK CC-PWCV5Z-DK AUG-CC-PWCVDZ-DK AUG-CC-PWCVTZ-DK AUG-CC-PWCVQZ-DK AUG-CC-PWCV5Z-DK
syn keyword orcaBasis contained CC-PVDZ-DK3 CC-PVTZ-DK3 CC-PVQZ-DK3 CC-PWCVDZ-DK3 CC-PWCVTZ-DK3 CC-PWCVQZ-DK3 CC-PVDZ-F12 CC-PVTZ-F12
syn keyword orcaBasis contained CC-PVQZ-F12 CC-PCVDZ-F12 CC-PCVTZ-F12 CC-PCVQZ-F12 CC-PVDZ-PP CC-PVTZ-PP CC-PVQZ-PP CC-PV5Z-PP
syn keyword orcaBasis contained AUG-CC-PVDZ-PP AUG-CC-PVTZ-PP AUG-CC-PVQZ-PP AUG-CC-PV5Z-PP CC-PCVDZ-PP CC-PCVTZ-PP CC-PCVQZ-PP CC-PCV5Z-PP
syn keyword orcaBasis contained AUG-CC-PCVDZ-PP AUG-CC-PCVTZ-PP AUG-CC-PCVQZ-PP AUG-CC-PCV5Z-PP CC-PWCVDZ-PP CC-PWCVTZ-PP CC-PWCVQZ-PP CC-PWCV5Z-PP
syn keyword orcaBasis contained AUG-CC-PWCVDZ-PP AUG-CC-PWCVTZ-PP AUG-CC-PWCVQZ-PP AUG-CC-PWCV5Z-PP CC-PVDZ-PP-F12 CC-PVTZ-PP-F12 CC-PVQZ-PP-F12 AUG-CC-PVDZ-PP-OPTRI
syn keyword orcaBasis contained AUG-CC-PVTZ-PP-OPTRI AUG-CC-PVQZ-PP-OPTRI AUG-CC-PV5Z-PP-OPTRI AUG-CC-PWCVDZ-PP-OPTRI AUG-CC-PWCVTZ-PP-OPTRI AUG-CC-PWCVQZ-PP-OPTRI AUG-CC-PWCV5Z-PP-OPTRI
syn match orcaBasis contained "\<AUG-CC-PVTZ/C\>"
syn keyword orcaBasis contained CC-PVDZ-F12-MP2FIT CC-PVTZ-F12-MP2FIT CC-PVQZ-F12-MP2FIT CC-PVDZ-F12-OPTRI CC-PVTZ-F12-OPTRI CC-PVQZ-F12-OPTRI CC-PCVDZ-F12-MP2FIT CC-PCVQZ-F12-MP2FIT
syn keyword orcaBasis contained CC-PCVTZ-F12-MP2FIT CC-PCVDZ-F12-OPTRI CC-PCVQZ-F12-OPTRI CC-PCVTZ-F12-OPTRI CC-PVDZ-PP-F12-MP2FIT CC-PVTZ-PP-F12-MP2FIT CC-PVQZ-PP-F12-MP2FIT CC-PVDZ-PP-F12-OPTRI
syn keyword orcaBasis contained CC-PVTZ-PP-F12-OPTRI CC-PVQZ-PP-F12-OPTRI
syn match orcaBasis contained "\<CC-PVTZ/JK\>"
syn match orcaBasis contained "\<CC-PVQZ/JK\>"
syn match orcaBasis contained "\<CC-PV5Z/JK\>"
syn match orcaBasis contained "\<AUG-CC-PVTZ/JK\>"
syn match orcaBasis contained "\<AUG-CC-PVQZ/JK\>"
syn match orcaBasis contained "\<AUG-CC-PV5Z/JK\>"
syn match orcaBasis contained "\<CC-PV6Z/C\>"
syn match orcaBasis contained "\<CC-PV5Z/C\>"
syn match orcaBasis contained "\<CC-PVDZ/C\>"
syn match orcaBasis contained "\<CC-PVQZ/C\>"
syn match orcaBasis contained "\<CC-PVTZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PV6Z/C\>"
syn match orcaBasis contained "\<AUG-CC-PV5Z/C\>"
syn match orcaBasis contained "\<AUG-CC-PVDZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PVQZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PVTZ/C\>"
syn match orcaBasis contained "\<CC-PWCVDZ/C\>"
syn match orcaBasis contained "\<CC-PWCVTZ/C\>"
syn match orcaBasis contained "\<CC-PWCVQZ/C\>"
syn match orcaBasis contained "\<CC-PWCV5Z/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVDZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVTZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVQZ/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCV5Z/C\>"
syn match orcaBasis contained "\<CC-PVDZ-PP/C\>"
syn match orcaBasis contained "\<CC-PVTZ-PP/C\>"
syn match orcaBasis contained "\<CC-PVQZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PVDZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PVTZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PVQZ-PP/C\>"
syn match orcaBasis contained "\<CC-PWCVDZ-PP/C\>"
syn match orcaBasis contained "\<CC-PWCVTZ-PP/C\>"
syn match orcaBasis contained "\<CC-PWCVQZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVDZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVTZ-PP/C\>"
syn match orcaBasis contained "\<AUG-CC-PWCVQZ-PP/C\>"
syn keyword orcaBasis contained CC-PVDZ-F12-CABS CC-PVTZ-F12-CABS CC-PVQZ-F12-CABS
syn match orcaBasis contained "\<DGAUSS-A1/J\>"
syn match orcaBasis contained "\<DGAUSS-A2/J\>"
syn match orcaBasis contained "\<DEF2-SD \>"
syn match orcaBasis contained "\<SDD \>"
syn match orcaBasis contained "\<LANL1 \>"
syn match orcaBasis contained "\<LANL2 \>"
syn match orcaBasis contained "\<DEF2ECP \>"
syn match orcaBasis contained "\<DEF2-ECP \>"
syn match orcaBasis contained "\<DHFECP \>"
syn match orcaBasis contained "\<DHF-ECP \>"
syn match orcaBasis contained "\<SK-MCDHF-RSC \>"
syn match orcaBasis contained "\<DEFECP \>"
syn match orcaBasis contained "\<DEF-ECP \>"
syn match orcaBasis contained "\<HAYWADT \>"
syn match orcaBasis contained "\<XFIT/1\>"
syn match orcaBasis contained "\<XFIT/2\>"
syn match orcaBasis contained "\<XFIT/3\>"
syn match orcaBasis contained "\<XFIT/4\>"
syn keyword orcaBasis contained AUTOAUX AUTOAUXTRIM

" ORCA 6.x new basis sets: vDZP (for wB97X-3C)
syn keyword orcaBasis contained VDZP vDZP

" ORCA 6.x new basis sets: CRENBL ECP family
syn keyword orcaBasis contained CRENBL CRENBL-ECP

" ORCA 6.x new basis sets: HGBS family (hydrogenic Gaussian basis sets)
syn keyword orcaBasis contained HGBS-5 HGBS-7 HGBS-9 HGBSP1-5 HGBSP1-7 HGBSP1-9 HGBSP2-5 HGBSP2-7
syn keyword orcaBasis contained HGBSP2-9 HGBSP3-5 HGBSP3-7 HGBSP3-9 AHGBS-5 AHGBS-7 AHGBS-9 AHGBSP1-5
syn keyword orcaBasis contained AHGBSP1-7 AHGBSP1-9 AHGBSP2-5 AHGBSP2-7 AHGBSP2-9 AHGBSP3-5 AHGBSP3-7 AHGBSP3-9

" ORCA 6.x new basis sets: pcX family (core X-ray spectroscopy)
syn keyword orcaBasis contained PCX-1 PCX-2 PCX-3 PCX-4 AUG-PCX-1 AUG-PCX-2 AUG-PCX-3 AUG-PCX-4

" ORCA 6.x new basis sets: pcH family (hyperfine coupling)
syn keyword orcaBasis contained PCH-1 PCH-2 PCH-3 PCH-4 AUG-PCH-1 AUG-PCH-2 AUG-PCH-3 AUG-PCH-4

" ============================================================
" Block directives (% ... end)
" - Inline directives: %maxcore, %moread (no end)
" - Paired regions: all others
" To add a new block:
"   1. append its name to the methodBlock start= alternation below
"   2. append its name to the orcaBlock keyword list (defined after orcaMethodAlias)
" ============================================================
syn match orcaBlock "%maxcore\>" contains=startBlock
syn match orcaBlock "%moread\>" contains=startBlock

" block directive regions
" end= matches 'end' only at column 0 (no leading whitespace), so indented
" 'end' tokens closing sub-blocks (e.g. CASDFT...end, Constraints...end)
" do not close the outer block region.
" To add a new block: add its name to the alternation below AND to orcaBlock above.
syn region methodBlock
         \ start="%\(method\|basis\|scf\|mp2\|cis\|tddft\|mrci\|geom\|freq\|vpt2\|esd\|dftmrci\)"
         \ start="%\(coords\|output\|ci\|plots\|parameters\|ndoparas\|rel\|dkh\|pal\|cosmo\|rr\)"
         \ start="%\(eprnmr\|loc\|elprop\|casscf\|mcrpa\|mdci\|dlpnocc\|mm\|mtr\|xes\|chelpg\)"
         \ start="%\(numgrad\|mecp\|ecp\|rocis\|mrcc\|cipsi\|ice\|iceci\|md\|nbo\|lft\|autoci\)"
         \ start="%\(cpcm\|cim\|compound\|neb\|irc\|anmr\|cregen\|confscript\|anmrrc\|qmmm\)"
         \ start="%\(conical\|ecrism\|shark\|symmetry\|sym\|xtb\|goat\|docker\|solvator\)"
         \ start="%\(casresp\|frag\|casdft\|mcd\|qgprop\|magrelax\|eda\)"
         \ end="^end\>"
         \ transparent keepend extend fold
         \ contains=startBlock,endBlock,orcaBlock,orcaNumber,orcaString,orcaFloat,
         \ orcaMethodInt,orcaMethodBool,orcaMethodReal,orcaMethodString,
         \ orcaMethodAlias,orcaMethodLogical,orcaBlockParam

" ============================================================
" Block parameters (inside % ... end blocks)
" orcaMethodInt  - integer-valued parameters
" orcaMethodBool - boolean-valued parameters
" orcaMethodReal - float-valued parameters
" orcaMethodString - string-valued parameters
" ============================================================
syn keyword orcaMethodInt contained VERSION RUNTYP AMASSES SHARKPRINTLEVEL SHARKFOCKFLAG FROZENCORE F12G_NGAUSS SCANGUESS
syn keyword orcaMethodInt contained RIFLAGS FUNCTIONAL XCKERNEL EXCHANGE CORRELATION LDAOPT XCKERNELX XCKERNELC
syn keyword orcaMethodInt contained XCKERNEL_X XCKERNEL_C XCKERNELLDA ADFTNRMAXITER ADFTLMAXAUXJ ADFTLMAXAUXX RADIALGRID ANGULARGRID
syn keyword orcaMethodInt contained PRUNEGRID GRIDPRUNING WEIGHTSCHEME VDWRADIALGRID VDWGRIDPRUNING VDWANGULARGRID DFTXCGradVersion XCGradVersion
syn keyword orcaMethodInt contained DFTXCGradMode XCGradMode XCHessFlags DFTXCHessFlags XCHessMode DFTXCHessMode DFTXCHessFXMode
syn match orcaMethodInt contained "\<ReduceRHSDFTHess  \>"
syn keyword orcaMethodInt contained SPECIALGRIDATOMS GRID_X GRIDX ANGULARGRIDX XCORRECTION SFITINVERTTYPE KTYPE JTYPE
syn keyword orcaMethodInt contained COSXGRADTYPE RCSINGLESFOCK RIJKSINGLESFOCK GRID_X_FIN GRIDX_FIN RADIALGRID_FIN ANGULARGRID_FIN PRUNEGRID_FIN
syn keyword orcaMethodInt contained GRIDPRUNING_FIN WEIGHTSCHEME_FIN GRID FINALGRID DFTDOPT FUNCTIONALVDW Z_SOLVER CISGRAD_Z_SOLVER
syn keyword orcaMethodInt contained TDDFTGRAD_Z_SOLVER Z_MAXITER Z_MAXDIIS Z_GRIDXC Z_GRIDX Z_GRIDX_RHS Z_COSX_ALG

syn keyword orcaMethodBool contained CHECKFROZENCORE USESYMMETRY USESYM SYMRELAX SYMNOCOORDINATETRANSFORM DOMP2 DOMREOM DOORBSELECT
syn keyword orcaMethodBool contained USELIBINT USESHARK SHARKUSEGENERALCONTRACTION RANGESEPEXX SWITCHTOSOSCF REDUCEPRINT ALLOWRHF RI
syn keyword orcaMethodBool contained DOADFT HGRIDREDUCED ROTINVARIANT REDUCEPMODELGRID VDWROTINVARIANT DFTXC_IsNumWD DFTXC_IsNumWG XC_IsNumWD
syn keyword orcaMethodBool contained XC_IsNumWG XCIsNumWD XCIsNumWG NewDFTHess DOEQ USEGRIDX NEWGRIDX USEFINALGRIDX
syn keyword orcaMethodBool contained USEGRIDX3 USESFITTING COSX_FULLSYMMETRY USEQGRADFIT DOROBUST DOSFITSTYLE COSX_PARTIALCONTRACTION COSX_ROTINVARIANT
syn keyword orcaMethodBool contained PRINTGRADCOMP DOWDERIVS HGRIDREDUCED_FIN ROTINVARIANT_FIN USEFINALGRID POSTSCFGGA DoGCP
syn match orcaMethodBool contained "\<GCP.D3MINIS\>"
syn keyword orcaMethodBool contained GRACLB94 GRACLB PROPFILE WRITEONLYINITIALPROPERTYFILE STORECISGRAD DONOTCH

syn keyword orcaMethodReal contained SYMTHRESH RANGESEPMU RANGESEPSCAL F12GAMMA F12G_A F12G_D F12ORTHOTHRESH ADFTNRTOL
syn keyword orcaMethodReal contained ADFTXALPHA INTACC NTHETAMAX BFCUT WEIGHTCUT WDTHRESH DENSCUTRATIO VDWINTACC
syn keyword orcaMethodReal contained VDWDENSTCUT VDWDISTTCUT SPECIALGRIDINTACC INTACC_X INTACCX SINVPIVCDTHRESH SINVTHRESH INTACC_X_FIN
syn keyword orcaMethodReal contained INTACCX_FIN INTACC_FIN NTHETAMAX_FIN DFTPAR XALPHA XBETA XKAPPA XLB94
syn keyword orcaMethodReal contained XMUEPBE CBETAPBE ACM ACM_A SCALHFX ACM_B SCALDFXGRAD SCALDFX
syn keyword orcaMethodReal contained ACM_C SCALDFCGRAD SCALDFC SCALGGAC SCALLDAC SCALMP2C XCKERNEL_DFTPAR XCKERNEL_XALPHA
syn keyword orcaMethodReal contained XCKERNEL_XBETA XCKERNEL_XKAPPA XCKERNEL_ACM XCKERNEL_ACM_A XCKERNEL_SCALHFX XCKERNEL_ACM_B XCKERNEL_SCALDFXGRAD XCKERNEL_SCALDFX
syn keyword orcaMethodReal contained XCKERNEL_ACM_C XCKERNEL_SCALDFCGRAD XCKERNEL_SCALDFC XCKERNEL_XMUEPBE XCKERNEL_CBETAPBE DFTDSCALEC6 D3S6 D3RS6
syn keyword orcaMethodReal contained D3S8 D3ALPHA6 D3A1 D3A2 D4S9 D4S6 D4RS6 D4S8
syn keyword orcaMethodReal contained D4ALPHA6 D4A1 D4A2 NLb NLC IP GRAC_ALPHA GRAC_BETA
syn keyword orcaMethodReal contained LIBXCDENSITYTHRESHOLD LIBXCZETATHRESHOLD LIBXCTAUTHRESHOLD LIBXCDENSITYTHRESHOLD LIBXCZETATHRESHOLD LIBXCTAUTHRESHOLD Z_TOL Z_SHIFT
syn keyword orcaMethodReal contained Z_INTACCXC Z_INTACCX MAYER_BONDORDERTHRESH LOEWDIN_BONDORDERTHRESH

syn keyword orcaMethodString contained
         \ PROGGTOINT
         \ PROGSTOINT
         \ PROGNDOINT
         \ PROGCASSCF
         \ PROGSCF
         \ PROGMP2
         \ PROGCIS
         \ PROGPLOT
         \ PROGMOM
         \ PROGMDCI
         \ PROGMRCI
         \ PROGCPSCF
         \ PROGCPCASSCF
         \ PROGMCRPA
         \ PROGLOC
         \ PROGVIB
         \ PROGPC
         \ PROGPOP
         \ PROGCIPREP
         \ PROGGSTEP
         \ PROGSCFGRAD
         \ PROGREL
         \ PROGSOC
         \ PROGEPRNMR
         \ PROGMD
         \ PROGGRAD
         \ POINTCHARGENAME
         \ POINTCHARGES
         \ GCPMETHOD

" ============================================================
" Method aliases and DFT functional names
" ============================================================
syn keyword orcaMethodAlias contained FORCE_SHARK FORCE_LIBINT SHARK_LIBINT_HYBRID FC_ELECTRONS FC_EWIN FC_NONE PATOM HUECKEL
syn keyword orcaMethodAlias contained ONEELEC MOREAD PMODEL OLDPRUNING UNPRUNED ADAPTIVE EXTENDED EXTEND
syn keyword orcaMethodAlias contained CHOLESKY CHOLESKY_Q DIAG DIAG_Q PIVCHOLESKY PIVCHOLESKY_Q S12_CHOLESKY S12_PIVCHOLESKY
syn keyword orcaMethodAlias contained K_XvX K_QvX K_XvQ K_QvQ K_QXSym K_QXRobust J_XvX J_QvQ
syn keyword orcaMethodAlias contained J_QXSym J_QXRobust GRAD_N GRAD_A GRAD_W GRAD_AW GAUSSCHEBYSHEV EULERMCLAURIN
syn keyword orcaMethodAlias contained RADIALDEFT SIMPLEGRID LEBEDEV50 LEBEDEV110 LEBEDEV194 LEBEDEV302 LEBEDEV434 LEBEDEV550
syn keyword orcaMethodAlias contained LEBEDEV770 WEIGHT_BECKE WEIGHT_SS WEIGHT_ATOMXC REVPBE38 REVPBE0 RPW86PBE PW86PBE
syn keyword orcaMethodAlias contained HFS LDA LSD SVWN HFLDA BP BP86 BPW91
syn keyword orcaMethodAlias contained PW91 BLYP OLYP XLYP PBE BPBE B3LYP B3LYP_TM
syn keyword orcaMethodAlias contained B3LYP_G B3PW91 B3P86 B3P B3PBE O3LYP X3LYP REVPBE
syn keyword orcaMethodAlias contained RPBE PW91P86 PW91P PWP PWP1 PW91 PW91_0 PW1PW
syn keyword orcaMethodAlias contained B1LYP B1P B1PW91 B1PW B1PBE PBE0 GLYP G1LYP
syn keyword orcaMethodAlias contained G2LYP GP G1P G3P VWN5 VWN3 PWLDA BNULL
syn keyword orcaMethodAlias contained BVWN LB94 BHANDHLYP M06L M06 M062X TPSS revTPSS
syn keyword orcaMethodAlias contained TPSSH TPSS0 MPWPW MPW1PW MPWLYP MPW1LYP PW6B95 PWPB95
syn keyword orcaMethodAlias contained B2PLYP MPW2PLYP WB97 WB97X WB97X-D3 CAM-B3LYP LC-BLYP B97
syn keyword orcaMethodAlias contained B97D B973C SCANFUNC RSCAN R2SCAN WR2SCAN srLDA srPBE
syn keyword orcaMethodAlias contained X_NOX X_SLATER X_BECKE X_B88 X_PW X_PW91 X_PBE X_RPBE
syn keyword orcaMethodAlias contained X_G96 X_LB94 X_OPTX X_OPTX3 X_X X_M06L X_M06 X_M062X
syn keyword orcaMethodAlias contained X_TPSS X_REVTPSS X_MPW X_RPW86 X_PW86 X_PW6 X_B97BECKE X_B97D
syn keyword orcaMethodAlias contained X_WB97 X_WB97X X_WB97XD3 X_WB97X2TQZ X_B973C X_SCAN X_RSCAN X_R2SCAN
syn keyword orcaMethodAlias contained X_WR2SCAN X_WB88 X_LRCPBE C_NOC C_VWNA C_VWNB C_VWN5 C_VWN3
syn keyword orcaMethodAlias contained C_PWLDA C_P86 C_PW91 C_P C_LYP C_PBE C_OP C_M06L
syn keyword orcaMethodAlias contained C_M06 C_M062X C_TPSS C_REVTPSS C_B95 C_B97BECKE C_B97D C_WB97
syn keyword orcaMethodAlias contained C_WB97X C_WB97XD3 C_WB97X2TQZ C_B973C C_SCAN C_RSCAN C_R2SCAN R2SCANH
syn keyword orcaMethodAlias contained R2SCAN50 PR2SCAN50 PR2SCAN69 WPR2SCAN50 KPR2SCAN50 R2SCAN-CIDH R2SCAN-QIDH R2SCAN0-DH
syn keyword orcaMethodAlias contained R2SCAN0-2 WB97X-D4REV WB97M-D4REV WB97M2 B2NC-PLYP REVDSD-PBEP86-D4 REVDOD-PBEP86-D4 srPBE0
syn keyword orcaMethodAlias contained TLDA TPBE TPBE0 CTLDA CTPBE CTPBE0 X_R2SCANH X_R2SCAN50
syn keyword orcaMethodAlias contained C_R2SCANH C_R2SCAN50 CG DIIS POPLE INVERTA EHT CNDO
syn keyword orcaMethodAlias contained INDO NDDO HFGTO HF DFGTO DFT HFSTO ENERGY
syn keyword orcaMethodAlias contained SINGLEPOINT SP TRAJECTORY SCAN GEOM
syn match orcaMethodAlias contained "\<GEOMETRY\(OPT\)\?\>"
syn keyword orcaMethodAlias contained OPT GRADIENT CIM ANMR CONFSCRIPT CREGEN
syn match orcaMethodAlias contained "\<MASS\(ORIG\|2016\)\>"
syn keyword orcaMethodAlias contained FCNORMALMODESCAN FCNMSCAN NORMALMODESCAN NMSCAN MODETRAJECTORY MTRAJECTORY
syn match orcaMethodAlias contained "\<MTR\?\>"
syn keyword orcaMethodAlias contained NORMALMODEGRADIENT ENMGRADIENT NMGRADIENT ENMGRAD NMGRAD NOVERSION
syn match orcaMethodAlias contained "\<CNDO_\(1\|2\|S\)\>"
syn match orcaMethodAlias contained "\<ZINDO_\(1\|2\|S\)\>"
syn match orcaMethodAlias contained "\<INDO_\(1\|2\|S\)\>"
syn match orcaMethodAlias contained "\<ZNDDO_\(1\|2\)\>"
syn match orcaMethodAlias contained "\<NDDO_\(1\|2\|MK\)\>"
syn keyword orcaMethodAlias contained MNDO AM1 PM3 MNDO_D MP2 GAMESS

" orcaBlock is defined after orcaMethodAlias so it wins the priority tie
" for words that appear in both (e.g. GEOM, SCAN, METHOD).
syn keyword orcaBlock contained method basis scf mp2 cis tddft mrci geom
syn keyword orcaBlock contained freq vpt2 esd dftmrci coords output ci plots
syn keyword orcaBlock contained parameters ndoparas rel dkh pal cosmo rr eprnmr
syn keyword orcaBlock contained loc elprop casscf mcrpa mdci dlpnocc mm mtr
syn keyword orcaBlock contained xes chelpg numgrad mecp ecp rocis mrcc cipsi
syn keyword orcaBlock contained ice iceci md nbo lft autoci cpcm cim
syn keyword orcaBlock contained compound neb irc anmr cregen confscript anmrrc qmmm
syn keyword orcaBlock contained conical ecrism shark symmetry sym xtb goat docker
syn keyword orcaBlock contained solvator casresp frag casdft mcd qgprop magrelax eda

" ============================================================
" Logical constants
" ============================================================
syn keyword orcaMethodLogical contained TRUE YES T ON
syn keyword orcaMethodLogical contained FALSE NO OFF

" ============================================================
" Block markers
" ============================================================
syn match startBlock "%" contained
syn match endBlock "^end\>" contained

" ============================================================
" Special directives, literals, comments
" ============================================================
" new_job directive
syn match orcaJob "\$new_job"

" coordinate input
syn match coordBlock "\*\s*\(xyz\(file\)\?\|int\|internal\|gzmt\(file\)\?\|gbwfile\|pdbfile\)"

" ============================================================
" Block parameter names (878 unique, sourced from ORCA 6.1 manual section 2.1.6)
" Kept in sync with g:orca_block_params in ftplugin/orca.vim.
" ============================================================
syn keyword orcaBlockParam contained AlphaConf AutoStart AutoTRAH AutoTRAHIter AutoTRAHNInter AutoTRAHTol BetaConf BFCut CNVDIIS
syn keyword orcaBlockParam contained ConvCheckMode Convergence ConvForced D3Thresh D4Thresh D5Thresh Damp DampErr DeltaSCFFromGS
syn keyword orcaBlockParam contained DIIS DIISBfac DIISMaxEq DIISMaxIt DIISStart DirectResetFreq DoMOM EasyConv EField
syn keyword orcaBlockParam contained EFieldOrigin ETol FOD FracOcc GTol Guess GuessMix GuessMode HCore HFTyp
syn keyword orcaBlockParam contained IonizeAlpha IonizeBeta KeepInitialRef KeepInts KDIIS LSCFalpha LSCFbeta LSD LShift MaxC
syn keyword orcaBlockParam contained MaxDisk MaxIntMem MaxIter MOInp NoDamp NoDIIS NoLShift NormalConv NoSmear NoSOSCF
syn keyword orcaBlockParam contained NoTRAH PMOM Precond QField ROKS Rotate RTol SCFMode ShiftErr SlowConv SMD
syn keyword orcaBlockParam contained Smear SOSCFBlockDiag SOSCFConstrainedMaxStep SOSCFConstraints SOSCFConvFactor SOSCFHessUp SOSCFMaxIt SOSCFMaxStep
syn keyword orcaBlockParam contained SOSCFStart SOSCF STABDTol STABEWIN STABlambda STABMaxDim STABMaxIter STABNGuess STABNRoots
syn keyword orcaBlockParam contained STABORBWin STABPerform STABRestartUHFifUnstable STABRTol STol TCut TCutInt Thresh TolE TolErr
syn keyword orcaBlockParam contained TolFacMicro TolG TolMAXP TolRMSP TolX TRAH VerySlowConv Z_Tol AddAuxCGTO AddAuxJGTO AddAuxJKGTO
syn keyword orcaBlockParam contained AddCABSGTO AddGTO AllowGhostECP AutoAux AutoAuxLLimit AutoAuxLmax AutoAuxSize AutoAuxTightB
syn keyword orcaBlockParam contained AuxC AuxJ AuxJC AuxJK Basis CABS Decontract DecontractAuxC
syn keyword orcaBlockParam contained DecontractAuxJ DecontractAuxJK DecontractBas DecontractCABS DelECP ECP FragAuxC FragAuxJ
syn keyword orcaBlockParam contained FragAuxJK FragBasis FragCABS FragECP GhostECP GTOAuxCName GTOAuxJKName GTOAuxJName
syn keyword orcaBlockParam contained GTOAuxName GTOCABSName GTOName NewAuxCGTO NewAuxJGTO NewAuxJKGTO NewCABSGTO NewECP
syn keyword orcaBlockParam contained NewGTO NoDecontractAuxC NoDecontractAuxJ NoDecontractAuxJK NoDecontractBas NoECP OldAutoAux PCDThresh
syn keyword orcaBlockParam contained PCDTrimAuxC PCDTrimAuxJ PCDTrimAuxJK PCDTrimBas ReadFragAuxC ReadFragAuxJ ReadFragAuxJK ReadFragBasis
syn keyword orcaBlockParam contained ReadFragCABS ReadFragECP SThresh AddExtraBonds AddExtraBonds_MaxDist AddExtraBonds_MaxLength Almloef AUTOFRAG
syn keyword orcaBlockParam contained BFGS BIAS Bofill BOXPOT Calc_Hess cartfallback ConnectFragments ConstrainFragments Constraints Convergence
syn keyword orcaBlockParam contained coordsys COpt ELLIPSEPOT EV_Reverse Ext_Params EXTOPTEXE FixFrags Frags freezeHydrogens GFNFF
syn keyword orcaBlockParam contained Hess_Internal HESS_MinEV HESS_Modification Hueckel Hybrid_Hess InHess inhess InHessName invertConstraints Lindh
syn keyword orcaBlockParam contained LooseOpt MaxStep modify_internal MORead NormalOpt NResetHess NStepsInResetHess NumFreq NumHess
syn keyword orcaBlockParam contained Opt OptElement OptGuess optimizeHydrogens PAtom PModel Powell PrintInternalHess ProjectTR
syn keyword orcaBlockParam contained Read Recalc_Hess ReducePrint ReduceRedInts RelaxFrags RelaxHFrags RigidFrags RunTyp
syn keyword orcaBlockParam contained Scan Schlegel Shift_Diag Simul_Scan SPHEREPOT Step Swart TightOpt TightSCF
syn keyword orcaBlockParam contained TolMaxD TolMaxG TolRMSD TolRMSG Trust Update UseSOSCF VeryTightOpt
syn keyword orcaBlockParam contained XTB0 XTB1 XTB2 CIM DFT Docker EDA Energy
syn keyword orcaBlockParam contained EnergyGrad EnGrad GeometryOpt Gradient HF MD Method MM
syn keyword orcaBlockParam contained ModeTrajectory MTR NMGrad NMGradient NMScan NormalModeGradient NormalModeScan PrintThermoChem
syn keyword orcaBlockParam contained PropertiesOnly ROHF SP Trajectory AnFreq CentralDiff CutOffFreq Delq DX Hybrid_Hess
syn keyword orcaBlockParam contained Increment NumFreq NumGrad NumHessTransInvar Partial_Hess ProjectTR QRRHORefFreq QuasiRRHO Restart
syn keyword orcaBlockParam contained ScalFreq T Temp TransInvar XTBVPT2 Direct
syn keyword orcaBlockParam contained CalcS2 Density Direct DLPNO DoRegMP2 DoSCS EMax EMin EWin F12
syn keyword orcaBlockParam contained FCut ForceDirect GridX IntAccX KC_GridX KC_IntAccX KCOpt LoosePNO MaxCore MaxOrbIter
syn keyword orcaBlockParam contained MP2Shift NatOrbs NoIter NormalPNO OrbOpt PertCan_EThresh PertCan_UThresh PrintLevel Ps Pt
syn keyword orcaBlockParam contained Q1Opt RegMP2Kappa RegMP2Sigma RegMP2Type RespDijConv RespStoreT RI TCutPNO TightPNO TNat
syn keyword orcaBlockParam contained UsePertCanOrbs Z_GridX Z_IntAccX ZLoc_Solver CCSD Conv FB IAOBOYS IAOIBO
syn keyword orcaBlockParam contained AD_Loewdin AD_Mulliken AD_SpinResolved Brueckner CCSD2 CheckEachRoot citype CoreHole CoreThresh
syn keyword orcaBlockParam contained Covalent CovalPOL CVSEP Denmat DoDIDplot DoEOM DoLanczos DoLEDHF Doleft DoOlsen
syn keyword orcaBlockParam contained DoRootwise DoSDiagnostic DoSingularPT DoTDM DoAlpha DoBeta DoCore DOAOX3E DOCOSXEOM DRESS3ED
syn keyword orcaBlockParam contained DRESS3ES DTol ewin FB FOLLOWCIS IAOBOYS IAOIBO InCore KCOpt LED
syn keyword orcaBlockParam contained LMP2ScaleTCutPNO LShift Localize LocMaxIter LocMaxIterLed LocTocLed LocTol LoosePNO MaxCore MaxDIIS
syn keyword orcaBlockParam contained MaxIter NatOrbIters NDav NInits NormalPNO NRoots NRootsPerBatch OTol pCCSDAB pCCSDCD
syn keyword orcaBlockParam contained pCCSDEF PrintLevel PrintOrbSelect RootHoming Singles SingularPTThresh STol TCutDO TCutMKN TCutPairs
syn keyword orcaBlockParam contained TCutPNO TightPNO TrafoType Triples UseEOMOptD UseEOMOptS UseCISUpdate UseFullLMP2Guess UseQROs
syn keyword orcaBlockParam contained VirtualThresh ZSimple MP3 QCISD ActConstraints ActOrbs AutoTRAH bweight CIPSIType CIStep
syn keyword orcaBlockParam contained DIIS DIISThresh dOrbs DoFullSemiclassical DoNDO DoNTO DOI DoubleShell DoubleShellMO DThresh
syn keyword orcaBlockParam contained ETol ExactDiagSwitch ExtOrbs FlipSpin fOrbs FreezeActive FreezeGrad FreezeIE GradScaling GTol
syn keyword orcaBlockParam contained ICEType imult IntOrbs irrep iroot KDIIS LMORBS MaxDim MaxDIIS MaxIter MaxM
syn keyword orcaBlockParam contained MaxRot MinShift mult NDOStates nel NGuessMat norb NRoots NTOStates NTOThresh orbstep
syn keyword orcaBlockParam contained OSZ PMOS PrintGState PrintLevel PrintWF RefMO ResetFreq RIJCOSX RTol SDO ShiftDn
syn keyword orcaBlockParam contained ShiftUp SOSCF SuperCI_PT switchdens SwitchConv SwitchIter switchstep SymThresh TGen TightSCF TPrint
syn keyword orcaBlockParam contained TrafoStep TRAH TVar weights CPCMEQ DecomposeFosc DoNTO DoSoc
syn keyword orcaBlockParam contained B CPCMEQ DecomposeFosc DoDipoleLength DoDipoleVelocity DoFullSemiClassical DoMCD DoNTO DoSoc
syn keyword orcaBlockParam contained DOTRANS EnStep EThresh ETol EWin FIR FOLLOWIROOT IRoot IROOTLIST IRootMult LRCPCM
syn keyword orcaBlockParam contained MaxCore MaxDim MaxIter Mode NGuessMat NRoots NTOStates NTOThresh OrbWin PThresh
syn keyword orcaBlockParam contained PTLimit RTol SaveUnrNatOrb SocGrad TDA TPrint triplets TROOTLIST do_giao_soc2el DSOC DSS
syn keyword orcaBlockParam contained dtensor GIAO_2el gtensor gtensor_1el2el hfcgaugecorrection_angulargrid hfcgaugecorrection_bfcutoff hfcgaugecorrection_intacc
syn keyword orcaBlockParam contained hfcgaugecorrection_numeric hfcgaugecorrection_prunegrid hfcgaugecorrection_wcutoff hfcgaugecorrection_zeff LevelShift LocOrbGBW Mass2016
syn keyword orcaBlockParam contained MaxDIIS MaxIter NMRCoal NMREquiv NMRSpecFreq nuclei ori printEuler Solver SpinSpinAtomPairs
syn keyword orcaBlockParam contained SpinSpinRThresh Tol nprocs nprocs_world nprocs_group
syn keyword orcaBlockParam contained ACCURACY ALPBSOLVENT CPCMXSOLVENT DDCOSMOSOLVENT DOALPB DOCPCMX DODDCOSMO DoMP2 EPSILON ETEMP
syn keyword orcaBlockParam contained READXTBPARAM SmearTemp UseXTBMixer VERSION XTB XTBFF XTBFOD XTBINPUTSTRING
syn keyword orcaBlockParam contained XTBINPUTSTRING2 XTBPARAMFILE WRITEXTBPARAM AIM KeepTransDensity LargePrint MiniPrint NoPrintMOs
syn keyword orcaBlockParam contained NoPropFile NoReducedPop NormalPrint PDBFILE Print PrintBasis PrintGap PrintMOs
syn keyword orcaBlockParam contained ReducedPop SmallPrint UNO XYZFILE P_AtCharges_L P_AtCharges_M P_AtomBasis P_AtomDensFit
syn keyword orcaBlockParam contained P_AtomExpVal P_AtPopMO_L P_AtPopMO_M P_Basis P_BondOrder_L P_BondOrder_M P_Cartesian P_Density
syn keyword orcaBlockParam contained P_DFTD P_DFTD_GRAD P_DIISError P_DIISMat P_Fockian P_FragBondOrder_L P_FragBondOrder_M P_FragCharges_L
syn keyword orcaBlockParam contained P_FragCharges_M P_Fragments P_FragOvlMO_L P_FragOvlMO_M P_FragPopMO_L P_FragPopMO_M P_G1EL2EL P_GuessOrb
syn keyword orcaBlockParam contained P_Hirshfeld P_InputFile P_Internal P_Iter_C P_Iter_F P_Iter_P P_KinEn P_Loewdin
syn keyword orcaBlockParam contained P_Mayer P_MBIS P_MOs P_Mulliken P_NatPop P_NPA P_OneElec P_OrbCharges_L
syn keyword orcaBlockParam contained P_OrbCharges_M P_OrbEn P_OrbPopMO_L P_OrbPopMO_M P_Overlap P_ReducedOrbPop_L P_ReducedOrbPop_M P_ReducedOrbPopMO_L
syn keyword orcaBlockParam contained P_ReducedOrbPopMO_M P_S12 P_SCFInfo P_SCFIterInfo P_SCFMemInfo P_SCFSTABANA P_SpinDensity P_Sym_Salc
syn keyword orcaBlockParam contained P_Symmetry P_UNO_AtPopMO_L P_UNO_AtPopMO_M P_UNO_FragPopMO_L P_UNO_FragPopMO_M P_UNO_OccNum P_UNO_OrbPopMO_L P_UNO_OrbPopMO_M
syn keyword orcaBlockParam contained P_UNO_ReducedOrbPopMO_L P_UNO_ReducedOrbPopMO_M C DKH DKH1 DLU FiniteNuc fpFWtrafo IntAcc IORA
syn keyword orcaBlockParam contained LightAtomThresh Method ModelDens ModelPot OneCenter Order PictureChange PrintLevel Rel1C RelDLU
syn keyword orcaBlockParam contained RelFull ScaleZORA SOCFlags SOCMaxCenter SOCOff SOCType SpecialGridIntAcc StorageLevel VELOCITY X2C Xalpha
syn keyword orcaBlockParam contained Zeff ZORA
syn keyword orcaBlockParam contained AtomRadii cds_cpcm cut_area cut_swf draco draco_charges dracoisodens fepstype
syn keyword orcaBlockParam contained fopt ndiv num_leb pmin refrac rmin rsolv scale_gauss
syn keyword orcaBlockParam contained smdsolvent sola solb solc solg solh soln soln25
syn keyword orcaBlockParam contained solvent surfacetype thresh_h thresh_noth vopt xfeps
syn keyword orcaBlockParam contained Corrected COUPLED CPCMccm Final Outlying SMD18 Accel Anneal
syn keyword orcaBlockParam contained Append Atom Cell Celsius CenterCOM Colvar Colvars Constraint
syn keyword orcaBlockParam contained CoordNumber Cube Cutoff DCD Define Define_Region Dihedral Distance
syn keyword orcaBlockParam contained Dump Each Fixed Format Gaussian Group Harmonic Height
syn keyword orcaBlockParam contained HillSpawn History Initvel Kelvin Last List Lower Manage_Colvar
syn keyword orcaBlockParam contained Manage_Colvars Manage_Region Massive MaxGrad Metadynamics Minimize MTS Noise
syn keyword orcaBlockParam contained Noprint Position Pressure Rad Ramp Randomize Range Rect
syn keyword orcaBlockParam contained Region Remove RemoveAtoms Replace Reset Restart Restraint Restraints
syn keyword orcaBlockParam contained Rhomb Rigid RMSGrad Run Scale SCFLog Screendump Sigma
syn keyword orcaBlockParam contained Sphere Spring StepLimit Steps Store Stride Target TempConv
syn keyword orcaBlockParam contained Temp Temperature Thermostat Thermostats Timecon Timestep Upper Vectors Wall
syn keyword orcaBlockParam contained Weights WellTempered Yoshida ActiveAtoms ActiveCoreAtoms ActiveCoreExtension_Type ActiveCore_Extension ActiveCore_Type
syn keyword orcaBlockParam contained ChargeAlteration CheckAutoFragBoundaries CheckAutoFragForQMGaps COV_BONDS Dist_AtomsAroundOpt Do_NB_For_Fixed_Fixed Electrostatic Embedding
syn keyword orcaBlockParam contained ExtendActiveRegion Frag Fragments Mechanical OptRegion_FixedAtoms ORCAFFFilename PrintOptRegion PrintOptRegionExt
syn keyword orcaBlockParam contained PrintPDB QMAtoms QMCore_Extension QMCore_Type QMCoreAtoms QMCoreExtension_Type QMGap_MinLength RCD
syn keyword orcaBlockParam contained RIGID_MM_WATER Scale_CS Scale_RCD Use_Active_InfoFromPDB Coulomb14Scaling CoulombCutOff DielecConst LJCutOffInner
syn keyword orcaBlockParam contained LJCutOffOuter ShiftForceCoulomb SwitchForceLJ ABS ABSQ ABSV Algebraic Available
syn keyword orcaBlockParam contained CD CellVolumeFraction DoHemiSphereSC DoSymetricSC FFMIO IAOBasis KeepDens LIVVO
syn keyword orcaBlockParam contained LoadQCCluster LocMet NEWBOYS ORBITAL RIXS SOC SOCABS SOCABSQ
syn keyword orcaBlockParam contained SOCCD SymmetryOperations TRANSABS VIRT XAS XASS XASSOC XES
syn keyword orcaBlockParam contained XESSOC ZETA_D AllSingles CIType DavidsonOpt Densities DIIS DoDDCIMP2 Etol EUnselOpt
syn keyword orcaBlockParam contained EunselOpt EWin EWIN Excitations Flags Fopt FourIndexInts H0Opt IntMode KeepFiles LevelShift
syn keyword orcaBlockParam contained LinearResponse Loc MaxDIIS MaxDim MaxIter MaxMemInt MaxMemVec MORanges MRACPF MRAQCC
syn keyword orcaBlockParam contained MRCI MRDDCI1 MRDDCI2 MRDDCI3 MRPT_b MRPT_shift NatOrbIters NelCorr NewBlock NGuessMat
syn keyword orcaBlockParam contained NGuessMatRefCI NoIter NRoots Otol Partitioning PrintLevel PrintWF refs RefWeight RejectInvalidRefs
syn keyword orcaBlockParam contained RelaxRefs RITrafo Rtol Second Solver SORCI Tnat Tnat2 Tpre Tpre_fi
syn keyword orcaBlockParam contained Tpre_in TPrint TPrintWF Tsel Tsel_fi Tsel_in UseIVOs UsePartialTrafo XASMOs B DecomposeFosc
syn keyword orcaBlockParam contained Do_HM_ia Do_HM_is Do_HM_sa Do_ia Do_is Do_isa Do_ista Do_LM_ia Do_LM_is
syn keyword orcaBlockParam contained Do_LM_sa Do_LM_ss Do_sa DoCD DoDipoleLength DoDipoleVelocity DoElastic DoFullSemiclassical DoGenROCIS DoHigherMult
syn keyword orcaBlockParam contained DoLoc DoLowerMult DoMCD DoNDO DoNTO DoPNO DoRIXS DoRIXSSOC DoSOC ETol
syn keyword orcaBlockParam contained EWin LocMet LocOrbWin MaxCore MaxDim MaxIter NDOStates NDOThresh NGuessMat NRoots
syn keyword orcaBlockParam contained NTOStates NTOThresh OrbWin PlotDiffDens PlotSOCDiffDens PrintLevel ReferenceMult rel RTol TCutPNO
syn keyword orcaBlockParam contained Temperature TPrint XASelems DoLocking DoOlsen
syn keyword orcaBlockParam contained DoOrbResp MaxRed PreCondMaxRed PreCondType PrintRHSVec PrintRspVec PrintWF TolPrintVec
syn keyword orcaBlockParam contained TolR Conventional PreConMaxRed CC2 CC3 CCD CCSDT CID
syn keyword orcaBlockParam contained CISD CISDT D3TPre D4TPre Density Density2 DIISStartIter ExcludeHigherExcDIIS
syn keyword orcaBlockParam contained Irrep KeepInts LevelShift MDCI MP2 MP4 MP5 Mult
syn keyword orcaBlockParam contained NatOrbs NEl NoRI NThresh RunROHFasUHF SOCoptions TrafoType UseOldInts
syn keyword orcaBlockParam contained CAR CWAF CWAR FreqAlter MWAD NMList NRRPPoints NTr RamanOrder RRPRange States TK
syn keyword orcaBlockParam contained APPROXADEN B CENTRALDIFF CONVDER COORDSYS DELE DELQ DELTA DOHT ESDFLAG
syn keyword orcaBlockParam contained ESHESSIAN FASTDER FCWL FCWS GEOMSTEP GSHESSIAN HESSFLAG IFREQFLAG INLINEW IROOT
syn keyword orcaBlockParam contained ISCFSHESSIAN ISCISHESSIAN LASERE LEBEDEVINTEGRATIONPOINTS LINEW MAXTIME MODELIST NPOINTS ORCA_ESD PRINTLEVEL
syn keyword orcaBlockParam contained PRINTVIB RORDER RRINTENS RRSLINEW RRTCUTDER RRTCUTJ SAMEFREQ SCALING SINGLEMODE SOCME
syn keyword orcaBlockParam contained SPECRANGE SPECRES STATES STDA STEPCONSTR STEPSCALING TCUTFREQ TDIP TDIPSCALING TEMP
syn keyword orcaBlockParam contained TMDIP TSHESSIAN UF_DELE UFFREQERR UNIT USEB USEJ WRITEHESS ALIGN AUTOWALL BONDFACTOR CONFDEGEN
syn keyword orcaBlockParam contained CONFTEMP ENDIFF EnforceStrictConvergence FREEFRAGMENTS FREEHETEROATOMS FREENONHATOMS FREEZEAMIDES FREEZEANGLES
syn keyword orcaBlockParam contained FREEZEBONDS FREEZECISTRANS GFNUPHILL KEEPWORKERDATA MAXCOORDNUMBER MAXCORESOPT MAXEN MAXENPERATOM
syn keyword orcaBlockParam contained MAXENTROPY MAXGLOBALITER MAXITERMULT MAXOPTITER MAXTOPODIFF MINDELS MINGLOBALITER NWorkers
syn keyword orcaBlockParam contained PRINTINTERNALS RANDOMSEED READENSEMBLE RMSD RMSDMETRIC ROTCONSTDIFF SKIPINITIALOPT SLOPPYOPT
syn keyword orcaBlockParam contained TEMPLIST TOPOBREAK UPHILLATOMS WORKERRANDOMSTART ALLOWMETALCOORD AUTOCOORDSYS CHECKTOPO COMPLETEDOCK
syn keyword orcaBlockParam contained CUMULATIVE DOCKLEVEL EVPES FIXHOST GRIDCENTER GRIDCENTERATOMS GRIDEXTENT GUEST
syn keyword orcaBlockParam contained GUESTCHARGE GUESTMULT HOST MBONDFAC NOOPT NOPT NORMALDOCK NREPEATGUEST
syn keyword orcaBlockParam contained OPTLEVEL POPDENSITY POPSIZE PREOPT QUICKDOCK SWARMMAXITER SWARMMINITER SWARMPES
syn keyword orcaBlockParam contained SWARMPOPDENSITY SWARMPOPSIZE ALPB CLUSTERMODE DROPLET Einter FIXSOLUTE NSOLV
syn keyword orcaBlockParam contained RADIUS RANDOMSOLV SOLVENTFILE STOCHASTIC USEEEQCHARGES VACUUMSEARCH WALLFAC CleanUpCoords
syn keyword orcaBlockParam contained CleanUpGeom CleanUpGrad CleanUpGradient PointGroup PreferC2v PrtSALC SymRelaxOpt SymRelaxSCF
syn keyword orcaBlockParam contained UseSym UseSymmetry ELDENSMP2UR Gaussian_Cube HPGL MO Molekel Origin
syn keyword orcaBlockParam contained SPINDENS SPINDENSAUTOCIRE SPINDENSAUTOCIUR SPINDENSMDCI SPINDENSMP2RE SPINDENSMP2UR SPINDENSOO UCO
syn keyword orcaBlockParam contained AllPop BW CenterOfCoords CenterOfEachAtom CenterOfMass CenterOfNucCharge CenterXYZ COSMO
syn keyword orcaBlockParam contained DIPOLE FMOPop GRID Loewdin Mayer MBIS MBIS_CHARGETHRESH MBIS_LARGEPRINT
syn keyword orcaBlockParam contained MBIS_ORIGIN_MULT MBIS_ORIMULT_XYZ Mulliken NBO NPA RMAX VDWRADII DELKEYLIST
syn keyword orcaBlockParam contained NCS Polar ORCA_ESD AABackbone AASCFineGrained AASideChains Aminoacids Atomic
syn keyword orcaBlockParam contained Backbone Connectivity Definition Deleted DoInterFragBonds Ext_lib Extend Extlib
syn keyword orcaBlockParam contained FragProc FunctionalGroups FuseAtomPairs FuseByAtoms NABackbone NABBFineGrained NASideChains NAME
syn keyword orcaBlockParam contained NotAssigned NucleoticAcid SeqBackbone SEQNABackbone Solvents STOREFRAGS TopolFile Usetopology
syn keyword orcaBlockParam contained Water COORDSTYPE DERHSOC HESSIAN MODE STEPSIZE degenThresh doRaman gridMax gridMin
syn keyword orcaBlockParam contained inputfile keepData magfld nGrid temperature DoEDA FRAG1 FRAG1_C FRAG1_FS FRAG1_M FRAG1_METHODFILE FRAG1_SF FRAG2
syn keyword orcaBlockParam contained FRAG2_C FRAG2_M FRAG2_METHODFILE FRAG2_SF MO2 Pauli

" Keep %block headers highlighted as blocks when a block name is also a valid
" parameter elsewhere, e.g. %mm vs %method MM.
syn match orcaBlockHeader "^%\w\+" contained containedin=methodBlock transparent contains=startBlock,orcaBlock

syn match orcaComment "#[^#]*\(#\|$\)"
syn region orcaString start=+"+ end=+"+
syn match orcaNumber	display "\<\d\+\>"
syn match orcaFloat display "\<\d\+\(\.\d\+\)\?\(e[-+]\=\d\+\)\=\>"

" ============================================================
" Synchronisation: re-parse from the last %block start
" ============================================================
syn sync match orcaSync grouphere methodBlock "^%\w\+"
syn sync maxlines=200

let b:current_syntax = "orca"

" ============================================================
" Highlighting
" ============================================================
hi def link orcaKeyword Identifier
hi def link orcaComment Comment
hi def link simpleKeyword Statement
hi def link simpleBang PreProc
hi def link methodBlock Statement
hi def link startBlock PreProc
hi def link endBlock Keyword
hi def link orcaBlock Keyword
hi def link orcaJob Structure
hi def link coordBlock Define
hi def link orcaString String
hi def link orcaNumber Number
hi def link orcaFloat Float
hi def link orcaBasis Type

hi def link orcaMethodInt Type
hi def link orcaMethodBool Type
hi def link orcaMethodReal Type
hi def link orcaMethodString Type
hi def link orcaMethodAlias Identifier
hi def link orcaBlockParam Type
hi def link orcaMethodLogical Boolean
