module Storage.Mime;

import Support.SupportDefs;

import Support.HelperFunctions;

import Interface.Bitmap;

import tango.stdc.stringz;

const uint32 B_MIME_STRING_TYPE = MakeValue('M', 'I', 'M', 'S');

enum icon_size {
	B_LARGE_ICON = 32,
	B_MINI_ICON = 16
}

enum {
	B_UPDATE_MIME_INFO_NO_FORCE = 0,
	B_UPDATE_MIME_INFO_FORCE_KEEP_TYPE = 1,
	B_UPDATE_MIME_INFO_FORCE_UPDATE_ALL = 2
}

extern (C) extern {
	int update_mime_info(char* path, int recursive, int synchronous, int force);
	status_t create_app_meta_mime(char* path, int recursive, int synchronous, int force);
	status_t get_device_icon(char* device, void* icon, int32 size);


	status_t be_get_device_icon_1(char*, void* icon, icon_size);	
	status_t be_get_device_icon_2(char*, uint8**, size_t* _size,type_code*);
	status_t be_get_named_icon_1(char*, void*, icon_size);
	status_t be_get_named_icon_2(char*, uint8**, size_t*, type_code*);
}

// D functions to make the calls transparent with BBitmap
int get_device_icon(char [] device, BBitmap icon, icon_size which) {
	return be_get_device_icon_1(toStringz(device), icon.fInstancePointer, which);
}

int get_device_icon(char [] device, uint8** data, inout size_t size, inout type_code type) {
	return be_get_device_icon_2(toStringz(device), data, &size, &type);
}

int get_named_icon(char [] name, BBitmap icon, icon_size which) {
	return be_get_named_icon_1(toStringz(name), icon.fInstancePointer, which);
}

int get_named_icon(char [] name, uint8** data, inout size_t size, inout type_code type) {
	return be_get_named_icon_2(toStringz(name), data, &size, &type);
}
