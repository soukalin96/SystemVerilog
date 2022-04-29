`ifndef dft_tmtb_inc
    `define dft_tmtb_inc



      `define Hie_msg(sname) `"sname```"
      `define DFT_TMTB



//`include "HBM3/Patterns/p1500_patterns/p1500_supporting_tasks.v" //for make_soft_repair task
`ifndef dft_inc
`include "DFT_patterns/dft_inc.v"
`endif



//`include "DFT_patterns/tm_tasks.v"
`include "DFT_TMTB_patterns/dft_tmtb_tasks.v"
//`include "DFT_TMTB_patterns/datrimstagger_tm.v"



//`include "HBM3/Patterns/p1500_patterns/remap.v" //Not needed in tmtb tasks




/*
// Base or Cube test patterns
`ifndef VSIM_TB_X64_CORE
//`include "DFT_TMTB_patterns/forcediering_if_tm.v"
`include "DFT_TMTB_patterns/pseudo_pllseldig_tm.v"
// Cube only test patterns
`ifndef VSIM_TB_X64_IF
`ifndef VSIM_TB_X64_4HB
`include "DFT_TMTB_patterns/vddmonsel_p1500_inst_tm.v"
`endif
`endif
`endif
*/
//*************** Logic die test patterns**************/
//****************mnadimpalli*************************/
`ifdef VSIM_TB_X64_IF
// `include "DFT_TMTB_IF_patterns/dafire_tm.v"
// `include "DFT_TMTB_IF_patterns/tscattrip_tm.v"
// `include "DFT_TMTB_IF_patterns/tmfzDaZqPdn_MD_if.v"
// `include "DFT_TMTB_IF_patterns/tmfzDaIbCtle_if.v"
// `include "DFT_TMTB_IF_patterns/bstdchar_if_tm.v"
// `include "DFT_TMTB_IF_patterns/tmfztrimvrefphyawcha_if.v"
//**************** LOPA *******************************/
// `include "DFT_TMTB_IF_patterns/tmfzSliceCtrl_if.v"
// `include "DFT_TMTB_IF_patterns/tmfzDaNbtiToggle_if.v"
// `include "DFT_TMTB_IF_patterns/tmfzNbtiToggle_if.v"
// `include "DFT_TMTB_IF_patterns/tmOsc_if.v"

//Anurag
//`include "DFT_TMTB_IF_patterns/tmDaRttStr_MD_if.v"
//`include "DFT_TMTB_IF_patterns/tmDaRttStr_P2P_if.v"
//`include "DFT_TMTB_IF_patterns/tmDaOdiStr_MD_if.v"
//`include "DFT_TMTB_IF_patterns/tmDaOdiStr_P2P_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDaZqPup_MD_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDaZqPup_P2P_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDaZqPdn_P2P_if.v"



//Debashrit



//`include "DFT_TMTB_IF_patterns/tmfzTrimVadlybias_if.v"



//Abisree
//`include "DFT_TMTB_IF_patterns/tmfzpumpcores_if.v"
//`include "DFT_TMTB_IF_patterns/tmscanclk_if.v"
//`include "DFT_TMTB_IF_patterns/tmallampen_if.v"
//`include "DFT_TMTB_IF_patterns/tmforcediering_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzIddAwdAdd_if.v"
//Naveen
//`include "DFT_TMTB_IF_patterns/tmfzDaIbPseudoDfeCtrl_if.v"



//Sachin
//`include "DFT_TMTB_IF_patterns/tmfzDwDccDRclk_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDccWclkTSV_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzWclktDly_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzWclkTSVDly_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzP2p0_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzP2p1_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzP2p2_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzP2p3_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDaSniffRCCtrl_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzDaSniffCkCtrl_if.v"



//Abhinav
//`include "DFT_TMTB_IF_patterns/tmfzPllLockMonitor_if_tm.v"
//`include "DFT_TMTB_IF_patterns/tmfzPllNbtiToggle_if_tm.v"



