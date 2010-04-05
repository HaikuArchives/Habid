module Storage.Resources;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;
import tango.stdc.posix.sys.stat;
import tango.stdc.stringz;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

import Storage.Entry;
import Storage.File;

import Kernel.image;

import Support.types;

extern (C) extern {
	be_BResources *be_BResources_ctor_1();
	be_BResources *be_BResources_ctor_2(be_BFile *file, bool clobber);
	be_BResources *be_BResources_ctor_3(char *path, bool clobber);
	be_BResources *be_BResources_ctor_4(entry_ref *reference, bool clobber);

	void be_BResources_dtor(be_BResources *instPointer);

	status_t be_BResources_SetTo_1(be_BResources *instPointer, be_BFile *file, bool clobber);
	status_t be_BResources_SetTo_2(be_BResources *instPointer, char *path, bool clobber);
	status_t be_BResources_SetTo_3(be_BResources *instPointer, entry_ref *reference, bool clobber);
	
	// Haiku only
	status_t be_BResources_SetToImage_1(be_BResources *instPointer, image_id image, bool clobber);
	status_t be_BResources_SetToImage_2(be_BResources *instPointer, void *codeOrDataPointer, bool clobber);

	void be_BResources_Unset(be_BResources *instPointer);
	status_t be_BResources_InitCheck(be_BResources *instPointer);

	be_BFile *be_BResources_File(be_BResources *instPointer);

	void *be_BResources_LoadResource_1(be_BResources *instPointer, type_code type, int32 id, size_t *outSize);
	void *be_BResources_LoadResource_2(be_BResources *instPointer, type_code type, char *name, size_t *outSize);

	status_t be_BResources_PreloadResourceType(be_BResources *instPointer, type_code type);

	status_t be_BResources_Sync(be_BResources *instPointer);
	status_t be_BResources_MergeFrom(be_BResources *instPointer, be_BFile *fromFile);
	status_t be_BResources_WriteTo(be_BResources *instPointer, be_BFile *file);

	status_t be_BResources_AddResource(be_BResources *instPointer, type_code type, int32 id, void *data, size_t length, char *name);

	bool be_BResources_HasResource_1(be_BResources *instPointer, type_code type, int32 id);
	bool be_BResources_HasResource_2(be_BResources *instPointer, type_code type, char *name);

	bool be_BResources_GetResourceInfo_1(be_BResources *instPointer, int32 byIndex, type_code *typeFound, int32 *idFound,
						 char **nameFound, size_t *lengthFound);
	bool be_BResources_GetResourceInfo_2(be_BResources *instPointer, type_code byType, int32 andIndex, int32 *idFound,
						 char **nameFound, size_t *lengthFound);
	bool be_BResources_GetResourceInfo_3(be_BResources *instPointer, type_code byType, int32 andID,
						 char **nameFound, size_t *lengthFound);
	bool be_BResources_GetResourceInfo_4(be_BResources *instPointer, type_code byType, char *andName, int32 *idFound,
						 size_t *lengthFound);
	bool be_BResources_GetResourceInfo_5(be_BResources *instPointer, void *byPointer, type_code *typeFound,
						 int32 *idFound, size_t *lengthFound, char **nameFound);

	status_t be_BResources_RemoveResource_1(be_BResources *instPointer, void *resource);
	status_t be_BResources_RemoveResource_2(be_BResources *instPointer, type_code type, int32 id);


	// deprecated

	status_t be_BResources_WriteResource(be_BResources *instPointer, type_code type, int32 id, void *data,
						   off_t offset, size_t length);

	status_t be_BResources_ReadResource(be_BResources *instPointer, type_code type, int32 id, void *data, off_t offset,
						  size_t length);

	void *be_BResources_FindResource_1(be_BResources *instPointer, type_code type, int32 id, size_t *lengthFound);
	void *be_BResources_FindResource_2(be_BResources *instPointer, type_code type, char *name, size_t *lengthFound);
}


extern (C) {

}


