/********************************************************************************
** Form generated from reading UI file 'preferencesdialog.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_PREFERENCESDIALOG_H
#define UI_PREFERENCESDIALOG_H

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
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QLineEdit>
#include <QtGui/QListWidget>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QStackedWidget>
#include <QtGui/QTabWidget>
#include <QtGui/QTreeWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_PreferencesDialogClass
{
public:
    QVBoxLayout *vboxLayout;
    QTabWidget *tabWidget;
    QWidget *fontsTab;
    QGridLayout *gridLayout;
    QHBoxLayout *hboxLayout;
    QLabel *fontLabel;
    QComboBox *comboBox;
    QStackedWidget *stackedWidget_2;
    QWidget *page_4;
    QWidget *filtersTab;
    QGridLayout *gridLayout1;
    QLabel *label;
    QLabel *label_2;
    QListWidget *filterWidget;
    QTreeWidget *attributeWidget;
    QPushButton *filterAddButton;
    QPushButton *filterRemoveButton;
    QWidget *docsTab;
    QVBoxLayout *vboxLayout1;
    QLabel *label_3;
    QHBoxLayout *hboxLayout1;
    QListWidget *registeredDocsListWidget;
    QVBoxLayout *vboxLayout2;
    QPushButton *docAddButton;
    QPushButton *docRemoveButton;
    QSpacerItem *spacerItem;
    QWidget *optionsTab;
    QVBoxLayout *verticalLayout_3;
    QGroupBox *groupBox_2;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label_5;
    QComboBox *helpStartComboBox;
    QSpacerItem *horizontalSpacer_3;
    QGroupBox *groupBox;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label_4;
    QLineEdit *homePageLineEdit;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *currentPageButton;
    QPushButton *blankPageButton;
    QPushButton *defaultPageButton;
    QGroupBox *groupBox_3;
    QVBoxLayout *verticalLayout_2;
    QCheckBox *showTabs;
    QSpacerItem *verticalSpacer_2;
    QHBoxLayout *hboxLayout2;
    QSpacerItem *spacerItem1;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *PreferencesDialogClass)
    {
        if (PreferencesDialogClass->objectName().isEmpty())
            PreferencesDialogClass->setObjectName(QString::fromUtf8("PreferencesDialogClass"));
        PreferencesDialogClass->resize(375, 275);
        vboxLayout = new QVBoxLayout(PreferencesDialogClass);
        vboxLayout->setSpacing(6);
        vboxLayout->setContentsMargins(11, 11, 11, 11);
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        tabWidget = new QTabWidget(PreferencesDialogClass);
        tabWidget->setObjectName(QString::fromUtf8("tabWidget"));
        fontsTab = new QWidget();
        fontsTab->setObjectName(QString::fromUtf8("fontsTab"));
        gridLayout = new QGridLayout(fontsTab);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        hboxLayout = new QHBoxLayout();
        hboxLayout->setSpacing(6);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        fontLabel = new QLabel(fontsTab);
        fontLabel->setObjectName(QString::fromUtf8("fontLabel"));
        QSizePolicy sizePolicy(QSizePolicy::Maximum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(fontLabel->sizePolicy().hasHeightForWidth());
        fontLabel->setSizePolicy(sizePolicy);

        hboxLayout->addWidget(fontLabel);

        comboBox = new QComboBox(fontsTab);
        comboBox->setObjectName(QString::fromUtf8("comboBox"));

        hboxLayout->addWidget(comboBox);


        gridLayout->addLayout(hboxLayout, 0, 0, 1, 1);

        stackedWidget_2 = new QStackedWidget(fontsTab);
        stackedWidget_2->setObjectName(QString::fromUtf8("stackedWidget_2"));
        page_4 = new QWidget();
        page_4->setObjectName(QString::fromUtf8("page_4"));
        stackedWidget_2->addWidget(page_4);

        gridLayout->addWidget(stackedWidget_2, 1, 0, 1, 1);

        tabWidget->addTab(fontsTab, QString());
        filtersTab = new QWidget();
        filtersTab->setObjectName(QString::fromUtf8("filtersTab"));
        gridLayout1 = new QGridLayout(filtersTab);
        gridLayout1->setSpacing(6);
        gridLayout1->setContentsMargins(11, 11, 11, 11);
        gridLayout1->setObjectName(QString::fromUtf8("gridLayout1"));
        label = new QLabel(filtersTab);
        label->setObjectName(QString::fromUtf8("label"));

        gridLayout1->addWidget(label, 0, 0, 1, 2);

        label_2 = new QLabel(filtersTab);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setFrameShape(QFrame::NoFrame);

        gridLayout1->addWidget(label_2, 0, 2, 1, 1);

        filterWidget = new QListWidget(filtersTab);
        filterWidget->setObjectName(QString::fromUtf8("filterWidget"));

        gridLayout1->addWidget(filterWidget, 1, 0, 1, 2);

        attributeWidget = new QTreeWidget(filtersTab);
        attributeWidget->setObjectName(QString::fromUtf8("attributeWidget"));

        gridLayout1->addWidget(attributeWidget, 1, 2, 2, 1);

        filterAddButton = new QPushButton(filtersTab);
        filterAddButton->setObjectName(QString::fromUtf8("filterAddButton"));

        gridLayout1->addWidget(filterAddButton, 2, 0, 1, 1);

        filterRemoveButton = new QPushButton(filtersTab);
        filterRemoveButton->setObjectName(QString::fromUtf8("filterRemoveButton"));

        gridLayout1->addWidget(filterRemoveButton, 2, 1, 1, 1);

        tabWidget->addTab(filtersTab, QString());
        docsTab = new QWidget();
        docsTab->setObjectName(QString::fromUtf8("docsTab"));
        vboxLayout1 = new QVBoxLayout(docsTab);
        vboxLayout1->setSpacing(6);
        vboxLayout1->setContentsMargins(11, 11, 11, 11);
        vboxLayout1->setObjectName(QString::fromUtf8("vboxLayout1"));
        label_3 = new QLabel(docsTab);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        vboxLayout1->addWidget(label_3);

        hboxLayout1 = new QHBoxLayout();
        hboxLayout1->setSpacing(6);
        hboxLayout1->setContentsMargins(0, 0, 0, 0);
        hboxLayout1->setObjectName(QString::fromUtf8("hboxLayout1"));
        registeredDocsListWidget = new QListWidget(docsTab);
        registeredDocsListWidget->setObjectName(QString::fromUtf8("registeredDocsListWidget"));
        registeredDocsListWidget->setSelectionMode(QAbstractItemView::ExtendedSelection);

        hboxLayout1->addWidget(registeredDocsListWidget);

        vboxLayout2 = new QVBoxLayout();
        vboxLayout2->setSpacing(6);
        vboxLayout2->setContentsMargins(0, 0, 0, 0);
        vboxLayout2->setObjectName(QString::fromUtf8("vboxLayout2"));
        docAddButton = new QPushButton(docsTab);
        docAddButton->setObjectName(QString::fromUtf8("docAddButton"));

        vboxLayout2->addWidget(docAddButton);

        docRemoveButton = new QPushButton(docsTab);
        docRemoveButton->setObjectName(QString::fromUtf8("docRemoveButton"));

        vboxLayout2->addWidget(docRemoveButton);

        spacerItem = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        vboxLayout2->addItem(spacerItem);


        hboxLayout1->addLayout(vboxLayout2);


        vboxLayout1->addLayout(hboxLayout1);

        tabWidget->addTab(docsTab, QString());
        optionsTab = new QWidget();
        optionsTab->setObjectName(QString::fromUtf8("optionsTab"));
        verticalLayout_3 = new QVBoxLayout(optionsTab);
        verticalLayout_3->setSpacing(6);
        verticalLayout_3->setContentsMargins(11, 11, 11, 11);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        groupBox_2 = new QGroupBox(optionsTab);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        horizontalLayout_3 = new QHBoxLayout(groupBox_2);
        horizontalLayout_3->setSpacing(6);
        horizontalLayout_3->setContentsMargins(11, 11, 11, 11);
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        label_5 = new QLabel(groupBox_2);
        label_5->setObjectName(QString::fromUtf8("label_5"));
        QSizePolicy sizePolicy1(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(label_5->sizePolicy().hasHeightForWidth());
        label_5->setSizePolicy(sizePolicy1);

        horizontalLayout_3->addWidget(label_5);

        helpStartComboBox = new QComboBox(groupBox_2);
        helpStartComboBox->setObjectName(QString::fromUtf8("helpStartComboBox"));
        sizePolicy1.setHeightForWidth(helpStartComboBox->sizePolicy().hasHeightForWidth());
        helpStartComboBox->setSizePolicy(sizePolicy1);

        horizontalLayout_3->addWidget(helpStartComboBox);

        horizontalSpacer_3 = new QSpacerItem(54, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_3);


        verticalLayout_3->addWidget(groupBox_2);

        groupBox = new QGroupBox(optionsTab);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        verticalLayout = new QVBoxLayout(groupBox);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(6);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        label_4 = new QLabel(groupBox);
        label_4->setObjectName(QString::fromUtf8("label_4"));

        horizontalLayout_2->addWidget(label_4);

        homePageLineEdit = new QLineEdit(groupBox);
        homePageLineEdit->setObjectName(QString::fromUtf8("homePageLineEdit"));

        horizontalLayout_2->addWidget(homePageLineEdit);


        verticalLayout->addLayout(horizontalLayout_2);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        currentPageButton = new QPushButton(groupBox);
        currentPageButton->setObjectName(QString::fromUtf8("currentPageButton"));

        horizontalLayout->addWidget(currentPageButton);

        blankPageButton = new QPushButton(groupBox);
        blankPageButton->setObjectName(QString::fromUtf8("blankPageButton"));

        horizontalLayout->addWidget(blankPageButton);

        defaultPageButton = new QPushButton(groupBox);
        defaultPageButton->setObjectName(QString::fromUtf8("defaultPageButton"));

        horizontalLayout->addWidget(defaultPageButton);


        verticalLayout->addLayout(horizontalLayout);


        verticalLayout_3->addWidget(groupBox);

        groupBox_3 = new QGroupBox(optionsTab);
        groupBox_3->setObjectName(QString::fromUtf8("groupBox_3"));
        verticalLayout_2 = new QVBoxLayout(groupBox_3);
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        showTabs = new QCheckBox(groupBox_3);
        showTabs->setObjectName(QString::fromUtf8("showTabs"));

        verticalLayout_2->addWidget(showTabs);


        verticalLayout_3->addWidget(groupBox_3);

        verticalSpacer_2 = new QSpacerItem(20, 72, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(verticalSpacer_2);

        tabWidget->addTab(optionsTab, QString());

        vboxLayout->addWidget(tabWidget);

        hboxLayout2 = new QHBoxLayout();
        hboxLayout2->setSpacing(6);
        hboxLayout2->setContentsMargins(0, 0, 0, 0);
        hboxLayout2->setObjectName(QString::fromUtf8("hboxLayout2"));
        spacerItem1 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout2->addItem(spacerItem1);

        buttonBox = new QDialogButtonBox(PreferencesDialogClass);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        hboxLayout2->addWidget(buttonBox);


        vboxLayout->addLayout(hboxLayout2);


        retranslateUi(PreferencesDialogClass);
        QObject::connect(comboBox, SIGNAL(currentIndexChanged(int)), stackedWidget_2, SLOT(setCurrentIndex(int)));

        tabWidget->setCurrentIndex(0);
        stackedWidget_2->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(PreferencesDialogClass);
    } // setupUi

    void retranslateUi(QDialog *PreferencesDialogClass)
    {
        PreferencesDialogClass->setWindowTitle(QApplication::translate("PreferencesDialogClass", "Preferences", 0, QApplication::UnicodeUTF8));
        fontLabel->setText(QApplication::translate("PreferencesDialogClass", "Font settings:", 0, QApplication::UnicodeUTF8));
        comboBox->clear();
        comboBox->insertItems(0, QStringList()
         << QApplication::translate("PreferencesDialogClass", "Browser", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("PreferencesDialogClass", "Application", 0, QApplication::UnicodeUTF8)
        );
        tabWidget->setTabText(tabWidget->indexOf(fontsTab), QApplication::translate("PreferencesDialogClass", "Fonts", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("PreferencesDialogClass", "Filter:", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("PreferencesDialogClass", "Attributes:", 0, QApplication::UnicodeUTF8));
        QTreeWidgetItem *___qtreewidgetitem = attributeWidget->headerItem();
        ___qtreewidgetitem->setText(0, QApplication::translate("PreferencesDialogClass", "1", 0, QApplication::UnicodeUTF8));
        filterAddButton->setText(QApplication::translate("PreferencesDialogClass", "Add", 0, QApplication::UnicodeUTF8));
        filterRemoveButton->setText(QApplication::translate("PreferencesDialogClass", "Remove", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(filtersTab), QApplication::translate("PreferencesDialogClass", "Filters", 0, QApplication::UnicodeUTF8));
        label_3->setText(QApplication::translate("PreferencesDialogClass", "Registered Documentation:", 0, QApplication::UnicodeUTF8));
        docAddButton->setText(QApplication::translate("PreferencesDialogClass", "Add...", 0, QApplication::UnicodeUTF8));
        docRemoveButton->setText(QApplication::translate("PreferencesDialogClass", "Remove", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(docsTab), QApplication::translate("PreferencesDialogClass", "Documentation", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QString());
        label_5->setText(QApplication::translate("PreferencesDialogClass", "On help start:", 0, QApplication::UnicodeUTF8));
        helpStartComboBox->clear();
        helpStartComboBox->insertItems(0, QStringList()
         << QApplication::translate("PreferencesDialogClass", "Show my home page", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("PreferencesDialogClass", "Show a blank page", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("PreferencesDialogClass", "Show my tabs from last session", 0, QApplication::UnicodeUTF8)
        );
        groupBox->setTitle(QString());
        label_4->setText(QApplication::translate("PreferencesDialogClass", "Homepage", 0, QApplication::UnicodeUTF8));
        currentPageButton->setText(QApplication::translate("PreferencesDialogClass", "Current Page", 0, QApplication::UnicodeUTF8));
        blankPageButton->setText(QApplication::translate("PreferencesDialogClass", "Blank Page", 0, QApplication::UnicodeUTF8));
        defaultPageButton->setText(QApplication::translate("PreferencesDialogClass", "Restore to default", 0, QApplication::UnicodeUTF8));
        groupBox_3->setTitle(QApplication::translate("PreferencesDialogClass", "Appearance", 0, QApplication::UnicodeUTF8));
        showTabs->setText(QApplication::translate("PreferencesDialogClass", "Show tabs for each individual page", 0, QApplication::UnicodeUTF8));
        tabWidget->setTabText(tabWidget->indexOf(optionsTab), QApplication::translate("PreferencesDialogClass", "Options", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class PreferencesDialogClass: public Ui_PreferencesDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_PREFERENCESDIALOG_H
