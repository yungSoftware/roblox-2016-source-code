/********************************************************************************
** Form generated from reading UI file 'AddEmulationDevDialog.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ADDEMULATIONDEVDIALOG_H
#define UI_ADDEMULATIONDEVDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QDialog>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_AddEmulationDevDialog
{
public:
    QVBoxLayout *verticalLayout;
    QVBoxLayout *verticalLayout_2;
    QHBoxLayout *horizontalLayout_5;
    QLabel *label_5;
    QLineEdit *lineEditName;
    QGroupBox *groupBox_3;
    QHBoxLayout *horizontalLayout_4;
    QLabel *label_2;
    QSpinBox *spinBoxWidth;
    QLabel *label;
    QSpinBox *spinBoxHeight;
    QGroupBox *groupBox_2;
    QHBoxLayout *horizontalLayout;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label_3;
    QLabel *dpiValue;
    QCheckBox *checkBoxMobile;
    QHBoxLayout *horizontalLayout_2;
    QSpacerItem *horizontalSpacer;
    QPushButton *okButton;
    QPushButton *cancelButton;

    void setupUi(QDialog *AddEmulationDevDialog)
    {
        if (AddEmulationDevDialog->objectName().isEmpty())
            AddEmulationDevDialog->setObjectName(QString::fromUtf8("AddEmulationDevDialog"));
        AddEmulationDevDialog->setWindowModality(Qt::WindowModal);
        AddEmulationDevDialog->resize(266, 172);
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(AddEmulationDevDialog->sizePolicy().hasHeightForWidth());
        AddEmulationDevDialog->setSizePolicy(sizePolicy);
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/images/RobloxStudio.png"), QSize(), QIcon::Normal, QIcon::Off);
        AddEmulationDevDialog->setWindowIcon(icon);
        AddEmulationDevDialog->setSizeGripEnabled(true);
        AddEmulationDevDialog->setModal(true);
        verticalLayout = new QVBoxLayout(AddEmulationDevDialog);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(0);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setSpacing(0);
#ifndef Q_OS_MAC
        horizontalLayout_5->setContentsMargins(0, 0, 0, 0);
#endif
        horizontalLayout_5->setObjectName(QString::fromUtf8("horizontalLayout_5"));
        label_5 = new QLabel(AddEmulationDevDialog);
        label_5->setObjectName(QString::fromUtf8("label_5"));

        horizontalLayout_5->addWidget(label_5);

        lineEditName = new QLineEdit(AddEmulationDevDialog);
        lineEditName->setObjectName(QString::fromUtf8("lineEditName"));

        horizontalLayout_5->addWidget(lineEditName);


        verticalLayout_2->addLayout(horizontalLayout_5);

        groupBox_3 = new QGroupBox(AddEmulationDevDialog);
        groupBox_3->setObjectName(QString::fromUtf8("groupBox_3"));
        groupBox_3->setLayoutDirection(Qt::LeftToRight);
        groupBox_3->setAutoFillBackground(false);
        horizontalLayout_4 = new QHBoxLayout(groupBox_3);
        horizontalLayout_4->setSpacing(0);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        horizontalLayout_4->setContentsMargins(0, 0, 8, 0);
        label_2 = new QLabel(groupBox_3);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Maximum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(label_2->sizePolicy().hasHeightForWidth());
        label_2->setSizePolicy(sizePolicy1);
        label_2->setLayoutDirection(Qt::LeftToRight);
        label_2->setAlignment(Qt::AlignCenter);

        horizontalLayout_4->addWidget(label_2);

        spinBoxWidth = new QSpinBox(groupBox_3);
        spinBoxWidth->setObjectName(QString::fromUtf8("spinBoxWidth"));
        spinBoxWidth->setMinimum(100);
        spinBoxWidth->setMaximum(5000);
        spinBoxWidth->setValue(640);

        horizontalLayout_4->addWidget(spinBoxWidth);

        label = new QLabel(groupBox_3);
        label->setObjectName(QString::fromUtf8("label"));
        QSizePolicy sizePolicy2(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy2);
        label->setLayoutDirection(Qt::LeftToRight);
        label->setAlignment(Qt::AlignCenter);

        horizontalLayout_4->addWidget(label);

        spinBoxHeight = new QSpinBox(groupBox_3);
        spinBoxHeight->setObjectName(QString::fromUtf8("spinBoxHeight"));
        spinBoxHeight->setMinimum(100);
        spinBoxHeight->setMaximum(5000);
        spinBoxHeight->setValue(480);

        horizontalLayout_4->addWidget(spinBoxHeight);


        verticalLayout_2->addWidget(groupBox_3);

        groupBox_2 = new QGroupBox(AddEmulationDevDialog);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        horizontalLayout = new QHBoxLayout(groupBox_2);
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setContentsMargins(5, 0, 0, 0);
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        horizontalLayout_3->setContentsMargins(5, -1, -1, -1);
        label_3 = new QLabel(groupBox_2);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        horizontalLayout_3->addWidget(label_3);

        dpiValue = new QLabel(groupBox_2);
        dpiValue->setObjectName(QString::fromUtf8("dpiValue"));

        horizontalLayout_3->addWidget(dpiValue);


        horizontalLayout->addLayout(horizontalLayout_3);

        checkBoxMobile = new QCheckBox(groupBox_2);
        checkBoxMobile->setObjectName(QString::fromUtf8("checkBoxMobile"));

        horizontalLayout->addWidget(checkBoxMobile);


        verticalLayout_2->addWidget(groupBox_2);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(5);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer);

        okButton = new QPushButton(AddEmulationDevDialog);
        okButton->setObjectName(QString::fromUtf8("okButton"));

        horizontalLayout_2->addWidget(okButton);

        cancelButton = new QPushButton(AddEmulationDevDialog);
        cancelButton->setObjectName(QString::fromUtf8("cancelButton"));

        horizontalLayout_2->addWidget(cancelButton);


        verticalLayout_2->addLayout(horizontalLayout_2);


        verticalLayout->addLayout(verticalLayout_2);


        retranslateUi(AddEmulationDevDialog);

        QMetaObject::connectSlotsByName(AddEmulationDevDialog);
    } // setupUi

    void retranslateUi(QDialog *AddEmulationDevDialog)
    {
        AddEmulationDevDialog->setWindowTitle(QApplication::translate("AddEmulationDevDialog", "Dialog", 0, QApplication::UnicodeUTF8));
        label_5->setText(QApplication::translate("AddEmulationDevDialog", "Name: ", 0, QApplication::UnicodeUTF8));
        lineEditName->setPlaceholderText(QApplication::translate("AddEmulationDevDialog", "Device Name", 0, QApplication::UnicodeUTF8));
        groupBox_3->setTitle(QApplication::translate("AddEmulationDevDialog", "Size", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("AddEmulationDevDialog", "Width: ", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("AddEmulationDevDialog", "Height: ", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("AddEmulationDevDialog", "Other", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("AddEmulationDevDialog", "Resolution:", 0, QApplication::UnicodeUTF8));
        dpiValue->setText(QApplication::translate("AddEmulationDevDialog", "96 DPI", 0, QApplication::UnicodeUTF8));
        checkBoxMobile->setText(QApplication::translate("AddEmulationDevDialog", "Mobile", 0, QApplication::UnicodeUTF8));
        okButton->setText(QApplication::translate("AddEmulationDevDialog", "OK", 0, QApplication::UnicodeUTF8));
        cancelButton->setText(QApplication::translate("AddEmulationDevDialog", "Cancel", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class AddEmulationDevDialog: public Ui_AddEmulationDevDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ADDEMULATIONDEVDIALOG_H
