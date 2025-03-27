#include "StdAfx.h"
#include "ShutdownDialog.h"
#include "VistaTools.h"
#include "atlsync.h"
#include <boost/thread/thread.hpp>
#include <boost/bind.hpp>
#include <commctrl.h>
#include "commonresourceconstants.h"
enum _TASKDIALOG_COMMON_BUTTON_FLAGS
{
	TDCBF_OK_BUTTON = 0x0001, // selected control return value IDOK
	TDCBF_YES_BUTTON = 0x0002, // selected control return value IDYES
	TDCBF_NO_BUTTON = 0x0004, // selected control return value IDNO
	TDCBF_CANCEL_BUTTON = 0x0008, // selected control return value IDCANCEL
	TDCBF_RETRY_BUTTON = 0x0010, // selected control return value IDRETRY
	TDCBF_CLOSE_BUTTON = 0x0020  // selected control return value IDCLOSE
};
typedef int TASKDIALOG_COMMON_BUTTON_FLAGS;           // Note: _TASKDIALOG_COMMON_BUTTON_FLAGS is an int
enum _TASKDIALOG_FLAGS
{
	TDF_ENABLE_HYPERLINKS = 0x0001,
	TDF_USE_HICON_MAIN = 0x0002,
	TDF_USE_HICON_FOOTER = 0x0004,
	TDF_ALLOW_DIALOG_CANCELLATION = 0x0008,
	TDF_USE_COMMAND_LINKS = 0x0010,
	TDF_USE_COMMAND_LINKS_NO_ICON = 0x0020,
	TDF_EXPAND_FOOTER_AREA = 0x0040,
	TDF_EXPANDED_BY_DEFAULT = 0x0080,
	TDF_VERIFICATION_FLAG_CHECKED = 0x0100,
	TDF_SHOW_PROGRESS_BAR = 0x0200,
	TDF_SHOW_MARQUEE_PROGRESS_BAR = 0x0400,
	TDF_CALLBACK_TIMER = 0x0800,
	TDF_POSITION_RELATIVE_TO_WINDOW = 0x1000,
	TDF_RTL_LAYOUT = 0x2000,
	TDF_NO_DEFAULT_RADIO_BUTTON = 0x4000,
	TDF_CAN_BE_MINIMIZED = 0x8000,
#if (NTDDI_VERSION >= NTDDI_WIN8)
	TDF_NO_SET_FOREGROUND = 0x00010000, // Don't call SetForegroundWindow() when activating the dialog
#endif // (NTDDI_VERSION >= NTDDI_WIN8)
	TDF_SIZE_TO_CONTENT = 0x01000000  // used by ShellMessageBox to emulate MessageBox sizing behavior
};
typedef int TASKDIALOG_FLAGS;                         // Note: _TASKDIALOG_FLAGS is an int

typedef enum _TASKDIALOG_MESSAGES
{
	TDM_NAVIGATE_PAGE = WM_USER + 101,
	TDM_CLICK_BUTTON = WM_USER + 102, // wParam = Button ID
	TDM_SET_MARQUEE_PROGRESS_BAR = WM_USER + 103, // wParam = 0 (nonMarque) wParam != 0 (Marquee)
	TDM_SET_PROGRESS_BAR_STATE = WM_USER + 104, // wParam = new progress state
	TDM_SET_PROGRESS_BAR_RANGE = WM_USER + 105, // lParam = MAKELPARAM(nMinRange, nMaxRange)
	TDM_SET_PROGRESS_BAR_POS = WM_USER + 106, // wParam = new position
	TDM_SET_PROGRESS_BAR_MARQUEE = WM_USER + 107, // wParam = 0 (stop marquee), wParam != 0 (start marquee), lparam = speed (milliseconds between repaints)
	TDM_SET_ELEMENT_TEXT = WM_USER + 108, // wParam = element (TASKDIALOG_ELEMENTS), lParam = new element text (LPCWSTR)
	TDM_CLICK_RADIO_BUTTON = WM_USER + 110, // wParam = Radio Button ID
	TDM_ENABLE_BUTTON = WM_USER + 111, // lParam = 0 (disable), lParam != 0 (enable), wParam = Button ID
	TDM_ENABLE_RADIO_BUTTON = WM_USER + 112, // lParam = 0 (disable), lParam != 0 (enable), wParam = Radio Button ID
	TDM_CLICK_VERIFICATION = WM_USER + 113, // wParam = 0 (unchecked), 1 (checked), lParam = 1 (set key focus)
	TDM_UPDATE_ELEMENT_TEXT = WM_USER + 114, // wParam = element (TASKDIALOG_ELEMENTS), lParam = new element text (LPCWSTR)
	TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE = WM_USER + 115, // wParam = Button ID, lParam = 0 (elevation not required), lParam != 0 (elevation required)
	TDM_UPDATE_ICON = WM_USER + 116  // wParam = icon element (TASKDIALOG_ICON_ELEMENTS), lParam = new icon (hIcon if TDF_USE_HICON_* was set, PCWSTR otherwise)
} TASKDIALOG_MESSAGES;

