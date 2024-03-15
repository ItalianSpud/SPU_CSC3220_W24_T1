# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appLunchBoxd_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appLunchBoxd_autogen.dir\\ParseCache.txt"
  "appLunchBoxd_autogen"
  )
endif()
