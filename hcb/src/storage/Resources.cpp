#include <hcb-types.h>

#include <storage/Resources.h>

extern "C" {

}

extern "C" {
	be_BResources *be_BResources_ctor_1() {
		return (be_BResources *)new BResources();
	}
	
	be_BResources *be_BResources_ctor_2(const be_BFile *file, bool clobber) {
		return (be_BResources *)new BResources((BFile *)file, clobber);
	}

	be_BResources *be_BResources_ctor_3(const char *path, bool clobber) {
		return (be_BResources *)new BResources(path, clobber);
	}

	be_BResources *be_BResources_ctor_4(const entry_ref *ref, bool clobber) {
		return (be_BResources *)new BResources(ref, clobber);
	}


	void be_BResources_dtor(be_BResources *instPointer) {
		delete (BResources *)instPointer;
	}

	status_t be_BResources_SetTo_1(be_BResources *instPointer, const be_BFile *file, bool clobber) {
		return ((BResources *)instPointer)->SetTo((BFile *)file, clobber);
	}
	
	status_t be_BResources_SetTo_2(be_BResources *instPointer, const char *path, bool clobber) {
		return ((BResources *)instPointer)->SetTo(path, clobber);
	}

	status_t be_BResources_SetTo_3(be_BResources *instPointer, const entry_ref *ref, bool clobber) {
		return ((BResources *)instPointer)->SetTo(ref, clobber);
	}

	
	// Haiku only
	status_t be_BResources_SetToImage_1(be_BResources *instPointer, image_id image, bool clobber) {
		return ((BResources *)instPointer)->SetToImage(image, clobber);
	}

	status_t be_BResources_SetToImage_2(be_BResources *instPointer, const void *codeOrDataPointer, bool clobber) {
		return ((BResources *)instPointer)->SetToImage(codeOrDataPointer, clobber);
	}


	void be_BResources_Unset(be_BResources *instPointer) {
		return ((BResources *)instPointer)->Unset();
	}

	status_t be_BResources_InitCheck(be_BResources *instPointer) {
		return ((BResources *)instPointer)->InitCheck();
	}


	const be_BFile *be_BResources_File(be_BResources *instPointer) {
		return (be_BFile *)&((BResources *)instPointer)->File();
	}


	const void *be_BResources_LoadResource_1(be_BResources *instPointer, type_code type, int32 id, size_t *outSize) {
		return ((BResources *)instPointer)->LoadResource(type, id, outSize);
	}

	const void *be_BResources_LoadResource_2(be_BResources *instPointer, type_code type, const char *name, size_t *outSize) {
		return ((BResources *)instPointer)->LoadResource(type, name, outSize);
	}


	status_t be_BResources_PreloadResourceType(be_BResources *instPointer, type_code type) {
		return ((BResources *)instPointer)->PreloadResourceType(type);
	}


	status_t be_BResources_Sync(be_BResources *instPointer) {
		return ((BResources *)instPointer)->Sync();
	}

	status_t be_BResources_MergeFrom(be_BResources *instPointer, be_BFile *fromFile) {
		return ((BResources *)instPointer)->MergeFrom((BFile *)fromFile);
	}

	status_t be_BResources_WriteTo(be_BResources *instPointer, be_BFile *file) {
		return ((BResources *)instPointer)->WriteTo((BFile *)file);
	}


	status_t be_BResources_AddResource(be_BResources *instPointer, type_code type, int32 id, const void *data, size_t length, const char *name) {
		return ((BResources *)instPointer)->AddResource(type, id, data, length, name);
	}


	bool be_BResources_HasResource_1(be_BResources *instPointer, type_code type, int32 id) {
		return ((BResources *)instPointer)->HasResource(type, id);
	}

	bool be_BResources_HasResource_2(be_BResources *instPointer, type_code type, const char *name) {
		return ((BResources *)instPointer)->HasResource(type, name);
	}


	bool be_BResources_GetResourceInfo_1(be_BResources *instPointer, int32 byIndex, type_code *typeFound, int32 *idFound,
						 const char **nameFound, size_t *lengthFound) {
		return ((BResources *)instPointer)->GetResourceInfo(byIndex, typeFound, idFound, nameFound, lengthFound);
	}

	bool be_BResources_GetResourceInfo_2(be_BResources *instPointer, type_code byType, int32 andIndex, int32 *idFound,
						 const char **nameFound, size_t *lengthFound) {
		return ((BResources *)instPointer)->GetResourceInfo(byType, andIndex, idFound, nameFound, lengthFound);
	}

	bool be_BResources_GetResourceInfo_3(be_BResources *instPointer, type_code byType, int32 andID,
						 const char **nameFound, size_t *lengthFound) {
		return ((BResources *)instPointer)->GetResourceInfo(byType, andID, nameFound, lengthFound);
	}

	bool be_BResources_GetResourceInfo_4(be_BResources *instPointer, type_code byType, const char *andName, int32 *idFound,
						 size_t *lengthFound) {
		return ((BResources *)instPointer)->GetResourceInfo(byType, andName, idFound, lengthFound);
	}

	bool be_BResources_GetResourceInfo_5(be_BResources *instPointer, const void *byPointer, type_code *typeFound,
						 int32 *idFound, size_t *lengthFound,
						 const char **nameFound) {
		return ((BResources *)instPointer)->GetResourceInfo(byPointer, typeFound, idFound, lengthFound, nameFound);
	}


	status_t be_BResources_RemoveResource_1(be_BResources *instPointer, const void *resource) {
		return ((BResources *)instPointer)->RemoveResource(resource);
	}

	status_t be_BResources_RemoveResource_2(be_BResources *instPointer, type_code type, int32 id) {
		return ((BResources *)instPointer)->RemoveResource(type, id);
	}



	// deprecated

	status_t be_BResources_WriteResource(be_BResources *instPointer, type_code type, int32 id, const void *data,
						   off_t offset, size_t length) {
		return ((BResources *)instPointer)->WriteResource(type, id, data, offset, length);
	}


	status_t be_BResources_ReadResource(be_BResources *instPointer, type_code type, int32 id, void *data, off_t offset,
						  size_t length) {
		return ((BResources *)instPointer)->ReadResource(type, id, data, offset, length);
	}


	void *be_BResource_FindResource_1(be_BResources *instPointer, type_code type, int32 id, size_t *lengthFound) {
		return ((BResources *)instPointer)->FindResource(type, id, lengthFound);
	}

	void *be_BResource_FindResource_2(be_BResources *instPointer, type_code type, const char *name, size_t *lengthFound) {
		return ((BResources *)instPointer)->FindResource(type, name, lengthFound);
	}
}
