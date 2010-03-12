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

enum app_verb {
	B_OPEN
}

extern (C) {
	void *	be_BMimeType_ctor_1();
	void *	be_BMimeType_ctor_2(char *);
	void	be_BMimeType_dtor(void *);
	int		be_BMimeType_SetTo(void *, char *);
	void	be_BMimeType_Unset(void *);
	int		be_BMimeType_InitCheck(void *);
	char *	be_BMimeType_Type(void *);
	bool	be_BMimeType_IsValid(void *);
	bool	be_BMimeType_IsSupertypeOnly(void *);
	int		be_BMimeType_GetSupertype(void *, void *);
	bool	be_BMimeType_operator_equal_1(void *, void *);
	bool	be_BMimeType_operator_equal_2(void *, char *);
	bool	be_BMimeType_Contains(void *, void *);
	int		be_BMimeType_Install(void *);
	int 	be_BMimeType_Delete(void *);
	bool	be_BMimeType_IsInstalled(void *);

	int		be_BMimeType_GetIcon_1(void *, void *, icon_size size);
	int		be_BMimeType_GetIcon_2(void *, byte **data, int size);
	int		be_BMimeType_GetPreferredApp(void *, char *signature, app_verb verb);	int		be_BMimeType_GetAttrInfo(void *, void *);
	int		be_BMimeType_GetFileExtensions(void *, void *);
	int		be_BMimeType_GetShortDescription(void *, char *desc);
	int		be_BMimeType_GetLongDescription(void *, char *desc);
	int		be_BMimeType_GetSupportingApps(void *, void *);

	int		be_BMimeType_SetIcon_1(void *, void *, icon_size size);
	int		be_BMimeType_SetIcon_2(void *, ubyte *, icon_size size);
	int		be_BMimeType_SetPreferredApp(void *, char *, app_verb verb);
	int		be_BMimeType_SetAttrInfo(void *, void *);
	int		be_BMimeType_SetFileExtensions(void *, void *);
	int		be_BMimeType_SetShortDescription(void *, char *);
	int		be_BMimeType_SetLongDescription(void *, char *);

	// Statics
	int		be_BMimeType_GetInstalledSupertypes_static(void *);
	int		be_BMimeType_GetInstalledTypes_1_static(void *);
	int		be_BMimeType_GetInstalledTypes_2_static(char *, void *);
	int		be_BMimeType_GetWildcardApps_static(void *);
	bool	be_BMimeType_IsValid_static(char *);
	// End Statics

	int		be_BMimeType_GetAppHint(void *, entry_ref *);
	int		be_BMimeType_SetAppHint(void *, entry_ref *);

	int		be_BMimeType_GetIconForType_1(void *, char *, void *, icon_size);
	int		be_BMimeType_GetIconForType_2(void *, char *, ubyte **, int *);
	int		be_BMimeType_SetIconForType_1(void *, char *, void *, icon_size);
	int		be_BMimeType_SetIconForType_2(void *, char *, ubyte *, int);

	int		be_BMimeType_GetSnifferRule_1(void *, void *);
	int		be_BMimeType_GetSnifferRule_2(void *, char *);
	int		be_BMimeType_CheckSnifferRule(void *, char *, void *);

	// More statics
	int		be_BMimeType_GuessMimeType_1_static(entry_ref *, void *);
	int		be_BMimeType_GuessMimeType_2_static(void *, int, void *);
	int		be_BMimeType_GuessMimeType_3_static(char *filename, void *);
	int		be_BMimeType_StartWatching_static(void *);
	int		be_BMimeType_StopWatching_static(void *);
	// End More statics

	// Deprecated
	int		be_BMimeType_SetType(void *, char *mimeType);
}

class BMimeType
{
	mixin BObject;

	this() {
		fInstancePointer = be_BMimeType_ctor_1();
	}

	this(char [] mimeType) {
		fInstancePointer = be_BMimeType_ctor_2(toStringz(mimeType));
	}

	~this() {
		if(fInstancePointer !is null)
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

