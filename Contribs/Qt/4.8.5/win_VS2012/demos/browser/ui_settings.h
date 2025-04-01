/********************************************************************************
** Form generated from reading UI file 'settings.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_SETTINGS_H
#define UI_SETTINGS_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QCheckBox>
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QTabWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_Settings
{
public:
    QGridLayout *gridLayout;
    QDialogButtonBox *buttonBox;
    QTabWidget *tabWidget;
    QWidget *tab;
    QGridLayout *gridLayout_4;
    QLabel *label_3;
    QLineEdit *homeLineEdit;
    QPushButton *setHomeToCurrentPageButton;
    QSpacerItem *horizontalSpacer;
    QLabel *label_4;
    QComboBox *expireHistory;
    QLabel *label_7;
    QLineEdit *downloadsLocation;
    QLabel *label_8;
    QComboBox *openLinksIn;
    QSpacerItem *spacerItem;
    QWidget *tab_3;
    QGridLayout *gridLayout_3;
    QLabel *label_5;
    QLabel *standardLabel;
    QPushButton *standardFontButton;
    QLabel *label_6;
    QLabel *fixedLabel;
    QPushButton *fixedFontButton;
    QSpacerItem *verticalSpacer;
    QWidget *tab_2;
    QVBoxLayout *verticalLayout_3;
    QGroupBox *groupBox;
    QVBoxLayout *verticalLayout_2;
    QCheckBox *enablePlugins;
    QCheckBox *enableJavascript;
    QGroupBox *cookiesGroupBox;
    QGridLayout *gridLayout1;
    QLabel *label_2;
    QComboBox *acceptCombo;
    QPushButton *exceptionsButton;
    QLabel *label;
    QComboBox *keepUntilCombo;
    QPushButton *cookiesButton;
    QSpacerItem *spacerItem1;
    QWidget *tab_4;
    QVBoxLayout *verticalLayout;
    QGroupBox *proxySupport;
    QGridLayout *gridLayout_6;
    QLabel *label_9;
    QComboBox *proxyType;
    QLabel *label_10;
    QLineEdit *proxyHostName;
    QLabel *label_11;
    QSpinBox *proxyPort;
    QSpacerItem *horizontalSpacer_2;
    QLabel *label_12;
    QLineEdit *proxyUserName;
    QLabel *label_13;
    QLineEdit *proxyPassword;
    QSpacerItem *verticalSpacer_2;
    QWidget *tab_5;
    QGridLayout *gridLayout_2;
    QLabel *label_14;
    QLineEdit *userStyleSheet;
    QSpacerItem *verticalSpacer_3;

    void setupUi(QDialog *Settings)
    {
        if (Settings->objectName().isEmpty())
            Settings->setObjectName(QString::fromUtf8("Settings"));
        Settings->resize(657, 322);
        gridLayout = new QGridLayout(Settings);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        buttonBox = new QDialogButtonBox(Settings);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        gridLayout->addWidget(buttonBox, 2, 0, 1, 1);

        tabWidget = new QTabWidget(Settings);
        tabWidget->setObjectName(QString::fromUtf8("tabWidget"));
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        tab->setGeometry(QRect(0, 0, 627, 243));
        gridLayout_4 = new QGridLayout(tab);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        label_3 = new QLabel(tab);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(label_3, 0, 0, 1, 1);

        homeLineEdit = new QLineEdit(tab);
        homeLineEdit->setObjectName(QString::fromUtf8("homeLineEdit"));

        gridLayout_4->addWidget(homeLineEdit, 0, 1, 1, 2);

        setHomeToCurrentPageButton = new QPushButton(tab);
        setHomeToCurrentPageButton->setObjectName(QString::fromUtf8("setHomeToCurrentPageButton"));

        gridLayout_4->addWidget(setHomeToCurrentPageButton, 1, 1, 1, 1);

        horizontalSpacer = new QSpacerItem(280, 18, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_4->addItem(horizontalSpacer, 1, 2, 1, 1);

        label_4 = new QLabel(tab);
        label_4->setObjectName(QString::fromUtf8("label_4"));
        label_4->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(label_4, 2, 0, 1, 1);

        expireHistory = new QComboBox(tab);
        expireHistory->setObjectName(QString::fromUtf8("expireHistory"));

        gridLayout_4->addWidget(expireHistory, 2, 1, 1, 2);

        label_7 = new QLabel(tab);
        label_7->setObjectName(QString::fromUtf8("label_7"));
        label_7->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(label_7, 3, 0, 1, 1);

        downloadsLocation = new QLineEdit(tab);
        downloadsLocation->setObjectName(QString::fromUtf8("downloadsLocation"));

        gridLayout_4->addWidget(downloadsLocation, 3, 1, 1, 2);

        label_8 = new QLabel(tab);
        label_8->setObjectName(QString::fromUtf8("label_8"));
        label_8->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_4->addWidget(label_8, 4, 0, 1, 1);

        openLinksIn = new QComboBox(tab);
        openLinksIn->setObjectName(QString::fromUtf8("openLinksIn"));

        gridLayout_4->addWidget(openLinksIn, 4, 1, 1, 2);

        spacerItem = new QSpacerItem(391, 262, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_4->addItem(spacerItem, 5, 1, 1, 2);

        tabWidget->addTab(tab, QString());
        tab_3 = new QWidget();
        tab_3->setObjectName(QString::fromUtf8("tab_3"));
        tab_3->setGeometry(QRect(0, 0, 627, 243));
        gridLayout_3 = new QGridLayout(tab_3);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        label_5 = new QLabel(tab_3);
        label_5->setObjectName(QString::fromUtf8("label_5"));
        label_5->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_3->addWidget(label_5, 0, 0, 1, 1);

        standardLabel = new QLabel(tab_3);
        standardLabel->setObjectName(QString::fromUtf8("standardLabel"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(standardLabel->sizePolicy().hasHeightForWidth());
        standardLabel->setSizePolicy(sizePolicy);
        standardLabel->setFrameShape(QFrame::StyledPanel);
        standardLabel->setAlignment(Qt::AlignCenter);

        gridLayout_3->addWidget(standardLabel, 0, 1, 1, 1);

        standardFontButton = new QPushButton(tab_3);
        standardFontButton->setObjectName(QString::fromUtf8("standardFontButton"));

        gridLayout_3->addWidget(standardFontButton, 0, 2, 1, 1);

        label_6 = new QLabel(tab_3);
        label_6->setObjectName(QString::fromUtf8("label_6"));
        label_6->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_3->addWidget(label_6, 1, 0, 1, 1);

        fixedLabel = new QLabel(tab_3);
        fixedLabel->setObjectName(QString::fromUtf8("fixedLabel"));
        fixedLabel->setFrameShape(QFrame::StyledPanel);
        fixedLabel->setAlignment(Qt::AlignCenter);

        gridLayout_3->addWidget(fixedLabel, 1, 1, 1, 1);

        fixedFontButton = new QPushButton(tab_3);
        fixedFontButton->setObjectName(QString::fromUtf8("fixedFontButton"));

        gridLayout_3->addWidget(fixedFontButton, 1, 2, 1, 1);

        verticalSpacer = new QSpacerItem(20, 93, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_3->addItem(verticalSpacer, 2, 1, 1, 1);

        tabWidget->addTab(tab_3, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        tab_2->setGeometry(QRect(0, 0, 627, 243));
        verticalLayout_3 = new QVBoxLayout(tab_2);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        groupBox = new QGroupBox(tab_2);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        verticalLayout_2 = new QVBoxLayout(groupBox);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        enablePlugins = new QCheckBox(groupBox);
        enablePlugins->setObjectName(QString::fromUtf8("enablePlugins"));
        enablePlugins->setChecked(true);

        verticalLayout_2->addWidget(enablePlugins);

        enableJavascript = new QCheckBox(groupBox);
        enableJavascript->setObjectName(QString::fromUtf8("enableJavascript"));
        enableJavascript->setChecked(true);

        verticalLayout_2->addWidget(enableJavascript);


        verticalLayout_3->addWidget(groupBox);

        cookiesGroupBox = new QGroupBox(tab_2);
        cookiesGroupBox->setObjectName(QString::fromUtf8("cookiesGroupBox"));
        gridLayout1 = new QGridLayout(cookiesGroupBox);
        gridLayout1->setObjectName(QString::fromUtf8("gridLayout1"));
        label_2 = new QLabel(cookiesGroupBox);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout1->addWidget(label_2, 0, 0, 1, 1);

        acceptCombo = new QComboBox(cookiesGroupBox);
        acceptCombo->setObjectName(QString::fromUtf8("acceptCombo"));

        gridLayout1->addWidget(acceptCombo, 0, 1, 1, 1);

        exceptionsButton = new QPushButton(cookiesGroupBox);
        exceptionsButton->setObjectName(QString::fromUtf8("exceptionsButton"));

        gridLayout1->addWidget(exceptionsButton, 0, 2, 1, 1);

        label = new QLabel(cookiesGroupBox);
        label->setObjectName(QString::fromUtf8("label"));
        label->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout1->addWidget(label, 1, 0, 1, 1);

        keepUntilCombo = new QComboBox(cookiesGroupBox);
        keepUntilCombo->setObjectName(QString::fromUtf8("keepUntilCombo"));

        gridLayout1->addWidget(keepUntilCombo, 1, 1, 1, 1);

        cookiesButton = new QPushButton(cookiesGroupBox);
        cookiesButton->setObjectName(QString::fromUtf8("cookiesButton"));

        gridLayout1->addWidget(cookiesButton, 1, 2, 1, 1);


        verticalLayout_3->addWidget(cookiesGroupBox);

        spacerItem1 = new QSpacerItem(371, 177, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(spacerItem1);

        tabWidget->addTab(tab_2, QString());
        tab_4 = new QWidget();
        tab_4->setObjectName(QString::fromUtf8("tab_4"));
        tab_4->setGeometry(QRect(0, 0, 627, 243));
        verticalLayout = new QVBoxLayout(tab_4);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        proxySupport = new QGroupBox(tab_4);
        proxySupport->setObjectName(QString::fromUtf8("proxySupport"));
        proxySupport->setCheckable(true);
        gridLayout_6 = new QGridLayout(proxySupport);
        gridLayout_6->setObjectName(QString::fromUtf8("gridLayout_6"));
        label_9 = new QLabel(proxySupport);
        label_9->setObjectName(QString::fromUtf8("label_9"));
        label_9->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_6->addWidget(label_9, 0, 0, 1, 1);

        proxyType = new QComboBox(proxySupport);
        proxyType->setObjectName(QString::fromUtf8("proxyType"));

        gridLayout_6->addWidget(proxyType, 0, 1, 1, 2);

        label_10 = new QLabel(proxySupport);
        label_10->setObjectName(QString::fromUtf8("label_10"));
        label_10->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_6->addWidget(label_10, 1, 0, 1, 1);

        proxyHostName = new QLineEdit(proxySupport);
        proxyHostName->setObjectName(QString::fromUtf8("proxyHostName"));

        gridLayout_6->addWidget(proxyHostName, 1, 1, 1, 2);

        label_11 = new QLabel(proxySupport);
        label_11->setObjectName(QString::fromUtf8("label_11"));
        label_11->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_6->addWidget(label_11, 2, 0, 1, 1);

        proxyPort = new QSpinBox(proxySupport);
        proxyPort->setObjectName(QString::fromUtf8("proxyPort"));
        proxyPort->setMaximum(10000);
        proxyPort->setValue(1080);

        gridLayout_6->addWidget(proxyPort, 2, 1, 1, 1);

        horizontalSpacer_2 = new QSpacerItem(293, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        gridLayout_6->addItem(horizontalSpacer_2, 2, 2, 1, 1);

        label_12 = new QLabel(proxySupport);
        label_12->setObjectName(QString::fromUtf8("label_12"));
        label_12->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_6->addWidget(label_12, 3, 0, 1, 1);

        proxyUserName = new QLineEdit(proxySupport);
        proxyUserName->setObjectName(QString::fromUtf8("proxyUserName"));

        gridLayout_6->addWidget(proxyUserName, 3, 1, 1, 2);

        label_13 = new QLabel(proxySupport);
        label_13->setObjectName(QString::fromUtf8("label_13"));
        label_13->setAlignment(Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter);

        gridLayout_6->addWidget(label_13, 4, 0, 1, 1);

        proxyPassword = new QLineEdit(proxySupport);
        proxyPassword->setObjectName(QString::fromUtf8("proxyPassword"));
        proxyPassword->setEchoMode(QLineEdit::Password);

        gridLayout_6->addWidget(proxyPassword, 4, 1, 1, 2);

        verticalSpacer_2 = new QSpacerItem(20, 8, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_6->addItem(verticalSpacer_2, 5, 0, 1, 1);


        verticalLayout->addWidget(proxySupport);

        tabWidget->addTab(tab_4, QString());
        tab_5 = new QWidget();
        tab_5->setObjectName(QString::fromUtf8("tab_5"));
        gridLayout_2 = new QGridLayout(tab_5);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        label_14 = new QLabel(tab_5);
        label_14->setObjectName(QString::fromUtf8("label_14"));

        gridLayout_2->addWidget(label_14, 0, 0, 1, 1);

        userStyleSheet = new QLineEdit(tab_5);
        userStyleSheet->setObjectName(QString::fromUtf8("userStyleSheet"));

        gridLayout_2->addWidget(userStyleSheet, 0, 1, 1, 1);

        verticalSpacer_3 = new QSpacerItem(20, 176, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_2->addItem(verticalSpacer_3, 1, 1, 1, 1);

        tabWidget->addTab(tab_5, QString());

        gridLayout->addWidget(tabWidget, 1, 0, 1, 1);


        retranslateUi(Settings);
        QObject::connect(buttonBox, SIGNAL(accepted()), Settings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), Settings, SLOT(reject()));

        tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(Settings);
    } // setupUi

    void retranslateUi(QDialog *Settings)
    {
        Settings->setWindowTitle(QApplication::translate("Settings", "Settings", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("Settings", "Home:", 0, QApplication::UnicodeUTF8));
        setHomeToCurrentPageButton->setText(QApplication::translate("Settings", "Set to current page", 0, QApplication::UnicodeUTF8));
        label_4->setText(QApplication::translate("Settings", "Remove history items:", 0, QApplication::UnicodeUTF8));
        expireHistory->clear();
        expireHistory->insertItems(0, QStringList()
         << QApplication::translate("Settings", "After one day", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "After one week", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "After two weeks", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "After one month", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "After one year", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "Manually", 0, QApplication::UnicodeUTF8)
        );
        label_7->setText(QApplication::translate("Settings", "Save downloads to:", 0, QApplication::UnicodeUTF8));
        label_8->setText(QApplication::translate("Settings", "Open links from applications:", 0, QApplication::UnicodeUTF8));
        openLinksIn->clear();
        openLinksIn->insertItems(0, QStringList()
         << QApplication::translate("Settings", "In a tab in the current window", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "In a new window", 0, QApplication::UnicodeUTF8)
        );
        tabWidget->setTabText(tabWidget->indexOf(tab), QApplication::translate("Settings", "General", 0, QApplication::UnicodeUTF8));
        label_5->setText(QApplication::translate("Settings", "Standard font:", 0, QApplication::UnicodeUTF8));
        standardLabel->setText(QApplication::translate("Settings", "Times 16", 0, QApplication::UnicodeUTF8));
        standardFontButton->setText(QApplication::translate("Settings", "Select...", 0, QApplication::UnicodeUTF8));
        label_6->setText(QApplication::translate("Settings", "Fixed-width font:", 0, QApplication::UnicodeUTF8));
        fixedLabel->setText(QApplication::translate("Settings", "Courier 13", 0, QApplication::UnicodeUTF8));
        fixedFontButton->setText(QApplication::translate("Settings", "Select...", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_3), QApplication::translate("Settings", "Appearance", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("Settings", "Web Content", 0, QApplication::UnicodeUTF8));
        enablePlugins->setText(QApplication::translate("Settings", "Enable Plugins", 0, QApplication::UnicodeUTF8));
        enableJavascript->setText(QApplication::translate("Settings", "Enable Javascript", 0, QApplication::UnicodeUTF8));
        cookiesGroupBox->setTitle(QApplication::translate("Settings", "Cookies", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("Settings", "Accept Cookies:", 0, QApplication::UnicodeUTF8));
        acceptCombo->clear();
        acceptCombo->insertItems(0, QStringList()
         << QApplication::translate("Settings", "Always", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "Never", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "Only from sites you navigate to", 0, QApplication::UnicodeUTF8)
        );
        exceptionsButton->setText(QApplication::translate("Settings", "Exceptions...", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("Settings", "Keep until:", 0, QApplication::UnicodeUTF8));
        keepUntilCombo->clear();
        keepUntilCombo->insertItems(0, QStringList()
         << QApplication::translate("Settings", "They expire", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "I exit the application", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "At most 90 days", 0, QApplication::UnicodeUTF8)
        );
        cookiesButton->setText(QApplication::translate("Settings", "Cookies...", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_2), QApplication::translate("Settings", "Privacy", 0, QApplication::UnicodeUTF8));
        proxySupport->setTitle(QApplication::translate("Settings", "Enable proxy", 0, QApplication::UnicodeUTF8));
        label_9->setText(QApplication::translate("Settings", "Type:", 0, QApplication::UnicodeUTF8));
        proxyType->clear();
        proxyType->insertItems(0, QStringList()
         << QApplication::translate("Settings", "Socks5", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("Settings", "Http", 0, QApplication::UnicodeUTF8)
        );
        label_10->setText(QApplication::translate("Settings", "Host:", 0, QApplication::UnicodeUTF8));
        label_11->setText(QApplication::translate("Settings", "Port:", 0, QApplication::UnicodeUTF8));
        label_12->setText(QApplication::translate("Settings", "User Name:", 0, QApplication::UnicodeUTF8));
        label_13->setText(QApplication::translate("Settings", "Password:", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_4), QApplication::translate("Settings", "Proxy", 0, QApplication::UnicodeUTF8));
        label_14->setText(QApplication::translate("Settings", "Style Sheet:", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(tab_5), QApplication::translate("Settings", "Advanced", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class Settings: public Ui_Settings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SETTINGS_H
