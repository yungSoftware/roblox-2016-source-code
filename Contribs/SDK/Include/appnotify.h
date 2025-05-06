 
/********************************************************************************
*                                                                               *
* psmapp.h - ApiSet Contract for api-ms-win-core-psm-app-l1                     *
*                                                                               *
* Copyright (c) Microsoft Corporation. All rights reserved.                     *
*                                                                               *
********************************************************************************/

#ifndef _APISET_PSMAPPNOTIFY_H_
#define _APISET_PSMAPPNOTIFY_H_

#include <apiset.h>
#include <apisetcconv.h>

#ifdef _CONTRACT_GEN        // Header(s) needed for contract generation only.
#include <windows.h>

#define PSM_APP_API_HOST
#endif

/* APISET_NAME: api-ms-win-core-psm-appnotify-l1 */

#ifndef _APISET_PSM_APP_VER
#ifdef _APISET_MODERNCORE_VERSION
#if _APISET_MODERNCORE_VERSION >= 0x0100
#define _APISET_PSM_APP_VER 0x0100
#endif
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#undef APICONTRACT
#ifndef PSM_APP_API_HOST
#define APICONTRACT         DECLSPEC_IMPORT
#else
#define APICONTRACT
#endif

#pragma region Desktop Family

#if WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)

typedef
VOID
(*PAPPSTATE_CHANGE_ROUTINE) (
    _In_ BOOLEAN Quiesced,
    _In_ PVOID Context
    );

typedef struct _APPSTATE_REGISTRATION *PAPPSTATE_REGISTRATION;


#if (NTDDI_VERSION >= NTDDI_WINBLUE)

APICONTRACT
ULONG
NTAPI
RegisterAppStateChangeNotification(
    _In_ PAPPSTATE_CHANGE_ROUTINE Routine,
    _In_opt_ PVOID Context,
    _Out_ PAPPSTATE_REGISTRATION * Registration
    );


APICONTRACT
VOID
NTAPI
UnregisterAppStateChangeNotification(
    _Inout_ PAPPSTATE_REGISTRATION Registration
    );


#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)

#endif /* WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP) */
#pragma endregion

#ifdef __cplusplus
}
#endif

#endif // _APISET_PSMAPPNOTIFY_H_
