/********************************************************************************
** Form generated from reading UI file 'bookmarkwidget.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_BOOKMARKWIDGET_H
#define UI_BOOKMARKWIDGET_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QStackedWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_BookmarkWidget
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLabel *label;
    QSpacerItem *horizontalSpacer;
    QLineEdit *lineEdit;
    QStackedWidget *stackedWidget;
    QHBoxLayout *horizontalLayout_2;
    QSpacerItem *horizontalSpacer_2;
    QPushButton *add;
    QPushButton *remove;

    void setupUi(QWidget *BookmarkWidget)
    {
        if (BookmarkWidget->objectName().isEmpty())
            BookmarkWidget->setObjectName(QString::fromUtf8("BookmarkWidget"));
        BookmarkWidget->resize(235, 606);
        verticalLayout = new QVBoxLayout(BookmarkWidget);
        verticalLayout->setContentsMargins(4, 4, 4, 4);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        label = new QLabel(BookmarkWidget);
        label->setObjectName(QString::fromUtf8("label"));

        horizontalLayout->addWidget(label);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        verticalLayout->addLayout(horizontalLayout);

        lineEdit = new QLineEdit(BookmarkWidget);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));

        verticalLayout->addWidget(lineEdit);

        stackedWidget = new QStackedWidget(BookmarkWidget);
        stackedWidget->setObjectName(QString::fromUtf8("stackedWidget"));

        verticalLayout->addWidget(stackedWidget);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_2);

        add = new QPushButton(BookmarkWidget);
        add->setObjectName(QString::fromUtf8("add"));

        horizontalLayout_2->addWidget(add);

        remove = new QPushButton(BookmarkWidget);
        remove->setObjectName(QString::fromUtf8("remove"));

        horizontalLayout_2->addWidget(remove);


        verticalLayout->addLayout(horizontalLayout_2);


        retranslateUi(BookmarkWidget);

        QMetaObject::connectSlotsByName(BookmarkWidget);
    } // setupUi

    void retranslateUi(QWidget *BookmarkWidget)
    {
        BookmarkWidget->setWindowTitle(QApplication::translate("BookmarkWidget", "Bookmarks", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("BookmarkWidget", "Filter:", 0, QApplication::UnicodeUTF8));
        add->setText(QApplication::translate("BookmarkWidget", "Add", 0, QApplication::UnicodeUTF8));
        remove->setText(QApplication::translate("BookmarkWidget", "Remove", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class BookmarkWidget: public Ui_BookmarkWidget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BOOKMARKWIDGET_H
