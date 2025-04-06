/********************************************************************************
** Form generated from reading UI file 'bookmarks.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_BOOKMARKS_H
#define UI_BOOKMARKS_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include "edittreeview.h"
#include "searchlineedit.h"

QT_BEGIN_NAMESPACE

class Ui_BookmarksDialog
{
public:
    QGridLayout *gridLayout;
    QSpacerItem *spacerItem;
    SearchLineEdit *search;
    EditTreeView *tree;
    QHBoxLayout *hboxLayout;
    QPushButton *removeButton;
    QPushButton *addFolderButton;
    QSpacerItem *spacerItem1;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *BookmarksDialog)
    {
        if (BookmarksDialog->objectName().isEmpty())
            BookmarksDialog->setObjectName(QString::fromUtf8("BookmarksDialog"));
        BookmarksDialog->resize(758, 450);
        gridLayout = new QGridLayout(BookmarksDialog);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        spacerItem = new QSpacerItem(252, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout->addItem(spacerItem, 0, 0, 1, 1);

        search = new SearchLineEdit(BookmarksDialog);
        search->setObjectName(QString::fromUtf8("search"));

        gridLayout->addWidget(search, 0, 1, 1, 1);

        tree = new EditTreeView(BookmarksDialog);
        tree->setObjectName(QString::fromUtf8("tree"));

        gridLayout->addWidget(tree, 1, 0, 1, 2);

        hboxLayout = new QHBoxLayout();
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        removeButton = new QPushButton(BookmarksDialog);
        removeButton->setObjectName(QString::fromUtf8("removeButton"));

        hboxLayout->addWidget(removeButton);

        addFolderButton = new QPushButton(BookmarksDialog);
        addFolderButton->setObjectName(QString::fromUtf8("addFolderButton"));

        hboxLayout->addWidget(addFolderButton);

        spacerItem1 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout->addItem(spacerItem1);

        buttonBox = new QDialogButtonBox(BookmarksDialog);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setStandardButtons(QDialogButtonBox::Ok);

        hboxLayout->addWidget(buttonBox);


        gridLayout->addLayout(hboxLayout, 2, 0, 1, 2);


        retranslateUi(BookmarksDialog);
        QObject::connect(buttonBox, SIGNAL(accepted()), BookmarksDialog, SLOT(accept()));

        QMetaObject::connectSlotsByName(BookmarksDialog);
    } // setupUi

    void retranslateUi(QDialog *BookmarksDialog)
    {
        BookmarksDialog->setWindowTitle(QApplication::translate("BookmarksDialog", "Bookmarks", 0, QApplication::UnicodeUTF8));
        removeButton->setText(QApplication::translate("BookmarksDialog", "&Remove", 0, QApplication::UnicodeUTF8));
        addFolderButton->setText(QApplication::translate("BookmarksDialog", "Add Folder", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class BookmarksDialog: public Ui_BookmarksDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BOOKMARKS_H
