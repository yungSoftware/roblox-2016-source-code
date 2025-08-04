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
** Form generated from reading UI file 'changeproperties.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_CHANGEPROPERTIES_H
#define UI_CHANGEPROPERTIES_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QTabWidget>
#include <QtGui/QToolButton>
#include <QtGui/QTreeWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_ChangeProperties
{
public:
    QVBoxLayout *vboxLayout;
    QTabWidget *tabWidget;
    QWidget *propertiesTab;
    QVBoxLayout *vboxLayout1;
    QTreeWidget *listProperties;
    QHBoxLayout *hboxLayout;
    QLabel *valueLabel;
    QLineEdit *editValue;
    QToolButton *buttonSet;
    QWidget *requestTab;
    QVBoxLayout *vboxLayout2;
    QTreeWidget *listEditRequests;
    QHBoxLayout *hboxLayout1;
    QSpacerItem *spacerItem;
    QPushButton *buttonClose;

    void setupUi(QDialog *ChangeProperties)
    {
        if (ChangeProperties->objectName().isEmpty())
            ChangeProperties->setObjectName(QString::fromUtf8("ChangeProperties"));
        ChangeProperties->resize(728, 584);
        vboxLayout = new QVBoxLayout(ChangeProperties);
        vboxLayout->setSpacing(6);
        vboxLayout->setContentsMargins(11, 11, 11, 11);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        tabWidget = new QTabWidget(ChangeProperties);
        tabWidget->setObjectName(QString::fromUtf8("tabWidget"));
        propertiesTab = new QWidget();
        propertiesTab->setObjectName(QString::fromUtf8("propertiesTab"));
        vboxLayout1 = new QVBoxLayout(propertiesTab);
        vboxLayout1->setSpacing(6);
        vboxLayout1->setContentsMargins(11, 11, 11, 11);
        vboxLayout1->setObjectName(QString::fromUtf8("vboxLayout1"));
        listProperties = new QTreeWidget(propertiesTab);
        listProperties->setObjectName(QString::fromUtf8("listProperties"));
        listProperties->setRootIsDecorated(false);

        vboxLayout1->addWidget(listProperties);

        hboxLayout = new QHBoxLayout();
        hboxLayout->setSpacing(6);
        hboxLayout->setContentsMargins(0, 0, 0, 0);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        valueLabel = new QLabel(propertiesTab);
        valueLabel->setObjectName(QString::fromUtf8("valueLabel"));

        hboxLayout->addWidget(valueLabel);

        editValue = new QLineEdit(propertiesTab);
        editValue->setObjectName(QString::fromUtf8("editValue"));

        hboxLayout->addWidget(editValue);

        buttonSet = new QToolButton(propertiesTab);
        buttonSet->setObjectName(QString::fromUtf8("buttonSet"));

        hboxLayout->addWidget(buttonSet);


        vboxLayout1->addLayout(hboxLayout);

        tabWidget->addTab(propertiesTab, QString());
        requestTab = new QWidget();
        requestTab->setObjectName(QString::fromUtf8("requestTab"));
        vboxLayout2 = new QVBoxLayout(requestTab);
        vboxLayout2->setSpacing(6);
        vboxLayout2->setContentsMargins(11, 11, 11, 11);
        vboxLayout2->setObjectName(QString::fromUtf8("vboxLayout2"));
        listEditRequests = new QTreeWidget(requestTab);
        listEditRequests->setObjectName(QString::fromUtf8("listEditRequests"));

        vboxLayout2->addWidget(listEditRequests);

        tabWidget->addTab(requestTab, QString());

        vboxLayout->addWidget(tabWidget);

        hboxLayout1 = new QHBoxLayout();
        hboxLayout1->setSpacing(6);
        hboxLayout1->setContentsMargins(0, 0, 0, 0);
        hboxLayout1->setObjectName(QString::fromUtf8("hboxLayout1"));
        spacerItem = new QSpacerItem(1, 1, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout1->addItem(spacerItem);

        buttonClose = new QPushButton(ChangeProperties);
        buttonClose->setObjectName(QString::fromUtf8("buttonClose"));

        hboxLayout1->addWidget(buttonClose);


        vboxLayout->addLayout(hboxLayout1);

#ifndef QT_NO_SHORTCUT
        valueLabel->setBuddy(editValue);
#endif // QT_NO_SHORTCUT

        retranslateUi(ChangeProperties);
        QObject::connect(buttonClose, SIGNAL(clicked()), ChangeProperties, SLOT(accept()));

        QMetaObject::connectSlotsByName(ChangeProperties);
    } // setupUi

    void retranslateUi(QDialog *ChangeProperties)
    {
        ChangeProperties->setWindowTitle(QApplication::translate("ChangeProperties", "Change Control Properties", 0, QApplication::UnicodeUTF8));
        QTreeWidgetItem *___qtreewidgetitem = listProperties->headerItem();
        ___qtreewidgetitem->setText(2, QApplication::translate("ChangeProperties", "Value", 0, QApplication::UnicodeUTF8));
        ___qtreewidgetitem->setText(1, QApplication::translate("ChangeProperties", "Type", 0, QApplication::UnicodeUTF8));
        ___qtreewidgetitem->setText(0, QApplication::translate("ChangeProperties", "Property", 0, QApplication::UnicodeUTF8));
        valueLabel->setText(QApplication::translate("ChangeProperties", "Property &Value:", 0, QApplication::UnicodeUTF8));
        buttonSet->setText(QApplication::translate("ChangeProperties", "&Set", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(propertiesTab), QApplication::translate("ChangeProperties", "&Properties", 0, QApplication::UnicodeUTF8));
        QTreeWidgetItem *___qtreewidgetitem1 = listEditRequests->headerItem();
        ___qtreewidgetitem1->setText(0, QApplication::translate("ChangeProperties", "Property", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(requestTab), QApplication::translate("ChangeProperties", "Property Edit &Requests", 0, QApplication::UnicodeUTF8));
        buttonClose->setText(QApplication::translate("ChangeProperties", "C&lose", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class ChangeProperties: public Ui_ChangeProperties {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_CHANGEPROPERTIES_H
