QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtGLWebcamDemo
TEMPLATE = app

INCLUDEPATH+= cqtopencvviewergl

SOURCES += main.cpp\
           qtglwebcamdemo.cpp \
           cqtopencvviewergl/cqtopencvviewergl.cpp

HEADERS  += qtglwebcamdemo.h \
            cqtopencvviewergl/cqtopencvviewergl.h

FORMS    += qtglwebcamdemo.ui

win32 {
message("Using win32 configuration")

OPENCV_PATH = C:/devel/OpenCV/opencv-2.4.6.0 # Note: update with the correct OpenCV version


#LIBS_PATH = "$$OPENCV_PATH/build/x86/mingw/lib" #project compiled using MINGW
LIBS_PATH = "$$OPENCV_PATH/build/x86/vc10/lib" #project compiled using Visual C++ 2010 32bit compiler

    CONFIG(debug, debug|release) {
    LIBS     += -L$$LIBS_PATH \
                -lopencv_core246d \
                -lopencv_highgui246d
    }

    CONFIG(release, debug|release) {
    LIBS     += -L$$LIBS_PATH \
                -lopencv_core246 \
                -lopencv_highgui246
    }
}

unix {
message("Using unix configuration")

OPENCV_PATH = /home/charles/Programs/Opencv-2.4.13

LIBS_PATH = /home/charles/Programs/Opencv-2.4.13/install/lib

LIBS     += \
    -L$$LIBS_PATH \
    -lopencv_core \
    -lopencv_highgui \
    -lopencv_imgproc
}

INCLUDEPATH += \
    $$OPENCV_PATH/install/include/ \ #core module


message("OpenCV path: $$OPENCV_PATH")
message("Includes path: $$INCLUDEPATH")
message("Libraries: $$LIBS")


