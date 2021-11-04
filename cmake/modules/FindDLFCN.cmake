include(FindPackageHandleStandardArgs)

if (WIN32)

    find_path(DLFCN_INCLUDE_DIR
        NAMES
            DLFCN.h
        HINTS
            "${DLFCN_LOCATION}/include"
            "$ENV{DLFCN_LOCATION}/include"
        PATHS
            "$ENV{PROGRAMFILES}/DLFCN/include"
        DOC "The directory where DLFCN.h resides" )

    find_library(DLFCN_LIBRARY
        NAMES
            DLFCN DLFCN DLFCN32s DLFCN32
        HINTS
            "${DLFCN_LOCATION}/lib"
            "$ENV{DLFCN_LOCATION}/lib"
        PATHS
            "$ENV{PROGRAMFILES}/DLFCN/lib"
        DOC "The DLFCN library")
endif ()

if (${CMAKE_HOST_UNIX})
    find_path( DLFCN_INCLUDE_DIR
        NAMES
            DLFCN.h
        HINTS
            "${DLFCN_LOCATION}/include"
            "$ENV{DLFCN_LOCATION}/include"
        PATHS
            /usr/include
            /usr/local/include
            /sw/include
            /opt/local/include
            NO_DEFAULT_PATH
            DOC "The directory where DLFCN.h resides"
    )
    find_library( DLFCN_LIBRARY
        NAMES
            DLFCN DLFCN
        HINTS
            "${DLFCN_LOCATION}/lib"
            "$ENV{DLFCN_LOCATION}/lib"
        PATHS
            /usr/lib64
            /usr/lib
            /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}
            /usr/local/lib64
            /usr/local/lib
            /sw/lib
            /opt/local/lib
            NO_DEFAULT_PATH
            DOC "The DLFCN library")
endif ()

find_package_handle_standard_args(DLFCN
    REQUIRED_VARS
        DLFCN_INCLUDE_DIR
        DLFCN_LIBRARY
)
