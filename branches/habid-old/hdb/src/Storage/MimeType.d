module Storage.MimeType;

import Support.BObject;

import Storage.Mime;
import Storage.StorageDefs;
import Storage.Entry;

import Interface.Bitmap;

import App.Message;

import tango.stdc.stringz;
import tango.stdc.stdlib;

import tango.io.Stdout;

import Support.types;

enum app_verb {
	B_OPEN
}

extern (C) {
	be_BMimeType * 	be_BMimeType_ctor_1();
	be_BMimeType * 	be_BMimeType_ctor_2(char *);
	void	be_BMimeType_dtor(be_BMimeType *);
	int		be_BMimeType_SetTo(be_BMimeType *, char *);
	void	be_BMimeType_Unset(be_BMimeType *);
	int		be_BMimeType_InitCheck(be_BMimeType *);
	char *	be_BMimeType_Type(be_BMimeType *);
	bool	be_BMimeType_IsValid(be_BMimeType *);
	bool	be_BMimeType_IsSupertypeOnly(be_BMimeType *);
	int		be_BMimeType_GetSupertype(be_BMimeType *, be_BMimeType *);
	bool	be_BMimeType_operator_equal_1(be_BMimeType *, be_BMimeType *);
	bool	be_BMimeType_operator_equal_2(be_BMimeType *, char *);
	bool	be_BMimeType_Contains(be_BMimeType *, be_BMimeType *);
	int		be_BMimeType_Install(be_BMimeType *);
	int 	be_BMimeType_Delete(be_BMimeType *);
	bool	be_BMimeType_IsInstalled(be_BMimeType *);

	int		be_BMimeType_GetIcon_1(be_BMimeType *, be_BBitmap *, icon_size size);
	int		be_BMimeType_GetIcon_2(be_BMimeType *, byte **data, int size);
	int		be_BMimeType_GetPreferredApp(be_BMimeType *, char *signature, app_verb verb);	
	int		be_BMimeType_GetAttrInfo(be_BMimeType *, be_BMessage *);
	int		be_BMimeType_GetFileExtensions(be_BMimeType *, be_BMessage *);
	int		be_BMimeType_GetShortDescription(be_BMimeType *, char *desc);
	int		be_BMimeType_GetLongDescription(be_BMimeType *, char *desc);
	int		be_BMimeType_GetSupportingApps(be_BMimeType *, be_BMessage *);

	int		be_BMimeType_SetIcon_1(be_BMimeType *, be_BBitmap *, icon_size size);
	int		be_BMimeType_SetIcon_2(be_BMimeType *, ubyte *, icon_size size);
	int		be_BMimeType_SetPreferredApp(be_BMimeType *, char *, app_verb verb);
	int		be_BMimeType_SetAttrInfo(be_BMimeType *, be_BMessage *);
	int		be_BMimeType_SetFileExtensions(be_BMimeType *, be_BMessage *);
	int		be_BMimeType_SetShortDescription(be_BMimeType *, char *);
	int		be_BMimeType_SetLongDescription(be_BMimeType *, char *);

	// Statics
	int		be_BMimeType_GetInstalledSupertypes_static(be_BMessage *);
	int		be_BMimeType_GetInstalledTypes_1_static(be_BMessage *);
	int		be_BMimeType_GetInstalledTypes_2_static(char *, be_BMessage *);
	int		be_BMimeType_GetWildcardApps_static(be_BMessage *);
	bool	be_BMimeType_IsValid_static(char *);
	// End Statics

	int		be_BMimeType_GetAppHint(be_BMimeType *, entry_ref *);
	int		be_BMimeType_SetAppHint(be_BMimeType *, entry_ref *);

	int		be_BMimeType_GetIconForType_1(be_BMimeType *, char *, be_BBitmap *, icon_size);
	int		be_BMimeType_GetIconForType_2(be_BMimeType *, char *, ubyte **, int *);
	int		be_BMimeType_SetIconForType_1(be_BMimeType *, char *, be_BBitmap *, icon_size);
	int		be_BMimeType_SetIconForType_2(be_BMimeType *, char *, ubyte *, int);

	int		be_BMimeType_GetSnifferRule_1(be_BMimeType *, be_BString *);
	int		be_BMimeType_GetSnifferRule_2(be_BMimeType *, char *);
	int		be_BMimeType_CheckSnifferRule(be_BMimeType *, char *, be_BString *);

	// More statics
	int		be_BMimeType_GuessMimeType_1_static(entry_ref *, be_BMimeType *);
	int		be_BMimeType_GuessMimeType_2_static(be_BMimeType *, int, be_BMimeType *);
	int		be_BMimeType_GuessMimeType_3_static(char *filename, be_BMimeType *);
	int		be_BMimeType_StartWatching_static(be_BMessenger *);
	int		be_BMimeType_StopWatching_static(be_BMessenger *);
	// End More statics

	// Deprecated
	int		be_BMimeType_SetType(be_BMimeType *, char *mimeType);
}

