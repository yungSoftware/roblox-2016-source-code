

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0603 */
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 500
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __skydrivesyncpartner_h__
#define __skydrivesyncpartner_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ILSCEvent_FWD_DEFINED__
#define __ILSCEvent_FWD_DEFINED__
typedef interface ILSCEvent ILSCEvent;

#endif 	/* __ILSCEvent_FWD_DEFINED__ */


#ifndef __ILSCEvent2_FWD_DEFINED__
#define __ILSCEvent2_FWD_DEFINED__
typedef interface ILSCEvent2 ILSCEvent2;

#endif 	/* __ILSCEvent2_FWD_DEFINED__ */


#ifndef __IEnumLSCEvent_FWD_DEFINED__
#define __IEnumLSCEvent_FWD_DEFINED__
typedef interface IEnumLSCEvent IEnumLSCEvent;

#endif 	/* __IEnumLSCEvent_FWD_DEFINED__ */


#ifndef __IPartnerActivityCallback_FWD_DEFINED__
#define __IPartnerActivityCallback_FWD_DEFINED__
typedef interface IPartnerActivityCallback IPartnerActivityCallback;

#endif 	/* __IPartnerActivityCallback_FWD_DEFINED__ */


#ifndef __ILSCLocalSyncClient_FWD_DEFINED__
#define __ILSCLocalSyncClient_FWD_DEFINED__
typedef interface ILSCLocalSyncClient ILSCLocalSyncClient;

#endif 	/* __ILSCLocalSyncClient_FWD_DEFINED__ */


#ifndef __ILSCFileSyncHost_FWD_DEFINED__
#define __ILSCFileSyncHost_FWD_DEFINED__
typedef interface ILSCFileSyncHost ILSCFileSyncHost;

#endif 	/* __ILSCFileSyncHost_FWD_DEFINED__ */


#ifndef __LSCFileSyncHost_FWD_DEFINED__
#define __LSCFileSyncHost_FWD_DEFINED__

#ifdef __cplusplus
typedef class LSCFileSyncHost LSCFileSyncHost;
#else
typedef struct LSCFileSyncHost LSCFileSyncHost;
#endif /* __cplusplus */

#endif 	/* __LSCFileSyncHost_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_skydrivesyncpartner_0000_0000 */
/* [local] */ 

#include <winapifamily.h>
#pragma region Desktop Family
#if WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP)
#if (NTDDI_VERSION >= NTDDI_WINBLUE)
#define E_LSC_FILENOTSUPPORTED				MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0300)
#define E_LSC_CONFLICTINGFILE				MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0301)
#define E_LSC_LOCALFILEUNAVAILABLE			MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0302)
#define E_LSC_NOTINITIALIZED					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0303)
#define E_LSC_FILENOTFOUND					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0304)
#define E_LSC_LOCALPATHNOTMAPPED				MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0305)
#define E_LSC_CACHEMISMATCH					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0306)
#define E_LSC_PENDINGCHANGESINCACHE			MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0307)
#define E_LSC_SERVERPATHINDIFFERENTCACHE		MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0308)
#define E_LSC_DIRECTORYHINTCONFLICT			MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0309)
#define E_LSC_PATHMISMATCH					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x030A)
#define E_LSC_PROGIDCONFLICT					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x030B)
#define E_LSC_FILEUPTODATE 					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x030C)
#define E_LSC_DEPRECATED 					MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x030D)
#define E_SC_NOT_RUNNING                     MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0400)
#define E_SC_NONMAPPED_PATH                  MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0401)
#define E_SC_ALREADY_RUNNING                 MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0402)
#define E_SC_CREDTYPEMISMATCH                MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0403)
#define E_SC_DIFFERENT_USER                  MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0404)
#define E_SC_AUTH_FAILURE                    MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0405)
#define E_SC_INIT_REQUIRED                   MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0406)
#define S_SC_RAN_PREVIOUSLY                  MAKE_HRESULT(SEVERITY_SUCCESS, FACILITY_ITF, 0x0407)
#define LSCFILESYNC_REGISTRY_KEY              L"Software\\Microsoft\\Windows\\CurrentVersion\\SkyDrive\\FileSyncPartner"
#define LSCFILESYNC_REGISTRY_PARTNER_CLID     L"PartnerCLSID"
#define LSCFILESYNC_REGISTRY_PARTNER_WATCH    L"PartnerInstallationRegistryToWatch"
#define LSCFILESYNC_REGISTRY_PARTNER_DISABLED L"PartnerDisabled"
typedef /* [uuid] */  DECLSPEC_UUID("2F1AE2BF-C855-40c9-B5F3-B4F23BE244C8") 
enum LSCEventTypeOccurred
    {
        LSCEventTypeOccurred_GetChanges	= 0,
        LSCEventTypeOccurred_GetSupportedFileExtensions	= ( LSCEventTypeOccurred_GetChanges + 1 ) 
    } 	LSCEventTypeOccurred;

