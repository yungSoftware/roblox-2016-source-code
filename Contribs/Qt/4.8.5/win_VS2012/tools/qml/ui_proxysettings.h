/********************************************************************************
** Form generated from reading UI file 'proxysettings.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_PROXYSETTINGS_H
#define UI_PROXYSETTINGS_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>

QT_BEGIN_NAMESPACE

class Ui_ProxySettings
{
public:
    QGridLayout *gridLayout;
    QCheckBox *proxyCheckBox;
    QLabel *serverAddressLabel;
    QLineEdit *proxyServerEdit;
    QLabel *label;
    QLineEdit *proxyPortEdit;
    QLabel *usernameLabel;
    QLineEdit *usernameEdit;
    QLabel *passwordLabel;
    QLineEdit *passwordEdit;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *ProxySettings)
    {
        if (ProxySettings->objectName().isEmpty())
            ProxySettings->setObjectName(QString::fromUtf8("ProxySettings"));
        ProxySettings->resize(318, 199);
        gridLayout = new QGridLayout(ProxySettings);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        proxyCheckBox = new QCheckBox(ProxySettings);
        proxyCheckBox->setObjectName(QString::fromUtf8("proxyCheckBox"));

        gridLayout->addWidget(proxyCheckBox, 0, 0, 1, 2);

        serverAddressLabel = new QLabel(ProxySettings);
        serverAddressLabel->setObjectName(QString::fromUtf8("serverAddressLabel"));

        gridLayout->addWidget(serverAddressLabel, 1, 0, 1, 1);

        proxyServerEdit = new QLineEdit(ProxySettings);
        proxyServerEdit->setObjectName(QString::fromUtf8("proxyServerEdit"));

        gridLayout->addWidget(proxyServerEdit, 1, 1, 1, 1);

        label = new QLabel(ProxySettings);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout->addWidget(label, 2, 0, 1, 1);

        proxyPortEdit = new QLineEdit(ProxySettings);
        proxyPortEdit->setObjectName(QString::fromUtf8("proxyPortEdit"));

        gridLayout->addWidget(proxyPortEdit, 2, 1, 1, 1);

        usernameLabel = new QLabel(ProxySettings);
        usernameLabel->setObjectName(QString::fromUtf8("usernameLabel"));

        gridLayout->addWidget(usernameLabel, 3, 0, 1, 1);

        usernameEdit = new QLineEdit(ProxySettings);
        usernameEdit->setObjectName(QString::fromUtf8("usernameEdit"));

        gridLayout->addWidget(usernameEdit, 3, 1, 1, 1);

        passwordLabel = new QLabel(ProxySettings);
        passwordLabel->setObjectName(QString::fromUtf8("passwordLabel"));

        gridLayout->addWidget(passwordLabel, 4, 0, 1, 1);

        passwordEdit = new QLineEdit(ProxySettings);
        passwordEdit->setObjectName(QString::fromUtf8("passwordEdit"));
        passwordEdit->setEchoMode(QLineEdit::Password);

        gridLayout->addWidget(passwordEdit, 4, 1, 1, 1);

        buttonBox = new QDialogButtonBox(ProxySettings);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        gridLayout->addWidget(buttonBox, 5, 0, 1, 2);


        retranslateUi(ProxySettings);
        QObject::connect(buttonBox, SIGNAL(accepted()), ProxySettings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), ProxySettings, SLOT(reject()));

        QMetaObject::connectSlotsByName(ProxySettings);
    } // setupUi

    void retranslateUi(QDialog *ProxySettings)
    {
        ProxySettings->setWindowTitle(QApplication::translate("ProxySettings", "Dialog", 0, QApplication::UnicodeUTF8));
        proxyCheckBox->setText(QApplication::translate("ProxySettings", "Use http proxy", 0, QApplication::UnicodeUTF8));
        serverAddressLabel->setText(QApplication::translate("ProxySettings", "Server Address:", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("ProxySettings", "Port:", 0, QApplication::UnicodeUTF8));
        usernameLabel->setText(QApplication::translate("ProxySettings", "Username:", 0, QApplication::UnicodeUTF8));
        passwordLabel->setText(QApplication::translate("ProxySettings", "Password:", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class ProxySettings: public Ui_ProxySettings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_PROXYSETTINGS_H
