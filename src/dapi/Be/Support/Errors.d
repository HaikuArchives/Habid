/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

module Be.Support.Errors;

const int LONG_MIN = 0;

/* Error baselines */
const int B_GENERAL_ERROR_BASE		=	LONG_MIN;
const int B_OS_ERROR_BASE			=	(B_GENERAL_ERROR_BASE + 0x1000);
const int B_APP_ERROR_BASE			=	(B_GENERAL_ERROR_BASE + 0x2000);
const int B_INTERFACE_ERROR_BASE	=	(B_GENERAL_ERROR_BASE + 0x3000);
const int B_MEDIA_ERROR_BASE		=	(B_GENERAL_ERROR_BASE + 0x4000);
										/* - 0x41ff */
const int B_TRANSLATION_ERROR_BASE	=	(B_GENERAL_ERROR_BASE + 0x4800);
										/* - 0x48ff */
const int B_MIDI_ERROR_BASE			=	(B_GENERAL_ERROR_BASE + 0x5000);
const int B_STORAGE_ERROR_BASE		=	(B_GENERAL_ERROR_BASE + 0x6000);
const int B_POSIX_ERROR_BASE		=	(B_GENERAL_ERROR_BASE + 0x7000);
const int B_MAIL_ERROR_BASE			=	(B_GENERAL_ERROR_BASE + 0x8000);
const int B_PRINT_ERROR_BASE		=	(B_GENERAL_ERROR_BASE + 0x9000);
const int B_DEVICE_ERROR_BASE		=	(B_GENERAL_ERROR_BASE + 0xa000);

/* Developer-defined errors start at (B_ERRORS_END+1) */
const int B_ERRORS_END				=	(B_GENERAL_ERROR_BASE + 0xffff);

/* General Errors */
const int B_NO_MEMORY				=	(B_GENERAL_ERROR_BASE + 0);
const int B_IO_ERROR				=	(B_GENERAL_ERROR_BASE + 1);
const int B_PERMISSION_DENIED		=	(B_GENERAL_ERROR_BASE + 2);
const int B_BAD_INDEX				=	(B_GENERAL_ERROR_BASE + 3);
const int B_BAD_TYPE				=	(B_GENERAL_ERROR_BASE + 4);
const int B_BAD_VALUE				=	(B_GENERAL_ERROR_BASE + 5);
const int B_MISMATCHED_VALUES		=	(B_GENERAL_ERROR_BASE + 6);
const int B_NAME_NOT_FOUND			=	(B_GENERAL_ERROR_BASE + 7);
const int B_NAME_IN_USE				=	(B_GENERAL_ERROR_BASE + 8);
const int B_TIMED_OUT				=	(B_GENERAL_ERROR_BASE + 9);
const int B_INTERRUPTED				=	(B_GENERAL_ERROR_BASE + 10);
const int B_WOULD_BLOCK				=	(B_GENERAL_ERROR_BASE + 11);
const int B_CANCELED				=	(B_GENERAL_ERROR_BASE + 12);
const int B_NO_INIT					=	(B_GENERAL_ERROR_BASE + 13);
const int B_NOT_INITIALIZED			=	(B_GENERAL_ERROR_BASE + 13);
const int B_BUSY					=	(B_GENERAL_ERROR_BASE + 14);
const int B_NOT_ALLOWED				=	(B_GENERAL_ERROR_BASE + 15);
const int B_BAD_DATA				=	(B_GENERAL_ERROR_BASE + 16);
const int B_DONT_DO_THAT			=	(B_GENERAL_ERROR_BASE + 17);

const int B_ERROR					=	(-1);
const int B_OK						=	(cast(int)0);
const int B_NO_ERROR				=	(cast(int)0);

/* Kernel Kit Errors */
const int B_BAD_SEM_ID				=	(B_OS_ERROR_BASE + 0);
const int B_NO_MORE_SEMS			=	(B_OS_ERROR_BASE + 1);

const int B_BAD_THREAD_ID			=	(B_OS_ERROR_BASE + 0x100);
const int B_NO_MORE_THREADS			=	(B_OS_ERROR_BASE + 0x101);
const int B_BAD_THREAD_STATE		=	(B_OS_ERROR_BASE + 0x102);
const int B_BAD_TEAM_ID				=	(B_OS_ERROR_BASE + 0x103);
const int B_NO_MORE_TEAMS			=	(B_OS_ERROR_BASE + 0x104);

