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
#include <QtGui/QComboBox>
#include <QtGui/QDialog>
#include <QtGui/QDialogButtonBox>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QSlider>
#include <QtGui/QSpacerItem>
#include <QtGui/QToolButton>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_settings
{
public:
    QVBoxLayout *verticalLayout_2;
    QGroupBox *groupBox;
    QGridLayout *gridLayout;
    QComboBox *scalemodeCombo;
    QLabel *label_9;
    QSlider *contrastSlider;
    QLabel *label_8;
    QSlider *brightnessSlider;
    QLabel *label_7;
    QSlider *saturationSlider;
    QLabel *label_2;
    QSlider *hueSlider;
    QLabel *label_10;
    QComboBox *aspectCombo;
    QLabel *label_11;
    QGroupBox *groupBox_2;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *hboxLayout;
    QLabel *label;
    QComboBox *deviceCombo;
    QHBoxLayout *horizontalLayout;
    QLabel *label_6;
    QComboBox *audioEffectsCombo;
    QToolButton *effectButton;
    QHBoxLayout *hboxLayout1;
    QLabel *crossFadeLabel;
    QVBoxLayout *vboxLayout;
    QSlider *crossFadeSlider;
    QHBoxLayout *hboxLayout2;
    QLabel *crossFadeLabel1;
    QSpacerItem *spacerItem;
    QLabel *crossFadeLabel2;
    QSpacerItem *spacerItem1;
    QLabel *crossFadeLabel3;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *settings)
    {
        if (settings->objectName().isEmpty())
            settings->setObjectName(QString::fromUtf8("settings"));
        settings->resize(175, 397);
        verticalLayout_2 = new QVBoxLayout(settings);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        groupBox = new QGroupBox(settings);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        groupBox->setFlat(true);
        gridLayout = new QGridLayout(groupBox);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        scalemodeCombo = new QComboBox(groupBox);
        scalemodeCombo->setObjectName(QString::fromUtf8("scalemodeCombo"));
        scalemodeCombo->setSizeAdjustPolicy(QComboBox::AdjustToContentsOnFirstShow);

        gridLayout->addWidget(scalemodeCombo, 5, 2, 1, 1);

        label_9 = new QLabel(groupBox);
        label_9->setObjectName(QString::fromUtf8("label_9"));

        gridLayout->addWidget(label_9, 0, 0, 1, 1);

        contrastSlider = new QSlider(groupBox);
        contrastSlider->setObjectName(QString::fromUtf8("contrastSlider"));
        contrastSlider->setMinimumSize(QSize(0, 0));
        contrastSlider->setMinimum(-8);
        contrastSlider->setMaximum(8);
        contrastSlider->setOrientation(Qt::Horizontal);
        contrastSlider->setTickPosition(QSlider::TicksBelow);
        contrastSlider->setTickInterval(4);

        gridLayout->addWidget(contrastSlider, 0, 1, 1, 2);

        label_8 = new QLabel(groupBox);
        label_8->setObjectName(QString::fromUtf8("label_8"));

        gridLayout->addWidget(label_8, 1, 0, 1, 1);

        brightnessSlider = new QSlider(groupBox);
        brightnessSlider->setObjectName(QString::fromUtf8("brightnessSlider"));
        brightnessSlider->setMinimum(-8);
        brightnessSlider->setMaximum(8);
        brightnessSlider->setOrientation(Qt::Horizontal);
        brightnessSlider->setTickPosition(QSlider::TicksBelow);
        brightnessSlider->setTickInterval(4);

        gridLayout->addWidget(brightnessSlider, 1, 1, 1, 2);

        label_7 = new QLabel(groupBox);
        label_7->setObjectName(QString::fromUtf8("label_7"));

        gridLayout->addWidget(label_7, 2, 0, 1, 1);

        saturationSlider = new QSlider(groupBox);
        saturationSlider->setObjectName(QString::fromUtf8("saturationSlider"));
        saturationSlider->setMinimum(-8);
        saturationSlider->setMaximum(8);
        saturationSlider->setOrientation(Qt::Horizontal);
        saturationSlider->setTickPosition(QSlider::TicksBelow);
        saturationSlider->setTickInterval(4);

        gridLayout->addWidget(saturationSlider, 2, 1, 1, 2);

        label_2 = new QLabel(groupBox);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        gridLayout->addWidget(label_2, 3, 0, 1, 1);

        hueSlider = new QSlider(groupBox);
        hueSlider->setObjectName(QString::fromUtf8("hueSlider"));
        hueSlider->setMinimum(-8);
        hueSlider->setMaximum(8);
        hueSlider->setOrientation(Qt::Horizontal);
        hueSlider->setTickPosition(QSlider::TicksBelow);
        hueSlider->setTickInterval(4);

        gridLayout->addWidget(hueSlider, 3, 1, 1, 2);

        label_10 = new QLabel(groupBox);
        label_10->setObjectName(QString::fromUtf8("label_10"));

        gridLayout->addWidget(label_10, 4, 0, 1, 2);

        aspectCombo = new QComboBox(groupBox);
        aspectCombo->setObjectName(QString::fromUtf8("aspectCombo"));
        aspectCombo->setSizeAdjustPolicy(QComboBox::AdjustToContentsOnFirstShow);

        gridLayout->addWidget(aspectCombo, 4, 2, 1, 1);

        label_11 = new QLabel(groupBox);
        label_11->setObjectName(QString::fromUtf8("label_11"));

        gridLayout->addWidget(label_11, 5, 0, 1, 2);

        scalemodeCombo->raise();
        label_9->raise();
        contrastSlider->raise();
        label_8->raise();
        brightnessSlider->raise();
        label_7->raise();
        saturationSlider->raise();
        label_2->raise();
        hueSlider->raise();
        label_10->raise();
        aspectCombo->raise();
        label_11->raise();

        verticalLayout_2->addWidget(groupBox);

        groupBox_2 = new QGroupBox(settings);
        groupBox_2->setObjectName(QString::fromUtf8("groupBox_2"));
        groupBox_2->setFlat(true);
        verticalLayout = new QVBoxLayout(groupBox_2);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        hboxLayout = new QHBoxLayout();
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        label = new QLabel(groupBox_2);
        label->setObjectName(QString::fromUtf8("label"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy);
        label->setMinimumSize(QSize(10, 0));
        label->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop);

        hboxLayout->addWidget(label);

        deviceCombo = new QComboBox(groupBox_2);
        deviceCombo->setObjectName(QString::fromUtf8("deviceCombo"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(deviceCombo->sizePolicy().hasHeightForWidth());
        deviceCombo->setSizePolicy(sizePolicy1);
        deviceCombo->setMinimumSize(QSize(10, 0));
        deviceCombo->setSizeAdjustPolicy(QComboBox::AdjustToMinimumContentsLength);

        hboxLayout->addWidget(deviceCombo);


        verticalLayout->addLayout(hboxLayout);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        label_6 = new QLabel(groupBox_2);
        label_6->setObjectName(QString::fromUtf8("label_6"));
        sizePolicy.setHeightForWidth(label_6->sizePolicy().hasHeightForWidth());
        label_6->setSizePolicy(sizePolicy);
        label_6->setMinimumSize(QSize(10, 0));
        label_6->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop);

        horizontalLayout->addWidget(label_6);

        audioEffectsCombo = new QComboBox(groupBox_2);
        audioEffectsCombo->setObjectName(QString::fromUtf8("audioEffectsCombo"));
        sizePolicy1.setHeightForWidth(audioEffectsCombo->sizePolicy().hasHeightForWidth());
        audioEffectsCombo->setSizePolicy(sizePolicy1);
        audioEffectsCombo->setMinimumSize(QSize(10, 0));
        audioEffectsCombo->setSizeAdjustPolicy(QComboBox::AdjustToMinimumContentsLength);

        horizontalLayout->addWidget(audioEffectsCombo);

        effectButton = new QToolButton(groupBox_2);
        effectButton->setObjectName(QString::fromUtf8("effectButton"));
        effectButton->setEnabled(false);

        horizontalLayout->addWidget(effectButton);


        verticalLayout->addLayout(horizontalLayout);

        hboxLayout1 = new QHBoxLayout();
        hboxLayout1->setObjectName(QString::fromUtf8("hboxLayout1"));
        crossFadeLabel = new QLabel(groupBox_2);
        crossFadeLabel->setObjectName(QString::fromUtf8("crossFadeLabel"));
        sizePolicy.setHeightForWidth(crossFadeLabel->sizePolicy().hasHeightForWidth());
        crossFadeLabel->setSizePolicy(sizePolicy);
        crossFadeLabel->setMinimumSize(QSize(10, 0));
        crossFadeLabel->setAlignment(Qt::AlignLeading|Qt::AlignLeft|Qt::AlignTop);

        hboxLayout1->addWidget(crossFadeLabel);

        vboxLayout = new QVBoxLayout();
        vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
        crossFadeSlider = new QSlider(groupBox_2);
        crossFadeSlider->setObjectName(QString::fromUtf8("crossFadeSlider"));
        sizePolicy1.setHeightForWidth(crossFadeSlider->sizePolicy().hasHeightForWidth());
        crossFadeSlider->setSizePolicy(sizePolicy1);
        crossFadeSlider->setMinimum(-20);
        crossFadeSlider->setMaximum(20);
        crossFadeSlider->setSingleStep(1);
        crossFadeSlider->setPageStep(2);
        crossFadeSlider->setValue(0);
        crossFadeSlider->setOrientation(Qt::Horizontal);
        crossFadeSlider->setTickPosition(QSlider::TicksBelow);

        vboxLayout->addWidget(crossFadeSlider);

        hboxLayout2 = new QHBoxLayout();
        hboxLayout2->setObjectName(QString::fromUtf8("hboxLayout2"));
        crossFadeLabel1 = new QLabel(groupBox_2);
        crossFadeLabel1->setObjectName(QString::fromUtf8("crossFadeLabel1"));
        QFont font;
        font.setPointSize(9);
        crossFadeLabel1->setFont(font);

        hboxLayout2->addWidget(crossFadeLabel1);

        spacerItem = new QSpacerItem(0, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout2->addItem(spacerItem);

        crossFadeLabel2 = new QLabel(groupBox_2);
        crossFadeLabel2->setObjectName(QString::fromUtf8("crossFadeLabel2"));
        crossFadeLabel2->setFont(font);

        hboxLayout2->addWidget(crossFadeLabel2);

        spacerItem1 = new QSpacerItem(0, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        hboxLayout2->addItem(spacerItem1);

        crossFadeLabel3 = new QLabel(groupBox_2);
        crossFadeLabel3->setObjectName(QString::fromUtf8("crossFadeLabel3"));
        crossFadeLabel3->setFont(font);

        hboxLayout2->addWidget(crossFadeLabel3);


        vboxLayout->addLayout(hboxLayout2);


        hboxLayout1->addLayout(vboxLayout);


        verticalLayout->addLayout(hboxLayout1);


        verticalLayout_2->addWidget(groupBox_2);

        buttonBox = new QDialogButtonBox(settings);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        verticalLayout_2->addWidget(buttonBox);


        retranslateUi(settings);
        QObject::connect(buttonBox, SIGNAL(accepted()), settings, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), settings, SLOT(reject()));

        QMetaObject::connectSlotsByName(settings);
    } // setupUi

    void retranslateUi(QDialog *settings)
    {
        settings->setWindowTitle(QApplication::translate("settings", "Settings", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("settings", "Video options:", 0, QApplication::UnicodeUTF8));
        scalemodeCombo->clear();
        scalemodeCombo->insertItems(0, QStringList()
         << QApplication::translate("settings", "Fit in view", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("settings", "Scale and crop", 0, QApplication::UnicodeUTF8)
        );
        label_9->setText(QApplication::translate("settings", "Contrast:", 0, QApplication::UnicodeUTF8));
        label_8->setText(QApplication::translate("settings", "Brightness:", 0, QApplication::UnicodeUTF8));
        label_7->setText(QApplication::translate("settings", "Saturation:", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("settings", "Hue:", 0, QApplication::UnicodeUTF8));
        label_10->setText(QApplication::translate("settings", "Aspect ratio:", 0, QApplication::UnicodeUTF8));
        aspectCombo->clear();
        aspectCombo->insertItems(0, QStringList()
         << QApplication::translate("settings", "Auto", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("settings", "Stretch", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("settings", "4/3", 0, QApplication::UnicodeUTF8)
         << QApplication::translate("settings", "16/9", 0, QApplication::UnicodeUTF8)
        );
        label_11->setText(QApplication::translate("settings", "Scale Mode:", 0, QApplication::UnicodeUTF8));
        groupBox_2->setTitle(QApplication::translate("settings", "Audio options:", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("settings", "Audio device:", 0, QApplication::UnicodeUTF8));
        label_6->setText(QApplication::translate("settings", "Audio effect:", 0, QApplication::UnicodeUTF8));
        effectButton->setText(QApplication::translate("settings", "Setup", 0, QApplication::UnicodeUTF8));
        crossFadeLabel->setText(QApplication::translate("settings", "Cross fade:", 0, QApplication::UnicodeUTF8));
        crossFadeLabel1->setText(QApplication::translate("settings", "-10 Sec", 0, QApplication::UnicodeUTF8));
        crossFadeLabel2->setText(QApplication::translate("settings", "0", 0, QApplication::UnicodeUTF8));
        crossFadeLabel3->setText(QApplication::translate("settings", "10 Sec ", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class settings: public Ui_settings {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SETTINGS_H
