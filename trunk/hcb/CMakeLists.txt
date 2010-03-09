PROJECT(BEC C CXX)

SET(BEC_SRCS
src/storage/MimeType.cpp
src/storage/Statable.cpp

src/support/DataIO.cpp
src/support/Flattenable.cpp
)

INCLUDE_DIRECTORIES(./include/)
ADD_LIBRARY(bec SHARED ${BEC_SRCS})