const int B_BAD_PORT_ID				=	(B_OS_ERROR_BASE + 0x200);
const int B_NO_MORE_PORTS			=	(B_OS_ERROR_BASE + 0x201);

const int B_BAD_IMAGE_ID			=	(B_OS_ERROR_BASE + 0x300);
const int B_BAD_ADDRESS				=	(B_OS_ERROR_BASE + 0x301);
const int B_NOT_AN_EXECUTABLE		=	(B_OS_ERROR_BASE + 0x302);
const int B_MISSING_LIBRARY			=	(B_OS_ERROR_BASE + 0x303);
const int B_MISSING_SYMBOL			=	(B_OS_ERROR_BASE + 0x304);

const int B_DEBUGGER_ALREADY_INSTALLED	=	(B_OS_ERROR_BASE + 0x400);

/* Application Kit Errors */
const int B_BAD_REPLY				=	(B_APP_ERROR_BASE + 0);
const int B_DUPLICATE_REPLY			=	(B_APP_ERROR_BASE + 1);
const int B_MESSAGE_TO_SELF			=	(B_APP_ERROR_BASE + 2);
const int B_BAD_HANDLER				=	(B_APP_ERROR_BASE + 3);
const int B_ALREADY_RUNNING			=	(B_APP_ERROR_BASE + 4);
const int B_LAUNCH_FAILED			=	(B_APP_ERROR_BASE + 5);
const int B_AMBIGUOUS_APP_LAUNCH	=	(B_APP_ERROR_BASE + 6);
const int B_UNKNOWN_MIME_TYPE		=	(B_APP_ERROR_BASE + 7);
const int B_BAD_SCRIPT_SYNTAX		=	(B_APP_ERROR_BASE + 8);
const int B_LAUNCH_FAILED_NO_RESOLVE_LINK	=	(B_APP_ERROR_BASE + 9);
const int B_LAUNCH_FAILED_EXECUTABLE		=	(B_APP_ERROR_BASE + 10);
const int B_LAUNCH_FAILED_APP_NOT_FOUND		=	(B_APP_ERROR_BASE + 11);
const int B_LAUNCH_FAILED_APP_IN_TRASH		=	(B_APP_ERROR_BASE + 12);
const int B_LAUNCH_FAILED_NO_PREFERRED_APP	=	(B_APP_ERROR_BASE + 13);
const int B_LAUNCH_FAILED_FILES_APP_NOT_FOUND	=	(B_APP_ERROR_BASE + 14);
const int B_BAD_MIME_SNIFFER_RULE	=	(B_APP_ERROR_BASE + 15);
const int B_NOT_A_MESSAGE			=	(B_APP_ERROR_BASE + 16);
const int B_SHUTDOWN_CANCELLED		=	(B_APP_ERROR_BASE + 17);
const int B_SHUTTING_DOWN			=	(B_APP_ERROR_BASE + 18);

/* Storage Kit/File System Errors */
const int B_FILE_ERROR				=	(B_STORAGE_ERROR_BASE + 0);
const int B_FILE_NOT_FOUND			=	(B_STORAGE_ERROR_BASE + 1);
			/* deprecated: use B_ENTRY_NOT_FOUND instead */
const int B_FILE_EXISTS				=	(B_STORAGE_ERROR_BASE + 2);
const int B_ENTRY_NOT_FOUND			=	(B_STORAGE_ERROR_BASE + 3);
const int B_NAME_TOO_LONG			=	(B_STORAGE_ERROR_BASE + 4);
const int B_NOT_A_DIRECTORY			=	(B_STORAGE_ERROR_BASE + 5);
const int B_DIRECTORY_NOT_EMPTY		=	(B_STORAGE_ERROR_BASE + 6);
const int B_DEVICE_FULL				=	(B_STORAGE_ERROR_BASE + 7);
const int B_READ_ONLY_DEVICE		=	(B_STORAGE_ERROR_BASE + 8);
const int B_IS_A_DIRECTORY			=	(B_STORAGE_ERROR_BASE + 9);
const int B_NO_MORE_FDS				=	(B_STORAGE_ERROR_BASE + 10);
const int B_CROSS_DEVICE_LINK		=	(B_STORAGE_ERROR_BASE + 11);
const int B_LINK_LIMIT				=	(B_STORAGE_ERROR_BASE + 12);
const int B_BUSTED_PIPE				=	(B_STORAGE_ERROR_BASE + 13);
const int B_UNSUPPORTED				=	(B_STORAGE_ERROR_BASE + 14);
const int B_PARTITION_TOO_SMALL		=	(B_STORAGE_ERROR_BASE + 15);