typedef /* [uuid] */  DECLSPEC_UUID("EED6739B-07B5-485f-811A-4777A82195CA") 
enum LSCEventType
    {
        LSCEventType_None	= 0,
        LSCEventType_OnLocalChanges	= 1,
        LSCEventType_OnOpenedByUser	= 2,
        LSCEventType_OnServerChangesDownloaded	= 3,
        LSCEventType_OnLocalChangesUploaded	= 4,
        LSCEventType_OnLocalConflictStateChanged	= 5,
        LSCEventType_OnFileAdded	= 6,
        LSCEventType_OnFileDeleted	= 7,
        LSCEventType_OnSyncEnabled	= 8,
        LSCEventType_OnServerChangesDownloadStarted	= 9,
        LSCEventType_OnLocalChangesUploadStarted	= 10,
        LSCEventType_OnFilePathConflict	= 11
    } 	LSCEventType;

typedef /* [uuid] */  DECLSPEC_UUID("46952438-6B4D-4d8d-A8C0-9085E9B53D0F") 
enum LSCEventSyncErrorType
    {
        LSCEventSyncErrorType_UserInterventionRequiredUnexpected	= 0,
        LSCEventSyncErrorType_NoInterventionRequired	= 1,
        LSCEventSyncErrorType_UserInterventionRequired	= 2,
        LSCEventSyncErrorType_WaitingOnClient	= 3,
        LSCEventSyncErrorType_ClientInterventionRequired	= 4
    } 	LSCEventSyncErrorType;

typedef /* [uuid] */  DECLSPEC_UUID("A0A82A6A-3456-4436-B4FA-B966E4F1C956") 
enum LSCStatusFlag
    {
        LSCStatusFlag_None	= 0,
        LSCStatusFlag_UploadPending	= 0x1,
        LSCStatusFlag_DownloadPending	= 0x2,
        LSCStatusFlag_LocalFileUnchanged	= 0x4
    } 	LSCStatusFlag;

DEFINE_ENUM_FLAG_OPERATORS(LSCStatusFlag);
typedef /* [uuid] */  DECLSPEC_UUID("7D6F7719-B00B-4bd3-A1CE-CD145C6E6526") 
enum LSCNetworkSyncPermissionType
    {
        LSCNetworkSyncPermissionType_HighCost	= 0,
        LSCNetworkSyncPermissionType_HighPowerUsage	= ( LSCNetworkSyncPermissionType_HighCost + 1 ) 
    } 	LSCNetworkSyncPermissionType;



extern RPC_IF_HANDLE __MIDL_itf_skydrivesyncpartner_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_skydrivesyncpartner_0000_0000_v0_0_s_ifspec;

#ifndef __ILSCEvent_INTERFACE_DEFINED__
#define __ILSCEvent_INTERFACE_DEFINED__

