#------------------------------------------------
# The Virtual Monte Carlo packages
# Copyright (C) 2019 Ivana Hrivnacova
# All rights reserved.
#
# For the licensing terms see geant4_vmc/LICENSE.
# Contact: root-vmc@cern.ch
#-------------------------------------------------

# Configuration file for CMake build for geant3
# which finds all required packages.
#
# I. Hrivnacova, 15/04/2019

#-- ROOT (required) ------------------------------------------------------------
find_package(ROOT CONFIG REQUIRED)
include(${ROOT_USE_FILE})
set (ROOT_LIBRARIES ${ROOT_LIBRARIES} -lEG -lGeom)

#-- VMC (required) ------------------------------------------------------------
if(ROOT_vmc_FOUND)
  message(STATUS "Using VMC built with ROOT")
  set(VMC_LIBRARIES "VMC")
else()
  #-- VMC (required) ------------------------------------------------------------
  find_package(VMC CONFIG REQUIRED)
  if(NOT VMC_FIND_QUIETLY)
    message(STATUS "Found VMC ${VMC_VERSION} in ${VMC_DIR}")
    #message(STATUS VMC_INCLUDE_DIRS ${VMC_INCLUDE_DIRS})
    #message(STATUS VMC_LIBRARIES ${VMC_LIBRARIES})
  endif()
endif()
