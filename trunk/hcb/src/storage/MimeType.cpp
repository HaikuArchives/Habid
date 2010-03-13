#include <storage/MimeType.h>

#include <hcb-types.h>

#include <storage/HCB_MimeType.h>

BMimeTypeBridge::BMimeTypeBridge ()
: BMimeType() 
{ }

BMimeTypeBridge::BMimeTypeBridge (const char *mimeType)
: BMimeType(mimeType)
{ }

BMimeTypeBridge::~BMimeTypeBridge()
{ }


extern "C" {
	be_BMimeType * be_BMimeType_ctor_1() {
		return (be_BMimeType *)new BMimeTypeBridge;
	}

	be_BMimeType * be_BMimeType_ctor_2(const char *mimeType) {
		return (be_BMimeType *)new BMimeTypeBridge(mimeType);
	}

	void be_BMimeType_dtor(be_BMimeType *obj) {
			delete (BMimeTypeBridge *)obj;
	}

	status_t be_BMimeType_SetTo(be_BMimeType *instPointer, const char *mimeType) {
		return ((BMimeTypeBridge *)instPointer)->SetTo(mimeType);
	}

	void be_BMimeType_Unset(be_BMimeType *instPointer) {
		((BMimeTypeBridge *)instPointer)->Unset();
	}

	status_t be_BMimeType_InitCheck(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->InitCheck();
	}

	const char * be_BMimeType_Type(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->Type();
	}

	bool be_BMimeType_IsValid(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->IsValid();
	}

	bool be_BMimeType_IsSupertypeOnly(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->IsSupertypeOnly();
	}

	status_t be_BMimeType_GetSupertype(be_BMimeType *instPointer, BMimeTypeBridge *superType) {
		return ((BMimeTypeBridge *)instPointer)->GetSupertype((BMimeType *)superType);
	}

	bool be_BMimeType_operator_equal_1(be_BMimeType *instPointer, BMimeTypeBridge *type) {
		return *((BMimeTypeBridge *)instPointer) == *((BMimeTypeBridge *)type);
	}

	bool be_BMimeType_operator_equal_2(be_BMimeType *instPointer, const char *type) {
		return *((BMimeTypeBridge *)instPointer) == type;
	}

	bool be_BMimeType_Contains(be_BMimeType *instPointer, BMimeTypeBridge *type) {
		return ((BMimeTypeBridge *)instPointer)->Contains((BMimeTypeBridge *)type);
	}

	status_t be_BMimeType_Install(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->Install();
	}

	status_t be_BMimeType_Delete(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->Delete();
	}

	bool be_BMimeType_IsInstalled(be_BMimeType *instPointer) {
		return ((BMimeTypeBridge *)instPointer)->IsInstalled();
	}

	status_t be_BMimeType_GetIcon_1(be_BMimeType *instPointer, be_BBitmap *icon, icon_size size) {
		return ((BMimeTypeBridge *)instPointer)->GetIcon((BBitmap *)icon, size);
	}

	status_t be_BMimeType_GetIcon_2(be_BMimeType *instPointer, uint8 **data, size_t *size) {
		return ((BMimeTypeBridge *)instPointer)->GetIcon(data, size);
	}

	status_t be_BMimeType_GetPreferredApp(be_BMimeType *instPointer, char *signature, app_verb verb) {
		return ((BMimeTypeBridge *)instPointer)->GetPreferredApp(signature, verb);
	}

	status_t be_BMimeType_GetAttrInfo(be_BMimeType *instPointer, be_BMessage *info) {
		return ((BMimeTypeBridge *)instPointer)->GetAttrInfo((BMessage *)info);
	}

	status_t be_BMimeType_GetFileExtensions(be_BMimeType *instPointer, be_BMessage *info) {
		return ((BMimeTypeBridge *)instPointer)->GetFileExtensions((BMessage *)info);
	}

	status_t be_BMimeType_GetShortDescription(be_BMimeType *instPointer, char *desc) {
		return ((BMimeTypeBridge *)instPointer)->GetShortDescription(desc);
	}

	status_t be_BMimeType_GetLongDescription(be_BMimeType *instPointer, char *desc) {
		return ((BMimeTypeBridge *)instPointer)->GetLongDescription(desc);
	}

	status_t be_BMimeType_GetSupportingApps(be_BMimeType *instPointer, be_BMessage *signatures) {
		return ((BMimeTypeBridge *)instPointer)->GetSupportingApps((BMessage *)signatures);
	}

	///////////////////
	
	status_t be_BMimeType_SetIcon_1(be_BMimeType *instPointer, const be_BBitmap *icon, icon_size size) {
		return ((BMimeTypeBridge *)instPointer)->SetIcon((const BBitmap *)icon, size);
	}

	status_t be_BMimeType_SetIcon_2(be_BMimeType *instPointer, const uint8 *data, icon_size size) {
		return ((BMimeTypeBridge *)instPointer)->SetIcon(data, size);
	}

	status_t be_BMimeType_SetPreferredApp(be_BMimeType *instPointer, const char *signature, app_verb verb) {
		return ((BMimeTypeBridge *)instPointer)->SetPreferredApp(signature, verb);
	}

	status_t be_BMimeType_SetAttrInfo(be_BMimeType *instPointer, const be_BMessage *info) {
		return ((BMimeTypeBridge *)instPointer)->SetAttrInfo((const BMessage *)info);
	}

	status_t be_BMimeType_SetFileExtensions(be_BMimeType *instPointer, const be_BMessage *extensions) {
		return ((BMimeTypeBridge *)instPointer)->SetFileExtensions((const BMessage *)extensions);
	}

	status_t be_BMimeType_SetShortDescription(be_BMimeType *instPointer, const char *desc) {
		return ((BMimeTypeBridge *)instPointer)->SetShortDescription(desc);
	}

	status_t be_BMimeType_SetLongDescription(be_BMimeType *instPointer, const char *desc) {
		return ((BMimeTypeBridge *)instPointer)->SetLongDescription(desc);
	}

	status_t be_BMimeType_GetInstalledSupertypes_static(be_BMessage *supertypes) {
		return BMimeTypeBridge::GetInstalledSupertypes((BMessage *)supertypes);
	}

	status_t be_BMimeType_GetInstalledTypes_1_static(be_BMessage *types) {
		return BMimeTypeBridge::GetInstalledTypes((BMessage *)types);
	}

	status_t be_BMimeType_GetInstalledTypes_2_static(const char *supertype, be_BMessage *subtypes) {
		return BMimeTypeBridge::GetInstalledTypes(supertype, (BMessage *)subtypes);
	}

	status_t be_BMimeType_GetWildcardApps_static(be_BMessage *wildcardApps) {
		return BMimeTypeBridge::GetWildcardApps((BMessage *)wildcardApps);
	}

	bool be_BMimeType_IsValid_static(const char *mimeType) {
		return BMimeTypeBridge::IsValid(mimeType);
	}

	status_t be_BMimeType_GetAppHint(be_BMimeType *instPointer, entry_ref *ref) {
		return ((BMimeTypeBridge *)instPointer)->GetAppHint(ref);
	}

	status_t be_BMimeType_SetAppHint(be_BMimeType *instPointer, const entry_ref *ref) {
		return ((BMimeTypeBridge *)instPointer)->SetAppHint(ref);
	}


	/* for application signatures only. */
	status_t be_BMimeType_GetIconForType_1(be_BMimeType *instPointer, const char *type, be_BBitmap *icon, icon_size which) {
		return ((BMimeTypeBridge *)instPointer)->GetIconForType(type, (BBitmap *)icon, which);
	}

	status_t be_BMimeType_GetIconForType_2(be_BMimeType *instPointer, const char *type, uint8 **data, size_t *size) {
		return ((BMimeTypeBridge *)instPointer)->GetIconForType(type, data, size);
	}

	status_t be_BMimeType_SetIconForType_1(be_BMimeType *instPointer, const char *type, const be_BBitmap *icon, icon_size which) {
		return ((BMimeTypeBridge *)instPointer)->SetIconForType(type, (BBitmap *)icon, which);
	}

	status_t be_BMimeType_SetIconForType_2(be_BMimeType *instPointer, const char *type, const uint8 *data, size_t size) {
		return ((BMimeTypeBridge *)instPointer)->SetIconForType(type, data, size);
	}

	status_t be_BMimeType_GetSnifferRule_1(be_BMimeType *instPointer, be_BString *result) {
		return ((BMimeTypeBridge *)instPointer)->GetSnifferRule((BString *)result);
	}

	status_t be_BMimeType_SetSnifferRule_2(be_BMimeType *instPointer, const char *rule) {
		return ((BMimeTypeBridge *)instPointer)->SetSnifferRule(rule);
	}

	status_t be_BMimeType_CheckSnifferRule(be_BMimeType *instPointer, const char *rule, be_BString *parseError) {
		return ((BMimeTypeBridge *)instPointer)->CheckSnifferRule(rule, (BString *)parseError);
	}

	status_t be_BMimeType_GuessMimeType_1_static(const entry_ref *file, be_BMimeType *type) {
		return BMimeTypeBridge::GuessMimeType(file, (BMimeType *)type);
	}

	status_t be_BMimeType_GuessMimeType_2_static(const void *buffer, int32 length, be_BMimeType *type) {
		return BMimeTypeBridge::GuessMimeType(buffer, length, (BMimeType *)type);
	}

	status_t be_BMimeType_GuessMimeType_3_static(const char *filename, be_BMimeType *type) {
		return BMimeTypeBridge::GuessMimeType(filename, (BMimeType *)type);
	}

	status_t be_BMimeType_StartWatching_static(be_BMessenger *target) {
		return BMimeTypeBridge::StartWatching(*((BMessenger *)target));
	}

	status_t be_BMimeType_StopWatching_static(be_BMessenger *target) {
		return BMimeTypeBridge::StopWatching(*((BMessenger *)target));
	}

	/* Deprecated. Use SetTo() insted. */
	status_t be_BMimeType_SetType(be_BMimeType *instPointer, const char *mimeType) {
		return ((BMimeTypeBridge *)instPointer)->SetType(mimeType);
	}
}
