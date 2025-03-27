/*++ 

Copyright (c) Microsoft Corporation

Module Name:

    MDMRegistration.h

Abstract:

    This file contains structures, function signatures for 3rd Party 
    management softwares that intend to interact with Windows MDM

Environment:

    User Mode - Win32

Notes:

--*/

#if (NTDDI_VERSION >= NTDDI_WINBLUE)

#ifndef _MDM_REG_
#define _MDM_REG_

#ifdef _MSC_VER
#pragma once
#endif

#include <winapifamily.h>

#pragma region Desktop Family
#if WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)

#ifdef __cplusplus
extern "C" {
#endif

////////////////////////////////////////////////////////////////////////////////
//
// Error Codes
//

#define E_DATATYPE_MISMATCH                               HRESULT_FROM_WIN32(ERROR_DATATYPE_MISMATCH)

// We will use this facility code for back end registration errors.
#define MDM_REGISTRATION_FACILITY_CODE                    25

// Invalid Schema , Message Format Error from server.
#define MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR           MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 1)

// Server failed to authenticate the user.
#define MREGISTER_E_DEVICE_AUTHENTICATION_ERROR           MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 2)

// User is not authorized to enroll.
#define MREGISTER_E_DEVICE_AUTHORIZATION_ERROR            MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 3)

// User has no permission on the cert template or CA unreachable.
#define MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR        MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 4)

// Generic Failure from management server, such as DB access error.
#define MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR          MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 5)

// Unhandled exception from server.
#define MREGISTER_E_DEVICE__INTERNALSERVICE_ERROR         MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 6)

// Unhandled exception from server.
#define MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR          MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 7)

// Unknown server error.
#define MREGISTER_E_DEVICE_UNKNOWN_ERROR                  MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 8)

// Another enrollment operation is currently underway.
#define MREGISTER_E_REGISTRATION_IN_PROGRESS              MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 9)

// Device is already enrolled.
#define MREGISTER_E_DEVICE_ALREADY_REGISTERED             MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 10)

// Device is not enrolled.
#define MREGISTER_E_DEVICE_NOT_REGISTERED                 MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 11)

// Redirection is needed
#define MREGISTER_E_DISCOVERY_REDIRECTED                  MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 12)

// Device is not registered with AD
#define MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR        MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 13)

// Redirection is needed
#define MREGISTER_E_DISCOVERY_FAILED                      MAKE_HRESULT(SEVERITY_ERROR, MDM_REGISTRATION_FACILITY_CODE, 14)

// Struct returned by the discovery service containing
// the endpoints and information about the management service.
typedef struct _MANAGEMENT_SERVICE_INFO
{
    LPWSTR  pszMDMServiceUri;
    LPWSTR  pszAuthenticationUri;
}MANAGEMENT_SERVICE_INFO,*PMANAGEMENT_SERVICE_INFO;


/*++

Routine Description:

    This function is used to check if this device is registered with an MDM service.

Arguments:

    pfIsDeviceRegisteredWithManagement - will be set to TRUE if device is registered, FALSE otherwise.
    cchUPN - maximum length of pszUPN
    pszUPN - string parameter to return the UPN
    
Return Value:

    HRESULT indicating success or failure.

--*/
HRESULT WINAPI
IsDeviceRegisteredWithManagement(
    _Out_ BOOL *pfIsDeviceRegisteredWithManagement,
    _In_ DWORD cchUPN,
    _Out_z_cap_(cchUPN) LPWSTR pszUPN
    );


/*++
Routine Description:

    This function is used to check if registration is allowed

Arguments:

    pfIsManagementRegistrationAllowed - will be set to TRUE if device is managed externally, FALSE otherwise.

Return Value:

    HRESULT indicating success or failure.

--*/
HRESULT WINAPI
IsManagementRegistrationAllowed(
    _Out_ BOOL *pfIsManagementRegistrationAllowed
    );

/*++
Routine Description:

    This function is used to set if the device is externally managed

Arguments:

    IsManagedExternally - TRUE if device is managed externally, FALSE otherwise.

Return Value:

    HRESULT indicating success or failure.

--*/
HRESULT WINAPI
SetManagedExternally(
    _In_ BOOL IsManagedExternally
    );


/*++

Routine Description:

    This function is used to auto-discover the MDM service.

Arguments:

    pszUPN - email.

Return Value:

    HRESULT indicating success or failure.
    pszUPN - UPN (email address) of the user
    ppMgmtInfo - Struct containing MDM service URIs

--*/
HRESULT WINAPI
DiscoverManagementService(
    _In_z_              LPCWSTR                         pszUPN, 
    _Out_               PMANAGEMENT_SERVICE_INFO*       ppMgmtInfo 
    );


/*++

Routine Description:

    This function is used to register a device with the MDM service synchronously.

Arguments:

    ppszMDMServiceUri - Management service URI.
    pszUPN - UPN (email address) of the user
    pszAccessToken - Access token obtained from the authentication service

Return Value:

    HRESULT indicating success or failure.
    
--*/
HRESULT WINAPI
RegisterDeviceWithManagement(
    _In_z_                  LPCWSTR     ppszMDMServiceUri,
    _In_z_                  LPCWSTR     pszUPN,
    _In_z_                  LPCWSTR     ppzsAccessToken
    );

/*++

Routine Description:

    This function is used to unregister a device synchronously.

Arguments:

    RemoveEnterpriseData - If TRUE enterprise data is removed

Return Value:

    HRESULT indicating success or failure.

--*/
HRESULT WINAPI
UnregisterDeviceWithManagement(
    _In_ BOOL RemoveEnterpriseData
    );

/*++

Routine Description:

    This API is used to get the management app hyperlink associated with the MDM service.

Arguments:

    cchHyperlink - maximum length of pszHyperlink
    pszHyperlink - string parameter to return a hyperlink to the MDM service app

Return Value:

    HRESULT indicating success or failure.

--*/
HRESULT WINAPI
GetManagementAppHyperlink(
    _In_ DWORD cchHyperlink,
    _Out_z_cap_(cchHyperlink) LPWSTR pszHyperlink
    );


#if (NTDDI_VERSION > NTDDI_WINBLUE || \
(NTDDI_VERSION == NTDDI_WINBLUE && defined(WINBLUE_KBSPRING14)))

/*++
Routine Description:

    This function is used to discover the MDM service given a candidate service URL

Arguments:

    pszUPN - email
    pszDiscoveryServiceCandidate - candidate service URL for for discovery

Return Value:

    HRESULT indicating success or failure.
    ppMgmtInfo - Struct containing MDM service URIs
--*/

HRESULT WINAPI
DiscoverManagementServiceEx(
    _In_z_              LPCWSTR                         pszUPN,
    _In_z_              LPCWSTR                         pszDiscoveryServiceCandidate,
    _Out_               PMANAGEMENT_SERVICE_INFO*       ppMgmtInfo
    );

#endif

#ifdef __cplusplus
}
#endif

#endif // WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)
#pragma endregion

#endif // _MDM_REG_

#endif // NTDDI_VERSION >= NTDDI_WINBLUE 
