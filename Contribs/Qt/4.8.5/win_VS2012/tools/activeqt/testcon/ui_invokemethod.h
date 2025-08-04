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
** Form generated from reading UI file 'invokemethod.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_INVOKEMETHOD_H
#define UI_INVOKEMETHOD_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QToolButton>
#include <QtGui/QTreeWidget>

QT_BEGIN_NAMESPACE

class Ui_InvokeMethod
{
public:
    QGridLayout *gridLayout;
    QGroupBox *boxParameters;
    QGridLayout *gridLayout1;
    QTreeWidget *listParameters;
    QToolButton *buttonSet;
    QLineEdit *editValue;
    QLabel *TextLabel3;
    QGridLayout *gridLayout2;
    QLineEdit *editReturn;
    QComboBox *comboMethods;
    QLabel *labelMethods;
    QSpacerItem *spacerItem;
    QLabel *TextLabel1;
    QPushButton *buttonInvoke;
    QSpacerItem *spacerItem1;
    QSpacerItem *spacerItem2;
    QPushButton *buttonClose;

    void setupUi(QDialog *InvokeMethod)
    {
        if (InvokeMethod->objectName().isEmpty())
            InvokeMethod->setObjectName(QString::fromUtf8("InvokeMethod"));
        InvokeMethod->resize(503, 416);
        gridLayout = new QGridLayout(InvokeMethod);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        boxParameters = new QGroupBox(InvokeMethod);
        boxParameters->setObjectName(QString::fromUtf8("boxParameters"));
        gridLayout1 = new QGridLayout(boxParameters);
        gridLayout1->setSpacing(6);
        gridLayout1->setContentsMargins(11, 11, 11, 11);
        gridLayout1->setObjectName(QString::fromUtf8("gridLayout1"));
        listParameters = new QTreeWidget(boxParameters);
        listParameters->setObjectName(QString::fromUtf8("listParameters"));
        listParameters->setRootIsDecorated(false);

        gridLayout1->addWidget(listParameters, 0, 0, 1, 3);

        buttonSet = new QToolButton(boxParameters);
        buttonSet->setObjectName(QString::fromUtf8("buttonSet"));

        gridLayout1->addWidget(buttonSet, 1, 2, 1, 1);

        editValue = new QLineEdit(boxParameters);
        editValue->setObjectName(QString::fromUtf8("editValue"));

        gridLayout1->addWidget(editValue, 1, 1, 1, 1);

        TextLabel3 = new QLabel(boxParameters);
        TextLabel3->setObjectName(QString::fromUtf8("TextLabel3"));

        gridLayout1->addWidget(TextLabel3, 1, 0, 1, 1);


        gridLayout->addWidget(boxParameters, 1, 0, 1, 2);

        gridLayout2 = new QGridLayout();
        gridLayout2->setSpacing(6);
        gridLayout2->setContentsMargins(0, 0, 0, 0);
        gridLayout2->setObjectName(QString::fromUtf8("gridLayout2"));
        editReturn = new QLineEdit(InvokeMethod);
        editReturn->setObjectName(QString::fromUtf8("editReturn"));
        editReturn->setReadOnly(true);

        gridLayout2->addWidget(editReturn, 1, 1, 1, 1);

        comboMethods = new QComboBox(InvokeMethod);
        comboMethods->setObjectName(QString::fromUtf8("comboMethods"));
        QSizePolicy sizePolicy(static_cast<QSizePolicy::Policy>(7), static_cast<QSizePolicy::Policy>(0));
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(comboMethods->sizePolicy().hasHeightForWidth());
        comboMethods->setSizePolicy(sizePolicy);
        comboMethods->setEditable(true);
        comboMethods->setInsertPolicy(QComboBox::NoInsert);
        comboMethods->setAutoCompletion(true);
        comboMethods->setDuplicatesEnabled(false);

        gridLayout2->addWidget(comboMethods, 0, 1, 1, 1);

        labelMethods = new QLabel(InvokeMethod);
        labelMethods->setObjectName(QString::fromUtf8("labelMethods"));

        gridLayout2->addWidget(labelMethods, 0, 0, 1, 1);

        spacerItem = new QSpacerItem(20, 20, QSizePolicy::Preferred, QSizePolicy::Minimum);

        gridLayout2->addItem(spacerItem, 0, 2, 1, 1);

        TextLabel1 = new QLabel(InvokeMethod);
        TextLabel1->setObjectName(QString::fromUtf8("TextLabel1"));

        gridLayout2->addWidget(TextLabel1, 1, 0, 1, 1);

        buttonInvoke = new QPushButton(InvokeMethod);
        buttonInvoke->setObjectName(QString::fromUtf8("buttonInvoke"));
        buttonInvoke->setDefault(true);

        gridLayout2->addWidget(buttonInvoke, 0, 3, 1, 1);

        spacerItem1 = new QSpacerItem(111, 21, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout2->addItem(spacerItem1, 1, 2, 1, 2);


        gridLayout->addLayout(gridLayout2, 0, 0, 1, 2);

        spacerItem2 = new QSpacerItem(361, 21, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(spacerItem2, 2, 0, 1, 1);

        buttonClose = new QPushButton(InvokeMethod);
        buttonClose->setObjectName(QString::fromUtf8("buttonClose"));
        buttonClose->setAutoDefault(false);

        gridLayout->addWidget(buttonClose, 2, 1, 1, 1);

#ifndef QT_NO_SHORTCUT
        TextLabel3->setBuddy(editValue);
        labelMethods->setBuddy(comboMethods);
#endif // QT_NO_SHORTCUT

        retranslateUi(InvokeMethod);
        QObject::connect(buttonClose, SIGNAL(clicked()), InvokeMethod, SLOT(accept()));

        QMetaObject::connectSlotsByName(InvokeMethod);
    } // setupUi

    void retranslateUi(QDialog *InvokeMethod)
    {
        InvokeMethod->setWindowTitle(QApplication::translate("InvokeMethod", "Invoke Methods", 0, QApplication::UnicodeUTF8));
        boxParameters->setTitle(QApplication::translate("InvokeMethod", "&Parameter List", 0, QApplication::UnicodeUTF8));
        QTreeWidgetItem *___qtreewidgetitem = listParameters->headerItem();
        ___qtreewidgetitem->setText(2, QApplication::translate("InvokeMethod", "Value", 0, QApplication::UnicodeUTF8));
        ___qtreewidgetitem->setText(1, QApplication::translate("InvokeMethod", "Type", 0, QApplication::UnicodeUTF8));
        ___qtreewidgetitem->setText(0, QApplication::translate("InvokeMethod", "Parameter", 0, QApplication::UnicodeUTF8));
        buttonSet->setText(QApplication::translate("InvokeMethod", "&Set", 0, QApplication::UnicodeUTF8));
        TextLabel3->setText(QApplication::translate("InvokeMethod", "Parameter &Value:", 0, QApplication::UnicodeUTF8));
        labelMethods->setText(QApplication::translate("InvokeMethod", "&Method Name:", 0, QApplication::UnicodeUTF8));
        TextLabel1->setText(QApplication::translate("InvokeMethod", "Returned Value:", 0, QApplication::UnicodeUTF8));
        buttonInvoke->setText(QApplication::translate("InvokeMethod", "&Invoke", 0, QApplication::UnicodeUTF8));
        buttonClose->setText(QApplication::translate("InvokeMethod", "C&lose", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class InvokeMethod: public Ui_InvokeMethod {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_INVOKEMETHOD_H
