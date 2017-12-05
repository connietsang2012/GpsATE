/**************************************************************************/
/* LabWindows/CVI User Interface Resource (UIR) Include File              */
/*                                                                        */
/* WARNING: Do not add to, delete from, or otherwise modify the contents  */
/*          of this include file.                                         */
/**************************************************************************/

#include <userint.h>

#ifdef __cplusplus
    extern "C" {
#endif

     /* Panels and Controls: */

#define  PANEL                            1
#define  PANEL_COM_PORT_SETTING_2         2       /* control type: ring, callback function: ListComPortDynamiclly */
#define  PANEL_COM_PORT_SETTING           3       /* control type: ring, callback function: ListComPortDynamiclly */
#define  PANEL_IMEI_2                     4       /* control type: string, callback function: Get_IMEI */
#define  PANEL_RESULTS_2                  5       /* control type: textBox, callback function: (none) */
#define  PANEL_TESTRESULT_2               6       /* control type: string, callback function: (none) */
#define  PANEL_TIMER_SENDTCPCMD_2         7       /* control type: timer, callback function: sendTcpcmd_timer */
#define  PANEL_TIMER_SENDCMD_2            8       /* control type: timer, callback function: sendcmd_timer */
#define  PANEL_COMDISCONNECT_2            9       /* control type: command, callback function: ComDisConnect */
#define  PANEL_COMCONNECT_2               10      /* control type: command, callback function: ComConnect */
#define  PANEL_QUIT                       11      /* control type: command, callback function: Quit */
#define  PANEL_IMEI                       12      /* control type: string, callback function: Get_IMEI */
#define  PANEL_TEST_2                     13      /* control type: command, callback function: CouplingTest */
#define  PANEL_TEST                       14      /* control type: command, callback function: CouplingTest */
#define  PANEL_RESULTS                    15      /* control type: textBox, callback function: (none) */
#define  PANEL_TESTRESULT                 16      /* control type: string, callback function: (none) */
#define  PANEL_TIMER_SENDTCPCMD           17      /* control type: timer, callback function: sendTcpcmd_timer */
#define  PANEL_TIMER_SENDCMD              18      /* control type: timer, callback function: sendcmd_timer */
#define  PANEL_CONNECTED_2                19      /* control type: LED, callback function: (none) */
#define  PANEL_CONNECTED                  20      /* control type: LED, callback function: (none) */
#define  PANEL_COMDISCONNECT              21      /* control type: command, callback function: ComDisConnect */
#define  PANEL_COMCONNECT                 22      /* control type: command, callback function: ComConnect */
#define  PANEL_COUPLINGTESTTIMER          23      /* control type: timer, callback function: EnterCouplingTestAgain */
#define  PANEL_CONTENT                    24      /* control type: string, callback function: (none) */
#define  PANEL_COUPLINGTESTTIMER_2        25      /* control type: timer, callback function: EnterCouplingTestAgain */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK ComConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK ComDisConnect(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK CouplingTest(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK EnterCouplingTestAgain(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Get_IMEI(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK ListComPortDynamiclly(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Quit(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK sendcmd_timer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK sendTcpcmd_timer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
