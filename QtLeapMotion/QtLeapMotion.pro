#/****************************************************************************
#**
#** Copyright (C) Paul Lemire
#** Contact: paul.lemire@epitech.eu
#**
#**
#** GNU Lesser General Public License Usage
#** This file may be used under the terms of the GNU Lesser
#** General Public License version 2.1 as published by the Free Software
#** Foundation and appearing in the file LICENSE.LGPL included in the
#** packaging of this file.  Please review the following information to
#** ensure the GNU Lesser General Public License version 2.1 requirements
#** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
#**
#** GNU General Public License Usage
#** Alternatively, this file may be used under the terms of the GNU
#** General Public License version 3.0 as published by the Free Software
#** Foundation and appearing in the file LICENSE.GPL included in the
#** packaging of this file.  Please review the following information to
#** ensure the GNU General Public License version 3.0 requirements will be
#** met: http://www.gnu.org/copyleft/gpl.html.
#**
#**
#****************************************************************************/

TEMPLATE = lib

TARGET = QtLeapMotion

DEFINES += QTLEAPMOTION_LIBRARY

CONFIG += dll

QT += qml quick

OBJECTS_DIR = tmp

MOC_DIR = tmp

INCLUDEPATH += $$PWD/Leap/include

include (./QtLeapGlobal/QtLeapGlobal.pri)
include (./QtLeapDevice/QtLeapDevice.pri)
include (./QtLeapGestures/QtLeapGestures.pri)
include (./QtLeapTouch/QtLeapTouch.pri)

# WORKS ONLY WITH QT COMPILED FOR MSVC
win32: {
 !contains(QMAKE_HOST.arch, x86_64) {
        message("x86 build")
        LIBS += $$PWD/Leap/x86/Leap.lib
    } else {
        message("x86_64 build")
        LIBS += $$PWD/Leap/x64/Leap.lib
    }
}

linux-g++: {
    !contains(QMAKE_HOST.arch, x86_64) {
        LIBS += -L$$PWD/Leap/x86/ -lLeap
    } else {
        message("x86_64 build")
        LIBS += -L$$PWD/Leap/x64/ -lLeap
    }
}



#linux : {
#    QMAKE_LFLAGS += -Wl,--rpath=$$PWD
#    QMAKE_RPATH=
#}

win32:DESTDIR = ./

