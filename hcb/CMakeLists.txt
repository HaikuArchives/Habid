PROJECT(BEC C CXX)

SET(BEC_SRCS
src/app/Handler.cpp
src/app/Looper.cpp
src/app/Message.cpp
src/app/MessageQueue.cpp


src/storage/Entry.cpp
src/storage/EntryList.cpp
src/storage/Mime.cpp
src/storage/MimeType.cpp
src/storage/Node.cpp
src/storage/Path.cpp
src/storage/Statable.cpp

src/support/Archivable.cpp
src/support/Beep.cpp
src/support/DataIO.cpp
src/support/DataIO_BMemoryIO.cpp
src/support/DataIO_BMallocIO.cpp
src/support/DataIO_BPositionIO.cpp
src/support/Flattenable.cpp
src/support/List.cpp
src/support/Locker.cpp
src/support/String.cpp
src/support/StopWatch.cpp
)

INCLUDE_DIRECTORIES(
./include/
)
ADD_LIBRARY(bec SHARED ${BEC_SRCS})
