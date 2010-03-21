PROJECT(BED)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
FIND_PACKAGE(D REQUIRED)

SET(BED_SRCS
src/Kernel/fs_attr.d
src/Kernel/OS.d

src/Storage/Entry.d
src/Storage/EntryList.d

src/Storage/MimeType.d
src/Storage/Mime.d

src/Storage/Node.d

src/Storage/Path.d

src/Storage/Statable.d
src/Storage/StorageDefs.d

src/Storage/Volume.d

src/Interface/Bitmap.d

src/Support/BObject.d
src/Support/DataIO.d

src/Support/Errors.d

src/Support/Flattenable.d

src/Support/List.d
src/Support/Locker.d

src/Support/SupportDefs.d
src/Support/String.d
src/Support/StopWatch.d

src/Support/types.d

src/App/Message.d
)

SET(BED_INCLUDES
src
)


add_d_target(bed NOT_DETECT_DEPENDS TYPE SHARED SOURCES ${BED_SRCS} INCLUDES ${BED_INCLUDES})
