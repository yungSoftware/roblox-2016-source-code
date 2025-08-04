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
** Form generated from reading UI file 'ambientproperties.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_AMBIENTPROPERTIES_H
#define UI_AMBIENTPROPERTIES_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QFrame>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QToolButton>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_AmbientProperties
{
public:
    QVBoxLayout *vboxLayout;
    QGroupBox *boxProperties;
    QGridLayout *gridLayout;
    QLabel *TextLabel1;
    QLabel *TextLabel2;
    QLabel *TextLabel3;
    QLabel *TextLabel4;
    QFrame *foreSample;
    QFrame *backSample;
    QToolButton *buttonBackground;
    QToolButton *buttonForeground;
    QToolButton *buttonFont;
    QFrame *Frame6;
    QHBoxLayout *hboxLayout;
    QLabel *enabledSample;
    QToolButton *buttonEnabled;
    QFrame *fontSample;
    QHBoxLayout *hboxLayout1;
    QLabel *TextLabel6;
    QHBoxLayout *hboxLayout2;
    QSpacerItem *spacerItem;
    QPushButton *buttonClose;

    void setupUi(QDialog *AmbientProperties)
    {
        if (AmbientProperties->objectName().isEmpty())
            AmbientProperties->setObjectName(QString::fromUtf8("AmbientProperties"));
        AmbientProperties->resize(185, 173);
        vboxLayout = new QVBoxLayout(AmbientProperties);
        vboxLayout->setSpacing(6);
        vboxLayout->setContentsMargins(11, 11, 11, 11);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        boxProperties = new QGroupBox(AmbientProperties);
        boxProperties->setObjectName(QString::fromUtf8("boxProperties"));
        gridLayout = new QGridLayout(boxProperties);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        TextLabel1 = new QLabel(boxProperties);
        TextLabel1->setObjectName(QString::fromUtf8("TextLabel1"));

        gridLayout->addWidget(TextLabel1, 0, 0, 1, 1);

        TextLabel2 = new QLabel(boxProperties);
        TextLabel2->setObjectName(QString::fromUtf8("TextLabel2"));

        gridLayout->addWidget(TextLabel2, 1, 0, 1, 1);

        TextLabel3 = new QLabel(boxProperties);
        TextLabel3->setObjectName(QString::fromUtf8("TextLabel3"));

        gridLayout->addWidget(TextLabel3, 2, 0, 1, 1);

        TextLabel4 = new QLabel(boxProperties);
        TextLabel4->setObjectName(QString::fromUtf8("TextLabel4"));

        gridLayout->addWidget(TextLabel4, 3, 0, 1, 1);

        foreSample = new QFrame(boxProperties);
        foreSample->setObjectName(QString::fromUtf8("foreSample"));
        foreSample->setFrameShape(QFrame::StyledPanel);
        foreSample->setFrameShadow(QFrame::Raised);

        gridLayout->addWidget(foreSample, 1, 1, 1, 1);

        backSample = new QFrame(boxProperties);
        backSample->setObjectName(QString::fromUtf8("backSample"));
        backSample->setFrameShape(QFrame::StyledPanel);
        backSample->setFrameShadow(QFrame::Raised);

        gridLayout->addWidget(backSample, 0, 1, 1, 1);

        buttonBackground = new QToolButton(boxProperties);
        buttonBackground->setObjectName(QString::fromUtf8("buttonBackground"));
        QSizePolicy sizePolicy(static_cast<QSizePolicy::Policy>(5), static_cast<QSizePolicy::Policy>(1));
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(buttonBackground->sizePolicy().hasHeightForWidth());
        buttonBackground->setSizePolicy(sizePolicy);

        gridLayout->addWidget(buttonBackground, 0, 2, 1, 1);

        buttonForeground = new QToolButton(boxProperties);
        buttonForeground->setObjectName(QString::fromUtf8("buttonForeground"));
        sizePolicy.setHeightForWidth(buttonForeground->sizePolicy().hasHeightForWidth());
        buttonForeground->setSizePolicy(sizePolicy);

        gridLayout->addWidget(buttonForeground, 1, 2, 1, 1);

        buttonFont = new QToolButton(boxProperties);
        buttonFont->setObjectName(QString::fromUtf8("buttonFont"));
        sizePolicy.setHeightForWidth(buttonFont->sizePolicy().hasHeightForWidth());
        buttonFont->setSizePolicy(sizePolicy);

        gridLayout->addWidget(buttonFont, 2, 2, 1, 1);

        Frame6 = new QFrame(boxProperties);
        Frame6->setObjectName(QString::fromUtf8("Frame6"));
        Frame6->setFrameShape(QFrame::StyledPanel);
        Frame6->setFrameShadow(QFrame::Raised);
        hboxLayout = new QHBoxLayout(Frame6);
        hboxLayout->setSpacing(0);
        hboxLayout->setContentsMargins(0, 0, 0, 0);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        enabledSample = new QLabel(Frame6);
        enabledSample->setObjectName(QString::fromUtf8("enabledSample"));
        enabledSample->setEnabled(true);

        hboxLayout->addWidget(enabledSample);


        gridLayout->addWidget(Frame6, 3, 1, 1, 1);

        buttonEnabled = new QToolButton(boxProperties);
        buttonEnabled->setObjectName(QString::fromUtf8("buttonEnabled"));
        sizePolicy.setHeightForWidth(buttonEnabled->sizePolicy().hasHeightForWidth());
        buttonEnabled->setSizePolicy(sizePolicy);
        buttonEnabled->setCheckable(true);

        gridLayout->addWidget(buttonEnabled, 3, 2, 1, 1);

        fontSample = new QFrame(boxProperties);
        fontSample->setObjectName(QString::fromUtf8("fontSample"));
        fontSample->setFrameShape(QFrame::StyledPanel);
        fontSample->setFrameShadow(QFrame::Raised);
        hboxLayout1 = new QHBoxLayout(fontSample);
        hboxLayout1->setSpacing(6);
        hboxLayout1->setContentsMargins(0, 0, 0, 0);
        hboxLayout1->setObjectName(QString::fromUtf8("hboxLayout1"));
        TextLabel6 = new QLabel(fontSample);
        TextLabel6->setObjectName(QString::fromUtf8("TextLabel6"));

        hboxLayout1->addWidget(TextLabel6);


        gridLayout->addWidget(fontSample, 2, 1, 1, 1);


        vboxLayout->addWidget(boxProperties);

        hboxLayout2 = new QHBoxLayout();
        hboxLayout2->setSpacing(6);
        hboxLayout2->setContentsMargins(0, 0, 0, 0);
        hboxLayout2->setObjectName(QString::fromUtf8("hboxLayout2"));
        spacerItem = new QSpacerItem(1, 1, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout2->addItem(spacerItem);

        buttonClose = new QPushButton(AmbientProperties);
        buttonClose->setObjectName(QString::fromUtf8("buttonClose"));

        hboxLayout2->addWidget(buttonClose);


        vboxLayout->addLayout(hboxLayout2);


        retranslateUi(AmbientProperties);
        QObject::connect(buttonClose, SIGNAL(clicked()), AmbientProperties, SLOT(accept()));

        QMetaObject::connectSlotsByName(AmbientProperties);
    } // setupUi

    void retranslateUi(QDialog *AmbientProperties)
    {
        AmbientProperties->setWindowTitle(QApplication::translate("AmbientProperties", "Change Ambient Properties", 0, QApplication::UnicodeUTF8));
        boxProperties->setTitle(QApplication::translate("AmbientProperties", "&Properties", 0, QApplication::UnicodeUTF8));
        TextLabel1->setText(QApplication::translate("AmbientProperties", "Background:", 0, QApplication::UnicodeUTF8));
        TextLabel2->setText(QApplication::translate("AmbientProperties", "Foreground:", 0, QApplication::UnicodeUTF8));
        TextLabel3->setText(QApplication::translate("AmbientProperties", "Font:", 0, QApplication::UnicodeUTF8));
        TextLabel4->setText(QApplication::translate("AmbientProperties", "Enabled:", 0, QApplication::UnicodeUTF8));
        buttonBackground->setText(QApplication::translate("AmbientProperties", "...", 0, QApplication::UnicodeUTF8));
        buttonForeground->setText(QApplication::translate("AmbientProperties", "...", 0, QApplication::UnicodeUTF8));
        buttonFont->setText(QApplication::translate("AmbientProperties", "...", 0, QApplication::UnicodeUTF8));
        enabledSample->setText(QApplication::translate("AmbientProperties", "<sample>", 0, QApplication::UnicodeUTF8));
        buttonEnabled->setText(QApplication::translate("AmbientProperties", "...", 0, QApplication::UnicodeUTF8));
        TextLabel6->setText(QApplication::translate("AmbientProperties", "<sample>", 0, QApplication::UnicodeUTF8));
        buttonClose->setText(QApplication::translate("AmbientProperties", "C&lose", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class AmbientProperties: public Ui_AmbientProperties {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_AMBIENTPROPERTIES_H