/* POSIX Errors */
version(B_USE_POSITIVE_POSIX_ERRORS)
{
	int B_TO_POSIX_ERROR(int error)
	{
		return (-(error));
	}
	int B_FROM_POSIX_ERROR(int error)
	{
		return (-(error));
	}
} else {
	int B_TO_POSIX_ERROR(int error)
	{
		return (error);
	}
	int B_FROM_POSIX_ERROR(int error)
	{
		return (error);
	}
}

const int B_POSIX_ENOMEM		=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0);
const int E2BIG					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1);
const int ECHILD				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2);
const int EDEADLK				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 3);
const int EFBIG					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 4);
const int EMLINK				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 5);
const int ENFILE				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 6);
const int ENODEV				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 7);
const int ENOLCK				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 8);
const int ENOSYS				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 9);
const int ENOTTY				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 10);
const int ENXIO					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 11);
const int ESPIPE				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 12);
const int ESRCH					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 13);
const int EFPOS					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 14);
const int ESIGPARM				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 15);
const int EDOM					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 16);
const int ERANGE				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 17);
const int EPROTOTYPE			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 18);
const int EPROTONOSUPPORT		=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 19);
const int EPFNOSUPPORT			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 20);
const int EAFNOSUPPORT			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 21);
const int EADDRINUSE			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 22);
const int EADDRNOTAVAIL			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 23);
const int ENETDOWN				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 24);
const int ENETUNREACH			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 25);
const int ENETRESET				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 26);
const int ECONNABORTED			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 27);
const int ECONNRESET			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 28);
const int EISCONN				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 29);
const int ENOTCONN				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 30);
const int ESHUTDOWN				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 31);
const int ECONNREFUSED			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 32);
const int EHOSTUNREACH			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 33);
const int ENOPROTOOPT			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 34);
const int ENOBUFS				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 35);
const int EINPROGRESS			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 36);
const int EALREADY				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 37);
const int EILSEQ				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 38);
const int ENOMSG				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 39);
const int ESTALE				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 40);
const int EOVERFLOW				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 41);
const int EMSGSIZE				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 42);
const int EOPNOTSUPP			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 43);
const int ENOTSOCK				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 44);
const int EHOSTDOWN				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 45);
const int EBADMSG				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 46);
const int ECANCELED				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 47);
const int EDESTADDRREQ			=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 48);
const int EDQUOT				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 49);
const int EIDRM					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 50);
const int EMULTIHOP				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 51);
const int ENODATA				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 52);
const int ENOLINK				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 53);
const int ENOSR					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 54);
const int ENOSTR				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 55);
const int ENOTSUP				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 56);
const int EPROTO				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 57);
const int ETIME					=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 58);
const int ETXTBSY				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 59);
const int ENOATTR				=	B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 60);

/* B_NO_MEMORY (0x80000000) can't be negated, so it needs special handling */
version(B_USE_POSITIVE_POSIX_ERRORS)
{
const int ENOMEM				=	B_POSIX_ENOMEM;
} else {
const int ENOMEM				=	B_NO_MEMORY;
}

