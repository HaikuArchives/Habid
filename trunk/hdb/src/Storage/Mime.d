module Storage.Mime;

import Interface.Bitmap;

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
	int		get_device_icon(char *device, BBitmap *icon, icon_size which);
	int		get_device_icon(char *device, byte **data, int *size);

	int		get_named_icon(char *name, BBitmap *icon, icon_size which);
	int		get_named_icon(char *name, byte **data, int *size);
}
