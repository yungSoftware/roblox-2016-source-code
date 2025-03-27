/********************************************************************************
** Form generated from reading UI file 'Roblox Studio 2013 dialog.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ROBLOX_20_STUDIO_20_2013_20_DIALOG_H
#define UI_ROBLOX_20_STUDIO_20_2013_20_DIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QDialogButtonBox *buttonBox;
    QLabel *label;
    QLabel *label_3;
    QLabel *label_2;

    void setupUi(QDialog *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QString::fromUtf8("Dialog"));
        Dialog->setWindowModality(Qt::ApplicationModal);
        Dialog->resize(540, 463);
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(Dialog->sizePolicy().hasHeightForWidth());
        Dialog->setSizePolicy(sizePolicy);
        Dialog->setMinimumSize(QSize(540, 463));
        Dialog->setMaximumSize(QSize(540, 463));
        buttonBox = new QDialogButtonBox(Dialog);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setGeometry(QRect(54, 416, 461, 32));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Close);
        label = new QLabel(Dialog);
        label->setObjectName(QString::fromUtf8("label"));
        label->setGeometry(QRect(20, 10, 81, 71));
        label->setTextFormat(Qt::RichText);
        label->setScaledContents(false);
        label->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop);
        label->setMargin(0);
        label->setIndent(0);
        label->setTextInteractionFlags(Qt::LinksAccessibleByKeyboard|Qt::LinksAccessibleByMouse|Qt::TextBrowserInteraction|Qt::TextSelectableByKeyboard|Qt::TextSelectableByMouse);
        label_3 = new QLabel(Dialog);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setGeometry(QRect(40, 80, 511, 381));
        label_3->setTextInteractionFlags(Qt::LinksAccessibleByKeyboard|Qt::LinksAccessibleByMouse|Qt::TextBrowserInteraction|Qt::TextSelectableByKeyboard|Qt::TextSelectableByMouse);
        label_2 = new QLabel(Dialog);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setGeometry(QRect(105, 21, 421, 51));
        label->raise();
        label_3->raise();
        label_2->raise();
        buttonBox->raise();

        retranslateUi(Dialog);
        QObject::connect(buttonBox, SIGNAL(accepted()), Dialog, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Dialog, SLOT(reject()));

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QDialog *Dialog)
    {
        Dialog->setWindowTitle(QString());
        label->setText(QApplication::translate("Dialog", "<html><head/><body><p><img src=\":/images/RobloxStudio.png\" width=\"70\" height=\"70\" style=\"float: left;\"/></p></body></html>", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("Dialog", "<html><head/><body><p><span style=\" font-family:'arial'; font-size:14px;\">We\342\200\231re proud to present this improved ROBLOX Studio experience! In addition<br/>to large performance improvements and new features, you may notice a <br/>different look and feel to ROBLOX Studio. As always, we welcome your <br/>feedback as we continually strive to provide you with a great product. <br/>Please leave your feedback in our ROBLOX Studio forum. </span></p><p><span style=\" font-family:'arial'; font-size:14px;\">Here are just a few of the recent improvements to ROBLOX Studio: </span></p><p>\n"
"<div style=\"margin-left: 20px;\">\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">80% fewer crashes </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Dockable basic objects panel </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\""
                        ">Interface settings and docks remember how you set them </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Performance improvements for selection and rendering </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Fewer crashes during file saves </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Collision free tool \342\200\223 Rotate, resize, and translate with no collisions </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Script syntax highlighting support for core libraries </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Additional shortcut keys </span><br/>\n"
"<img src=\":/images/checkmark.png\"/>&nbsp;&nbsp;<span style=\" font-family:'arial'; font-size:14px;\">Aut"
                        "o-indentation for scripts </span>\n"
"</div></p><p><br/><span style=\" font-family:'arial'; font-size:14px;\">Sincerely,<br/>The ROBLOX Studio Team </span><br/><br/></p></body></html>", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("Dialog", "<html><head/><body><p><img src=\":/images/ROBLOX-Studio-2013.png\"/></p></body></html>", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ROBLOX_20_STUDIO_20_2013_20_DIALOG_H