typedef enum _TASKDIALOG_NOTIFICATIONS
{
	TDN_CREATED = 0,
	TDN_NAVIGATED = 1,
	TDN_BUTTON_CLICKED = 2,            // wParam = Button ID
	TDN_HYPERLINK_CLICKED = 3,            // lParam = (LPCWSTR)pszHREF
	TDN_TIMER = 4,            // wParam = Milliseconds since dialog created or timer reset
	TDN_DESTROYED = 5,
	TDN_RADIO_BUTTON_CLICKED = 6,            // wParam = Radio Button ID
	TDN_DIALOG_CONSTRUCTED = 7,
	TDN_VERIFICATION_CLICKED = 8,             // wParam = 1 if checkbox checked, 0 if not, lParam is unused and always 0
	TDN_HELP = 9,
	TDN_EXPANDO_BUTTON_CLICKED = 10            // wParam = 0 (dialog is now collapsed), wParam != 0 (dialog is now expanded)
} TASKDIALOG_NOTIFICATIONS;

typedef struct _TASKDIALOG_BUTTON
{
	int     nButtonID;
	PCWSTR  pszButtonText;
} TASKDIALOG_BUTTON;

typedef enum _TASKDIALOG_ELEMENTS
{
	TDE_CONTENT,
	TDE_EXPANDED_INFORMATION,
	TDE_FOOTER,
	TDE_MAIN_INSTRUCTION
} TASKDIALOG_ELEMENTS;

typedef enum _TASKDIALOG_ICON_ELEMENTS
{
	TDIE_ICON_MAIN,
	TDIE_ICON_FOOTER
} TASKDIALOG_ICON_ELEMENTS;

#define TD_WARNING_ICON         MAKEINTRESOURCEW(-1)
#define TD_ERROR_ICON           MAKEINTRESOURCEW(-2)
#define TD_INFORMATION_ICON     MAKEINTRESOURCEW(-3)
#define TD_SHIELD_ICON          MAKEINTRESOURCEW(-4)
typedef HRESULT(CALLBACK* PFTASKDIALOGCALLBACK)(_In_ HWND hwnd, _In_ UINT msg, _In_ WPARAM wParam, _In_ LPARAM lParam, _In_ LONG_PTR lpRefData);
typedef struct _TASKDIALOGCONFIG
{
	UINT        cbSize;
	HWND        hwndParent;                             // incorrectly named, this is the owner window, not a parent.
	HINSTANCE   hInstance;                              // used for MAKEINTRESOURCE() strings
	TASKDIALOG_FLAGS                dwFlags;            // TASKDIALOG_FLAGS (TDF_XXX) flags
	TASKDIALOG_COMMON_BUTTON_FLAGS  dwCommonButtons;    // TASKDIALOG_COMMON_BUTTON (TDCBF_XXX) flags
	PCWSTR      pszWindowTitle;                         // string or MAKEINTRESOURCE()
	union
	{
		HICON   hMainIcon;
		PCWSTR  pszMainIcon;
	} DUMMYUNIONNAME;
	PCWSTR      pszMainInstruction;
	PCWSTR      pszContent;
	UINT        cButtons;
	const TASKDIALOG_BUTTON* pButtons;
	int         nDefaultButton;
	UINT        cRadioButtons;
	const TASKDIALOG_BUTTON* pRadioButtons;
	int         nDefaultRadioButton;
	PCWSTR      pszVerificationText;
	PCWSTR      pszExpandedInformation;
	PCWSTR      pszExpandedControlText;
	PCWSTR      pszCollapsedControlText;
	union
	{
		HICON   hFooterIcon;
		PCWSTR  pszFooterIcon;
	} DUMMYUNIONNAME2;
	PCWSTR      pszFooter;
	PFTASKDIALOGCALLBACK pfCallback;
	LONG_PTR    lpCallbackData;
	UINT        cxWidth;                                // width of the Task Dialog's client area in DLU's. If 0, Task Dialog will calculate the ideal width.
} TASKDIALOGCONFIG;
#ifndef PBST_NORMAL
#define PBST_NORMAL             0x0001
#define PBST_ERROR              0x0002
#define PBST_PAUSED             0x0003
#endif

