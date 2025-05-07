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
** Form generated from reading UI file 'controlinfo.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CONTROLINFO_H
#define UI_CONTROLINFO_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QTreeWidget>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_ControlInfo
{
public:
    QVBoxLayout *vboxLayout;
    QTreeWidget *listInfo;
    QHBoxLayout *hboxLayout;
    QSpacerItem *spacerItem;
    QPushButton *buttonClose;

    void setupUi(QDialog *ControlInfo)
    {
        if (ControlInfo->objectName().isEmpty())
            ControlInfo->setObjectName(QString::fromUtf8("ControlInfo"));
        ControlInfo->resize(600, 480);
        vboxLayout = new QVBoxLayout(ControlInfo);
        vboxLayout->setSpacing(6);
        vboxLayout->setContentsMargins(11, 11, 11, 11);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        listInfo = new QTreeWidget(ControlInfo);
        listInfo->setObjectName(QString::fromUtf8("listInfo"));

        vboxLayout->addWidget(listInfo);

        hboxLayout = new QHBoxLayout();
        hboxLayout->setSpacing(6);
        hboxLayout->setContentsMargins(0, 0, 0, 0);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        spacerItem = new QSpacerItem(1, 1, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout->addItem(spacerItem);

        buttonClose = new QPushButton(ControlInfo);
        buttonClose->setObjectName(QString::fromUtf8("buttonClose"));

        hboxLayout->addWidget(buttonClose);


        vboxLayout->addLayout(hboxLayout);


        retranslateUi(ControlInfo);
        QObject::connect(buttonClose, SIGNAL(clicked()), ControlInfo, SLOT(accept()));

        QMetaObject::connectSlotsByName(ControlInfo);
    } // setupUi

    void retranslateUi(QDialog *ControlInfo)
    {
        ControlInfo->setWindowTitle(QApplication::translate("ControlInfo", "Control Details", 0, QApplication::UnicodeUTF8));
        QTreeWidgetItem *___qtreewidgetitem = listInfo->headerItem();
        ___qtreewidgetitem->setText(1, QApplication::translate("ControlInfo", "Value", 0, QApplication::UnicodeUTF8));
        ___qtreewidgetitem->setText(0, QApplication::translate("ControlInfo", "Item", 0, QApplication::UnicodeUTF8));
        buttonClose->setText(QApplication::translate("ControlInfo", "C&lose", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class ControlInfo: public Ui_ControlInfo {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CONTROLINFO_H
