

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 8.00.0595 */
/* at Thu Mar 27 15:26:50 2025
 */
/* Compiler settings for RobloxProxy.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 8.00.0595 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_ILauncher,0x699F0898,0xB7BC,0x4DE5,0xAF,0xEE,0x0E,0xC3,0x8A,0xD4,0x22,0x40);


MIDL_DEFINE_GUID(IID, LIBID_RobloxProxyLib,0x731B317A,0xE2B8,0x4BF7,0xA2,0xC4,0xB4,0x7C,0x22,0x5D,0xDA,0xFF);


MIDL_DEFINE_GUID(IID, DIID__ILauncherEvents,0x6E9600BE,0x5654,0x47F0,0x9A,0x68,0xD6,0xDC,0x25,0xFA,0xDC,0x55);


MIDL_DEFINE_GUID(CLSID, CLSID_Launcher,0x76D50904,0x6780,0x4c8b,0x89,0x86,0x1A,0x7E,0xE0,0xB1,0x71,0x6D);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



