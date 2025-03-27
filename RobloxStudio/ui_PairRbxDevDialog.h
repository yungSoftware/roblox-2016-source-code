/********************************************************************************
** Form generated from reading UI file 'PairRbxDevDialog.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_PAIRRBXDEVDIALOG_H
#define UI_PAIRRBXDEVDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QGridLayout>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_PairRbxDevDialog
{
public:
    QVBoxLayout *vboxLayout;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QGridLayout *gridLayout;
    QLabel *statusLabel;
    QLabel *codeLabel;
    QHBoxLayout *horizontalLayout;
    QPushButton *cancelButton;

    void setupUi(QDialog *PairRbxDevDialog)
    {
        if (PairRbxDevDialog->objectName().isEmpty())
            PairRbxDevDialog->setObjectName(QString::fromUtf8("PairRbxDevDialog"));
        PairRbxDevDialog->setWindowModality(Qt::ApplicationModal);
        PairRbxDevDialog->resize(650, 500);
        QSizePolicy sizePolicy(QSizePolicy::Maximum, QSizePolicy::Maximum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(PairRbxDevDialog->sizePolicy().hasHeightForWidth());
        PairRbxDevDialog->setSizePolicy(sizePolicy);
        PairRbxDevDialog->setMinimumSize(QSize(650, 350));
        PairRbxDevDialog->setMaximumSize(QSize(650, 500));
        QIcon icon;
        icon.addFile(QString::fromUtf8("images/RobloxStudio.png"), QSize(), QIcon::Normal, QIcon::Off);
        PairRbxDevDialog->setWindowIcon(icon);
        PairRbxDevDialog->setWindowOpacity(3);
        PairRbxDevDialog->setModal(true);
        vboxLayout = new QVBoxLayout(PairRbxDevDialog);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        vboxLayout->setSizeConstraint(QLayout::SetNoConstraint);
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        label = new QLabel(PairRbxDevDialog);
        label->setObjectName(QString::fromUtf8("label"));
        QFont font;
        font.setFamily(QString::fromUtf8("Helvetica Neue"));
        font.setPointSize(31);
        font.setBold(false);
        font.setWeight(50);
        label->setFont(font);
        label->setScaledContents(false);
        label->setAlignment(Qt::AlignCenter);
        label->setWordWrap(true);

        verticalLayout->addWidget(label);


        vboxLayout->addLayout(verticalLayout);

        gridLayout = new QGridLayout();
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        statusLabel = new QLabel(PairRbxDevDialog);
        statusLabel->setObjectName(QString::fromUtf8("statusLabel"));
        QFont font1;
        font1.setFamily(QString::fromUtf8("Helvetica Neue"));
        font1.setPointSize(15);
        statusLabel->setFont(font1);
        statusLabel->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(statusLabel, 1, 0, 1, 1);

        codeLabel = new QLabel(PairRbxDevDialog);
        codeLabel->setObjectName(QString::fromUtf8("codeLabel"));
        QFont font2;
        font2.setFamily(QString::fromUtf8("Helvetica Neue"));
        font2.setPointSize(40);
        codeLabel->setFont(font2);
        codeLabel->setAlignment(Qt::AlignCenter);

        gridLayout->addWidget(codeLabel, 0, 0, 1, 1);


        vboxLayout->addLayout(gridLayout);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        horizontalLayout->setContentsMargins(100, -1, 100, -1);
        cancelButton = new QPushButton(PairRbxDevDialog);
        cancelButton->setObjectName(QString::fromUtf8("cancelButton"));
        QSizePolicy sizePolicy1(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(cancelButton->sizePolicy().hasHeightForWidth());
        cancelButton->setSizePolicy(sizePolicy1);
        cancelButton->setMinimumSize(QSize(180, 0));
        cancelButton->setSizeIncrement(QSize(0, 0));
        cancelButton->setBaseSize(QSize(0, 0));

        horizontalLayout->addWidget(cancelButton);


        vboxLayout->addLayout(horizontalLayout);


        retranslateUi(PairRbxDevDialog);

        QMetaObject::connectSlotsByName(PairRbxDevDialog);
    } // setupUi

    void retranslateUi(QDialog *PairRbxDevDialog)
    {
        PairRbxDevDialog->setWindowTitle(QApplication::translate("PairRbxDevDialog", "Pair Roblox Developer Device", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("PairRbxDevDialog", "Enter this code on your device's pair screen", 0, QApplication::UnicodeUTF8));
        statusLabel->setText(QApplication::translate("PairRbxDevDialog", "Waiting for device to pair....", 0, QApplication::UnicodeUTF8));
        codeLabel->setText(QApplication::translate("PairRbxDevDialog", "8974", 0, QApplication::UnicodeUTF8));
        cancelButton->setText(QApplication::translate("PairRbxDevDialog", "Done", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class PairRbxDevDialog: public Ui_PairRbxDevDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_PAIRRBXDEVDIALOG_H
