//+---------------------------------------------------------------------------
//
//  Microsoft Windows
//  Copyright (C) Microsoft Corporation.
//
//  File:       OnDemandConnRouteHelper.h
//
//  Contents:   On Demand Connection Route Helper API Prototypes and Definitions
//
//----------------------------------------------------------------------------

#ifndef _ONDEMANDCONNROUTEHELPER_H
#define _ONDEMANDCONNROUTEHELPER_H
#include <winapifamily.h>

#pragma region Desktop Family
#if WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)

#if NTDDI_VERSION >= NTDDI_WINBLUE

#ifdef _MSC_VER
#pragma once
#endif

STDAPI OnDemandGetRoutingHint(
        _In_ PCWSTR destinationHostName,
        _Out_ DWORD* interfaceIndex);


typedef void (WINAPI *ONDEMAND_NOTIFICATION_CALLBACK) (_In_opt_ void*);


STDAPI OnDemandRegisterNotification(
        _In_ ONDEMAND_NOTIFICATION_CALLBACK callback,
        _In_opt_ void* callbackContext,
        _Out_ HANDLE* registrationHandle);


STDAPI OnDemandUnRegisterNotification(_In_ HANDLE registrationHandle);


#endif // NTDDI_VERSION >= NTDDI_WINBLUE

#endif /* WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP) */
#pragma endregion

#endif  // _ONDEMANDCONNROUTEHELPER_H
