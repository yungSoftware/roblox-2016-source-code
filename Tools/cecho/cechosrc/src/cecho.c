// cecho.c
// by thomas_polaert@yahoo.fr & anzz1
//
// This source code is provided "as-is" under The Code Project Open License (CPOL)
// http://www.codeproject.com/info/cpol10.aspx
//

#define VERSION_WSTR  L"cecho v3.00"

#include "windows.h"
#include "../include/ntdll.h"

// action declarations
typedef void (*Fct)();

void printStack();
void resetStack();
void setColor();
void printInvalid();
void printEscChar();
void printHexChar();
void parseColor();
void invalidCode();

#define MAX_TRANS 5
#define MAX_STACK 0x1000

// expected tokens list
wchar_t* Grammar[][MAX_TRANS] = {
    {L"{", L""},
    {L"{}", L"\\", L"0123456789abcdefABCDEF#", L" \t", L""},
    {L"u", L"}", L""},
    {L"0123456789abcdefABCDEF", L"}", L""},
    {L"0123456789abcdefABCDEF", L" \t", L"}", L"\\", L""},
    {L"0123456789abcdefABCDEF#", L"}", L""},
    {L"}", L""},
    {L"}", L""},
    {L"}", L" \t", L""}
};

// action executed on state changed
Fct Action[][MAX_TRANS] = {
    {&printStack,0},
    {&resetStack,0,0,0,0},
    {0,&printInvalid,&printEscChar},
    {0,&printInvalid,0},
    {0,&printHexChar,&printHexChar,&printHexChar,0},
    {0,&parseColor,0},
    {&setColor,0},
    {&parseColor,0},
    {&invalidCode,&invalidCode,0}
};

// next state Ids
char Successor[][MAX_TRANS] = {
    {1,0},
    {0,2,5,1,7},
    {3,0,1},
    {4,0,8},
    {4,1,0,2,8},
    {6,0,7},
    {0,7},
    {0,7},
    {0,1,8}
};

// available colors
wchar_t* Color[18] = {
    L"black",
    L"navy",
    L"green",
    L"teal",
    L"maroon",
    L"purple",
    L"olive",
    L"silver",
    L"gray",
    L"blue",
    L"lime",
    L"aqua",
    L"red",
    L"fuchsia",
    L"yellow",
    L"white",
    L"default",
    L"#"
};

// token stack
wchar_t tokStack[MAX_STACK];
// token stack cursor
int tokCurs = 0;
// standard output handle
void* hConsole;
// default colors
unsigned short defaultTxtAttr = 7;
// current colors
unsigned short txtAttr = 7;
// are we redirected
char isConsole = 0;
// use unix line endings
char unixln = 0;

//help text
wchar_t* help = L"\r\n\t{lime}" VERSION_WSTR L"\r\n\r\n" \
L"echo command with colors\r\n" \
L"by thomas_polaert@yahoo.fr & anzz1{#}\r\n\r\n" \
L"Usage: cecho [options] <text_to_output>\r\n" \
L"\t{{{{\t\t= Escape character for '{{'\r\n" \
L"\t{{\\n\\t}\t\t= New line - Tab\r\n" \
L"\t{{\\u0007}\t= Unicode character code\r\n" \
L"\t{{0A}\t\t= Color code\r\n" \
L"\t{{red on gray}\t= Color name\r\n" \
L"\t{{#}\t\t= Restore initial color\r\n\r\n" \
L"Options:\r\n" \
L"\t-n\t\t= No newline on end\r\n" \
L"\t-r\t\t= Use UNIX-style newlines\r\n" \
L"\t-z\t\t= Do not restore initial colors on end\r\n\r\n" \
L"\t-h\t\t= Print help message\r\n" \
L"\t-v\t\t= Print version string\r\n\r\n" \
L"Available colors:\r\n" \
L"\t0 = {black}black{#}\t8 = {gray}gray{#}\r\n" \
L"\t1 = {navy}navy{#}\t9 = {blue}blue{#}\r\n" \
L"\t2 = {green}green{#}\tA = {lime}lime{#}\r\n" \
L"\t3 = {teal}teal{#}\tB = {aqua}aqua{#}\r\n" \
L"\t4 = {maroon}maroon{#}\tC = {red}red{#}\r\n" \
L"\t5 = {purple}purple{#}\tD = {fuchsia}fuchsia{#}\r\n" \
L"\t6 = {olive}olive{#}\tE = {yellow}yellow{#}\r\n" \
L"\t7 = {silver}silver{#}\tF = {white}white{#}\r\n";