class BMimeType
{
	mixin(BObject!("be_BMimeType", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BMimeType_ctor_1();
	}

	this(char [] mimeType) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMimeType_ctor_2(toStringz(mimeType));
	}

	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BMimeType_dtor(fInstancePointer);
		fInstancePointer = null;
	}

	final int SetTo(char [] mimeType) {
		return be_BMimeType_SetTo(fInstancePointer, toStringz(mimeType));
	}

	final void Unset() {
		be_BMimeType_Unset(fInstancePointer);
	}

	final int	InitCheck() {
		return be_BMimeType_InitCheck(fInstancePointer);
	}

	final char [] Type() {
		return fromStringz(be_BMimeType_Type(fInstancePointer)).dup;
	}

	final bool IsValid() {
		return be_BMimeType_IsValid(fInstancePointer);
	}

	final bool IsSupertypeOnly() {
		return be_BMimeType_IsSupertypeOnly(fInstancePointer);
	}

	final int	GetSupertype(BMimeType mimeType) {
		return be_BMimeType_GetSupertype(fInstancePointer, mimeType.fInstancePointer);
	}

	final bool opEquals(BMimeType type) {
		return be_BMimeType_operator_equal_1(fInstancePointer, type.fInstancePointer);
	}

	final bool opEquals(char [] type) {
		return be_BMimeType_operator_equal_2(fInstancePointer, toStringz(type));
	}

	final bool Contains(BMimeType type) {
		return be_BMimeType_Contains(fInstancePointer, type.fInstancePointer);
	}

	final int Install() {
		return be_BMimeType_Install(fInstancePointer);
	}

	final int Delete() {
		return be_BMimeType_Delete(fInstancePointer);
	}

	final int IsInstalled() {
		return be_BMimeType_IsInstalled(fInstancePointer);
	}

	final int GetIcon(BBitmap bitmap, icon_size size) {
		return be_BMimeType_GetIcon_1(fInstancePointer, bitmap.fInstancePointer, size);
	}

	final int GetIcon(byte **data, int size) {
		return be_BMimeType_GetIcon_2(fInstancePointer, data, size);
	}	

	final int GetPreferredApp(char *signature, app_verb verb) {
		return be_BMimeType_GetPreferredApp(fInstancePointer, signature, verb);
	}

	final int GetAttrInfo(BMessage msg) {
		return be_BMimeType_GetAttrInfo(fInstancePointer, msg.fInstancePointer);
	}

	final int GetFileExtensions(BMessage msg) {
		return be_BMimeType_GetFileExtensions(fInstancePointer, msg.fInstancePointer);
	}

	final int GetShortDescription(ref char [] desc) {
		char * str = cast(char *)malloc(B_MIME_TYPE_LENGTH);

		int ret = be_BMimeType_GetShortDescription(fInstancePointer, str);

		desc = fromStringz(str).dup;

		delete(str);

		return ret;
	}

	final int GetLongDescription(ref char [] desc) {
		char * str = cast(char *)malloc(B_MIME_TYPE_LENGTH);

		int ret = be_BMimeType_GetLongDescription(fInstancePointer, str);

		desc = fromStringz(str).dup;

		delete(str);

		return ret;
	}

	final int GetSupportingApps(BMessage msg) {
		return be_BMimeType_GetSupportingApps(fInstancePointer, msg.fInstancePointer);
	}

	final int SetIcon(BBitmap icon, icon_size size) {
		return be_BMimeType_SetIcon_1(fInstancePointer, icon.fInstancePointer, size);
	}

	final int SetIcon(ubyte * data, icon_size size) {
		return be_BMimeType_SetIcon_2(fInstancePointer, data, size);
	}

	final int SetPreferredApp(char [] signature, app_verb verb) {
		return be_BMimeType_SetPreferredApp(fInstancePointer, toStringz(signature), verb);
	}

	final int SetAttrInfo(BMessage msg) {
		return be_BMimeType_SetAttrInfo(fInstancePointer, msg.fInstancePointer);
	}
	
	final int SetFileExtensions(BMessage msg) {
		return be_BMimeType_SetFileExtensions(fInstancePointer, msg.fInstancePointer);
	}

	final int SetShortDescription(char [] desc) {
		return be_BMimeType_SetShortDescription(fInstancePointer, toStringz(desc));
	}

	final int SetLongDescription(char [] desc) {
		return be_BMimeType_SetLongDescription(fInstancePointer, toStringz(desc));
	}

	final static int GetInstalledSupertypes(BMessage msg) {
		return be_BMimeType_GetInstalledSupertypes_static(msg.fInstancePointer);
	}

	final static int GetInstalledTypes(BMessage msg) {
		return be_BMimeType_GetInstalledTypes_1_static(msg.fInstancePointer);
	}

	final static int GetInstalledTypes(char [] supertype, BMessage msg) {
		return be_BMimeType_GetInstalledTypes_2_static(toStringz(supertype), msg.fInstancePointer);
	}

	final static int GetWildcardApps(BMessage msg) {
		return be_BMimeType_GetWildcardApps_static(msg.fInstancePointer);
	}

	final static bool IsValid(char [] mimeType) {
		return be_BMimeType_IsValid_static(toStringz(mimeType));
	}
}

