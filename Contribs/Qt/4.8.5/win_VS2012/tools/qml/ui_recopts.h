/********************************************************************************
** Form generated from reading UI file 'recopts.ui'
**
** Created by: Qt User Interface Compiler version 4.8.5
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_RECOPTS_H
#define UI_RECOPTS_H

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
#include <QtGui/QLineEdit>
#include <QtGui/QRadioButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QSpinBox>
#include <QtGui/QToolButton>
#include <QtGui/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_RecordingOptions
{
public:
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label;
    QLineEdit *file;
    QToolButton *pickfile;
    QGroupBox *groupBox;
    QGridLayout *gridLayout_2;
    QRadioButton *sizeOriginal;
    QRadioButton *sizeVGA;
    QRadioButton *size720p;
    QRadioButton *sizeQVGA;
    QHBoxLayout *horizontalLayout_2;
    QRadioButton *sizeCustom;
    QSpinBox *sizeWidth;
    QLabel *label_2;
    QSpinBox *sizeHeight;
    QSpacerItem *horizontalSpacer_3;
    QSpacerItem *horizontalSpacer_4;
    QGroupBox *rateOptions;
    QGridLayout *gridLayout_4;
    QRadioButton *hz60;
    QRadioButton *hz50;
    QRadioButton *hz25;
    QHBoxLayout *horizontalLayout;
    QRadioButton *hzCustom;
    QLineEdit *hz;
    QLabel *label_3;
    QSpacerItem *horizontalSpacer_2;
    QRadioButton *hz24;
    QSpacerItem *horizontalSpacer;
    QSpacerItem *horizontalSpacer_5;
    QGroupBox *ffmpegOptions;
    QGridLayout *gridLayout_3;
    QComboBox *profile;
    QLineEdit *args;
    QToolButton *ffmpegHelp;
    QLabel *warning;
    QDialogButtonBox *buttonBox;

    void setupUi(QDialog *RecordingOptions)
    {
        if (RecordingOptions->objectName().isEmpty())
            RecordingOptions->setObjectName(QString::fromUtf8("RecordingOptions"));
        RecordingOptions->resize(316, 436);
        verticalLayout = new QVBoxLayout(RecordingOptions);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        label = new QLabel(RecordingOptions);
        label->setObjectName(QString::fromUtf8("label"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy);

        horizontalLayout_3->addWidget(label);

        file = new QLineEdit(RecordingOptions);
        file->setObjectName(QString::fromUtf8("file"));

        horizontalLayout_3->addWidget(file);

        pickfile = new QToolButton(RecordingOptions);
        pickfile->setObjectName(QString::fromUtf8("pickfile"));

        horizontalLayout_3->addWidget(pickfile);


        verticalLayout->addLayout(horizontalLayout_3);

        groupBox = new QGroupBox(RecordingOptions);
        groupBox->setObjectName(QString::fromUtf8("groupBox"));
        gridLayout_2 = new QGridLayout(groupBox);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        sizeOriginal = new QRadioButton(groupBox);
        sizeOriginal->setObjectName(QString::fromUtf8("sizeOriginal"));
        sizeOriginal->setChecked(true);

        gridLayout_2->addWidget(sizeOriginal, 0, 0, 1, 1);

        sizeVGA = new QRadioButton(groupBox);
        sizeVGA->setObjectName(QString::fromUtf8("sizeVGA"));

        gridLayout_2->addWidget(sizeVGA, 0, 1, 1, 1);

        size720p = new QRadioButton(groupBox);
        size720p->setObjectName(QString::fromUtf8("size720p"));

        gridLayout_2->addWidget(size720p, 1, 0, 1, 1);

        sizeQVGA = new QRadioButton(groupBox);
        sizeQVGA->setObjectName(QString::fromUtf8("sizeQVGA"));

        gridLayout_2->addWidget(sizeQVGA, 1, 1, 1, 1);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        sizeCustom = new QRadioButton(groupBox);
        sizeCustom->setObjectName(QString::fromUtf8("sizeCustom"));

        horizontalLayout_2->addWidget(sizeCustom);

        sizeWidth = new QSpinBox(groupBox);
        sizeWidth->setObjectName(QString::fromUtf8("sizeWidth"));
        sizeWidth->setMinimum(1);
        sizeWidth->setMaximum(9999);

        horizontalLayout_2->addWidget(sizeWidth);

        label_2 = new QLabel(groupBox);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        sizePolicy.setHeightForWidth(label_2->sizePolicy().hasHeightForWidth());
        label_2->setSizePolicy(sizePolicy);

        horizontalLayout_2->addWidget(label_2);

        sizeHeight = new QSpinBox(groupBox);
        sizeHeight->setObjectName(QString::fromUtf8("sizeHeight"));
        sizeHeight->setMinimum(1);
        sizeHeight->setMaximum(9999);

        horizontalLayout_2->addWidget(sizeHeight);

        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::MinimumExpanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_3);


        gridLayout_2->addLayout(horizontalLayout_2, 2, 0, 1, 3);

        horizontalSpacer_4 = new QSpacerItem(40, 20, QSizePolicy::MinimumExpanding, QSizePolicy::Minimum);

        gridLayout_2->addItem(horizontalSpacer_4, 0, 2, 1, 1);


        verticalLayout->addWidget(groupBox);

        rateOptions = new QGroupBox(RecordingOptions);
        rateOptions->setObjectName(QString::fromUtf8("rateOptions"));
        gridLayout_4 = new QGridLayout(rateOptions);
        gridLayout_4->setObjectName(QString::fromUtf8("gridLayout_4"));
        hz60 = new QRadioButton(rateOptions);
        hz60->setObjectName(QString::fromUtf8("hz60"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(hz60->sizePolicy().hasHeightForWidth());
        hz60->setSizePolicy(sizePolicy1);
        hz60->setChecked(true);

        gridLayout_4->addWidget(hz60, 0, 0, 1, 1);

        hz50 = new QRadioButton(rateOptions);
        hz50->setObjectName(QString::fromUtf8("hz50"));

        gridLayout_4->addWidget(hz50, 1, 0, 1, 1);

        hz25 = new QRadioButton(rateOptions);
        hz25->setObjectName(QString::fromUtf8("hz25"));

        gridLayout_4->addWidget(hz25, 0, 2, 1, 1);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        hzCustom = new QRadioButton(rateOptions);
        hzCustom->setObjectName(QString::fromUtf8("hzCustom"));

        horizontalLayout->addWidget(hzCustom);

        hz = new QLineEdit(rateOptions);
        hz->setObjectName(QString::fromUtf8("hz"));
        QSizePolicy sizePolicy2(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(hz->sizePolicy().hasHeightForWidth());
        hz->setSizePolicy(sizePolicy2);
        hz->setMinimumSize(QSize(60, 0));
        hz->setMaximumSize(QSize(100, 16777215));

        horizontalLayout->addWidget(hz);

        label_3 = new QLabel(rateOptions);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        horizontalLayout->addWidget(label_3);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::MinimumExpanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        gridLayout_4->addLayout(horizontalLayout, 2, 0, 1, 4);

        hz24 = new QRadioButton(rateOptions);
        hz24->setObjectName(QString::fromUtf8("hz24"));

        gridLayout_4->addWidget(hz24, 1, 2, 1, 1);

        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::MinimumExpanding, QSizePolicy::Minimum);

        gridLayout_4->addItem(horizontalSpacer, 0, 3, 1, 1);

        horizontalSpacer_5 = new QSpacerItem(20, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        gridLayout_4->addItem(horizontalSpacer_5, 0, 1, 1, 1);


        verticalLayout->addWidget(rateOptions);

        ffmpegOptions = new QGroupBox(RecordingOptions);
        ffmpegOptions->setObjectName(QString::fromUtf8("ffmpegOptions"));
        gridLayout_3 = new QGridLayout(ffmpegOptions);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        profile = new QComboBox(ffmpegOptions);
        profile->setObjectName(QString::fromUtf8("profile"));

        gridLayout_3->addWidget(profile, 0, 0, 1, 3);

        args = new QLineEdit(ffmpegOptions);
        args->setObjectName(QString::fromUtf8("args"));

        gridLayout_3->addWidget(args, 1, 0, 1, 2);

        ffmpegHelp = new QToolButton(ffmpegOptions);
        ffmpegHelp->setObjectName(QString::fromUtf8("ffmpegHelp"));

        gridLayout_3->addWidget(ffmpegHelp, 1, 2, 1, 1);


        verticalLayout->addWidget(ffmpegOptions);

        warning = new QLabel(RecordingOptions);
        warning->setObjectName(QString::fromUtf8("warning"));

        verticalLayout->addWidget(warning);

        buttonBox = new QDialogButtonBox(RecordingOptions);
        buttonBox->setObjectName(QString::fromUtf8("buttonBox"));
        buttonBox->setOrientation(Qt::Horizontal);
        buttonBox->setStandardButtons(QDialogButtonBox::Cancel|QDialogButtonBox::Ok);

        verticalLayout->addWidget(buttonBox);

        QWidget::setTabOrder(file, pickfile);
        QWidget::setTabOrder(pickfile, sizeOriginal);
        QWidget::setTabOrder(sizeOriginal, sizeVGA);
        QWidget::setTabOrder(sizeVGA, size720p);
        QWidget::setTabOrder(size720p, sizeQVGA);
        QWidget::setTabOrder(sizeQVGA, sizeCustom);
        QWidget::setTabOrder(sizeCustom, sizeWidth);
        QWidget::setTabOrder(sizeWidth, sizeHeight);
        QWidget::setTabOrder(sizeHeight, hz60);
        QWidget::setTabOrder(hz60, hz25);
        QWidget::setTabOrder(hz25, hz50);
        QWidget::setTabOrder(hz50, hz24);
        QWidget::setTabOrder(hz24, hzCustom);
        QWidget::setTabOrder(hzCustom, hz);
        QWidget::setTabOrder(hz, profile);
        QWidget::setTabOrder(profile, args);
        QWidget::setTabOrder(args, ffmpegHelp);
        QWidget::setTabOrder(ffmpegHelp, buttonBox);

        retranslateUi(RecordingOptions);
        QObject::connect(hzCustom, SIGNAL(clicked()), hz, SLOT(setFocus()));
        QObject::connect(hz, SIGNAL(textChanged(QString)), hzCustom, SLOT(toggle()));
        QObject::connect(hz, SIGNAL(selectionChanged()), hzCustom, SLOT(toggle()));
        QObject::connect(buttonBox, SIGNAL(accepted()), RecordingOptions, SLOT(accept()));
        QObject::connect(buttonBox, SIGNAL(rejected()), RecordingOptions, SLOT(reject()));
        QObject::connect(profile, SIGNAL(activated(int)), RecordingOptions, SLOT(pickProfile(int)));
        QObject::connect(args, SIGNAL(textEdited(QString)), RecordingOptions, SLOT(storeCustomArgs(QString)));
        QObject::connect(sizeWidth, SIGNAL(valueChanged(int)), sizeCustom, SLOT(toggle()));
        QObject::connect(sizeHeight, SIGNAL(valueChanged(int)), sizeCustom, SLOT(toggle()));

        QMetaObject::connectSlotsByName(RecordingOptions);
    } // setupUi

    void retranslateUi(QDialog *RecordingOptions)
    {
        RecordingOptions->setWindowTitle(QApplication::translate("RecordingOptions", "Video options", 0, QApplication::UnicodeUTF8));
        label->setText(QApplication::translate("RecordingOptions", "File:", 0, QApplication::UnicodeUTF8));
        pickfile->setText(QApplication::translate("RecordingOptions", "...", 0, QApplication::UnicodeUTF8));
        groupBox->setTitle(QApplication::translate("RecordingOptions", "Size", 0, QApplication::UnicodeUTF8));
        sizeOriginal->setText(QString());
        sizeVGA->setText(QApplication::translate("RecordingOptions", "VGA", 0, QApplication::UnicodeUTF8));
        size720p->setText(QApplication::translate("RecordingOptions", "720p", 0, QApplication::UnicodeUTF8));
        sizeQVGA->setText(QApplication::translate("RecordingOptions", "QVGA", 0, QApplication::UnicodeUTF8));
        sizeCustom->setText(QApplication::translate("RecordingOptions", "Width:", 0, QApplication::UnicodeUTF8));
        label_2->setText(QApplication::translate("RecordingOptions", "Height:", 0, QApplication::UnicodeUTF8));
        rateOptions->setTitle(QApplication::translate("RecordingOptions", "Rate", 0, QApplication::UnicodeUTF8));
        hz60->setText(QApplication::translate("RecordingOptions", "60Hz", 0, QApplication::UnicodeUTF8));
        hz50->setText(QApplication::translate("RecordingOptions", "50Hz", 0, QApplication::UnicodeUTF8));
        hz25->setText(QApplication::translate("RecordingOptions", "25Hz", 0, QApplication::UnicodeUTF8));
        hzCustom->setText(QString());
        label_3->setText(QApplication::translate("RecordingOptions", "Hz", 0, QApplication::UnicodeUTF8));
        hz24->setText(QApplication::translate("RecordingOptions", "24Hz", 0, QApplication::UnicodeUTF8));
        ffmpegOptions->setTitle(QApplication::translate("RecordingOptions", "Profile", 0, QApplication::UnicodeUTF8));
        ffmpegHelp->setText(QApplication::translate("RecordingOptions", "Help", 0, QApplication::UnicodeUTF8));
        warning->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class RecordingOptions: public Ui_RecordingOptions {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_RECOPTS_H
