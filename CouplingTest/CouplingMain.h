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
#define  PANEL_COM_PORT_SETTING           2       /* control type: ring, callback function: ListComPortDynamiclly */
#define  PANEL_QUIT                       3       /* control type: command, callback function: Quit */
#define  PANEL_IMEI                       4       /* control type: string, callback function: Get_IMEI */
#define  PANEL_TEST                       5       /* control type: command, callback function: CouplingTest */
#define  PANEL_RESULTS                    6       /* control type: textBox, callback function: (none) */
#define  PANEL_TESTRESULT                 7       /* control type: string, callback function: (none) */
#define  PANEL_TIMER_SENDCMD              8       /* control type: timer, callback function: sendcmd_timer */


     /* Control Arrays: */

          /* (no control arrays in the resource file) */


     /* Menu Bars, Menus, and Menu Items: */

          /* (no menu bars in the resource file) */


     /* Callback Prototypes: */

int  CVICALLBACK CouplingTest(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Get_IMEI(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK ListComPortDynamiclly(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK Quit(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);
int  CVICALLBACK sendcmd_timer(int panel, int control, int event, void *callbackData, int eventData1, int eventData2);


#ifdef __cplusplus
    }
#endif
