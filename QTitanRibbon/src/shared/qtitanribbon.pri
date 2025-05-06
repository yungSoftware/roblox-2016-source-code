
QTITANDIR = $$quote($$(QTITANDIR))

include($$PWD/platform.pri)

QTITAN_LIB_PATH = $$QTITANDIR/bin$$QTITAN_LIB_PREFIX

INCLUDEPATH += $$PWD/../../include

win32-msvc|win32-msvc.net|win32-msvc2002|win32-msvc2003|win32-msvc2005|win32-msvc2008|win32-msvc2010|win32-msvc2012 {

    CONFIG(debug, debug|release):LIBS += $$QTITAN_LIB_PATH/qtnribbond3.lib
        else:LIBS += $$QTITAN_LIB_PATH/qtnribbon3.lib
}

win32-g++ {

    LIBS += -L$$QTITAN_LIB_PATH

    CONFIG(debug, debug|release):LIBS += -lqtnribbond3
        else:LIBS += -lqtnribbon3
}

unix {

    LIBS += -L$$QTITAN_LIB_PATH

    CONFIG(debug, debug|release):LIBS += -lqtnribbond
        else:LIBS += -lqtnribbon
}

!lessThan(QT_VER_MAJ, 5) {
  QT += widgets
}