//Amogh
//`include "DFT_TMTB_IF_patterns/tmfzClkSetHld_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzCaSetHld_if.v"
//`include "DFT_TMTB_IF_patterns/tmfzTsSlope_tmfzTsTrim_if.v"
//`include "DFT_TMTB_IF_patterns/tmTempHtLimit_tmTsAlert_if.v"
//`include "DFT_TMTB_IF_patterns/tmTsDis_if.v"
`endif




//****************************************************/
// Core die only test patterns
`ifdef VSIM_TB_X64_CORE
// `include "DFT_TMTB_patterns/tmfzRfshWlnum.v"
//Gaurav
// `include "DFT_TMTB_patterns/tmfzNsaPsaVtcDrv.v"
//Datta
//`include "DFT_TMTB_patterns/tmfzCdeClkDly.v"
// `include "DFT_TMTB_patterns/tmfzCdeClkWrDly.v"



//Ritik
// `include "DFT_TMTB_patterns/tmfzDsaEnDly.v"
// `include "DFT_TMTB_patterns/tmfzDsaGateEnDly.v"
// `include "DFT_TMTB_patterns/tmfzDsaGateEnPulse.v"
// `include "DFT_TMTB_patterns/tmfzRdOutEnDly.v"
// `include "DFT_TMTB_patterns/tmfzGioPreDisPulse.v"
// `include "DFT_TMTB_patterns/tmfzWrDataLatchPulse.v"
// `include "DFT_TMTB_patterns/tmfzWrLatDly.v"
// `include "DFT_TMTB_patterns/tmfzClkSetHld.v"
// `include "DFT_TMTB_patterns/tmfzCmdLatDly.v"
// `include "DFT_TMTB_patterns/tmfzEqWl.v"
// `include "DFT_TMTB_patterns/tmfzRdFifoOutDly.v"
// `include "DFT_TMTB_patterns/tmfzWrtLioPreCtrl.v"
// `include "DFT_TMTB_patterns/tmfzRefWlToSaEq.v"
// `include "DFT_TMTB_patterns/tmfzSenseAmp.v"
// `include "DFT_TMTB_patterns/tmfzWrDataLatchType.v"
// `include "DFT_TMTB_patterns/tmfzCaSetHld.v"
// `include "DFT_TMTB_patterns/tmfzVtcEqToNsaDly.v"
// `include "DFT_TMTB_patterns/tmfzSaEqCtrl.v"
// `include "DFT_TMTB_patterns/tmfzWlToSaEq.v"
// `include "DFT_TMTB_patterns/tmfzIdd3Ctrl.v"
// `include "DFT_TMTB_patterns/tmDwFifoMon.v"
// `include "DFT_TMTB_patterns/tmSrefOscCtrl.v"




//Vinay
// `include "DFT_TMTB_patterns/tmfzAwrEnDly.v"
// `include "DFT_TMTB_patterns/tmfzBlprCtrl.v"
// `include "DFT_TMTB_patterns/tmfzDsaClkStretch.v"
// `include "DFT_TMTB_patterns/tmfzRdStateOffDly.v"
// `include "DFT_TMTB_patterns/tmfzRdTxEnDly.v"
// `include "DFT_TMTB_patterns/tmfzArrayTimerOscCnt.v"
// `include "DFT_TMTB_patterns/tmfzArrayTimerTrasTrp.v"
// `include "DFT_TMTB_patterns/tmfzWclkDly.v"
// `include "DFT_TMTB_patterns/tmfzArrayTimerOscCtrl.v"



// `include "DFT_TMTB_patterns/tmfzTsWseCtrl.v"
// `include "DFT_TMTB_patterns/tmfzTsTrpCtrl.v"
// `include "DFT_TMTB_patterns/tmFifoRst.v"
// `include "DFT_TMTB_patterns/tmfzCdeEnDly.v"
// `include "DFT_TMTB_patterns/tmfzArrayTimerOscSlp.v"
// `include "DFT_TMTB_patterns/tmfzArrayTimerOsc.v"
// `include "DFT_TMTB_patterns/tmfzPprClk.v"




