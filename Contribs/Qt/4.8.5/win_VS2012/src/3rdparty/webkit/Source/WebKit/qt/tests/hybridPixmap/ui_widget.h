/********************************************************************************
** Form generated from reading UI file 'widget.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_WIDGET_H
#define UI_WIDGET_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>
#include "widget.h"

QT_BEGIN_NAMESPACE

class Ui_Widget
{
public:
    QVBoxLayout *verticalLayout;
    WebView *webView;
    QHBoxLayout *horizontalLayout;
    QLabel *lbl1;
    QLabel *lbl2;
    QLabel *lbl3;
    QLabel *lbl4;
    QSpacerItem *horizontalSpacer;

    void setupUi(QWidget *Widget)
    {
        if (Widget->objectName().isEmpty())
            Widget->setObjectName(QString::fromUtf8("Widget"));
        Widget->resize(600, 400);
        Widget->setWindowTitle(QString::fromUtf8("Widget"));
        verticalLayout = new QVBoxLayout(Widget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        webView = new WebView(Widget);
        webView->setObjectName(QString::fromUtf8("webView"));
        webView->setProperty("url", QVariant(QUrl(QString::fromUtf8("about:blank"))));

        verticalLayout->addWidget(webView);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        lbl1 = new QLabel(Widget);
        lbl1->setObjectName(QString::fromUtf8("lbl1"));
        lbl1->setText(QString::fromUtf8(""));

        horizontalLayout->addWidget(lbl1);

        lbl2 = new QLabel(Widget);
        lbl2->setObjectName(QString::fromUtf8("lbl2"));
        lbl2->setMinimumSize(QSize(120, 30));
        lbl2->setMaximumSize(QSize(120, 30));
        lbl2->setText(QString::fromUtf8("Image from Qt to HTML"));

        horizontalLayout->addWidget(lbl2);

        lbl3 = new QLabel(Widget);
        lbl3->setObjectName(QString::fromUtf8("lbl3"));
        lbl3->setText(QString::fromUtf8("Pixmap from Qt to HTML"));

        horizontalLayout->addWidget(lbl3);

        lbl4 = new QLabel(Widget);
        lbl4->setObjectName(QString::fromUtf8("lbl4"));
        lbl4->setText(QString::fromUtf8(""));

        horizontalLayout->addWidget(lbl4);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);


        verticalLayout->addLayout(horizontalLayout);


        retranslateUi(Widget);

        QMetaObject::connectSlotsByName(Widget);
    } // setupUi

    void retranslateUi(QWidget *Widget)
    {
        Q_UNUSED(Widget);
    } // retranslateUi

};

namespace Ui {
    class Widget: public Ui_Widget {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_WIDGET_H
