# Find LCM
#
# You can pass LCM_DIR to set the directory where lcm isinstalled.
#
# Sets LCM_FOUND, LCM_INCLUDE_DIRS, LCM_LIBRARIES

if(LCM_DIR)
set(_include_dir_hint "${LIBMULTISENSE_DIR}/include/MultiSense")
set(_lib_dir_hint "${LIBMULTISENSE_DIR}/lib")
endif()

find_path(LCM_INCLUDE_DIR NAMES lcm/lcm.h
HINTS @CMAKE_INSTALL_PREFIX@/include ${_include_dir_hint} /usr/include /usr/local/include /opt/local/include
)

find_library (LCM_LIBRARY NAMES liblcm lcm
HINTS @CMAKE_INSTALL_PREFIX@/lib ${_lib_dir_hint} /usr/lib /usr/local/lib /opt/local/lib/
)

set (LCM_INCLUDE_DIRS ${LCM_INCLUDE_DIR})
set (LCM_LIBRARIES ${LCM_LIBRARY})

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LCM_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args( LCM DEFAULT_MSG
  LCM_INCLUDE_DIR LCM_LIBRARY )

mark_as_advanced(LCM_INCLUDE_DIR)
mark_as_advanced(LCM_LIBRARY)