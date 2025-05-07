/********************************************************************************
** Form generated from reading UI file 'AutoSave.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_AUTOSAVE_H
#define UI_AUTOSAVE_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_AutoSave
{
public:
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QSpacerItem *verticalSpacer;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *openButton;
    QPushButton *ignoreButton;
    QPushButton *deleteButton;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QDialog *AutoSave)
    {
        if (AutoSave->objectName().isEmpty())
            AutoSave->setObjectName(QString::fromUtf8("AutoSave"));
        AutoSave->resize(650, 350);
        AutoSave->setMinimumSize(QSize(650, 350));
        AutoSave->setMaximumSize(QSize(650, 375));
        AutoSave->setWindowOpacity(3);
        AutoSave->setModal(true);
        verticalLayout = new QVBoxLayout(AutoSave);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        label = new QLabel(AutoSave);
        label->setObjectName(QString::fromUtf8("label"));
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy);
        label->setMaximumSize(QSize(600, 350));
        QFont font;
        font.setFamily(QString::fromUtf8("Arial"));
        font.setPointSize(10);
        label->setFont(font);
        label->setWordWrap(true);

        verticalLayout->addWidget(label);

        verticalSpacer = new QSpacerItem(20, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        openButton = new QPushButton(AutoSave);
        openButton->setObjectName(QString::fromUtf8("openButton"));
        openButton->setDefault(true);

        horizontalLayout->addWidget(openButton);

        ignoreButton = new QPushButton(AutoSave);
        ignoreButton->setObjectName(QString::fromUtf8("ignoreButton"));

        horizontalLayout->addWidget(ignoreButton);

        deleteButton = new QPushButton(AutoSave);
        deleteButton->setObjectName(QString::fromUtf8("deleteButton"));

        horizontalLayout->addWidget(deleteButton);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout->addLayout(horizontalLayout);


        retranslateUi(AutoSave);

        QMetaObject::connectSlotsByName(AutoSave);
    } // setupUi

    void retranslateUi(QDialog *AutoSave)
    {
        AutoSave->setWindowTitle(QApplication::translate("AutoSave", "Auto-Save Recovery", 0, QApplication::UnicodeUTF8));
        label->setText(QString());
        openButton->setText(QApplication::translate("AutoSave", "Open", 0, QApplication::UnicodeUTF8));
        ignoreButton->setText(QApplication::translate("AutoSave", "Ignore", 0, QApplication::UnicodeUTF8));
        deleteButton->setText(QApplication::translate("AutoSave", "Delete", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class AutoSave: public Ui_AutoSave {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_AUTOSAVE_H