/* interface ILSCEvent */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_ILSCEvent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7256DC08-3D4C-48e9-8AA7-442CE42BD9CB")
    ILSCEvent : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetEventType( 
            /* [out] */ __RPC__out LSCEventType *pnEventType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLocalWorkingPath( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrLocalWorkingPath) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetETag( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrETag) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetError( 
            /* [out] */ __RPC__out LONG *pnError) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetResourceID( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetConflictStatus( 
            /* [out] */ __RPC__out VARIANT_BOOL *pfIsInConflict) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetWebPath( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrWebPath) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetResourceIDAttempted( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResourceIDAttempted) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSyncErrorType( 
            /* [out] */ __RPC__out LSCEventSyncErrorType *pnSyncErrorType) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct ILSCEventVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ILSCEvent * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ILSCEvent * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ILSCEvent * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetEventType )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__out LSCEventType *pnEventType);
        
        HRESULT ( STDMETHODCALLTYPE *GetLocalWorkingPath )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrLocalWorkingPath);
        
        HRESULT ( STDMETHODCALLTYPE *GetETag )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrETag);
        
        HRESULT ( STDMETHODCALLTYPE *GetError )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__out LONG *pnError);
        
        HRESULT ( STDMETHODCALLTYPE *GetResourceID )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResourceID);
        
        HRESULT ( STDMETHODCALLTYPE *GetConflictStatus )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__out VARIANT_BOOL *pfIsInConflict);
        
        HRESULT ( STDMETHODCALLTYPE *GetWebPath )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrWebPath);
        
        HRESULT ( STDMETHODCALLTYPE *GetResourceIDAttempted )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResourceIDAttempted);
        
        HRESULT ( STDMETHODCALLTYPE *GetSyncErrorType )( 
            __RPC__in ILSCEvent * This,
            /* [out] */ __RPC__out LSCEventSyncErrorType *pnSyncErrorType);
        
        END_INTERFACE
    } ILSCEventVtbl;

    interface ILSCEvent
    {
        CONST_VTBL struct ILSCEventVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILSCEvent_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILSCEvent_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILSCEvent_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILSCEvent_GetEventType(This,pnEventType)	\
    ( (This)->lpVtbl -> GetEventType(This,pnEventType) ) 

#define ILSCEvent_GetLocalWorkingPath(This,pbstrLocalWorkingPath)	\
    ( (This)->lpVtbl -> GetLocalWorkingPath(This,pbstrLocalWorkingPath) ) 

#define ILSCEvent_GetETag(This,pbstrETag)	\
    ( (This)->lpVtbl -> GetETag(This,pbstrETag) ) 

#define ILSCEvent_GetError(This,pnError)	\
    ( (This)->lpVtbl -> GetError(This,pnError) ) 

#define ILSCEvent_GetResourceID(This,pbstrResourceID)	\
    ( (This)->lpVtbl -> GetResourceID(This,pbstrResourceID) ) 

#define ILSCEvent_GetConflictStatus(This,pfIsInConflict)	\
    ( (This)->lpVtbl -> GetConflictStatus(This,pfIsInConflict) ) 

#define ILSCEvent_GetWebPath(This,pbstrWebPath)	\
    ( (This)->lpVtbl -> GetWebPath(This,pbstrWebPath) ) 

#define ILSCEvent_GetResourceIDAttempted(This,pbstrResourceIDAttempted)	\
    ( (This)->lpVtbl -> GetResourceIDAttempted(This,pbstrResourceIDAttempted) ) 

#define ILSCEvent_GetSyncErrorType(This,pnSyncErrorType)	\
    ( (This)->lpVtbl -> GetSyncErrorType(This,pnSyncErrorType) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILSCEvent_INTERFACE_DEFINED__ */


#ifndef __ILSCEvent2_INTERFACE_DEFINED__
#define __ILSCEvent2_INTERFACE_DEFINED__

/* interface ILSCEvent2 */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_ILSCEvent2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("AC373B58-AF6C-4e10-AA96-B68271071D5E")
    ILSCEvent2 : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetErrorChain( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrErrorChain) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct ILSCEvent2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ILSCEvent2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ILSCEvent2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ILSCEvent2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetErrorChain )( 
            __RPC__in ILSCEvent2 * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrErrorChain);
        
        END_INTERFACE
    } ILSCEvent2Vtbl;

    interface ILSCEvent2
    {
        CONST_VTBL struct ILSCEvent2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILSCEvent2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILSCEvent2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILSCEvent2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILSCEvent2_GetErrorChain(This,pbstrErrorChain)	\
    ( (This)->lpVtbl -> GetErrorChain(This,pbstrErrorChain) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILSCEvent2_INTERFACE_DEFINED__ */


#ifndef __IEnumLSCEvent_INTERFACE_DEFINED__
#define __IEnumLSCEvent_INTERFACE_DEFINED__

/* interface IEnumLSCEvent */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_IEnumLSCEvent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6EAF0C65-1463-4a28-9D17-A3F8BE51D835")
    IEnumLSCEvent : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE FNext( 
            /* [out] */ __RPC__deref_out_opt ILSCEvent **ppiLSCEvent) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IEnumLSCEventVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IEnumLSCEvent * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IEnumLSCEvent * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IEnumLSCEvent * This);
        
        HRESULT ( STDMETHODCALLTYPE *FNext )( 
            __RPC__in IEnumLSCEvent * This,
            /* [out] */ __RPC__deref_out_opt ILSCEvent **ppiLSCEvent);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            __RPC__in IEnumLSCEvent * This);
        
        END_INTERFACE
    } IEnumLSCEventVtbl;

    interface IEnumLSCEvent
    {
        CONST_VTBL struct IEnumLSCEventVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumLSCEvent_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumLSCEvent_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumLSCEvent_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumLSCEvent_FNext(This,ppiLSCEvent)	\
    ( (This)->lpVtbl -> FNext(This,ppiLSCEvent) ) 

#define IEnumLSCEvent_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumLSCEvent_INTERFACE_DEFINED__ */


#ifndef __IPartnerActivityCallback_INTERFACE_DEFINED__
#define __IPartnerActivityCallback_INTERFACE_DEFINED__

/* interface IPartnerActivityCallback */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_IPartnerActivityCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1DAFC534-4732-4b41-B3B8-44CC68ECD764")
    IPartnerActivityCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE EventOccurred( 
            /* [in] */ LSCEventTypeOccurred eEventTypeOccurred) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IPartnerActivityCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IPartnerActivityCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IPartnerActivityCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IPartnerActivityCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *EventOccurred )( 
            __RPC__in IPartnerActivityCallback * This,
            /* [in] */ LSCEventTypeOccurred eEventTypeOccurred);
        
        END_INTERFACE
    } IPartnerActivityCallbackVtbl;

    interface IPartnerActivityCallback
    {
        CONST_VTBL struct IPartnerActivityCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPartnerActivityCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IPartnerActivityCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IPartnerActivityCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IPartnerActivityCallback_EventOccurred(This,eEventTypeOccurred)	\
    ( (This)->lpVtbl -> EventOccurred(This,eEventTypeOccurred) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IPartnerActivityCallback_INTERFACE_DEFINED__ */


#ifndef __ILSCLocalSyncClient_INTERFACE_DEFINED__
#define __ILSCLocalSyncClient_INTERFACE_DEFINED__

/* interface ILSCLocalSyncClient */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_ILSCLocalSyncClient;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9844296B-3DF9-43c1-B474-8BABC6F6B47F")
    ILSCLocalSyncClient : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [in] */ __RPC__in BSTR bstrSuppliedID,
            /* [in] */ __RPC__in BSTR bstrProgID,
            /* [in] */ __RPC__in BSTR bstrFileSystemDirectoryHint,
            /* [in] */ __RPC__in_opt IPartnerActivityCallback *pEventCallback,
            /* [out] */ __RPC__out VARIANT_BOOL *pfCreatedNewCache) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LocalFileChange( 
            /* [in] */ __RPC__in BSTR bstrFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrWebPath,
            /* [in] */ __RPC__in BSTR bstrResourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ServerFileChange( 
            /* [in] */ __RPC__in BSTR bstrFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrWebPath,
            /* [in] */ __RPC__in BSTR bstrResourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE DeleteFile( 
            /* [in] */ __RPC__in BSTR bstrResourceID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RenameFile( 
            /* [in] */ __RPC__in BSTR bstrResourceID,
            /* [in] */ __RPC__in BSTR bstrNewFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrNewWebPath,
            /* [in] */ VARIANT_BOOL fBlockUploads) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChanges( 
            /* [in] */ LONG nPreviousChangesToken,
            /* [out] */ __RPC__out LONG *pnCurrentChangesToken,
            /* [out] */ __RPC__deref_out_opt IEnumLSCEvent **ppiEvents) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ResetCache( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSupportedFileExtensions( 
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrSupportedFileExtensions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Uninitialize( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetClientConnectivityState( 
            /* [in] */ VARIANT_BOOL fIsOnline) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFileStatus( 
            /* [in] */ __RPC__in BSTR bstrResourceID,
            /* [in] */ LSCStatusFlag sfRequestedStatus,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrFileSystemPath,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrETag,
            /* [out] */ __RPC__out LSCStatusFlag *psfFileStatus) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetClientNetworkSyncPermission( 
            /* [in] */ LSCNetworkSyncPermissionType nspType,
            /* [in] */ VARIANT_BOOL fEnableSync) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClientNetworkSyncPermission( 
            /* [in] */ LSCNetworkSyncPermissionType nspType,
            /* [out] */ __RPC__out VARIANT_BOOL *pfSyncEnabled) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct ILSCLocalSyncClientVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ILSCLocalSyncClient * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ILSCLocalSyncClient * This);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrSuppliedID,
            /* [in] */ __RPC__in BSTR bstrProgID,
            /* [in] */ __RPC__in BSTR bstrFileSystemDirectoryHint,
            /* [in] */ __RPC__in_opt IPartnerActivityCallback *pEventCallback,
            /* [out] */ __RPC__out VARIANT_BOOL *pfCreatedNewCache);
        
        HRESULT ( STDMETHODCALLTYPE *LocalFileChange )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrWebPath,
            /* [in] */ __RPC__in BSTR bstrResourceID);
        
        HRESULT ( STDMETHODCALLTYPE *ServerFileChange )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrWebPath,
            /* [in] */ __RPC__in BSTR bstrResourceID);
        
        HRESULT ( STDMETHODCALLTYPE *DeleteFile )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrResourceID);
        
        HRESULT ( STDMETHODCALLTYPE *RenameFile )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrResourceID,
            /* [in] */ __RPC__in BSTR bstrNewFileSystemPath,
            /* [in] */ __RPC__in BSTR bstrNewWebPath,
            /* [in] */ VARIANT_BOOL fBlockUploads);
        
        HRESULT ( STDMETHODCALLTYPE *GetChanges )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ LONG nPreviousChangesToken,
            /* [out] */ __RPC__out LONG *pnCurrentChangesToken,
            /* [out] */ __RPC__deref_out_opt IEnumLSCEvent **ppiEvents);
        
        HRESULT ( STDMETHODCALLTYPE *ResetCache )( 
            __RPC__in ILSCLocalSyncClient * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetSupportedFileExtensions )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrSupportedFileExtensions);
        
        HRESULT ( STDMETHODCALLTYPE *Uninitialize )( 
            __RPC__in ILSCLocalSyncClient * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetClientConnectivityState )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ VARIANT_BOOL fIsOnline);
        
        HRESULT ( STDMETHODCALLTYPE *GetFileStatus )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ __RPC__in BSTR bstrResourceID,
            /* [in] */ LSCStatusFlag sfRequestedStatus,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrFileSystemPath,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrETag,
            /* [out] */ __RPC__out LSCStatusFlag *psfFileStatus);
        
        HRESULT ( STDMETHODCALLTYPE *SetClientNetworkSyncPermission )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ LSCNetworkSyncPermissionType nspType,
            /* [in] */ VARIANT_BOOL fEnableSync);
        
        HRESULT ( STDMETHODCALLTYPE *GetClientNetworkSyncPermission )( 
            __RPC__in ILSCLocalSyncClient * This,
            /* [in] */ LSCNetworkSyncPermissionType nspType,
            /* [out] */ __RPC__out VARIANT_BOOL *pfSyncEnabled);
        
        END_INTERFACE
    } ILSCLocalSyncClientVtbl;

    interface ILSCLocalSyncClient
    {
        CONST_VTBL struct ILSCLocalSyncClientVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILSCLocalSyncClient_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILSCLocalSyncClient_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILSCLocalSyncClient_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILSCLocalSyncClient_Initialize(This,bstrSuppliedID,bstrProgID,bstrFileSystemDirectoryHint,pEventCallback,pfCreatedNewCache)	\
    ( (This)->lpVtbl -> Initialize(This,bstrSuppliedID,bstrProgID,bstrFileSystemDirectoryHint,pEventCallback,pfCreatedNewCache) ) 

#define ILSCLocalSyncClient_LocalFileChange(This,bstrFileSystemPath,bstrWebPath,bstrResourceID)	\
    ( (This)->lpVtbl -> LocalFileChange(This,bstrFileSystemPath,bstrWebPath,bstrResourceID) ) 

#define ILSCLocalSyncClient_ServerFileChange(This,bstrFileSystemPath,bstrWebPath,bstrResourceID)	\
    ( (This)->lpVtbl -> ServerFileChange(This,bstrFileSystemPath,bstrWebPath,bstrResourceID) ) 

#define ILSCLocalSyncClient_DeleteFile(This,bstrResourceID)	\
    ( (This)->lpVtbl -> DeleteFile(This,bstrResourceID) ) 

#define ILSCLocalSyncClient_RenameFile(This,bstrResourceID,bstrNewFileSystemPath,bstrNewWebPath,fBlockUploads)	\
    ( (This)->lpVtbl -> RenameFile(This,bstrResourceID,bstrNewFileSystemPath,bstrNewWebPath,fBlockUploads) ) 

#define ILSCLocalSyncClient_GetChanges(This,nPreviousChangesToken,pnCurrentChangesToken,ppiEvents)	\
    ( (This)->lpVtbl -> GetChanges(This,nPreviousChangesToken,pnCurrentChangesToken,ppiEvents) ) 

#define ILSCLocalSyncClient_ResetCache(This)	\
    ( (This)->lpVtbl -> ResetCache(This) ) 

#define ILSCLocalSyncClient_GetSupportedFileExtensions(This,pbstrSupportedFileExtensions)	\
    ( (This)->lpVtbl -> GetSupportedFileExtensions(This,pbstrSupportedFileExtensions) ) 

#define ILSCLocalSyncClient_Uninitialize(This)	\
    ( (This)->lpVtbl -> Uninitialize(This) ) 

#define ILSCLocalSyncClient_SetClientConnectivityState(This,fIsOnline)	\
    ( (This)->lpVtbl -> SetClientConnectivityState(This,fIsOnline) ) 

#define ILSCLocalSyncClient_GetFileStatus(This,bstrResourceID,sfRequestedStatus,pbstrFileSystemPath,pbstrETag,psfFileStatus)	\
    ( (This)->lpVtbl -> GetFileStatus(This,bstrResourceID,sfRequestedStatus,pbstrFileSystemPath,pbstrETag,psfFileStatus) ) 

#define ILSCLocalSyncClient_SetClientNetworkSyncPermission(This,nspType,fEnableSync)	\
    ( (This)->lpVtbl -> SetClientNetworkSyncPermission(This,nspType,fEnableSync) ) 

#define ILSCLocalSyncClient_GetClientNetworkSyncPermission(This,nspType,pfSyncEnabled)	\
    ( (This)->lpVtbl -> GetClientNetworkSyncPermission(This,nspType,pfSyncEnabled) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILSCLocalSyncClient_INTERFACE_DEFINED__ */


#ifndef __ILSCFileSyncHost_INTERFACE_DEFINED__
#define __ILSCFileSyncHost_INTERFACE_DEFINED__

/* interface ILSCFileSyncHost */
/* [unique][nonextensible][oleautomation][uuid][object] */ 


EXTERN_C const IID IID_ILSCFileSyncHost;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("328968BE-B00A-4207-B76B-1A4978AA63E9")
    ILSCFileSyncHost : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE ResetIntegration( 
            /* [in] */ __RPC__in BSTR partnerId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FindLocalPathInformation( 
            /* [in] */ __RPC__in BSTR localPath,
            /* [out] */ __RPC__deref_out_opt BSTR *serverPath,
            /* [out] */ __RPC__deref_out_opt BSTR *resourceId,
            /* [out] */ __RPC__out VARIANT_BOOL *pOfflineFile) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FindServerPathInformation( 
            /* [in] */ __RPC__in BSTR serverPath,
            /* [out] */ __RPC__deref_out_opt BSTR *localPath,
            /* [out] */ __RPC__deref_out_opt BSTR *resourceId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFileActivity( 
            /* [in] */ __RPC__in BSTR resourceId,
            /* [out] */ __RPC__out ULONG *fileActivityCount) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct ILSCFileSyncHostVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ILSCFileSyncHost * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ILSCFileSyncHost * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ILSCFileSyncHost * This);
        
        HRESULT ( STDMETHODCALLTYPE *ResetIntegration )( 
            __RPC__in ILSCFileSyncHost * This,
            /* [in] */ __RPC__in BSTR partnerId);
        
        HRESULT ( STDMETHODCALLTYPE *FindLocalPathInformation )( 
            __RPC__in ILSCFileSyncHost * This,
            /* [in] */ __RPC__in BSTR localPath,
            /* [out] */ __RPC__deref_out_opt BSTR *serverPath,
            /* [out] */ __RPC__deref_out_opt BSTR *resourceId,
            /* [out] */ __RPC__out VARIANT_BOOL *pOfflineFile);
        
        HRESULT ( STDMETHODCALLTYPE *FindServerPathInformation )( 
            __RPC__in ILSCFileSyncHost * This,
            /* [in] */ __RPC__in BSTR serverPath,
            /* [out] */ __RPC__deref_out_opt BSTR *localPath,
            /* [out] */ __RPC__deref_out_opt BSTR *resourceId);
        
        HRESULT ( STDMETHODCALLTYPE *GetFileActivity )( 
            __RPC__in ILSCFileSyncHost * This,
            /* [in] */ __RPC__in BSTR resourceId,
            /* [out] */ __RPC__out ULONG *fileActivityCount);
        
        END_INTERFACE
    } ILSCFileSyncHostVtbl;

    interface ILSCFileSyncHost
    {
        CONST_VTBL struct ILSCFileSyncHostVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILSCFileSyncHost_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILSCFileSyncHost_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILSCFileSyncHost_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILSCFileSyncHost_ResetIntegration(This,partnerId)	\
    ( (This)->lpVtbl -> ResetIntegration(This,partnerId) ) 

#define ILSCFileSyncHost_FindLocalPathInformation(This,localPath,serverPath,resourceId,pOfflineFile)	\
    ( (This)->lpVtbl -> FindLocalPathInformation(This,localPath,serverPath,resourceId,pOfflineFile) ) 

#define ILSCFileSyncHost_FindServerPathInformation(This,serverPath,localPath,resourceId)	\
    ( (This)->lpVtbl -> FindServerPathInformation(This,serverPath,localPath,resourceId) ) 

#define ILSCFileSyncHost_GetFileActivity(This,resourceId,fileActivityCount)	\
    ( (This)->lpVtbl -> GetFileActivity(This,resourceId,fileActivityCount) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILSCFileSyncHost_INTERFACE_DEFINED__ */



#ifndef __LSCFileSyncHost_LIBRARY_DEFINED__
#define __LSCFileSyncHost_LIBRARY_DEFINED__

/* library LSCFileSyncHost */
/* [version][uuid] */ 


EXTERN_C const IID LIBID_LSCFileSyncHost;

EXTERN_C const CLSID CLSID_LSCFileSyncHost;

#ifdef __cplusplus

class DECLSPEC_UUID("B842558F-8A34-4C90-8066-F2BE6BE92BF1")
LSCFileSyncHost;
#endif
#endif /* __LSCFileSyncHost_LIBRARY_DEFINED__ */

/* interface __MIDL_itf_skydrivesyncpartner_0000_0007 */
/* [local] */ 

#endif // NTDDI_WINBLUE
#endif /* WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_DESKTOP) */
#pragma endregion


extern RPC_IF_HANDLE __MIDL_itf_skydrivesyncpartner_0000_0007_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_skydrivesyncpartner_0000_0007_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  BSTR_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree64(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


