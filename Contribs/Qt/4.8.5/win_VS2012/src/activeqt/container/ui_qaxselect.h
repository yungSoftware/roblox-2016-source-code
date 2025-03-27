/*
*********************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the ActiveQt framework of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
*********************************************************************
*/

/********************************************************************************
** Form generated from reading UI file 'qaxselect.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_QAXSELECT_H
#define UI_QAXSELECT_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QGridLayout>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QListView>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>
#include "ActiveQt/QAxWidget"

QT_BEGIN_NAMESPACE

class Ui_QAxSelect
{
public:
    QGridLayout *gridLayout;
    QVBoxLayout *vboxLayout;
    QPushButton *buttonOk;
    QPushButton *buttonCancel;
    QSpacerItem *Spacer2;
    QListView *ActiveXList;
    QHBoxLayout *hboxLayout;
    QLabel *TextLabel1;
    QLineEdit *ActiveX;

    void setupUi(QDialog *QAxSelect)
    {
        if (QAxSelect->objectName().isEmpty())
            QAxSelect->setObjectName(QString::fromUtf8("QAxSelect"));
        QAxSelect->resize(439, 326);
        QAxSelect->setSizeGripEnabled(true);
        gridLayout = new QGridLayout(QAxSelect);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        gridLayout->setObjectName(QString::fromUtf8("unnamed"));
        vboxLayout = new QVBoxLayout();
        vboxLayout->setSpacing(6);
        vboxLayout->setContentsMargins(0, 0, 0, 0);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        vboxLayout->setObjectName(QString::fromUtf8("unnamed"));
        buttonOk = new QPushButton(QAxSelect);
        buttonOk->setObjectName(QString::fromUtf8("buttonOk"));
        buttonOk->setAutoDefault(true);
        buttonOk->setDefault(true);

        vboxLayout->addWidget(buttonOk);

        buttonCancel = new QPushButton(QAxSelect);
        buttonCancel->setObjectName(QString::fromUtf8("buttonCancel"));
        buttonCancel->setAutoDefault(true);

        vboxLayout->addWidget(buttonCancel);

        Spacer2 = new QSpacerItem(20, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        vboxLayout->addItem(Spacer2);


        gridLayout->addLayout(vboxLayout, 0, 1, 2, 1);

        ActiveXList = new QListView(QAxSelect);
        ActiveXList->setObjectName(QString::fromUtf8("ActiveXList"));

        gridLayout->addWidget(ActiveXList, 0, 0, 1, 1);

        hboxLayout = new QHBoxLayout();
        hboxLayout->setSpacing(6);
        hboxLayout->setContentsMargins(0, 0, 0, 0);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        hboxLayout->setObjectName(QString::fromUtf8("unnamed"));
        TextLabel1 = new QLabel(QAxSelect);
        TextLabel1->setObjectName(QString::fromUtf8("TextLabel1"));

        hboxLayout->addWidget(TextLabel1);

        ActiveX = new QLineEdit(QAxSelect);
        ActiveX->setObjectName(QString::fromUtf8("ActiveX"));

        hboxLayout->addWidget(ActiveX);


        gridLayout->addLayout(hboxLayout, 1, 0, 1, 1);

#ifndef QT_NO_SHORTCUT
        TextLabel1->setBuddy(ActiveX);
#endif // QT_NO_SHORTCUT

        retranslateUi(QAxSelect);

        QMetaObject::connectSlotsByName(QAxSelect);
    } // setupUi

    void retranslateUi(QDialog *QAxSelect)
    {
        QAxSelect->setWindowTitle(QApplication::translate("QAxSelect", "Select ActiveX Control", 0, QApplication::UnicodeUTF8));
        buttonOk->setText(QApplication::translate("QAxSelect", "OK", 0, QApplication::UnicodeUTF8));
        buttonCancel->setText(QApplication::translate("QAxSelect", "&Cancel", 0, QApplication::UnicodeUTF8));
        TextLabel1->setText(QApplication::translate("QAxSelect", "COM &Object:", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class QAxSelect: public Ui_QAxSelect {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_QAXSELECT_H
