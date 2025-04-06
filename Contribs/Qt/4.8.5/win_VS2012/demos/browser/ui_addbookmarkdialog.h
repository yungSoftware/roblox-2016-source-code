/********************************************************************************
** Form generated from reading UI file 'addbookmarkdialog.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_ADDBOOKMARKDIALOG_H
#define UI_ADDBOOKMARKDIALOG_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_AddBookmarkDialog
{
public:
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QLineEdit *name;
    QComboBox *location;
    QSpacerItem *verticalSpacer;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *AddBookmarkDialog)
    {
        if (AddBookmarkDialog->objectName().isEmpty())
            AddBookmarkDialog->setObjectName(QString::fromUtf8("AddBookmarkDialog"));
        AddBookmarkDialog->resize(240, 168);
        verticalLayout = new QVBoxLayout(AddBookmarkDialog);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        label = new QLabel(AddBookmarkDialog);
        label->setObjectName(QString::fromUtf8("label"));
        label->setTextFormat(Qt::PlainText);
        label->setWordWrap(true);

        verticalLayout->addWidget(label);

        name = new QLineEdit(AddBookmarkDialog);
        name->setObjectName(QString::fromUtf8("name"));

        verticalLayout->addWidget(name);

        location = new QComboBox(AddBookmarkDialog);
        location->setObjectName(QString::fromUtf8("location"));

        verticalLayout->addWidget(location);

        verticalSpacer = new QSpacerItem(20, 2, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);

        buttonBox = new QDialogButtonBox(AddBookmarkDialog);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);
        buttonBox->setCenterButtons(false);

        verticalLayout->addWidget(buttonBox);


        retranslateUi(AddBookmarkDialog);
        QObject::connect(buttonBox, SIGNAL(accepted()), AddBookmarkDialog, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), AddBookmarkDialog, SLOT(reject()));

        QMetaObject::connectSlotsByName(AddBookmarkDialog);
    } // setupUi

    void retranslateUi(QDialog *AddBookmarkDialog)
    {
        AddBookmarkDialog->setWindowTitle(QApplication::translate("AddBookmarkDialog", "Add Bookmark", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("AddBookmarkDialog", "Type a name for the bookmark, and choose where to keep it.", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class AddBookmarkDialog: public Ui_AddBookmarkDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_ADDBOOKMARKDIALOG_H