// utf16/utf8, wchar/char, console/pipe/file print
void print(const wchar_t* wstr)
{
    unsigned long dwBytesWritten;
    if (isConsole)
        WriteConsoleW(hConsole, wstr, wcslen(wstr), &dwBytesWritten, 0);
    else
    {
        int clen, wlen;
        char* cbuf = 0;

        wlen = wcslen(wstr);
        clen = WideCharToMultiByte(65001, 0, wstr, wlen, 0, 0, 0, 0); // CP_UTF8
        cbuf = (char*)LocalAlloc(0, clen); // LMEM_FIXED

        if(!cbuf)
        {
           WriteFile(hConsole, "kernel32:LocalAlloc() failed\r\n", 21, &dwBytesWritten, 0);
           return;
        }

        WideCharToMultiByte(65001, 0, wstr, wlen, cbuf, clen, 0, 0);
        WriteFile(hConsole, cbuf, clen, &dwBytesWritten, 0);

        LocalFree(cbuf);
    }
}

// color info can be provided as a sentence, e.g. "Red on gray"
// keywords 'default' or '#' refers to initial colors.
// if not specified, background is 'default'
void parseColor()
{
    short clr, shift = 0;
    wchar_t* token;
    wchar_t* end;
    wchar_t* pos;

    tokStack[tokCurs-1] = 0;

    txtAttr = 0;

    pos = tokStack;
    end = tokStack+wcslen(tokStack);

    while (pos < end && (*pos == L' ' || *pos == L'\t'))
        pos++;

    do
    {
        for (token = pos; pos < end; pos++)
        {
            if (*pos == L' ' || *pos == L'\t')
            {
                *pos = 0;
                pos++;
                break;
            }
        }
        for (clr = 0; clr < 18; clr++)
        {
            if (!_wcsicmp(token, Color[clr]))
            {
                if (clr > 15)
                    txtAttr += defaultTxtAttr & (15 << shift);
                else
                    txtAttr += clr << shift;
                shift += 4;
                break;
            }
        }
    } while (token != pos && shift != 8);

    if (shift == 0)
    {
        // "<Invalid color: '%s'>"
        print(L"<Invalid color: '");
        print(tokStack);
        print(L"'>");  
    }
    else
    {
        if (shift == 4)
            txtAttr += defaultTxtAttr & 0xf0; // (15 << 4);

        if(isConsole)
            SetConsoleTextAttribute(hConsole, (unsigned short)(txtAttr & 0xff));
    }
}

// print the token stack content
void printStack()
{
    tokStack[tokCurs-1] = 0;
    print(tokStack);
}

void resetStack()
{
    // {{ is the escape sequence for '{'
    if (tokStack[tokCurs-1] == L'{')
        print(L"{");
}

void setColor()
{
    tokStack[tokCurs-1] = 0;

    if (isConsole)
    {
        unsigned short bg,fg;
        bg = tokStack[tokCurs-3];
        fg = tokStack[tokCurs-2];
        if (bg == 35)
        {
            txtAttr = defaultTxtAttr & 0xf0;
        }
        else
        {
            bg = bg < 58 ? bg - 48 : bg - 55;
            txtAttr = (bg << 4);
        }
        if (fg == 35)
        {
            txtAttr += defaultTxtAttr & 0x0f;
        }
        else
        {
            fg = fg < 58 ? fg - 48 : fg - 55;
            txtAttr += fg;
        }

        SetConsoleTextAttribute(hConsole, (unsigned short)(txtAttr & 0xff));
    }
}

void printInvalid()
{
    tokStack[tokCurs] = 0;

    // "<Invalid escape sequence: '\%c'>"
    print(L"<Invalid escape sequence: '");
    print(tokStack);
    print(L"'>");
}

void invalidCode()
{
    tokStack[tokCurs-1] = 0;

    //printInvalid()

    // "<Invalid unicode sequence: '\%c'>"
    print(L"<Invalid unicode sequence: '");
    print(tokStack);
    print(L"'>");
}

void printEscChar()
{
    switch (tokStack[tokCurs-1])
    {
        case L't':
            print(L"\t");
            break;
        case L'n':
            print(unixln ? L"\n" : L"\r\n");
            break;
        default:
            printInvalid();
            break;
    }
}

void printHexChar()
{
    unsigned short chr;
    wchar_t buf[2];

    tokStack[tokCurs] = 0;

    chr = (unsigned short)wcstol(tokStack + ((tokStack[0] == L'\\') ? 2 : 1), 0, 16);
    buf[0] = chr;
    buf[1] = 0;
    print(buf);
}

