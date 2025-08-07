/*
*********************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the tools applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
*********************************************************************
*/

/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QFrame>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QMainWindow>
#include <QtGui/QMenu>
#include <QtGui/QMenuBar>
#include <QtGui/QSplitter>
#include <QtGui/QTabWidget>
#include <QtGui/QTextEdit>
#include <QtGui/QToolBar>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionFileExit;
    QAction *actionContainerSet;
    QAction *actionControlMethods;
    QAction *actionControlProperties;
    QAction *actionContainerClear;
    QAction *actionContainerProperties;
    QAction *actionControlInfo;
    QAction *actionFileSave;
    QAction *actionFileLoad;
    QAction *actionFreezeEvents;
    QAction *actionFileNew;
    QAction *actionControlDocumentation;
    QAction *actionControlPixmap;
    QAction *actionScriptingLoad;
    QAction *actionScriptingRun;
    QActionGroup *actionGroupLogging;
    QAction *actionLogSignals;
    QAction *actionLogProperties;
    QWidget *centralWidget;
    QHBoxLayout *hboxLayout;
    QFrame *Frame;
    QVBoxLayout *vboxLayout;
    QSplitter *Splitter2;
    QFrame *Workbase;
    QTabWidget *TabWidget2;
    QWidget *logSignalsTab;
    QHBoxLayout *hboxLayout1;
    QTextEdit *logSignals;
    QWidget *logPropertiesTab;
    QHBoxLayout *hboxLayout2;
    QTextEdit *logProperties;
    QWidget *TabPage;
    QHBoxLayout *hboxLayout3;
    QTextEdit *logMacros;
    QWidget *logDebugTab;
    QHBoxLayout *hboxLayout4;
    QTextEdit *logDebug;
    QToolBar *Toolbar_2;
    QMenuBar *menubar;
    QMenu *FileMenu;
    QMenu *ContainerMenu;
    QMenu *ControlMenu;
    QMenu *VerbMenu;
    QMenu *ScriptMenu;
    QMenu *OptionsMenu;
    QMenu *LoggingMenu;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(929, 620);
        actionFileExit = new QAction(MainWindow);
        actionFileExit->setObjectName(QString::fromUtf8("actionFileExit"));
        actionContainerSet = new QAction(MainWindow);
        actionContainerSet->setObjectName(QString::fromUtf8("actionContainerSet"));
        actionContainerSet->setEnabled(false);
        actionControlMethods = new QAction(MainWindow);
        actionControlMethods->setObjectName(QString::fromUtf8("actionControlMethods"));
        actionControlMethods->setEnabled(false);
        const QIcon icon = qt_get_icon(image0_ID);
        actionControlMethods->setIcon(icon);
        actionControlProperties = new QAction(MainWindow);
        actionControlProperties->setObjectName(QString::fromUtf8("actionControlProperties"));
        actionControlProperties->setEnabled(false);
        const QIcon icon1 = qt_get_icon(image1_ID);
        actionControlProperties->setIcon(icon1);
        actionContainerClear = new QAction(MainWindow);
        actionContainerClear->setObjectName(QString::fromUtf8("actionContainerClear"));
        actionContainerClear->setEnabled(false);
        actionContainerProperties = new QAction(MainWindow);
        actionContainerProperties->setObjectName(QString::fromUtf8("actionContainerProperties"));
        actionControlInfo = new QAction(MainWindow);
        actionControlInfo->setObjectName(QString::fromUtf8("actionControlInfo"));
        actionControlInfo->setEnabled(false);
        actionFileSave = new QAction(MainWindow);
        actionFileSave->setObjectName(QString::fromUtf8("actionFileSave"));
        actionFileSave->setEnabled(false);
        actionFileLoad = new QAction(MainWindow);
        actionFileLoad->setObjectName(QString::fromUtf8("actionFileLoad"));
        actionFreezeEvents = new QAction(MainWindow);
        actionFreezeEvents->setObjectName(QString::fromUtf8("actionFreezeEvents"));
        actionFreezeEvents->setCheckable(true);
        actionFileNew = new QAction(MainWindow);
        actionFileNew->setObjectName(QString::fromUtf8("actionFileNew"));
        const QIcon icon2 = qt_get_icon(image2_ID);
        actionFileNew->setIcon(icon2);
        actionControlDocumentation = new QAction(MainWindow);
        actionControlDocumentation->setObjectName(QString::fromUtf8("actionControlDocumentation"));
        actionControlDocumentation->setEnabled(false);
        actionControlPixmap = new QAction(MainWindow);
        actionControlPixmap->setObjectName(QString::fromUtf8("actionControlPixmap"));
        actionControlPixmap->setEnabled(false);
        actionScriptingLoad = new QAction(MainWindow);
        actionScriptingLoad->setObjectName(QString::fromUtf8("actionScriptingLoad"));
        actionScriptingRun = new QAction(MainWindow);
        actionScriptingRun->setObjectName(QString::fromUtf8("actionScriptingRun"));
        actionScriptingRun->setEnabled(false);
        actionGroupLogging = new QActionGroup(MainWindow);
        actionGroupLogging->setObjectName(QString::fromUtf8("actionGroupLogging"));
        actionGroupLogging->setExclusive(false);
        actionLogSignals = new QAction(actionGroupLogging);
        actionLogSignals->setObjectName(QString::fromUtf8("actionLogSignals"));
        actionLogSignals->setCheckable(true);
        actionLogSignals->setChecked(true);
        actionLogProperties = new QAction(actionGroupLogging);
        actionLogProperties->setObjectName(QString::fromUtf8("actionLogProperties"));
        actionLogProperties->setCheckable(true);
        actionLogProperties->setChecked(true);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        hboxLayout = new QHBoxLayout(centralWidget);
        hboxLayout->setSpacing(6);
        hboxLayout->setContentsMargins(0, 0, 0, 0);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        hboxLayout->setObjectName(QString::fromUtf8("unnamed"));
        Frame = new QFrame(centralWidget);
        Frame->setObjectName(QString::fromUtf8("Frame"));
        QSizePolicy sizePolicy(static_cast<QSizePolicy::Policy>(5), static_cast<QSizePolicy::Policy>(7));
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(Frame->sizePolicy().hasHeightForWidth());
        Frame->setSizePolicy(sizePolicy);
        Frame->setFrameShape(QFrame::StyledPanel);
        Frame->setFrameShadow(QFrame::Sunken);
        vboxLayout = new QVBoxLayout(Frame);
        vboxLayout->setSpacing(0);
        vboxLayout->setContentsMargins(0, 0, 0, 0);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        vboxLayout->setObjectName(QString::fromUtf8("unnamed"));
        Splitter2 = new QSplitter(Frame);
        Splitter2->setObjectName(QString::fromUtf8("Splitter2"));
        Splitter2->setOrientation(Qt::Vertical);
        Workbase = new QFrame(Splitter2);
        Workbase->setObjectName(QString::fromUtf8("Workbase"));
        sizePolicy.setHeightForWidth(Workbase->sizePolicy().hasHeightForWidth());
        Workbase->setSizePolicy(sizePolicy);
        Workbase->setFrameShape(QFrame::NoFrame);
        Workbase->setFrameShadow(QFrame::Raised);
        Splitter2->addWidget(Workbase);
        TabWidget2 = new QTabWidget(Splitter2);
        TabWidget2->setObjectName(QString::fromUtf8("TabWidget2"));
        QSizePolicy sizePolicy1(static_cast<QSizePolicy::Policy>(7), static_cast<QSizePolicy::Policy>(4));
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(TabWidget2->sizePolicy().hasHeightForWidth());
        TabWidget2->setSizePolicy(sizePolicy1);
        logSignalsTab = new QWidget();
        logSignalsTab->setObjectName(QString::fromUtf8("logSignalsTab"));
        hboxLayout1 = new QHBoxLayout(logSignalsTab);
        hboxLayout1->setSpacing(6);
        hboxLayout1->setContentsMargins(0, 0, 0, 0);
        hboxLayout1->setObjectName(QString::fromUtf8("hboxLayout1"));
        hboxLayout1->setObjectName(QString::fromUtf8("unnamed"));
        logSignals = new QTextEdit(logSignalsTab);
        logSignals->setObjectName(QString::fromUtf8("logSignals"));
        QSizePolicy sizePolicy2(static_cast<QSizePolicy::Policy>(7), static_cast<QSizePolicy::Policy>(5));
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(logSignals->sizePolicy().hasHeightForWidth());
        logSignals->setSizePolicy(sizePolicy2);
        logSignals->setReadOnly(true);

        hboxLayout1->addWidget(logSignals);

        TabWidget2->addTab(logSignalsTab, QString());
        logPropertiesTab = new QWidget();
        logPropertiesTab->setObjectName(QString::fromUtf8("logPropertiesTab"));
        hboxLayout2 = new QHBoxLayout(logPropertiesTab);
        hboxLayout2->setSpacing(6);
        hboxLayout2->setContentsMargins(0, 0, 0, 0);
        hboxLayout2->setObjectName(QString::fromUtf8("hboxLayout2"));
        hboxLayout2->setObjectName(QString::fromUtf8("unnamed"));
        logProperties = new QTextEdit(logPropertiesTab);
        logProperties->setObjectName(QString::fromUtf8("logProperties"));
        sizePolicy2.setHeightForWidth(logProperties->sizePolicy().hasHeightForWidth());
        logProperties->setSizePolicy(sizePolicy2);
        logProperties->setReadOnly(true);

        hboxLayout2->addWidget(logProperties);

        TabWidget2->addTab(logPropertiesTab, QString());
        TabPage = new QWidget();
        TabPage->setObjectName(QString::fromUtf8("TabPage"));
        hboxLayout3 = new QHBoxLayout(TabPage);
        hboxLayout3->setSpacing(6);
        hboxLayout3->setContentsMargins(0, 0, 0, 0);
        hboxLayout3->setObjectName(QString::fromUtf8("hboxLayout3"));
        hboxLayout3->setObjectName(QString::fromUtf8("unnamed"));
        logMacros = new QTextEdit(TabPage);
        logMacros->setObjectName(QString::fromUtf8("logMacros"));
        sizePolicy2.setHeightForWidth(logMacros->sizePolicy().hasHeightForWidth());
        logMacros->setSizePolicy(sizePolicy2);
        logMacros->setReadOnly(true);

        hboxLayout3->addWidget(logMacros);

        TabWidget2->addTab(TabPage, QString());
        logDebugTab = new QWidget();
        logDebugTab->setObjectName(QString::fromUtf8("logDebugTab"));
        hboxLayout4 = new QHBoxLayout(logDebugTab);
        hboxLayout4->setSpacing(6);
        hboxLayout4->setContentsMargins(0, 0, 0, 0);
        hboxLayout4->setObjectName(QString::fromUtf8("hboxLayout4"));
        hboxLayout4->setObjectName(QString::fromUtf8("unnamed"));
        logDebug = new QTextEdit(logDebugTab);
        logDebug->setObjectName(QString::fromUtf8("logDebug"));
        sizePolicy2.setHeightForWidth(logDebug->sizePolicy().hasHeightForWidth());
        logDebug->setSizePolicy(sizePolicy2);
        logDebug->setReadOnly(true);

        hboxLayout4->addWidget(logDebug);

        TabWidget2->addTab(logDebugTab, QString());
        Splitter2->addWidget(TabWidget2);

        vboxLayout->addWidget(Splitter2);


        hboxLayout->addWidget(Frame);

        MainWindow->setCentralWidget(centralWidget);
        Toolbar_2 = new QToolBar(MainWindow);
        Toolbar_2->setObjectName(QString::fromUtf8("Toolbar_2"));
        MainWindow->addToolBar(Toolbar_2);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        FileMenu = new QMenu(menubar);
        FileMenu->setObjectName(QString::fromUtf8("FileMenu"));
        ContainerMenu = new QMenu(menubar);
        ContainerMenu->setObjectName(QString::fromUtf8("ContainerMenu"));
        ControlMenu = new QMenu(menubar);
        ControlMenu->setObjectName(QString::fromUtf8("ControlMenu"));
        VerbMenu = new QMenu(ControlMenu);
        VerbMenu->setObjectName(QString::fromUtf8("VerbMenu"));
        VerbMenu->setEnabled(false);
        ScriptMenu = new QMenu(menubar);
        ScriptMenu->setObjectName(QString::fromUtf8("ScriptMenu"));
        OptionsMenu = new QMenu(menubar);
        OptionsMenu->setObjectName(QString::fromUtf8("OptionsMenu"));
        LoggingMenu = new QMenu(OptionsMenu);
        LoggingMenu->setObjectName(QString::fromUtf8("LoggingMenu"));
        MainWindow->setMenuBar(menubar);

        Toolbar_2->addAction(actionFileNew);
        Toolbar_2->addAction(actionControlMethods);
        Toolbar_2->addAction(actionControlProperties);
        menubar->addAction(FileMenu->menuAction());
        menubar->addAction(ContainerMenu->menuAction());
        menubar->addAction(ControlMenu->menuAction());
        menubar->addAction(ScriptMenu->menuAction());
        menubar->addAction(OptionsMenu->menuAction());
        FileMenu->addAction(actionFileNew);
        FileMenu->addAction(actionFileLoad);
        FileMenu->addAction(actionFileSave);
        FileMenu->addSeparator();
        FileMenu->addAction(actionFileExit);
        ContainerMenu->addAction(actionContainerSet);
        ContainerMenu->addAction(actionContainerClear);
        ContainerMenu->addSeparator();
        ContainerMenu->addAction(actionContainerProperties);
        ControlMenu->addAction(actionControlMethods);
        ControlMenu->addAction(actionControlProperties);
        ControlMenu->addAction(VerbMenu->menuAction());
        ControlMenu->addSeparator();
        ControlMenu->addAction(actionControlInfo);
        ControlMenu->addAction(actionControlDocumentation);
        ControlMenu->addAction(actionControlPixmap);
        ScriptMenu->addAction(actionScriptingLoad);
        ScriptMenu->addAction(actionScriptingRun);
        OptionsMenu->addAction(actionFreezeEvents);
        OptionsMenu->addAction(LoggingMenu->menuAction());
        LoggingMenu->addAction(actionLogSignals);
        LoggingMenu->addAction(actionLogProperties);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "ActiveX Control Test Container", 0, QApplication::UnicodeUTF8));
        actionFileExit->setIconText(QApplication::translate("MainWindow", "Exit", 0, QApplication::UnicodeUTF8));
        actionFileExit->setText(QApplication::translate("MainWindow", "E&xit", 0, QApplication::UnicodeUTF8));
        actionContainerSet->setIconText(QApplication::translate("MainWindow", "Set Control", 0, QApplication::UnicodeUTF8));
        actionContainerSet->setText(QApplication::translate("MainWindow", "&Set Control", 0, QApplication::UnicodeUTF8));
        actionContainerSet->setShortcut(QApplication::translate("MainWindow", "Ctrl+S", 0, QApplication::UnicodeUTF8));
        actionControlMethods->setIconText(QApplication::translate("MainWindow", "Invoke Methods", 0, QApplication::UnicodeUTF8));
        actionControlMethods->setText(QApplication::translate("MainWindow", "Invoke &Methods", 0, QApplication::UnicodeUTF8));
        actionControlMethods->setShortcut(QApplication::translate("MainWindow", "Ctrl+M", 0, QApplication::UnicodeUTF8));
        actionControlProperties->setIconText(QApplication::translate("MainWindow", "Change Properties", 0, QApplication::UnicodeUTF8));
        actionControlProperties->setText(QApplication::translate("MainWindow", "Change &Properties", 0, QApplication::UnicodeUTF8));
        actionControlProperties->setShortcut(QApplication::translate("MainWindow", "Ctrl+P", 0, QApplication::UnicodeUTF8));
        actionContainerClear->setIconText(QApplication::translate("MainWindow", "Clear Control", 0, QApplication::UnicodeUTF8));
        actionContainerClear->setText(QApplication::translate("MainWindow", "C&lear Control", 0, QApplication::UnicodeUTF8));
        actionContainerClear->setShortcut(QString());
        actionContainerProperties->setIconText(QApplication::translate("MainWindow", "Ambient Properties", 0, QApplication::UnicodeUTF8));
        actionContainerProperties->setText(QApplication::translate("MainWindow", "Ambient &Properties", 0, QApplication::UnicodeUTF8));
        actionContainerProperties->setShortcut(QApplication::translate("MainWindow", "Ctrl+A", 0, QApplication::UnicodeUTF8));
        actionControlInfo->setIconText(QApplication::translate("MainWindow", "Details", 0, QApplication::UnicodeUTF8));
        actionControlInfo->setText(QApplication::translate("MainWindow", "&Details", 0, QApplication::UnicodeUTF8));
        actionControlInfo->setShortcut(QApplication::translate("MainWindow", "Ctrl+I", 0, QApplication::UnicodeUTF8));
        actionFileSave->setIconText(QApplication::translate("MainWindow", "Save Control", 0, QApplication::UnicodeUTF8));
        actionFileSave->setText(QApplication::translate("MainWindow", "&Save Control", 0, QApplication::UnicodeUTF8));
        actionFileLoad->setIconText(QApplication::translate("MainWindow", "Load Control", 0, QApplication::UnicodeUTF8));
        actionFileLoad->setText(QApplication::translate("MainWindow", "&Load Control", 0, QApplication::UnicodeUTF8));
        actionFreezeEvents->setIconText(QApplication::translate("MainWindow", "Freeze Events", 0, QApplication::UnicodeUTF8));
        actionFreezeEvents->setText(QApplication::translate("MainWindow", "&Freeze Events", 0, QApplication::UnicodeUTF8));
        actionFileNew->setIconText(QApplication::translate("MainWindow", "Insert Control", 0, QApplication::UnicodeUTF8));
        actionFileNew->setText(QApplication::translate("MainWindow", "&Insert Control", 0, QApplication::UnicodeUTF8));
        actionFileNew->setShortcut(QApplication::translate("MainWindow", "Ctrl+N", 0, QApplication::UnicodeUTF8));
        actionControlDocumentation->setIconText(QApplication::translate("MainWindow", "Show Documentation", 0, QApplication::UnicodeUTF8));
        actionControlDocumentation->setText(QApplication::translate("MainWindow", "Show D&ocumentation", 0, QApplication::UnicodeUTF8));
        actionControlDocumentation->setShortcut(QApplication::translate("MainWindow", "Ctrl+D", 0, QApplication::UnicodeUTF8));
        actionControlPixmap->setIconText(QApplication::translate("MainWindow", "Render to Pixmap", 0, QApplication::UnicodeUTF8));
        actionControlPixmap->setText(QApplication::translate("MainWindow", "Render to Pi&xmap", 0, QApplication::UnicodeUTF8));
        actionControlPixmap->setShortcut(QApplication::translate("MainWindow", "Ctrl+X", 0, QApplication::UnicodeUTF8));
        actionScriptingLoad->setIconText(QApplication::translate("MainWindow", "Load Script", 0, QApplication::UnicodeUTF8));
        actionScriptingLoad->setText(QApplication::translate("MainWindow", "&Load Script", 0, QApplication::UnicodeUTF8));
        actionScriptingRun->setIconText(QApplication::translate("MainWindow", "Run Macro", 0, QApplication::UnicodeUTF8));
        actionScriptingRun->setText(QApplication::translate("MainWindow", "&Run Macro...", 0, QApplication::UnicodeUTF8));
        actionLogSignals->setIconText(QApplication::translate("MainWindow", "Signals", 0, QApplication::UnicodeUTF8));
        actionLogSignals->setText(QApplication::translate("MainWindow", "&Signals", 0, QApplication::UnicodeUTF8));
        actionLogProperties->setIconText(QApplication::translate("MainWindow", "Properties", 0, QApplication::UnicodeUTF8));
        actionLogProperties->setText(QApplication::translate("MainWindow", "&Properties", 0, QApplication::UnicodeUTF8));
        TabWidget2->setTabText(TabWidget2->indexOf(logSignalsTab), QApplication::translate("MainWindow", "Signal log", 0, QApplication::UnicodeUTF8));
        TabWidget2->setTabText(TabWidget2->indexOf(logPropertiesTab), QApplication::translate("MainWindow", "Property log", 0, QApplication::UnicodeUTF8));
        TabWidget2->setTabText(TabWidget2->indexOf(TabPage), QApplication::translate("MainWindow", "Macro Log", 0, QApplication::UnicodeUTF8));
        TabWidget2->setTabText(TabWidget2->indexOf(logDebugTab), QApplication::translate("MainWindow", "Debug log", 0, QApplication::UnicodeUTF8));
        Toolbar_2->setWindowTitle(QApplication::translate("MainWindow", "Toolbar_2", 0, QApplication::UnicodeUTF8));
        FileMenu->setTitle(QApplication::translate("MainWindow", "&File", 0, QApplication::UnicodeUTF8));
        ContainerMenu->setTitle(QApplication::translate("MainWindow", "Con&tainer", 0, QApplication::UnicodeUTF8));
        ControlMenu->setTitle(QApplication::translate("MainWindow", "&Control", 0, QApplication::UnicodeUTF8));
        VerbMenu->setTitle(QApplication::translate("MainWindow", "&Verbs...", 0, QApplication::UnicodeUTF8));
        ScriptMenu->setTitle(QApplication::translate("MainWindow", "&Scripting", 0, QApplication::UnicodeUTF8));
        OptionsMenu->setTitle(QApplication::translate("MainWindow", "&Options", 0, QApplication::UnicodeUTF8));
        LoggingMenu->setTitle(QApplication::translate("MainWindow", "Log...", 0, QApplication::UnicodeUTF8));
    } // retranslateUi