/* POSIX errors that can be mapped to BeOS error codes */
const int EACCES				=	B_TO_POSIX_ERROR(B_PERMISSION_DENIED);
const int EINTR					=	B_TO_POSIX_ERROR(B_INTERRUPTED);
const int EIO					=	B_TO_POSIX_ERROR(B_IO_ERROR);
const int EBUSY					=	B_TO_POSIX_ERROR(B_BUSY);
const int EFAULT				=	B_TO_POSIX_ERROR(B_BAD_ADDRESS);
const int ETIMEDOUT				=	B_TO_POSIX_ERROR(B_TIMED_OUT);
const int EAGAIN				=	B_TO_POSIX_ERROR(B_WOULD_BLOCK);	/* SysV compatibility */
const int EWOULDBLOCK			=	B_TO_POSIX_ERROR(B_WOULD_BLOCK);	/* BSD compatibility */
const int EBADF					=	B_TO_POSIX_ERROR(B_FILE_ERROR);
const int EEXIST				=	B_TO_POSIX_ERROR(B_FILE_EXISTS);
const int EINVAL				=	B_TO_POSIX_ERROR(B_BAD_VALUE);
const int ENAMETOOLONG			=	B_TO_POSIX_ERROR(B_NAME_TOO_LONG);
const int ENOENT				=	B_TO_POSIX_ERROR(B_ENTRY_NOT_FOUND);
const int EPERM					=	B_TO_POSIX_ERROR(B_NOT_ALLOWED);
const int ENOTDIR				=	B_TO_POSIX_ERROR(B_NOT_A_DIRECTORY);
const int EISDIR				=	B_TO_POSIX_ERROR(B_IS_A_DIRECTORY);
const int ENOTEMPTY				=	B_TO_POSIX_ERROR(B_DIRECTORY_NOT_EMPTY);
const int ENOSPC				=	B_TO_POSIX_ERROR(B_DEVICE_FULL);
const int EROFS					=	B_TO_POSIX_ERROR(B_READ_ONLY_DEVICE);
const int EMFILE				=	B_TO_POSIX_ERROR(B_NO_MORE_FDS);
const int EXDEV					=	B_TO_POSIX_ERROR(B_CROSS_DEVICE_LINK);
const int ELOOP					=	B_TO_POSIX_ERROR(B_LINK_LIMIT);
const int ENOEXEC				=	B_TO_POSIX_ERROR(B_NOT_AN_EXECUTABLE);
const int EPIPE					=	B_TO_POSIX_ERROR(B_BUSTED_PIPE);

/* new error codes that can be mapped to POSIX errors */
const int B_BUFFER_OVERFLOW		=	B_FROM_POSIX_ERROR(EOVERFLOW);
const int B_TOO_MANY_ARGS		=	B_FROM_POSIX_ERROR(E2BIG);
const int B_FILE_TOO_LARGE		=	B_FROM_POSIX_ERROR(EFBIG);
const int B_RESULT_NOT_REPRESENTABLE	=	B_FROM_POSIX_ERROR(ERANGE);
const int B_DEVICE_NOT_FOUND	=	B_FROM_POSIX_ERROR(ENODEV);
const int B_NOT_SUPPORTED		=	B_FROM_POSIX_ERROR(EOPNOTSUPP);

/* Media Kit Errors */
const int B_STREAM_NOT_FOUND		=	(B_MEDIA_ERROR_BASE + 0);
const int B_SERVER_NOT_FOUND		=	(B_MEDIA_ERROR_BASE + 1);
const int B_RESOURCE_NOT_FOUND		=	(B_MEDIA_ERROR_BASE + 2);
const int B_RESOURCE_UNAVAILABLE	=	(B_MEDIA_ERROR_BASE + 3);
const int B_BAD_SUBSCRIBER			=	(B_MEDIA_ERROR_BASE + 4);
const int B_SUBSCRIBER_NOT_ENTERED	=	(B_MEDIA_ERROR_BASE + 5);
const int B_BUFFER_NOT_AVAILABLE	=	(B_MEDIA_ERROR_BASE + 6);
const int B_LAST_BUFFER_ERROR		=	(B_MEDIA_ERROR_BASE + 7);

