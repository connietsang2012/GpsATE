/*******************************************************************************
 *  Copyright Statement:
 *  --------------------
 *  This software is protected by Copyright and the information contained
 *  herein is confidential. The software may not be copied and the information
 *  contained herein may not be used or disclosed except with the written
 *  permission of MediaTek Inc. (C) 2003
 *
 ******************************************************************************/

/*******************************************************************************
 * Filename:
 * ---------
 *  brom.h
 *
 * Project:
 * --------
 *  BootRom Library
 *
 * Description:
 * ------------
 *  Exported C interface APIs for BootRom library.
 *
 * Author:
 * -------
 * -------
 *
 *******************************************************************************/
#ifndef _BROM_H_
#define _BROM_H_

/*#if defined(_WIN32)
#include <windows.h>
#elif defined(__GNUC__)
    typedef int HANDLE;
    #include <stddef.h>
#endif*/
#ifdef	__cplusplus
extern "C" {
#endif

struct FLASHTOOL_API_HANDLE;
typedef struct FLASHTOOL_API_HANDLE *	FLASHTOOL_API_HANDLE_T;
// The magic value to stop boot process
#define BOOT_STOP	9876

// boot infinitely
#define BOOT_INFINITE	0xFFFFFFF

// default start cmd retry count
#define DEFAULT_BROM_START_CMD_RETRY_COUNT	1

//------------------------------------------------------------------------------
// prototype of COM initial stage callback
//------------------------------------------------------------------------------
typedef int (__stdcall *CALLBACK_COM_INIT_STAGE)(HANDLE hCOM, void *usr_arg);

//------------------------------------------------------------------------------
// prototype of BootROM stage callback
//------------------------------------------------------------------------------
typedef int (__stdcall *CALLBACK_IN_BROM_STAGE)(unsigned int brom_handle, HANDLE hCOM, void *usr_arg);

//------------------------------------------------------------------------------
// prototype of write buf progress callback
//------------------------------------------------------------------------------
typedef int (__stdcall *CALLBACK_WRITE_BUF_PROGRESS_INIT)(void *usr_arg);
typedef int (__stdcall *CALLBACK_WRITE_BUF_PROGRESS)(unsigned char finished_percentage, unsigned int finished_bytes, unsigned int total_bytes, void *usr_arg);

//------------------------------------------------------------------------------
// prototype of Serial-Link-Authentication challenge callback
//------------------------------------------------------------------------------
typedef int (__stdcall *CALLBACK_SLA_CHALLENGE)(void *usr_arg, const unsigned char  *p_challenge_in, unsigned int  challenge_in_len, unsigned char  **pp_challenge_out, unsigned int  *p_challenge_out_len);
typedef int (__stdcall *CALLBACK_SLA_CHALLENGE_END)(void *usr_arg, unsigned char  *p_challenge_out);


#endif
