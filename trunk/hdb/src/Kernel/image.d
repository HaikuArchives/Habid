module Kernel.image;

import tango.stdc.posix.sys.types;
import tango.stdc.posix.dirent;

import Support.SupportDefs;
import Storage.StorageDefs;

import Kernel.OS;

typedef	int32 image_id;

enum image_type {
	B_APP_IMAGE			= 1,
	B_LIBRARY_IMAGE,
	B_ADD_ON_IMAGE,
	B_SYSTEM_IMAGE
}

extern (C) {
	alias void function() init_routine_t;
	alias void function() term_routine_t;
}

struct image_info {
	image_id	id;
	image_type	type;
	int32		sequence;
	int32		init_order;
	init_routine_t init_routine;
	term_routine_t term_routine;
	dev_t		device;
	ino_t		node;
	char		name[B_PATH_NAME_LENGTH];
	void		*text;
	void		*data;
	int32		text_size;
	int32		data_size;

	// Haiku R1 extensions
	int32		api_version;	// the Haiku API version used by the image
	int32		abi;			// the Haiku ABI used by the image
}

// flags for clear_caches()
const int B_FLUSH_DCACHE				=	0x0001;	/* data cache */
const int B_FLUSH_ICACHE				=	0x0004;	/* instruction cache */
const int B_INVALIDATE_DCACHE			=	0x0002;
const int B_INVALIDATE_ICACHE			=	0x0008;

// symbol types
const int B_SYMBOL_TYPE_DATA			=	0x1;
const int B_SYMBOL_TYPE_TEXT			=	0x2;
const int B_SYMBOL_TYPE_ANY				=	0x5;

// initialization/termination functions of shared objects
const char [] B_INIT_BEFORE_FUNCTION_NAME = "initialize_before";
const char [] B_INIT_AFTER_FUNCTION_NAME = "initialize_after";
const char [] B_TERM_BEFORE_FUNCTION_NAME ="terminate_before";
const char [] B_TERM_AFTER_FUNCTION_NAME ="terminate_after";

// flags for _kern_load_image() (private API)
enum {
	B_WAIT_TILL_LOADED	= 0x01,
		// Wait till the loader has loaded and relocated
		// (but not yet initialized) the application
		// image and all dependencies. If not supplied,
		// the function returns before the loader
		// started to do anything at all, i.e. it
		// returns success, even if the executable
		// doesn't exist.
};

extern (C) extern {
thread_id load_image(int32 argc, char **argv, char **environ);
image_id load_add_on(char *path);
status_t unload_add_on(image_id image);
status_t get_image_symbol(image_id image, char *name, int32 symbolType,
				void **_symbolLocation);
status_t get_nth_image_symbol(image_id image, int32 n, char *nameBuffer,
				int32 *_nameLength, int32 *_symbolType, void **_symbolLocation);
void clear_caches(void *address, size_t length, uint32 flags);


status_t get_image_info(image_id image, inout image_info info) {
	return _get_image_info(image, &info, info.sizeof);
}

status_t get_next_image_info(team_id team, inout int32 cookie, inout image_info info) {
	return _get_next_image_info(team, &cookie, &info, info.sizeof);
}

/* private, use the macros above */
status_t _get_image_info(image_id image, image_info *info, size_t size);
status_t _get_next_image_info(team_id team, int32 *cookie, image_info *info,
				size_t size);
}
