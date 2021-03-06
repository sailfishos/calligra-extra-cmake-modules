# - ECM_OPTIONAL_ADD_SUBDIRECTORY() combines ADD_SUBDIRECTORY() with an OPTION()
#
# ECM_OPTIONAL_ADD_SUBDIRECTORY(<dir>)
#
# If you use ECM_OPTIONAL_ADD_SUBDIRECTORY() instead of ADD_SUBDIRECTORY(),
# this will have two effects
#
# 1 - CMake will not complain if the directory doesn't exist
#     This makes sense if you want to distribute just one of the subdirs
#     in a source package, e.g. just one of the subdirs in kdeextragear.
# 2 - If the directory exists, it will offer an option to skip the
#     subdirectory.
#     This is useful if you want to compile only a subset of all
#     directories.
#
# If the CMake variable DISABLE_ALL_OPTIONAL_SUBDIRECTORIES is set to TRUE
# for the first CMake run on the project, all optional subdirectories will be disabled
# by default (but can of course be enabled via the respective options).
# E.g. the following will disable all optional subdirectories except the one named "kcalc":
#   $ cmake -DDISABLE_ALL_OPTIONAL_SUBDIRECTORIES=TRUE -DBUILD_kcalc=TRUE <srcdir>

# Copyright (c) 2007, Alexander Neundorf, <neundorf@kde.org>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


function(ECM_OPTIONAL_ADD_SUBDIRECTORY _dir)
  get_filename_component(_fullPath ${_dir} ABSOLUTE)
  if(EXISTS ${_fullPath}/CMakeLists.txt)
    if(DISABLE_ALL_OPTIONAL_SUBDIRECTORIES)
      set(_DEFAULT_OPTION_VALUE FALSE)
    else()
      set(_DEFAULT_OPTION_VALUE TRUE)
    endif()
    if(DISABLE_ALL_OPTIONAL_SUBDIRS  AND NOT DEFINED  BUILD_${_dir})
      set(_DEFAULT_OPTION_VALUE FALSE)
    endif()
    option(BUILD_${_dir} "Build directory ${_dir}" ${_DEFAULT_OPTION_VALUE})
    if(BUILD_${_dir})
      add_subdirectory(${_dir})
    endif()
  endif()
endfunction()
