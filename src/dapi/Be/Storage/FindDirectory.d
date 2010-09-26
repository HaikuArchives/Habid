/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.FindDirectory;

import Be.Support.SupportDefs;
import Be.Support.Errors;

import Be.Storage.Path;
import Be.Storage.Volume;

import tango.stdc.stringz;
import tango.stdc.stdlib;


enum directory_which {
	/* Per volume directories */
	B_DESKTOP_DIRECTORY					= 0,
	B_TRASH_DIRECTORY,

	/* System directories */
	B_SYSTEM_DIRECTORY					= 1000,
	B_SYSTEM_ADDONS_DIRECTORY			= 1002,
	B_SYSTEM_BOOT_DIRECTORY,
	B_SYSTEM_FONTS_DIRECTORY,
	B_SYSTEM_LIB_DIRECTORY,
 	B_SYSTEM_SERVERS_DIRECTORY,
	B_SYSTEM_APPS_DIRECTORY,
	B_SYSTEM_BIN_DIRECTORY,
	B_SYSTEM_DOCUMENTATION_DIRECTORY	= 1010,
	B_SYSTEM_PREFERENCES_DIRECTORY,
	B_SYSTEM_TRANSLATORS_DIRECTORY,
	B_SYSTEM_MEDIA_NODES_DIRECTORY,
	B_SYSTEM_SOUNDS_DIRECTORY,
	B_SYSTEM_DATA_DIRECTORY,

	/* Common directories, shared among all users. */
	B_COMMON_DIRECTORY					= 2000,
	B_COMMON_SYSTEM_DIRECTORY,
	B_COMMON_ADDONS_DIRECTORY,
	B_COMMON_BOOT_DIRECTORY,
	B_COMMON_FONTS_DIRECTORY,
	B_COMMON_LIB_DIRECTORY,
	B_COMMON_SERVERS_DIRECTORY,
	B_COMMON_BIN_DIRECTORY,
	B_COMMON_ETC_DIRECTORY,
	B_COMMON_DOCUMENTATION_DIRECTORY,
	B_COMMON_SETTINGS_DIRECTORY,
	B_COMMON_DEVELOP_DIRECTORY,
	B_COMMON_LOG_DIRECTORY,
	B_COMMON_SPOOL_DIRECTORY,
	B_COMMON_TEMP_DIRECTORY,
	B_COMMON_VAR_DIRECTORY,
	B_COMMON_TRANSLATORS_DIRECTORY,
	B_COMMON_MEDIA_NODES_DIRECTORY,
	B_COMMON_SOUNDS_DIRECTORY,
	B_COMMON_DATA_DIRECTORY,

	/* User directories. These are interpreted in the context
	   of the user making the find_directory call. */
	B_USER_DIRECTORY					= 3000,
	B_USER_CONFIG_DIRECTORY,
	B_USER_ADDONS_DIRECTORY,
	B_USER_BOOT_DIRECTORY,
	B_USER_FONTS_DIRECTORY,
	B_USER_LIB_DIRECTORY,
	B_USER_SETTINGS_DIRECTORY,
	B_USER_DESKBAR_DIRECTORY,
	B_USER_PRINTERS_DIRECTORY,
	B_USER_TRANSLATORS_DIRECTORY,
	B_USER_MEDIA_NODES_DIRECTORY,
	B_USER_SOUNDS_DIRECTORY,
	B_USER_DATA_DIRECTORY,
	B_USER_CACHE_DIRECTORY,

	/* Global directories. */
	B_APPS_DIRECTORY					= 4000,
	B_PREFERENCES_DIRECTORY,
	B_UTILITIES_DIRECTORY,
}

alias directory_which FindDir;

extern (C) extern
{
	status_t find_directory(directory_which which, dev_t volume, bool createIt, char* pathString, int32 length);
}
/*
extern (C++) extern
{
	status_t find_directory(directory_which which, void *path, bool createIt, void * volume);
}
*/
status_t find_directory(directory_which which, dev_t volume, bool createIt, inout char [] pathString, int32 length) {
	char *buffer = cast(char *)malloc(1024);
	
	status_t ret = find_directory(which, volume, createIt, buffer, length);
	
	pathString = fromStringz(buffer).dup;
	
	free(buffer);
	
	return ret;
}

status_t find_directory(directory_which which, IBPath path, bool createIt = false, IBVolume volume = null) {
	if(path is null)
		return B_BAD_VALUE;
		
	dev_t device = cast(dev_t)-1;
	
	if(volume !is null && volume.InitCheck() == B_OK)
		device = volume.Device();
		
	char [] buffer;
	
	status_t error = find_directory(which, device, createIt, buffer, 1024);
	
	if(error == B_OK)
		error = path.SetTo(buffer);
		
	return error;
}
