include_directories("${CMAKE_SOURCE_DIR}/fmod/include")

# Resolve FMOD lib directory
set(_fmod_abi "${ANDROID_ABI}")
# Normalize NEON variant to base directory name
if(_fmod_abi MATCHES "^armeabi-v7a")
  set(_fmod_abi "armeabi-v7a")
endif()

# Allow manual override from the command line: -DFMOD_LIB_DIR=...
if (FMOD_LIB_DIR)
  set(_fmod_libdir "${FMOD_LIB_DIR}")
else()
  set(_fmod_libdir "${CMAKE_SOURCE_DIR}/fmod/Android/${_fmod_abi}")
endif()

if (EXISTS "${_fmod_libdir}")
  link_directories("${_fmod_libdir}")
else()
  message(WARNING "FMOD library directory not found: ${_fmod_libdir}. Place libfmod.so (or libfmod.a) for ABI '${_fmod_abi}' there, or pass -DFMOD_LIB_DIR=...")
endif()