int main(void)
{
    short trans, fired;
    wchar_t* token;
    char state = 0;
    CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
    wchar_t* input;
    unsigned long mode;
    char nonewline = 0;
    char norestore = 0;

    // get console handle
    hConsole = GetStdHandle((unsigned long)-11); // STD_OUTPUT_HANDLE
    if (!hConsole || hConsole == (void*)-1)
        return -1;

    // check for redirection
    if (GetConsoleMode(hConsole, &mode))
    {
        isConsole = 1;

        // save initial colors
        if (GetConsoleScreenBufferInfo(hConsole, &consoleInfo))
        {
            defaultTxtAttr = consoleInfo.wAttributes;
            txtAttr = defaultTxtAttr;
        }
    }

    // retrieve commandline
    input = GetCommandLineW();
    if(!input)
    {
        print(L"kernel32:GetCommandLineW() failed\r\n");
        return -1;
    }

    // get argument part
    if (*input == L'"')
    {
        for (token = input; *token != 0; token++)
        {
            if (*token == L'"' && (*(token+1) == L' ' || *(token+1) == L'\t'))
            {
                input = token+2;
                break;
            }
        }
    }
    else
    {
        for (token = input; *token != 0; token++)
        {
            if (*token == L' ' || *token == L'\t')
            {
                input = token+1;
                break;
            }
        }
    }

    // parse arguments
    if (!token || *token == 0)
    input = help;
    else
    {
        char found;
        char end;

        // skip leading space
        if (*input == L' ')
            input++;

        // parse command line switches
        do 
        {
            found = 0;
            end = 0;

            token = input;

            if (*token == L'-')
            {
                token++;
                if (*token == L'-')
                    token++;
            }
            else if (*token == L'/')
                token++;

            if (token != input)
            {
                for (/*found = 0*/; !end; token++)
                {
                    switch (*token)
                    {
                        case L'n':
                        case L'N':
                            //print(L"nonewline ");
                            found = 1;
                            nonewline = 1;
                            break;
                        case L'r':
                        case L'R':
                            //print(L"unixln ");
                            found = 1;
                            unixln = 1;
                            break;
                        case L'z':
                        case L'Z':
                            //print(L"norestore ");
                            found = 1;
                            norestore = 1;
                            break;
                        case L'v':
                        case L'V':
                            print(VERSION_WSTR L"\r\n");
                            return 0;
                        case L'?':
                        case L'h':
                        case L'H':
                            input = help;
                            end = 1;
                            break;
                        default:
                            if (found)
                            {
                                if (*token != L' ' && *token != L'\t')
                                    found = 0;
                                else
                                    input = token + 1;
                            }
                            end = 1;
                            break;
                    }
                }
            }
        } while (found && end);
    }

    // parse input string
    for (fired = 0, token = input; *token != 0; token++)
    {
        // does token trigger a transition ?
        for (trans = 0; trans < MAX_TRANS && Grammar[state][trans] != 0; trans++)
        {
            // check if token belongs to the expected tokens list ? 
            // a empty list acts as a wildchar token
            if (wcschr(Grammar[state][trans], *token) || *Grammar[state][trans] == 0)
            {
                // push token into the stack
                if (tokCurs < MAX_STACK)
                    tokStack[tokCurs++] = *token;
                else
                {
                    print(L"Error: Max stack size reached (4096)\r\n");
                    return -1;
                }

                // execute the action associated to the transition (if any)
                if (Action[state][trans] != 0)
                {
                    (*Action[state][trans])();

                    tokCurs = 0; // reset token stack
                }
                // update parser state
                state = Successor[state][trans];
                fired = 1;
                break;
            }
        }
        if (fired == 0)
        {
            wchar_t buf[12]; // _MAX_ITOSTR_BASE10_COUNT
            buf[0] = *token;
            buf[1] = 0;

            if(isConsole && txtAttr != defaultTxtAttr)
                SetConsoleTextAttribute(hConsole, defaultTxtAttr);

            // "Syntax error: '%c' col %i"
            print(L"Syntax error: '");
            print(buf);
            print(L"' col ");
            print(_itow(token - input+1, buf, 10));
            print(L"\r\n");

            return -1;
        }
    }
    // print remaining token stack
    tokCurs++;
    printStack();

    // restore initial colors (-z not set)
    if (!norestore && isConsole && txtAttr != defaultTxtAttr)
        SetConsoleTextAttribute(hConsole, defaultTxtAttr);

    // end in newline (-n not set)
    if (!nonewline)
        print(unixln ? L"\n" : L"\r\n");

    return 0;
}
