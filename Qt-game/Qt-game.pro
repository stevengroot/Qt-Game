TEMPLATE = app

QT += qml quick
QT += positioning

SOURCES += main.cpp

RESOURCES += \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    images/close.png \
    images/info.png \
    images/settings.png \
    main.qml \
    p_settings.qml \
    p_main.qml \
    p_info.qml \
    p_confirm.qml \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