typedef HRESULT (WINAPI *TaskDialogIndirectProc)(const TASKDIALOGCONFIG *pTaskConfig, __out_opt int *pnButton, __out_opt int *pnRadioButton, __out_opt BOOL *pfVerificationFlagChecked);

class CShutdownTaskDialog : public CShutdownDialog
{
	int dialogResult;
	CEvent readyEvent;
	CEvent doneEvent;
	HWND taskWnd;
	char instructions[256];
public:
	CShutdownTaskDialog(HINSTANCE instance, HWND parent, const char* windowTitle)
		:readyEvent(NULL, TRUE, FALSE, NULL)
		,doneEvent(NULL, TRUE, FALSE, NULL)
		,taskWnd(NULL)
		,dialogResult(-1)
	{
		sprintf_s(instructions, 256, "Roblox needs to close \"%s\"", windowTitle);
		boost::thread(boost::bind(&CShutdownTaskDialog::run, this, instance, parent));
	}
	~CShutdownTaskDialog(void)
	{
		CloseDialog();
		::WaitForSingleObject(doneEvent, INFINITE);
	}

	void run(HINSTANCE instance, HWND parent)
	{
		HMODULE h = ::LoadLibraryW( L"comctl32.dll" );
		TaskDialogIndirectProc func = (TaskDialogIndirectProc)::GetProcAddress(h, "TaskDialogIndirect" );

		TASKDIALOGCONFIG config             = {0};
		config. cbSize                       = sizeof(config);
		config.dwFlags = TDF_ALLOW_DIALOG_CANCELLATION | TDF_USE_COMMAND_LINKS;
		config.hInstance                    = instance;
		config.hwndParent = parent;
		config.dwCommonButtons              = TDCBF_CANCEL_BUTTON;
		config.pszMainIcon                    = MAKEINTRESOURCEW(IDI_BOOTSTRAPPER);
		config.pszWindowTitle               = L"Roblox";
		CComBSTR bstr = CString(instructions);
		config.pszMainInstruction           = (BSTR)bstr;

		TASKDIALOG_BUTTON aCustomButtons[] = {
			{ IDOK, L"&Shut down now\n"
					L"You may lose work that you haven't saved" }
		};
		config.pButtons = aCustomButtons;
		config.cButtons = _countof(aCustomButtons);

		config.pfCallback = (PFTASKDIALOGCALLBACK)CShutdownTaskDialog::callback;
		config.lpCallbackData = reinterpret_cast<LONG_PTR>(this);

		int result;
		func(&config, &result, NULL, NULL);

		doneEvent.Set();
		dialogResult = result;
	}

	/*implement*/ void CloseDialog()
	{
		::WaitForSingleObject(readyEvent, INFINITE);
		::SendMessage(taskWnd, TDM_CLICK_BUTTON, IDCANCEL, 0);
	}
	/*implement*/ bool IsDismissed(DWORD& result) { result = dialogResult; return dialogResult!=-1; }


	HRESULT onCallback(HWND hwnd, UINT uNotification, WPARAM wParam, LPARAM lParam)
	{
		switch (uNotification)
		{
		case TDN_CREATED:
			taskWnd = hwnd;
			readyEvent.Set();
			return S_OK;
		
		case TDN_DESTROYED:
			taskWnd = NULL;
			return S_OK;
		
		default:
			return S_OK;
		}
	}
	static HRESULT __stdcall callback(HWND hwnd, UINT uNotification, WPARAM wParam, LPARAM lParam, LONG_PTR dwRefData)
	{
		CShutdownTaskDialog* dialog = reinterpret_cast<CShutdownTaskDialog*>(dwRefData);
		return dialog->onCallback(hwnd, uNotification, wParam, lParam);
	}
};



class CShutdownLegacyDialog : public CShutdownDialog
{
	int result;
public:
	CShutdownLegacyDialog(HINSTANCE hInstance, HWND parent, const TCHAR* windowTitle)
	{
		CString message;
		message.Format(_T("\"%s\" needs to close.\n\nShut down now?  You may lose work that you haven't saved"), windowTitle);
		result = ::MessageBox(parent,  message, _T("Roblox"), MB_OKCANCEL | MB_ICONQUESTION);
	}

	void CloseDialog(void)
	{
		// noopt
	}
	/*implement*/ bool IsDismissed(DWORD& result) { result = this->result; return result!=-1; }
};


CShutdownDialog* CShutdownDialog::Create(HINSTANCE instance, HWND parent, const TCHAR* windowTitle)
{
	//if (IsVista())
	//	return new CShutdownTaskDialog(instance, parent, windowTitle);
	//else
		return new CShutdownLegacyDialog(instance, parent, windowTitle);
}

