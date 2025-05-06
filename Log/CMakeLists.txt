include(tbb)
include(Base)

include_directories(include)

list(APPEND HEADERS include/FastLog.h)
list(APPEND HEADERS include/FastLogStream.h)

list(APPEND SOURCES FastLog.cpp)
list(APPEND SOURCES FastLogStream.cpp)

add_library(Log OBJECT ${SOURCES} ${HEADERS})
