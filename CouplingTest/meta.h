/*****************************************************************************
*  Copyright Statement:
*  --------------------
*  This software is protected by Copyright and the information contained
*  herein is confidential. The software may not be copied and the information
*  contained herein may not be used or disclosed except with the written
*  permission of MediaTek Inc. (C) 2001
*
*****************************************************************************/
/*!
 * @file meta.h
 * @mainpage Mobile Engineering Test Architecture Development Kit
 * @author MediaTek Inc.
 */
/*******************************************************************************
 * Filename:
 * ---------
 * meta.h
 *
 * Project:
 * --------
 *   META
 *
 * Description:
 * ------------
 *   This module contains the definitions for using META_DLL.dll.
 *
 * Author:
 * -------
 * -------
 *
 *==============================================================================
 *           HISTORY
 * Below this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *------------------------------------------------------------------------------
 * removed!
 * removed!
 * removed!
 *
 *
 *------------------------------------------------------------------------------
 * Upper this line, this part is controlled by PVCS VM. DO NOT MODIFY!!
 *==============================================================================
 *******************************************************************************/
#ifndef META_DLL_H
#define META_DLL_H


#include "brom.h"




#ifdef __cplusplus
extern "C" {
#endif


	typedef unsigned char bool;
#define __META_DLL_WCDMA__
#define __META_DLL_TD_A__
#define __META_TD_A__
#define __META_C2K__

#if defined(__CHECK_REENTRANCY__)
#define NON_REENTRANT_FUNC __declspec(deprecated("this is not a reentrant function"))
#else
#define NON_REENTRANT_FUNC
#endif // #if !defined(__CHECK_REENTRANCY__)
	
#endif