class BStatable
{
public:
	mixin(BObject!("be_BResources", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BResources_ctor_1();
	}


	this(BFile file, bool clobber = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BResources_ctor_2(file.fInstancePointer, clobber);
	}

	this(char [] path, bool clobber = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BResources_ctor_3(toStringz(path), clobber);
	}
	
	this(entry_ref reference, bool clobber = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BResources_ctor_4(&reference, clobber);
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BResources_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	status_t SetTo(BFile file, bool clobber = false) {
		return be_BResources_SetTo_1(fInstancePointer, file.fInstancePointer, clobber);
	}
	
	status_t SetTo(char [] path, bool clobber = false) {
		return be_BResources_SetTo_2(fInstancePointer, toStringz(path), clobber);
	}
	
	status_t SetTo(entry_ref reference, bool clobber = false) {
		return be_BResources_SetTo_3(fInstancePointer, &reference, clobber);
	}

	
	// Haiku only
	status_t SetToImage(image_id image, bool clobber = false) {
		return be_BResources_SetToImage_1(fInstancePointer, image, clobber);
	}
	
	status_t SetToImage(void *codeOrDataPointer, bool clobber = false) {
		return be_BResources_SetToImage_2(fInstancePointer, codeOrDataPointer, clobber);
	}


	void Unset() {
		be_BResources_Unset(fInstancePointer);
	}
	
	status_t InitCheck() {
		return be_BResources_InitCheck(fInstancePointer);
	}

	BFile File() {
		return new BFile(be_BResources_File(fInstancePointer), false);
	}


	void [] LoadResource(type_code type, int32 id) {
		size_t outSize;
		void *ptr = be_BResources_LoadResource_1(fInstancePointer, type, id, &outSize);
		
		if(ptr is null)
			return null;
			
		return ptr[0..outSize];
	}
	
	void [] LoadResource(type_code type, char [] name) {
		size_t outSize;
		
		void *ptr = be_BResources_LoadResource_2(fInstancePointer, type, toStringz(name), &outSize);
		
		if(ptr is null)
			return null;
			
		return ptr[0..outSize];
	}

	status_t PreloadResourceType(type_code type) {
		return be_BResources_PreloadResourceType(fInstancePointer, type);
	}
	

	status_t Sync() {
		return be_BResources_Sync(fInstancePointer);
	}
	
	status_t MergeFrom(BFile fromFile) {
		return be_BResources_MergeFrom(fInstancePointer, fromFile.fInstancePointer);
	}
	
	status_t WriteTo(BFile file) {
		return be_BResources_WriteTo(fInstancePointer, file.fInstancePointer);
	}

	status_t AddResource(type_code type, int32 id, void [] data, char [] name) {
		return be_BResources_AddResource(fInstancePointer, type, id, data.ptr, data.length, toStringz(name));
	}


	bool HasResource(type_code type, int32 id) {
		return be_BResources_HasResource_1(fInstancePointer, type, id);
	}
	
	bool HasResource(type_code type, char [] name) {
		return be_BResources_HasResource_2(fInstancePointer, type, toStringz(name));
	}


	bool GetResourceInfo(int32 byIndex, inout type_code typeFound, inout int32 idFound, inout char [] nameFound, inout size_t lengthFound) {
		char **tmpNameFound;

		bool ret = be_BResources_GetResourceInfo_1(fInstancePointer, byIndex, &typeFound, &idFound, tmpNameFound, &lengthFound);
		
		nameFound = fromStringz(*tmpNameFound);
		
		return ret;
	}

	bool GetResourceInfo(type_code byType, int32 andIndex, inout int32 idFound, inout char [] nameFound, inout size_t lengthFound) {
		char **tmpNameFound;
		
		bool ret = be_BResources_GetResourceInfo_2(fInstancePointer, byType, andIndex, &idFound, tmpNameFound, &lengthFound);
		
		nameFound = fromStringz(*tmpNameFound);
		
		return ret;
	}

	bool GetResourceInfo(type_code byType, int32 andID, inout char [] nameFound, inout size_t lengthFound) {
		char **tmpNameFound;
		
		bool ret = be_BResources_GetResourceInfo_3(fInstancePointer, byType, andID, tmpNameFound, &lengthFound);
	
		nameFound = fromStringz(*tmpNameFound);
			
		return ret;
	}
	
	bool GetResourceInfo(type_code byType, char [] andName, inout int32 idFound, inout size_t lengthFound) {
		return be_BResources_GetResourceInfo_4(fInstancePointer, byType, toStringz(andName), &idFound, &lengthFound);
	}
	
	bool GetResourceInfo(void *byPointer, inout type_code typeFound, inout int32 idFound, inout size_t lengthFound, inout char [] nameFound) {
		char **tmpNameFound;
		
		bool ret = be_BResources_GetResourceInfo_5(fInstancePointer, byPointer, &typeFound, &idFound, &lengthFound, tmpNameFound);
		
		nameFound = fromStringz(*tmpNameFound);
		
		return ret;
	}

	status_t RemoveResource(void *resource) {
		return be_BResources_RemoveResource_1(fInstancePointer, resource);
	}
	
	status_t RemoveResource(type_code type, int32 id) {
		return be_BResources_RemoveResource_2(fInstancePointer, type, id);
	}
/*
	// deprecated

	status_t be_BResources_WriteResource(be_BResources *instPointer, type_code type, int32 id, const void *data,
						   off_t offset, size_t length);

	status_t be_BResources_ReadResource(be_BResources *instPointer, type_code type, int32 id, void *data, off_t offset,
						  size_t length);

	void *be_BResource_FindResources_1(be_BResources *instPointer, type_code type, int32 id, size_t *lengthFound);
	void *be_BResource_FindResources_2(be_BResources *instPointer, type_code type, const char *name, size_t *lengthFound);
*/

}