//`include "DFT_TMTB_patterns/tmfzDlogCtrl.v"
//veerendra
// `include "DFT_TMTB_patterns/tmfzActCmdDly.v"
// `include "DFT_TMTB_patterns/tmfzCsToRd.v"
// `include "DFT_TMTB_patterns/tmfzTrimCsPulse.v"
// `include "DFT_TMTB_patterns/tmfzWriteVsEqIo.v"
// `include "DFT_TMTB_patterns/tmfzVaryBias.v"
// `include "DFT_TMTB_patterns/tmfzRdenStretch.v"
// `include "DFT_TMTB_patterns/tmfzGioPchgCtrl.v"
// `include "DFT_TMTB_patterns/tmfzPreCmdDly.v"
// `include "DFT_TMTB_patterns/tmColCtrl.v"
// `include "DFT_TMTB_patterns/tmfzLmrCmdDly.v"



////ssankam
// `include "DFT_TMTB_patterns/tmfzDwrEnDly.v"
// `include "DFT_TMTB_patterns/tmfzRdAddFifoDly.v"
// `include "DFT_TMTB_patterns/tmfzRclkaFifoDly.v"
// `include "DFT_TMTB_patterns/tmfzRdDataBusDly.v"
// `include "DFT_TMTB_patterns/tmfzRclkPulse.v"
// `include "DFT_TMTB_patterns/tmfzDrvDraPulse.v"
// `include "DFT_TMTB_patterns/tmfzWrCdeEnDly.v"
////Debashrit
// `include "DFT_TMTB_patterns/tmfziddvblp.v"
// `include "DFT_TMTB_patterns/tmvddxrlx.v"
// `include "DFT_TMTB_patterns/tmmonchsel.v"
////mnadimpalli
// `include "DFT_TMTB_patterns/tmfzcolcmddly.v"
// `include "DFT_TMTB_patterns/tmfzapcmddly.v"
// `include "DFT_TMTB_patterns/tmfzssclkdly.v"
// `include "DFT_TMTB_patterns/tmfzrclkadly.v"
// `include "DFT_TMTB_patterns/tmfzc1wrcmddly.v"
// `include "DFT_TMTB_patterns/tmfzgcoltosa.v"
// `include "DFT_TMTB_patterns/tmfzisotonsadly.v"
// `include "DFT_TMTB_patterns/tmforcedummy.v"
// `include "DFT_TMTB_patterns/tmfzrclkdutyctrl.v"
// `include "DFT_TMTB_patterns/tmfzreprclkdutyctrl.v"
// `include "DFT_TMTB_patterns/tmfzrepwclkdutyctrl.v"
// `include "DFT_TMTB_patterns/tmfzwclkdutyctrl.v"
// `include "DFT_TMTB_patterns/tmasyncisoblcp.v"
// `include "DFT_TMTB_patterns/monitor_core_tm.v"
//
////Abisree
// `include "DFT_TMTB_patterns/tmallampen.v"
// `include "DFT_TMTB_patterns/tmfzvaryactallon.v"
// `include "DFT_TMTB_patterns/tmfzvaryactctrl.v"
// `include "DFT_TMTB_patterns/tmarhsanzctrl.v"
// `include "DFT_TMTB_patterns/tmvnwlpadctrl.v"
// `include "DFT_TMTB_patterns/tmfzgiochgrecycledis.v"
// `include "DFT_TMTB_patterns/tmscanclk.v"
// `include "DFT_TMTB_patterns/tmfzlioccrddly.v"
// `include "DFT_TMTB_patterns/tmfzlioccrdpulse.v"
// `include "DFT_TMTB_patterns/tmfzdpoptrseldly.v"
// `include "DFT_TMTB_patterns/tmfzdpoutendly.v"
// `include "DFT_TMTB_patterns/tmfzdprclkdly.v"
// `include "DFT_TMTB_patterns/tmfzdpwclkdly.v"
// `include "DFT_TMTB_patterns/tmfzdprdrdydly.v"
// `include "DFT_TMTB_patterns/tmfzdpwrendly.v"
// `include "DFT_TMTB_patterns/tmfzlioccwr.v"
// `include "DFT_TMTB_patterns/tmfzlioeqdly.v"
// `include "DFT_TMTB_patterns/tmfzlioeqpulse.v"
// `include "DFT_TMTB_patterns/tmfzTwrVsTrp.v"
// `include "DFT_TMTB_patterns/tmfzRdAlignDly.v"



