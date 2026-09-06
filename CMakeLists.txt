# Minimale benötigte CMake-Version.
cmake_minimum_required(VERSION 3.16)

# Projektname und verwendete Programmiersprache.
project(MaterialDesign VERSION 1.0.0 LANGUAGES CXX)

# Qt 6 benötigt mindestens C++17.
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Verarbeitet .qrc-Dateien automatisch.
set(CMAKE_AUTORCC ON)

# Qt Quick laden.
find_package(Qt6 REQUIRED COMPONENTS Quick)

# Standardkonfiguration für Qt-Projekte.
qt_standard_project_setup()

# Anwendung und Quelldateien.
qt_add_executable(MaterialDesign
    main.cpp
    MaterialDesign.qrc
)

# Qt Quick mit der Anwendung verknüpfen.
target_link_libraries(MaterialDesign
    PRIVATE Qt6::Quick
)

# GUI-Anwendung unter Windows und App-Bundle unter macOS.
set_target_properties(MaterialDesign PROPERTIES
    WIN32_EXECUTABLE OFF
    MACOSX_BUNDLE ON
)