const int B_MEDIA_SYSTEM_FAILURE	=	(B_MEDIA_ERROR_BASE + 100);
const int B_MEDIA_BAD_NODE			=	(B_MEDIA_ERROR_BASE + 101);
const int B_MEDIA_NODE_BUSY			=	(B_MEDIA_ERROR_BASE + 102);
const int B_MEDIA_BAD_FORMAT		=	(B_MEDIA_ERROR_BASE + 103);
const int B_MEDIA_BAD_BUFFER		=	(B_MEDIA_ERROR_BASE + 104);
const int B_MEDIA_TOO_MANY_NODES	=	(B_MEDIA_ERROR_BASE + 105);
const int B_MEDIA_TOO_MANY_BUFFERS	=	(B_MEDIA_ERROR_BASE + 106);
const int B_MEDIA_NODE_ALREADY_EXISTS	=	(B_MEDIA_ERROR_BASE + 107);
const int B_MEDIA_BUFFER_ALREADY_EXISTS	=	(B_MEDIA_ERROR_BASE + 108);
const int B_MEDIA_CANNOT_SEEK			=	(B_MEDIA_ERROR_BASE + 109);
const int B_MEDIA_CANNOT_CHANGE_RUN_MODE	=	(B_MEDIA_ERROR_BASE + 110);
const int B_MEDIA_APP_ALREADY_REGISTERED	=	(B_MEDIA_ERROR_BASE + 111);
const int B_MEDIA_APP_NOT_REGISTERED	=	(B_MEDIA_ERROR_BASE + 112);
const int B_MEDIA_CANNOT_RECLAIM_BUFFERS	=	(B_MEDIA_ERROR_BASE + 113);
const int B_MEDIA_BUFFERS_NOT_RECLAIMED	=	(B_MEDIA_ERROR_BASE + 114);
const int B_MEDIA_TIME_SOURCE_STOPPED	=	(B_MEDIA_ERROR_BASE + 115);
const int B_MEDIA_TIME_SOURCE_BUSY		=	(B_MEDIA_ERROR_BASE + 116);
const int B_MEDIA_BAD_SOURCE			=	(B_MEDIA_ERROR_BASE + 117);
const int B_MEDIA_BAD_DESTINATION		=	(B_MEDIA_ERROR_BASE + 118);
const int B_MEDIA_ALREADY_CONNECTED		=	(B_MEDIA_ERROR_BASE + 119);
const int B_MEDIA_NOT_CONNECTED			=	(B_MEDIA_ERROR_BASE + 120);
const int B_MEDIA_BAD_CLIP_FORMAT		=	(B_MEDIA_ERROR_BASE + 121);
const int B_MEDIA_ADDON_FAILED			=	(B_MEDIA_ERROR_BASE + 122);
const int B_MEDIA_ADDON_DISABLED		=	(B_MEDIA_ERROR_BASE + 123);
const int B_MEDIA_CHANGE_IN_PROGRESS	=	(B_MEDIA_ERROR_BASE + 124);
const int B_MEDIA_STALE_CHANGE_COUNT	=	(B_MEDIA_ERROR_BASE + 125);
const int B_MEDIA_ADDON_RESTRICTED		=	(B_MEDIA_ERROR_BASE + 126);
const int B_MEDIA_NO_HANDLER			=	(B_MEDIA_ERROR_BASE + 127);
const int B_MEDIA_DUPLICATE_FORMAT		=	(B_MEDIA_ERROR_BASE + 128);
const int B_MEDIA_REALTIME_DISABLED		=	(B_MEDIA_ERROR_BASE + 129);
const int B_MEDIA_REALTIME_UNAVAILABLE	=	(B_MEDIA_ERROR_BASE + 130);

/* Mail Kit Errors */
const int B_MAIL_NO_DAEMON			=	(B_MAIL_ERROR_BASE + 0);
const int B_MAIL_UNKNOWN_USER		=	(B_MAIL_ERROR_BASE + 1);
const int B_MAIL_WRONG_PASSWORD		=	(B_MAIL_ERROR_BASE + 2);
const int B_MAIL_UNKNOWN_HOST		=	(B_MAIL_ERROR_BASE + 3);
const int B_MAIL_ACCESS_ERROR		=	(B_MAIL_ERROR_BASE + 4);
const int B_MAIL_UNKNOWN_FIELD		=	(B_MAIL_ERROR_BASE + 5);
const int B_MAIL_NO_RECIPIENT		=	(B_MAIL_ERROR_BASE + 6);
const int B_MAIL_INVALID_MAIL		=	(B_MAIL_ERROR_BASE + 7);

