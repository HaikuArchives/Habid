#include <hcb-types.h>

#include <storage/Mime.h>

extern "C" {
	status_t be_get_device_icon_1(const char* device, be_BBitmap* icon, icon_size which) {
		return get_device_icon(device, (BBitmap *)icon, which);
	}
	
	status_t be_get_device_icon_2(const char* device, uint8** _data, size_t* _size,type_code* _type) {
		return get_device_icon(device, _data, _size, _type);
	}

	status_t be_get_named_icon_1(const char* name, be_BBitmap* icon, icon_size which) {
		return get_named_icon(name, (BBitmap *)icon, which);
	}
	
	status_t be_get_named_icon_2(const char* name, uint8** _data, size_t* _size, type_code* _type) {
		return get_named_icon(name, _data, _size, _type);
	}
}