protected:
    enum IconID
    {
        image0_ID,
        image1_ID,
        image2_ID,
        unknown_ID
    };
    static QPixmap qt_get_icon(IconID id)
    {
    /* XPM */
    static const char* const image0_data[] = { 
"22 22 150 2",
"Qt c None",
"aj c #052277",
"#f c #05237b",
"a# c #05237c",
".6 c #05247e",
"at c #05247f",
".P c #052788",
"as c #052789",
"ap c #062a94",
"ar c #062b96",
"aq c #062c9c",
".y c #062d9d",
".d c #0732b2",
".i c #083cc1",
".e c #0944cd",
".h c #0b52e1",
".f c #0c54e5",
".g c #0c59ec",
".Z c #0f3bbc",
"#a c #103ec5",
"ag c #1142d2",
".H c #1143d5",
".r c #144ee3",
"#3 c #185ce9",
"#n c #1961eb",
"#N c #1c6cf1",
"#D c #1e74f4",
"a. c #1f40a2",
"#U c #2043a9",
"#w c #207ef9",
"#9 c #2144ad",
"#J c #2145af",
"#y c #2146b0",
"#r c #2246b1",
"#e c #2246b2",
".5 c #2247b4",
"ai c #244bbe",
"#T c #244bbf",
".O c #254dc3",
"#I c #2650c9",
"#8 c #2750cb",
"#q c #2751cc",
".4 c #2751cd",
".0 c #2853d1",
"#S c #2853d2",
".1 c #2955d6",
"#H c #2955d8",
".3 c #2956d9",
".2 c #2956da",
"#7 c #2a58de",
"#d c #2a58e0",
".N c #2b59e1",
"#R c #2b5ae5",
"#p c #2d5deb",
"#b c #2d5dec",
"#c c #2d5eed",
".I c #2e5ff1",
".J c #2e60f2",
"#G c #2e60f3",
".M c #2e61f5",
".K c #2f61f6",
".L c #2f62f8",
"ah c #3166f8",
"#6 c #3369f9",
".x c #356ef9",
"#Q c #3976f9",
"#o c #3d7ffa",
"#5 c #448efb",
".s c #4692fb",
".w c #4997fc",
"#F c #4998fc",
"#4 c #4a9bfc",
"#x c #4b9cfc",
".t c #4da0fc",
".u c #4da1fd",
".v c #4ea3fd",
"#P c #4fa4fd",
"#O c #57b6fe",
"#E c #5abbfe",
"an c #7d0101",
"am c #7e0101",
"ao c #7f0101",
"al c #830101",
"ak c #8e0202",
"aa c #9c0202",
"af c #a10202",
"ae c #a61b1b",
"#1 c #a71b1b",
"#2 c #a80202",
"#L c #a81b1b",
"#B c #a91b1b",
"ad c #ac1c1c",
"#u c #af1c1c",
"#M c #b00202",
"#A c #b11d1d",
"#C c #b20202",
"#t c #b21d1d",
"ac c #b41d1d",
"ab c #b91e1e",
"#V c #ba0202",
".c c #bc0202",
"#l c #be1f1f",
"#m c #c00202",
"## c #c10202",
"#0 c #c22020",
"#k c #c42020",
"#s c #c52020",
"#v c #c60303",
"#z c #c62020",
".Y c #c70303",
".G c #c80303",
"#Z c #cd2121",
".q c #cf0303",
"#. c #d02222",
"#Y c #d12222",
"#j c #d22222",
".X c #d32222",
".9 c #d42323",
".W c #d52323",
".F c #d63333",
".V c #da2424",
"#i c #db2424",
".U c #dc2424",
".b c #dd0303",
"#X c #dd2424",
".T c #df2424",
".E c #e43636",
".# c #ed0303",
".a c #ed0404",
".S c #ee2727",
"#K c #f52828",
".D c #f63a3a",
"#W c #f82828",
".j c #fa0404",
"#h c #fc2929",
".8 c #fc2b2b",
".p c #fc3c3c",
".R c #fd3535",
".C c #fd3c3c",
".B c #fd3f3f",
"#g c #fe4444",
".7 c #fe4545",
".Q c #fe4a4a",
".A c #fe4d4d",
".o c #fe5858",
".n c #fe6464",
".m c #fe6565",
".z c #ff4f4f",
".l c #ff6c6c",
".k c #ff7474",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQt.#.a.#.#.b.cQt.d.e.f.g.g.g.g.g.h.iQtQtQt",
"Qt.j.k.l.m.n.o.p.qQt.r.s.t.u.v.v.v.w.x.yQtQt",
".#.z.m.A.B.C.D.E.F.GQt.H.I.J.K.L.L.M.N.O.PQt",
".a.Q.R.S.T.U.U.V.W.X.YQt.Z.0.1.2.2.3.4.5.6Qt",
".#.7.8.T.U.U.U.U.V.9#.##Qt#a#b#c#d.3.4#e#fQt",
".##g#h.U.U.U.U.U#i#j#k#l#mQt#n#o#p.3#q#r#fQt",
".##g#h.U.U.U.U#i.W#s#t#u#vQt#w#x.K.3#q#y#fQt",
".##g#h.U.U.U#i.W#z#A#B#CQt#D#E#F#G#H#I#J#fQt",
".b.C#K.U.U#i.W#z#A#L#MQt#N#O#P#Q#R#S#T#U#fQt",
"#V#W#X#Y#.#Z#0#A#1#2Qt#3#4#5#6#7#8#T#9a.a#Qt",
"Qtaa#zabac#tadaeafQtagah#b#Sai#e#J#Ua.ajQtQt",
"QtQtakalamamanaoQtapaqarasata#a#a##fa#QtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt"};


    /* XPM */
    static const char* const image1_data[] = { 
"22 22 87 2",
"Qt c None",
".u c #000000",
".i c #010101",
".S c #020202",
".N c #0b0b0b",
".J c #0c0c0c",
"#t c #141414",
".z c #222222",
".h c #252525",
"#q c #313131",
".n c #343434",
".c c #383838",
".f c #3a3a3a",
"#p c #3c3c3c",
".b c #3d3d3d",
".2 c #3e3e3e",
".P c #3e6ca9",
".W c #3f3f3f",
".Q c #3f6dab",
".g c #404040",
".O c #4171b1",
".e c #444444",
".T c #474747",
".d c #484848",
".E c #497fc7",
".4 c #4b4b4b",
".F c #4d86d2",
".a c #505050",
"#k c #515151",
"#d c #525252",
"#m c #535353",
".G c #5390e2",
"#h c #545454",
"#a c #555555",
".R c #565656",
".H c #5797ed",
"#g c #5e5e5e",
"## c #606060",
".7 c #626262",
"#l c #636363",
".# c #656565",
"#r c #6666ab",
".I c #676767",
"#j c #686868",
"#n c #6868b0",
"#s c #6b6bbc",
"#. c #6e6e6e",
"#i c #6e6ec4",
"#f c #6f6f6f",
"#o c #6f6fc8",
"#b c #7171cd",
".j c #737373",
".t c #75a5e4",
".9 c #797979",
".8 c #7e7e7e",
".Y c #838383",
".s c #88a8d4",
".5 c #8a8a8a",
".r c #8ba5c9",
".X c #8d8d8d",
"#c c #939393",
".3 c #999999",
"#u c #9d9d9d",
".1 c #a5a5a5",
".L c #a93e3e",
".M c #ab3f3f",
".0 c #adadad",
".Z c #b0b0b0",
".K c #b54242",
".6 c #b5b5b5",
".V c #bfbfbf",
".y c #c2c2c2",
"#e c #c3c3c3",
".x c #c4c4c4",
".A c #c74949",
".o c #c98b8b",
".U c #cbcbcb",
".B c #d24d4d",
".m c #d2d2d2",
".p c #d48888",
".w c #dadada",
".l c #dedede",
".C c #e25353",
".q c #e47575",
".k c #e8e8e8",
".v c #eaeaea",
".D c #f25959",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQt.#.a.b.cQt.d.e.f.cQt.d.g.h.iQtQtQtQt",
"QtQtQt.j.k.l.l.m.n.o.o.p.q.n.r.r.s.t.uQtQtQt",
"QtQt.j.v.w.x.x.y.y.z.A.B.C.D.z.E.F.G.H.uQtQt",
"Qt.I.k.w.x.x.x.x.y.y.J.K.L.M.M.N.O.P.Q.Q.uQt",
"Qt.R.l.x.x.x.x.x.x.y.y.i.i.S.S.i.u.u.u.u.uQt",
"Qt.T.l.x.x.x.x.x.x.x.y.U.l.l.l.l.l.l.l.V.uQt",
"Qt.W.l.x.x.x.x.x.x.x.x.x.X.Y.x.x.Z.0.x.1.uQt",
"Qt.2.l.x.x.x.x.x.x.x.x.x.3.4.5.6.7.x.x.1.uQt",
"Qt.2.l.x.8.9#.###a#b.x.x.x#c.4.4.x.x.x.1.uQt",
"Qt.2.l.x.x.x.x.x.x.x.x.x.x#d.4.4#e.x.x.1.uQt",
"Qt.2.l.x.9#f#g#h#h#i.x.x#j.Z.x#k#k.x.x.1.uQt",
"Qt.2.l.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.1.uQt",
"Qt.2.l.x#l#a#h#m#d#n.x.x#h#h#h#o.x.x.x.1.uQt",
"Qt#p.l.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.1.uQt",
"Qt#q.l.x#h#h#m#d#d#r.x.x#m#m#m#s.x.x.x.1.uQt",
"Qt#t.l.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.x.1.uQt",
"Qt.u.V.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1.1#u.uQt",
"QtQt.u.u.u.u.u.u.u.u.u.u.u.u.u.u.u.u.u.uQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt",
"QtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQtQt"};


    /* XPM */
    static const char* const image2_data[] = { 
"22 22 41 1",
". c None",
"h c #000000",
"F c #181818",
"g c #242424",
"A c #3a3a3a",
"f c #3d3d3d",
"e c #484848",
"d c #4a4a4a",
"c c #4c4c4c",
"b c #555555",
"a c #676767",
"# c #797979",
"M c #929292",
"t c #959595",
"J c #a6a6a6",
"E c #b5b5b5",
"s c #b6b6b6",
"z c #bbbbbb",
"x c #bcbcbc",
"w c #bfbfbf",
"L c #c1c1c1",
"I c #c5c5c5",
"K c #cccccc",
"r c #d7d7d7",
"D c #dadada",
"q c #dcdcdc",
"p c #dfdfdf",
"y c #e2e2e2",
"v c #e3e3e3",
"l c #e5e5e5",
"H c #e7e7e7",
"j c #e9e9e9",
"o c #ededed",
"G c #efefef",
"k c #f0f0f0",
"C c #f1f1f1",
"n c #f7f7f7",
"u c #f9f9f9",
"B c #fdfdfd",
"m c #fefefe",
"i c #ffffff",
"......................",
"....#abcddefgh........",
"...#iiiiiiiiihh.......",
"...aiiiiiiiiihjh......",
"...biiiiiiiiihklh.....",
"...ciiiiiiiimhnoph....",
"...diiiiiiiiihhhhhh...",
"...diiiiiiiiiiqrsth...",
"...diiiiiiiiiiiuvwh...",
"...diiiiiiiiiiiuvxh...",
"...diiiiiiiiiiiuvxh...",
"...diiiiiiiiiiiuvxh...",
"...diiiiiiiiiiiuvxh...",
"...diiiiiiiiiiiuvxh...",
"...diiiiiiiiiiiuvxh...",
"...eiiiiiiiiiiiuyzh...",
"...AiiBuuuuuuuuCDEh...",
"...FBGHvvvvvvvyDIJh...",
"...hpKLxxxxxxxzEJMh...",
"....hhhhhhhhhhhhhh....",
"......................",
"......................"};


    switch (id) {
        case image0_ID: return QPixmap((const char**)image0_data);
        case image1_ID: return QPixmap((const char**)image1_data);
        case image2_ID: return QPixmap((const char**)image2_data);
        default: return QPixmap();
    } // switch
    } // icon

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