/* Printing Errors */
const int B_NO_PRINT_SERVER			=	(B_PRINT_ERROR_BASE + 0);

/* Device Kit Errors */
const int B_DEV_INVALID_IOCTL		=	(B_DEVICE_ERROR_BASE + 0);
const int B_DEV_NO_MEMORY			=	(B_DEVICE_ERROR_BASE + 1);
const int B_DEV_BAD_DRIVE_NUM		=	(B_DEVICE_ERROR_BASE + 2);
const int B_DEV_NO_MEDIA			=	(B_DEVICE_ERROR_BASE + 3);
const int B_DEV_UNREADABLE			=	(B_DEVICE_ERROR_BASE + 4);
const int B_DEV_FORMAT_ERROR		=	(B_DEVICE_ERROR_BASE + 5);
const int B_DEV_TIMEOUT				=	(B_DEVICE_ERROR_BASE + 6);
const int B_DEV_RECALIBRATE_ERROR	=	(B_DEVICE_ERROR_BASE + 7);
const int B_DEV_SEEK_ERROR			=	(B_DEVICE_ERROR_BASE + 8);
const int B_DEV_ID_ERROR			=	(B_DEVICE_ERROR_BASE + 9);
const int B_DEV_READ_ERROR			=	(B_DEVICE_ERROR_BASE + 10);
const int B_DEV_WRITE_ERROR			=	(B_DEVICE_ERROR_BASE + 11);
const int B_DEV_NOT_READY			=	(B_DEVICE_ERROR_BASE + 12);
const int B_DEV_MEDIA_CHANGED		=	(B_DEVICE_ERROR_BASE + 13);
const int B_DEV_MEDIA_CHANGE_REQUESTED	=	(B_DEVICE_ERROR_BASE + 14);
const int B_DEV_RESOURCE_CONFLICT	=	(B_DEVICE_ERROR_BASE + 15);
const int B_DEV_CONFIGURATION_ERROR	=	(B_DEVICE_ERROR_BASE + 16);
const int B_DEV_DISABLED_BY_USER	=	(B_DEVICE_ERROR_BASE + 17);
const int B_DEV_DOOR_OPEN			=	(B_DEVICE_ERROR_BASE + 18);

const int B_DEV_INVALID_PIPE		=	(B_DEVICE_ERROR_BASE + 19);
const int B_DEV_CRC_ERROR			=	(B_DEVICE_ERROR_BASE + 20);
const int B_DEV_STALLED				=	(B_DEVICE_ERROR_BASE + 21);
const int B_DEV_BAD_PID				=	(B_DEVICE_ERROR_BASE + 22);
const int B_DEV_UNEXPECTED_PID		=	(B_DEVICE_ERROR_BASE + 23);
const int B_DEV_DATA_OVERRUN		=	(B_DEVICE_ERROR_BASE + 24);
const int B_DEV_DATA_UNDERRUN		=	(B_DEVICE_ERROR_BASE + 25);
const int B_DEV_FIFO_OVERRUN		=	(B_DEVICE_ERROR_BASE + 26);
const int B_DEV_FIFO_UNDERRUN		=	(B_DEVICE_ERROR_BASE + 27);
const int B_DEV_PENDING				=	(B_DEVICE_ERROR_BASE + 28);
const int B_DEV_MULTIPLE_ERRORS		=	(B_DEVICE_ERROR_BASE + 29);
const int B_DEV_TOO_LATE			=	(B_DEVICE_ERROR_BASE + 30);

/* Translation Kit Errors */
const int B_TRANSLATION_BASE_ERROR	=	(B_TRANSLATION_ERROR_BASE + 0);
const int B_NO_TRANSLATOR			=	(B_TRANSLATION_ERROR_BASE + 1);
const int B_ILLEGAL_DATA			=	(B_TRANSLATION_ERROR_BASE + 2);


int B_TO_POSITIVE_ERROR(int error) {
	return _to_positive_error(error);
}

int B_TO_NEGATIVE_ERROR(int error) {
	return _to_negative_error(error);
}

extern (C) extern int _to_positive_error(int error);

extern (C) extern int _to_negative_error(int error);
