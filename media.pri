INCLUDEPATH += $$PWD/src
DEPENDPATH += $$PWD/src

HEADERS += $$PWD/src/media.h

contains(DEFINES, MEDIA_QTAV) {
    QT += avwidgets
    INCLUDEPATH += $$PWD/src/qtav
    DEPENDPATH += $$PWD/src/qtav
    HEADERS += $$PWD/src/qtav/mediaqtav.h
    SOURCES += $$PWD/src/qtav/mediaqtav.cpp
}

contains(DEFINES, MEDIA_MPV) {
    QT *= gui

    LIBS += -lmpv
mac {
    # useful for homebrew: brew install mpv
    # LIBS += -L/usr/local/lib
    # INCLUDEPATH += /usr/local/include
}

    INCLUDEPATH += $$PWD/src/mpv
    DEPENDPATH += $$PWD/src/mpv
    HEADERS += $$PWD/src/mpv/mediampv.h
    SOURCES += $$PWD/src/mpv/mediampv.cpp

    !contains(DEFINES, MEDIA_AUDIOONLY) {
        QT *= widgets
        greaterThan(QT_MAJOR_VERSION, 5): QT += openglwidgets
        unix:!mac {
            QT *= x11extras
        }
        HEADERS += $$PWD/src/mpv/mpvwidget.h
        SOURCES += $$PWD/src/mpv/mpvwidget.cpp
    }
}