// /********************LOPA*******************/
// `include "DFT_TMTB_patterns/tmfzPchg.v"
// `include "DFT_TMTB_patterns/tmfzGrfToPh.v"
// `include "DFT_TMTB_patterns/tmfzVtcBlcptoNsaDly.v"
// `include "DFT_TMTB_patterns/tmfzVtcBlcptoWlDly.v"
// `include "DFT_TMTB_patterns/tmfzVtcNsaPsaRfshDrv.v"
// `include "DFT_TMTB_patterns/tmfzVtcPulse.v"
// `include "DFT_TMTB_patterns/tmfzVtcSenseAmp.v"
// `include "DFT_TMTB_patterns/tmfzTrcdVsTrp.v"
// `include "DFT_TMTB_patterns/tmfzSecEnDly.v"
// `include "DFT_TMTB_patterns/tmfzEccRdWrEnDly.v"
// `include "DFT_TMTB_patterns/tmFloatLio.v"
// `include "DFT_TMTB_patterns/tmfzX2RCtrl.v"
// `include "DFT_TMTB_patterns/tmManFzCtrl.v"
// `include "DFT_TMTB_patterns/tmfzTrimStagDly.v"



///********************VIGNAN*******************/
// `include "DFT_TMTB_patterns/tmfzRclkRepCtrl.v"
// `include "DFT_TMTB_patterns/tmChFuseSel.v"
// `include "DFT_TMTB_patterns/tmTempHtLimit.v"
// `include "DFT_TMTB_patterns/tmfzRclkFifoCtrl.v"
// `include "DFT_TMTB_patterns/tmTsTrim.v"
// `include "DFT_TMTB_patterns/drdtrainmon_tm.v"
// `include "DFT_TMTB_patterns/forceredpre_tm.v"
// `include "DFT_TMTB_patterns/forcediering_tm.v"
// `include "DFT_TMTB_patterns/tmOsc.v"
// `include "DFT_TMTB_patterns/tmfzEccPipeStgA.v"
// `include "DFT_TMTB_patterns/tmfzEccPipeStgB.v"
// `include "DFT_TMTB_patterns/tmfzEccPipeStgC.v"
// `include "DFT_TMTB_patterns/processmon_core_tm.v"



//skatarey
/*
`include "DFT_TMTB_patterns/tmFloatVccprdec.v"
`include "DFT_TMTB_patterns/tmFloatVys.v"
`include "DFT_TMTB_patterns/tmForceDummy.v"
`include "DFT_TMTB_patterns/tmfzC1WrCmdDly.v"
`include "DFT_TMTB_patterns/tmfzDsaEnDly.v"
`include "DFT_TMTB_patterns/tmfzDsaGateEnDly.v"
`include "DFT_TMTB_patterns/tmfzDsaGateEnPulse.v"
`include "DFT_TMTB_patterns/tmfzGioPreDisPulse.v"
`include "DFT_TMTB_patterns/tmfzWrtLioPreCtrl.v"
`include "DFT_TMTB_patterns/tmfzWrLatDly.v"
`include "DFT_TMTB_patterns/tmfzRepRclkDutyCtrl.v"
`include "DFT_TMTB_patterns/tmfzRepWclkDutyCtrl.v"
`include "DFT_TMTB_patterns/tmfzNsaDrvSel.v"
`include "DFT_TMTB_patterns/tmallampen.v"
`include "DFT_TMTB_patterns/tmVnwlPadCtrl.v"
`include "DFT_TMTB_patterns/tmFloatLio.v"
`include "DFT_TMTB_patterns/tmAwReset.v"
`include "DFT_TMTB_patterns/tmfzRdOutEnDly.v"
`include "DFT_TMTB_patterns/tmBstdChar.v"
`include "DFT_TMTB_patterns/tmfzSwlKnee.v"
`include "DFT_TMTB_patterns/tmfzDsaClkStretch.v"
// `include "DFT_TMTB_patterns/tmfzPprClk.v"*/

`include "DFT_TMTB_patterns/tmfzVtcSenseAmp.v"

`endif

`include "DFT_TMTB_patterns/dft_tmtb_run.v"
`endif
