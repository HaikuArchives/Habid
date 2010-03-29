module App.Message;

import Support.BObject;

import Support.SupportDefs;
import Support.String;
import Support.DataIO;
import Support.Flattenable;

import Storage.Entry;

import Support.Errors;

import tango.stdc.posix.sys.types;
import tango.stdc.stdlib;
import tango.stdc.stringz;
import tango.io.Stdout;

extern (C) extern
{
	void * be_BMessage_ctor_1(void *bindInstPointer);
	void * be_BMessage_ctor_2(void *bindInstPointer, uint32 what);
	void * be_BMessage_ctor_3(void *bindInstPointer, void *other);
	void be_BMessage_dtor(void *);
	
	void * be_BMessage_operator_assign(void *, void *other);

		// Statistics and misc info
	status_t be_BMessage_GetInfo_1(void *, type_code typeRequested, int32 index, char **nameFound, type_code *typeFound, int32 *countFound);
	status_t be_BMessage_GetInfo_2(void *, char *name, type_code *typeFound, int32 *countFound);
	status_t be_BMessage_GetInfo_3(void *, char *name, type_code *typeFound, bool *fixedSize);
	int32 be_BMessage_CountNames(void *, type_code type);
	bool be_BMessage_IsEmpty(void *);
	bool be_BMessage_IsSystem(void *);
	bool be_BMessage_IsReply(void *);
	void be_BMessage_PrintToStream(void *);

	status_t be_BMessage_Rename(void *, char *oldEntry, char *newEntry);

	// Delivery info
	bool be_BMessage_WasDelivered(void *);
	bool be_BMessage_IsSourceWaiting(void *);
	bool be_BMessage_IsSourceRemote(void *);
//	BMessenger		ReturnAddress() const;
	void * be_BMessage_Previous(void *);
	bool be_BMessage_WasDropped(void *);
//	BPoint	DropPoint(BPoint *offset = NULL) const;


	// Replying
	status_t be_BMessage_SendReply_1(void *, uint32 command, void *replyTo);
	status_t be_BMessage_SendReply_2(void *, void *reply, void *replyTo,
							bigtime_t timeout);
	status_t be_BMessage_SendReply_3(void *, void *reply, void *replyTo,
							bigtime_t timeout);
	status_t be_BMessage_SendReply_4(void *, uint32 command, void *replyToReply);
	status_t be_BMessage_SendReply_5(void *, void *the_reply, void *replyToReply,
							bigtime_t sendTimeout, bigtime_t replyTimeout);

	// Flattening data
	ssize_t be_BMessage_FlattenedSize(void *);
	status_t be_BMessage_Flatten_1(void *, char *buffer, ssize_t size);
	status_t be_BMessage_Flatten_2(void *, void *stream, ssize_t *size);
	status_t be_BMessage_Unflatten_1(void *, char *flatBuffer);
	status_t be_BMessage_Unflatten_2(void *, void *stream);

	// Specifiers (scripting)
	status_t be_BMessage_AddSpecifier_1(void *, char *property);
	status_t be_BMessage_AddSpecifier_2(void *, char *property, int32 index);
	status_t be_BMessage_AddSpecifier_3(void *, char *property, int32 index, int32 range);
	status_t be_BMessage_AddSpecifier_4(void *, char *property, char *name);
	status_t be_BMessage_AddSpecifier_5(void *, void *specifier);

	status_t be_BMessage_SetCurrentSpecifier(void *, int32 index);
	status_t be_BMessage_GetCurrentSpecifier(void *, int32 *index, void *specifier, int32 *what, char **property);
	bool be_BMessage_HasSpecifiers(void *);
	status_t be_BMessage_PopSpecifier(void *);


	// Adding data
	status_t be_BMessage_AddRect(void *, char *name, void *aRect);
	status_t be_BMessage_AddPoint(void *, char *name, void *aPoint);
	status_t be_BMessage_AddString_1(void *, char *name, char *aString);
	status_t be_BMessage_AddString_2(void *, char *name, void *aString);
	status_t be_BMessage_AddInt8(void *, char *name, int8 value);
	status_t be_BMessage_AddUInt8(void *, char *name, uint8 value);
	status_t be_BMessage_AddInt16(void *, char *name, int16 value);
	status_t be_BMessage_AddUInt16(void *, char *name, uint16 value);
	status_t be_BMessage_AddInt32(void *, char *name, int32 value);
	status_t be_BMessage_AddUInt32(void *, char *name, uint32 value);
	status_t be_BMessage_AddInt64(void *, char *name, int64 value);
	status_t be_BMessage_AddUInt64(void *, char *name, uint64 value);
	status_t be_BMessage_AddBool(void *, char *name, bool aBoolean);
	status_t be_BMessage_AddFloat(void *, char *name, float aFloat);
	status_t be_BMessage_AddDouble(void *, char *name, double aDouble);
	status_t be_BMessage_AddPointer(void *, char *name, void *aPointer);
	status_t be_BMessage_AddMessenger(void *, char *name, void *messenger);
	status_t be_BMessage_AddRef(void *, char *name, entry_ref *);
	status_t be_BMessage_AddMessage(void *, char *name, void *message);
	status_t be_BMessage_AddFlat(void *, char *name, void *object, int32 count);
	status_t be_BMessage_AddData(void *, char *name, type_code type, void *data, ssize_t numBytes, bool isFixedSize, int32 count);


	// Removing data
	status_t be_BMessage_RemoveData(void *, char *name, int32 index);
	status_t be_BMessage_RemoveName(void *, char *name);
	status_t be_BMessage_MakeEmpty(void *);

	// Finding data
	status_t be_BMessage_FindRect_1(void *, char *name, void *rect);
	status_t be_BMessage_FindRect_2(void *, char *name, int32 index, void *rect);
	status_t be_BMessage_FindPoint_1(void *, char *name, void *point);
	status_t be_BMessage_FindPoint_2(void *, char *name, int32 index, void *point);
	status_t be_BMessage_FindString_1(void *, char *name, char **string);
	status_t be_BMessage_FindString_2(void *, char *name, int32 index, char **string);
	status_t be_BMessage_FindString_3(void *, char *name, void *string);
	status_t be_BMessage_FindString_4(void *, char *name, int32 index, void *string);
	status_t be_BMessage_FindInt8_1(void *, char *name, int8 *value);
	status_t be_BMessage_FindInt8_2(void *, char *name, int32 index, int8 *value);
	status_t be_BMessage_FindUInt8_1(void *, char *name, uint8 *value);
	status_t be_BMessage_FindUInt8_2(void *, char *name, int32 index, uint8 *value);
	status_t be_BMessage_FindInt16_1(void *, char *name, int16 *value);
	status_t be_BMessage_FindInt16_2(void *, char *name, int32 index, int16 *value);
	status_t be_BMessage_FindUInt16_1(void *, char *name, uint16 *value);
	status_t be_BMessage_FindUInt16_2(void *, char *name, int32 index, uint16 *value);
	status_t be_BMessage_FindInt32_1(void *, char *name, int32 *value);
	status_t be_BMessage_FindInt32_2(void *, char *name, int32 index, int32 *value);
	status_t be_BMessage_FindUInt32_1(void *, char *name, uint32 *value);
	status_t be_BMessage_FindUInt32_2(void *, char *name, int32 index, uint32 *value);
	status_t be_BMessage_FindInt64_1(void *, char *name, int64 *value);
	status_t be_BMessage_FindInt64_2(void *, char *name, int32 index, int64 *value);
	status_t be_BMessage_FindUInt64_1(void *, char *name, uint64 *value);
	status_t be_BMessage_FindUInt64_2(void *, char *name, int32 index, uint64 *value);
	status_t be_BMessage_FindBool_1(void *, char *name, bool *value);
	status_t be_BMessage_FindBool_2(void *, char *name, int32 index, bool *value);
	status_t be_BMessage_FindFloat_1(void *, char *name, float *value);
	status_t be_BMessage_FindFloat_2(void *, char *name, int32 index, float *value);
	status_t be_BMessage_FindDouble_1(void *, char *name, double *value);
	status_t be_BMessage_FindDouble_2(void *, char *name, int32 index, double *value);
	status_t be_BMessage_FindPointer_1(void *, char *name, void **pointer);
	status_t be_BMessage_FindPointer_2(void *, char *name, int32 index,  void **pointer);
	status_t be_BMessage_FindMessenger_1(void *, char *name, void *messenger);
	status_t be_BMessage_FindMessenger_2(void *, char *name, int32 index, void *messenger);
	status_t be_BMessage_FindRef_1(void *, char *name, entry_ref *);
	status_t be_BMessage_FindRef_2(void *, char *name, int32 index, entry_ref *);
	status_t be_BMessage_FindMessage_1(void *, char *name, void *message);
	status_t be_BMessage_FindMessage_2(void *, char *name, int32 index, void *message);
	status_t be_BMessage_FindFlat_1(void *, char *name, void *object);
	status_t be_BMessage_FindFlat_2(void *, char *name, int32 index, void *object);
	status_t be_BMessage_FindData_1(void *, char *name, type_code type,
							void **data, ssize_t *numBytes);
	status_t be_BMessage_FindData_2(void *, char *name, type_code type, int32 index,
							void **data, ssize_t *numBytes);

	// Replacing data
	status_t be_BMessage_ReplaceRect_1(void *, char *name, void *aRect);
	status_t be_BMessage_ReplaceRect_2(void *, char *name, int32 index, void *aRect);
	status_t be_BMessage_ReplacePoint_1(void *, char *name, void *aPoint);
	status_t be_BMessage_ReplacePoint_2(void *, char *name, int32 index, void *aPoint);
	status_t be_BMessage_ReplaceString_1(void *, char *name, char *aString);
	status_t be_BMessage_ReplaceString_2(void *, char *name, int32 index, char *aString);
	status_t be_BMessage_ReplaceString_3(void *, char *name, void *aString);
	status_t be_BMessage_ReplaceString_4(void *, char *name, int32 index, void *aString);
	status_t be_BMessage_ReplaceInt8_1(void *, char *name, int8 value);
	status_t be_BMessage_ReplaceInt8_2(void *, char *name, int32 index, int8 value);
	status_t be_BMessage_ReplaceUInt8_1(void *, char *name, uint8 value);
	status_t be_BMessage_ReplaceUInt8_2(void *, char *name, int32 index, uint8 value);
	status_t be_BMessage_ReplaceInt16_1(void *, char *name, int16 value);
	status_t be_BMessage_ReplaceInt16_2(void *, char *name, int32 index, int16 value);
	status_t be_BMessage_ReplaceUInt16_1(void *, char *name, uint16 value);
	status_t be_BMessage_ReplaceUInt16_2(void *, char *name, int32 index, uint16 value);
	status_t be_BMessage_ReplaceInt32_1(void *, char *name, int32 value);
	status_t be_BMessage_ReplaceInt32_2(void *, char *name, int32 index, int32 value);
	status_t be_BMessage_ReplaceUInt32_1(void *, char *name, uint32 value);
	status_t be_BMessage_ReplaceUInt32_2(void *, char *name, int32 index, uint32 value);
	status_t be_BMessage_ReplaceInt64_1(void *, char *name, int64 value);
	status_t be_BMessage_ReplaceInt64_2(void *, char *name, int32 index, int64 value);
	status_t be_BMessage_ReplaceUInt64_1(void *, char *name, uint64 value);
	status_t be_BMessage_ReplaceUInt64_2(void *, char *name, int32 index, uint64 value);
	status_t be_BMessage_ReplaceBool_1(void *, char *name, bool aBoolean);
	status_t be_BMessage_ReplaceBool_2(void *, char *name, int32 index, bool aBoolean);
	status_t be_BMessage_ReplaceFloat_1(void *, char *name, float aFloat);
	status_t be_BMessage_ReplaceFloat_2(void *, char *name, int32 index, float aFloat);
	status_t be_BMessage_ReplaceDouble_1(void *, char *name, double aDouble);
	status_t be_BMessage_ReplaceDouble_2(void *, char *name, int32 index, double aDouble);
	status_t be_BMessage_ReplacePointer_1(void *, char *name, void *pointer);
	status_t be_BMessage_ReplacePointer_2(void *, char *name, int32 index, void *pointer);
	status_t be_BMessage_ReplaceMessenger_1(void *, char *name, void *messenger);
	status_t be_BMessage_ReplaceMessenger_2(void *, char *name, int32 index, void *messenger);
	status_t be_BMessage_ReplaceRef_1(void *, char *name,entry_ref *);
	status_t be_BMessage_ReplaceRef_2(void *, char *name, int32 index, entry_ref *);
	status_t be_BMessage_ReplaceMessage_1(void *, char *name, void *message);
	status_t be_BMessage_ReplaceMessage_2(void *, char *name, int32 index, void *message);
	status_t be_BMessage_ReplaceFlat_1(void *, char *name, void *object);
	status_t be_BMessage_ReplaceFlat_2(void *, char *name, int32 index, void *object);
	status_t be_BMessage_ReplaceData_1(void *, char *name, type_code type,
							void *data, ssize_t numBytes);
	status_t be_BMessage_ReplaceData_2(void *, char *name, type_code type, int32 index,
							void *data, ssize_t numBytes);

/*
		// Comparing data - Haiku experimental API
		bool			HasSameData(BMessage &other,
							bool ignoreFieldOrder = true, bool deep = false) const;

		void			*operator new(size_t size);
		void			*operator new(size_t, void *pointer);
		void			operator delete(void *pointer, size_t size);
*/

		// Private, reserved, or obsolete
	bool be_BMessage_HasRect(void *, char *name, int32 n);
	bool be_BMessage_HasPoint(void *, char *name, int32 n);
	bool be_BMessage_HasString(void *, char *name, int32 n);
	bool be_BMessage_HasInt8(void *, char *name, int32 n);
	bool be_BMessage_HasUInt8(void *, char *name, int32 n);
	bool be_BMessage_HasInt16(void *, char *name, int32 n);
	bool be_BMessage_HasUInt16(void *, char *name, int32 n);
	bool be_BMessage_HasInt32(void *, char *name, int32 n);
	bool be_BMessage_HasUInt32(void *, char *name, int32 n);
	bool be_BMessage_HasInt64(void *, char *name, int32 n);
	bool be_BMessage_HasUInt64(void *, char *name, int32 n);
	bool be_BMessage_HasBool(void *, char *name, int32 n);
	bool be_BMessage_HasFloat(void *, char *name, int32 n);
	bool be_BMessage_HasDouble(void *, char *name, int32 n);
	bool be_BMessage_HasPointer(void *, char *name, int32 n);
	bool be_BMessage_HasMessenger(void *, char *name, int32 n);
	bool be_BMessage_HasRef(void *, char *name, int32 n);
	bool be_BMessage_HasMessage(void *, char *name, int32 n);
	bool be_BMessage_HasFlat_1(void *, char *name, void *flat);
	bool be_BMessage_HasFlat_2(void *, char *name, int32 n, void *flat);
	bool be_BMessage_HasData(void *, char *name, type_code type, int32 n);
	void *be_BMessage_FindRect(void *, char *name, int32 n);
	void *be_BMessage_FindPoint(void *, char *name, int32 n);
	char *be_BMessage_FindString(void *, char *name, int32 n);
	int8 be_BMessage_FindInt8(void *, char *name, int32 n);
	int16 be_BMessage_FindInt16(void *, char *name, int32 n);
	int32 be_BMessage_FindInt32(void *, char *name, int32 n);
	int64 be_BMessage_FindInt64(void *, char *name, int32 n);
	bool be_BMessage_FindBool(void *, char *name, int32 n);
	float be_BMessage_FindFloat(void *, char *name, int32 n);
	double be_BMessage_FindDouble(void *, char *name, int32 n);
}

const int B_FIELD_NAME_LENGTH		= 255;
const int B_PROPERTY_NAME_LENGTH	= 255;

enum {
	B_NO_SPECIFIER = 0,
	B_DIRECT_SPECIFIER = 1,
	B_INDEX_SPECIFIER,
	B_REVERSE_INDEX_SPECIFIER,
	B_RANGE_SPECIFIER,
	B_REVERSE_RANGE_SPECIFIER,
	B_NAME_SPECIFIER,
	B_ID_SPECIFIER,

	B_SPECIFIERS_END = 128
	// app-defined specifiers start at B_SPECIFIERS_END + 1
}

class BMessage
{
public:
	mixin BObject;
	
	this(void *instancePointer = null) {
		if(fInstancePointer is null && instancePointer is null)
			fInstancePointer = be_BMessage_ctor_1(cast(void *)this);
		else
			fInstancePointer = instancePointer;	
	}
	
	this(uint32 what) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessage_ctor_2(cast(void *)this, what);
	}
	
	this(BMessage other) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessage_ctor_3(cast(void *)this, other.fInstancePointer);
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BMessage_dtor(fInstancePointer);
	}
	
//	void * be_BMessage_operator_assign(void *, void *other);

	status_t GetInfo(type_code typeRequested, int32 index, inout char [] nameFound, inout type_code typeFound, inout int32 countFound) {
		char *nameBuffer;
		
		status_t ret = be_BMessage_GetInfo_1(fInstancePointer, typeRequested, index, &nameBuffer, &typeFound, &countFound);

		if(ret < B_OK) return ret;
		
		nameFound = fromStringz(nameBuffer);
		
		return ret;
	}
	
	// Statistics and misc info
	status_t GetInfo(char [] name, inout type_code typeFound, inout int32 countFound) {
		return be_BMessage_GetInfo_2(fInstancePointer, toStringz(name), &typeFound, &countFound);
	}


	status_t GetInfo(char [] name, inout type_code typeFound, inout bool fixedSize) {
		return be_BMessage_GetInfo_3(fInstancePointer, toStringz(name), &typeFound, &fixedSize);
	}

	int32 CountNames(type_code type) {
		return be_BMessage_CountNames(fInstancePointer, type);
	}
	
	bool IsEmpty() {
		return be_BMessage_IsEmpty(fInstancePointer);
	}
	
	bool IsSystem() {
		return be_BMessage_IsSystem(fInstancePointer);
	}
	
	bool IsReply() {
		return be_BMessage_IsReply(fInstancePointer);
	}
	
	void PrintToStream() {
		be_BMessage_PrintToStream(fInstancePointer);
	}
	status_t Rename(char [] oldEntry, char [] newEntry) {
		return be_BMessage_Rename(fInstancePointer, toStringz(oldEntry), toStringz(newEntry));
	}


	// Delivery info
	bool WasDeliviered() {
		return be_BMessage_WasDelivered(fInstancePointer);
	}
	
	bool IsSourceWaiting() {
		return be_BMessage_IsSourceWaiting(fInstancePointer);
	}
	
	bool IsSourceRemote() {
		return be_BMessage_IsSourceRemote(fInstancePointer);
	}
	
//	BMessenger		ReturnAddress() const;

	// Should i realy do it this way? :)
	BMessage Previous() {
		return new BMessage(be_BMessage_Previous(fInstancePointer));
	}
	
	bool WasDropped() {
		return be_BMessage_WasDropped(fInstancePointer);
	}
	
//	BPoint	DropPoint(BPoint *offset = NULL) const;

/*
	// Replying
	status_t SendReply(uint32 command, BHandler replyTo = null) {
		return be_BMessage_SendReply_1(fInstancePointer, command, replyTo is null ? null : replyTo.fInstancePointer);
	}
	
	status_t SendReply(BMessage reply, BHandler replyTo = null, bigtime_t timeout = B_INFINITE_TIMEOUT) {
		return be_BMessage_SendReply_2(fInstancePointer,
										reply.fInstancePointer,
										replyTo is null ? null : replyTo.fInstancePointer,
										timeout);
	}
	
	status_t SendReply(BMessage reply, BMessenger replyTo, bigtime_t timeout = B_INFINITE_TIMEOUT) {
		return be_BMessage_SendReply_3(fInstancePointer, reply.fInstancePointer, replyTo.fInstancePointer, timeout);
	}
	
	status_t SendReply(uint32 command, BMessage replyToReply) {
		return be_BMessage_SendReply_4(fInstancePointer, command, replyToReply.fInstancePointer);
	}
	
	status_t SendReply(BMessage the_reply, BMessage replyToReply, bigtime_t sendTimeout = B_INFINITE_TIMEOUT, bigtime_t replyTimeout = B_INFINITE_TIMEOUT) {
		return be_BMessage_SendReply_5(fInstancePointer, the_reply.fInstancePointer, replyToReply.fInstancePointer, sendTimeout, replyTimeout);
	}
*/
	

	// Flattening data
	ssize_t FlattenedSize() {
		return be_BMessage_FlattenedSize(fInstancePointer);
	}
	
	status_t Flatten(inout char [] buffer) {
		return be_BMessage_Flatten_1(fInstancePointer, buffer.ptr, buffer.length);
	}
	
	status_t Flatten(BDataIO stream, inout ssize_t size) {
		return be_BMessage_Flatten_2(fInstancePointer, stream.fInstancePointer, &size);
	}
	
	status_t Unflatten(char [] flatBuffer) {
		return be_BMessage_Unflatten_1(fInstancePointer, flatBuffer.ptr);
	}
	
	status_t Unflatten(BDataIO stream) {
		return be_BMessage_Unflatten_2(fInstancePointer, stream.fInstancePointer);
	}


	// Specifiers (scripting)
	status_t AddSpecifier(char [] property) {
		return be_BMessage_AddSpecifier_1(fInstancePointer, toStringz(property));
	}
	
	status_t AddSpecifier(char [] property, int32 index) {
		return be_BMessage_AddSpecifier_2(fInstancePointer, toStringz(property), index);
	}
	
	status_t AddSpecifier(char [] property, int32 index, int32 range) {
		return be_BMessage_AddSpecifier_3(fInstancePointer, toStringz(property), index, range);
	}
	
	status_t AddSpecifier(char [] property, char [] name) {
		return be_BMessage_AddSpecifier_4(fInstancePointer, toStringz(property), toStringz(name));
	}
	
	status_t AddSpecifier(BMessage specifier) {
		return be_BMessage_AddSpecifier_5(fInstancePointer, specifier.fInstancePointer);
	}

	status_t SetCurrentSpecifier(int32 index) {
		return be_BMessage_SetCurrentSpecifier(fInstancePointer, index);
	}
/*	
	status_t GetCurrentSpecifier(inout int32 index, BMessage specifier, inout int32 what, char [] property) {
		be_BMessage_GetCurrentSpecifier(void *, int32 *index, void *specifier, int32 *what, char **property);
	}
*/
	
	bool HasSpecifiers() {
		return be_BMessage_HasSpecifiers(fInstancePointer);
	}
	
	status_t PopSpecifier() {
		return be_BMessage_PopSpecifier(fInstancePointer);
	}

	// Adding data
//	status_t be_BMessage_AddRect(void *, char *name, void *aRect);
//	status_t be_BMessage_AddPoint(void *, char *name, void *aPoint);
	
	status_t AddString(char [] name, char [] string) {
		return be_BMessage_AddString_1(fInstancePointer, toStringz(name), toStringz(string));
	}
	
	status_t AddString(char [] name, BString string) {
		return be_BMessage_AddString_2(fInstancePointer, toStringz(name), string.fInstancePointer);
	}
	
	status_t AddInt8(char [] name, int8 value) {
		return be_BMessage_AddInt8(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddUInt8(char [] name, uint8 value) {
		return be_BMessage_AddUInt8(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddInt16(char [] name, int16 value) {
		return be_BMessage_AddInt16(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddUInt16(char [] name, uint16 value) {
		return be_BMessage_AddUInt16(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddInt32(char [] name, int32 value) {
		return be_BMessage_AddInt32(fInstancePointer, toStringz(name), value);
	}

	status_t AddUInt32(char [] name, int32 value) {
		return be_BMessage_AddUInt32(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddInt64(char [] name, int64 value) {
		return be_BMessage_AddInt64(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddUint64(char [] name, uint64 value) {
		return be_BMessage_AddUInt64(fInstancePointer, toStringz(name), value);
	}
	
	status_t AddBool(char [] name, bool aBoolean) {
		return be_BMessage_AddBool(fInstancePointer, toStringz(name), aBoolean);
	}
	
	status_t AddFloat(char [] name, float aFloat) {
		return be_BMessage_AddFloat(fInstancePointer, toStringz(name), aFloat);
	}
	
	status_t AddDouble(char [] name, double aDouble) {
		return be_BMessage_AddDouble(fInstancePointer, toStringz(name), aDouble);
	}
	
	status_t AddPointer(char [] name, void *aPointer) {
		return be_BMessage_AddPointer(fInstancePointer, toStringz(name), aPointer);
	}
/*
	status_t AddMessenger(char [] name, BMessenger messenger) {
		return be_BMessage_AddMessenger(fInstancePointer, toStringz(name), messenger.fInstancePointer);
	}
*/
	
	status_t AddRef(char [] name, entry_ref reference) {
		return be_BMessage_AddRef(fInstancePointer, toStringz(name), &reference);
	}
	
	status_t AddMessage(char [] name, BMessage message) {
		return be_BMessage_AddMessage(fInstancePointer, toStringz(name), message.fInstancePointer);
	}
	
	status_t AddFlat(char [] name, BFlattenable flat, int32 count) {
		return be_BMessage_AddFlat(fInstancePointer, toStringz(name), flat.fInstancePointer, count);
	}
	
	status_t AddData(char [] name, type_code type, void [] data, bool isFixedSize = true, int32 count = 1) {
		return be_BMessage_AddData(fInstancePointer, toStringz(name), type, data.ptr, data.length, isFixedSize, count);
	}


	// Removing data
	status_t RemoveData(char [] name, int32 index) {
		return be_BMessage_RemoveData(fInstancePointer, toStringz(name), index);
	}
	
	status_t RemoveName(char [] name) {
		return be_BMessage_RemoveName(fInstancePointer, toStringz(name));
	}
	
	status_t MakeEmpty() {
		return be_BMessage_MakeEmpty(fInstancePointer);
	}


	// Finding data
/*
	status_t FindRect(char [] name, inout BRect rect) {
		return be_BMessage_FindRect_1(fInstancePointer, toStringz(name), rect.fInstancePointer);
	}
	
	status_t FindRect(char [] name, int32 index, inout BRect rect) {
		return be_BMessage_FindRect_2(fInstancePointer, toStringz(name), index, rect.fInstancePointer);
	}
	
	status_t FindPoint(char [] name, inout BPoint point) {
		return be_BMessage_FindPoint_1(fInstancePointer, toStringz(name), point.fInstancePointer);
	}
	
	status_t FindPoint(char [] name, int32 index, inout BPoint point) {
		return be_BMessage_FindPoint_2(fInstancePointer, toStringz(name), index, point.fInstancePointer);
	}
*/
	
	status_t FindString(char [] name, inout char [] string) {
		char *tmpString;
		
		status_t ret = be_BMessage_FindString_1(fInstancePointer, toStringz(name), &tmpString);
		
		if(ret < B_OK) return ret;
		
		string = fromStringz(tmpString);
		
		return ret;
	}
	
	status_t FindString(char [] name, int32 index, inout char [] string) {
		char *tmpString;
		
		status_t ret = be_BMessage_FindString_2(fInstancePointer, toStringz(name), index, &tmpString);
	
		if(ret < B_OK) return ret;
		
		string = fromStringz(tmpString);
		
		return ret;
	}
	
	status_t FindString(char [] name, BString string) {
		return be_BMessage_FindString_3(fInstancePointer, toStringz(name), string.fInstancePointer);
	}
	
	status_t FindString(char [] name, int32 index, BString string) {
		return be_BMessage_FindString_4(fInstancePointer, toStringz(name), index, string.fInstancePointer);
	}
	
	status_t FindInt8(char [] name, inout int8 value) {
		return be_BMessage_FindInt8_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindInt8(char [] name, int32 index, inout int8 value) {
		return be_BMessage_FindInt8_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindUInt8(char [] name, inout uint8 value) {
		return be_BMessage_FindUInt8_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindUInt8(char [] name, int32 index, inout uint8 value) {
		return be_BMessage_FindUInt8_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindInt16(char [] name, inout int16 value) {
		return be_BMessage_FindInt16_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindInt16(char [] name, int32 index, inout int16 value) {
		return be_BMessage_FindInt16_2(fInstancePointer, toStringz(name), index, &value);
	}

	status_t FindUInt16(char [] name, inout uint16 value) {
		return be_BMessage_FindUInt16_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindUInt16(char [] name, int32 index, inout uint16 value) {
		return be_BMessage_FindUInt16_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindInt32(char [] name, inout int32 value) {
		return be_BMessage_FindInt32_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindInt32(char [] name, int32 index, inout int32 value) {
		return be_BMessage_FindInt32_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindUInt32(char [] name, inout uint32 value) {
		return be_BMessage_FindUInt32_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindUInt32(char [] name, int32 index, inout uint32 value) {
		return be_BMessage_FindUInt32_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindInt64(char [] name, inout int64 value) {
		return be_BMessage_FindInt64_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindInt64(char [] name, int32 index, inout int64 value) {
		return be_BMessage_FindInt64_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindUInt64(char [] name, inout uint64 value) {
		return be_BMessage_FindUInt64_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindUInt64(char [] name, int32 index, inout uint64 value) {
		return be_BMessage_FindUInt64_2(fInstancePointer, toStringz(name), index, &value);
	}


	status_t FindBool(char [] name, inout bool value) {
		return be_BMessage_FindBool_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindBool(char [] name, int32 index, inout bool value) {
		return be_BMessage_FindBool_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindFloat(char [] name, inout float value) {
		return be_BMessage_FindFloat_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindFloat(char [] name, int32 index, inout float value) {
		return be_BMessage_FindFloat_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindDouble(char [] name, inout double value) {
		return be_BMessage_FindDouble_1(fInstancePointer, toStringz(name), &value);
	}
	
	status_t FindDouble(char [] name, int32 index, inout double value) {
		return be_BMessage_FindDouble_2(fInstancePointer, toStringz(name), index, &value);
	}
	
	status_t FindPointer(char [] name, void *pointer) {
		return be_BMessage_FindPointer_1(fInstancePointer, toStringz(name), &pointer);
	}
	
	status_t FindPointer(char [] name, int32 index, void *pointer) {
		return be_BMessage_FindPointer_2(fInstancePointer, toStringz(name), index, &pointer);
	}

/*
	status_t FindMessenger(char [] name, inout BMessenger messenger) {
		return be_BMessage_FindMessenger_1(void *, char *name, void *messenger);
	}
	
	status_t FindMessenger(char [] name, int32 index, inout BMessenger messenger) {
		return be_BMessage_FindMessenger_2(void *, char *name, int32 index, void *messenger);
	}
*/	
	status_t FindRef(char [] name, inout entry_ref reference) {
		return be_BMessage_FindRef_1(fInstancePointer, toStringz(name), &reference);
	}
	
	status_t FindRef(char [] name, int32 index, inout entry_ref reference) {
		return be_BMessage_FindRef_2(fInstancePointer, toStringz(name), index, &reference);
	}
	
	status_t FindMessage(char [] name, inout BMessage message) {
		void *tmpInstancePointer;
		
		status_t ret = be_BMessage_FindMessage_1(fInstancePointer, toStringz(name), tmpInstancePointer);
		
		if(ret < B_OK) return ret;

		message = new BMessage(tmpInstancePointer);
		
		return ret;
	}
	
	status_t FindMessage(char [] name, int32 index, inout BMessage message) {
		void *tmpInstancePointer;
		
		status_t ret = be_BMessage_FindMessage_2(fInstancePointer, toStringz(name), index, tmpInstancePointer);
		
		if(ret < B_OK) return ret;

		message = new BMessage(tmpInstancePointer);
		
		return ret;
	}
/*
	status_t FindFlat(char [] name, inout BFlattenable flat) {
		void *tmpInstancePointer;
		
		status_t ret = be_BMessage_FindFlat_1(fInstancePointer, toStringz(name), tmpInstancePointer);
		
		if(ret < B_OK) return ret;

		flat = new BFlattenable(tmpInstancePointer);
		
		return ret;
	}
	
	status_t FindFlat(char [] name, int32 index, inout BFlattenable flat) {
		void *tmpInstancePointer;
		
		status_t ret = be_BMessage_FindFlat_2(fInstancePointer, toStringz(name), index, tmpInstancePointer);
	
		if(ret < B_OK) return ret;

		flat = new BFlattenable(tmpInstancePointer);
		
		return ret;
	}
*/
	
	status_t FindData(char [] name, type_code type, inout void [] data, inout ssize_t numBytes) {
		void *tmpData;
		
		status_t ret = be_BMessage_FindData_1(fInstancePointer, toStringz(name), type, &tmpData, &numBytes);
		
		if(ret < B_OK) return ret;
		
		data = tmpData[0..numBytes];
		
		return ret;
	}
	
	status_t FindData(char [] name, type_code type, int32 index, inout void [] data, inout ssize_t numBytes) {
		void *tmpData;
		
		status_t ret = be_BMessage_FindData_2(fInstancePointer, toStringz(name), type, index, &tmpData, &numBytes);
		
		if(ret < B_OK) return ret;
		
		data = tmpData[0..numBytes];
		
		return ret;
	}

	// Replacing data
/*
	status_t ReplaceRect(char [] name, BRect aRect) {
		return be_BMessage_ReplaceRect_1(fInstancePointer, toStringz(name), aRect.fInstancePointer);
	}
	
	status_t ReplaceRect(char [] name, int32 index, BRect aRect) {
		return be_BMessage_ReplaceRect_2(fInstancePointer, toStringz(name), index, aRect.fInstancePointer);
	}
	
	status_t ReplacePoint(char [] name, BPoint aPoint) {
		return be_BMessage_ReplacePoint_1(fInstancePointer, toStringz(name), aPoint.fInstancePointer);
	}
	
	status_t ReplacePoint(char [] name, int32 index, BPoint aPoint) {
		return be_BMessage_ReplacePoint_2(fInstancePointer, toStringz(name), index, aPoint.fInstancePointer);
	}
*/	
	status_t ReplaceString(char [] name, char [] aString) {
		return be_BMessage_ReplaceString_1(fInstancePointer, toStringz(name), toStringz(aString));
	}
	
	status_t ReplaceString(char [] name, int32 index, char [] aString) {
		return be_BMessage_ReplaceString_2(fInstancePointer, toStringz(name), index, toStringz(aString));
	}
	
	status_t ReplaceString(char [] name, BString aString) {
		return be_BMessage_ReplaceString_3(fInstancePointer, toStringz(name), aString.fInstancePointer);
	}
	
	status_t ReplaceString(char [] name, int32 index, BString aString) {
		return be_BMessage_ReplaceString_4(fInstancePointer, toStringz(name), index, aString.fInstancePointer);
	}

	status_t ReplaceInt8(char [] name, int8 value) {
		return be_BMessage_ReplaceInt8_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceInt8(char [] name, int32 index, int8 value) {
		return be_BMessage_ReplaceInt8_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceUInt8(char [] name, uint8 value) {
		return be_BMessage_ReplaceUInt8_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceUInt8(char [] name, int32 index, uint8 value) {
		return be_BMessage_ReplaceUInt8_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceInt16(char [] name, int16 value) {
		return be_BMessage_ReplaceInt16_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceInt16(char [] name, int32 index, int16 value) {
		return be_BMessage_ReplaceInt16_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceUInt16(char [] name, uint16 value) {
		return be_BMessage_ReplaceUInt16_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceUInt16(char [] name, int32 index, uint16 value) {
		return be_BMessage_ReplaceUInt16_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceInt32(char [] name, int32 value) {
		return be_BMessage_ReplaceInt32_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceInt32(char [] name, int32 index, int32 value) {
		return be_BMessage_ReplaceInt32_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceUInt32(char [] name, uint32 value) {
		return be_BMessage_ReplaceUInt32_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceUInt32(char [] name, int32 index, uint32 value) {
		return be_BMessage_ReplaceUInt32_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceInt64(char [] name, int64 value) {
		return be_BMessage_ReplaceInt64_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceInt64(char [] name, int32 index, int64 value) {
		return be_BMessage_ReplaceInt64_2(fInstancePointer, toStringz(name), index, value);
	}

	status_t ReplaceUInt64(char [] name, uint64 value) {
		return be_BMessage_ReplaceUInt64_1(fInstancePointer, toStringz(name), value);
	}

	status_t ReplaceUInt64(char [] name, int32 index, uint64 value) {
		return be_BMessage_ReplaceUInt64_2(fInstancePointer, toStringz(name), index, value);
	}


	status_t ReplaceBool(char [] name, bool aBoolean) {
		return be_BMessage_ReplaceBool_1(fInstancePointer, toStringz(name), aBoolean);
	}
	
	status_t ReplaceBool(char [] name, int32 index, bool aBoolean) {
		return be_BMessage_ReplaceBool_2(fInstancePointer, toStringz(name), index, aBoolean);
	}

	status_t ReplaceFloat(char [] name, float aFloat) {
		return be_BMessage_ReplaceFloat_1(fInstancePointer, toStringz(name), aFloat);
	}

	status_t ReplaceFloat(char [] name, int32 index, float aFloat) {
		return be_BMessage_ReplaceFloat_2(fInstancePointer, toStringz(name), index, aFloat);
	}

	status_t ReplaceDouble(char [] name, double aDouble) {
		return be_BMessage_ReplaceDouble_1(fInstancePointer, toStringz(name), aDouble);
	}

	status_t ReplaceDouble(char [] name, int32 index, double aDouble) {
		return be_BMessage_ReplaceDouble_2(fInstancePointer, toStringz(name), index, aDouble);
	}

	status_t ReplacePointer(char [] name, void *pointer) {
		return be_BMessage_ReplacePointer_1(fInstancePointer, toStringz(name), pointer);
	}

	status_t ReplacePointer(char [] name, int32 index, void *pointer) {
		return be_BMessage_ReplacePointer_2(fInstancePointer, toStringz(name), index, pointer);
	}

/*
	status_t ReplaceMessenger(char [] name, BMessenger messenger) {
		return be_BMessage_ReplaceMessenger_1(fInstancePointer, toStringz(name), messenger.fInstancePointer);
	}

	status_t ReplaceMessenger(char [] name, int32 index, BMessenger messenger) {
		return be_BMessage_ReplaceMessenger_2(fInstancePointer, toStringz(name), index, messenger.fInstancePointer);
	}
*/

	status_t ReplaceRef(char [] name, entry_ref reference) {
		return be_BMessage_ReplaceRef_1(fInstancePointer, toStringz(name), &reference);
	}

	status_t ReplaceRef(char [] name, int32 index, entry_ref reference) {
		return be_BMessage_ReplaceRef_2(fInstancePointer, toStringz(name), index, &reference);
	}

	status_t ReplaceMessage(char [] name, BMessage message) {
		return be_BMessage_ReplaceMessage_1(fInstancePointer, toStringz(name), message.fInstancePointer);
	}

	status_t ReplaceMessage(char [] name, int32 index, BMessage message) {
		return be_BMessage_ReplaceMessage_2(fInstancePointer, toStringz(name), index, message.fInstancePointer);
	}

	status_t ReplaceFlat(char [] name, BFlattenable flat) {
		return be_BMessage_ReplaceFlat_1(fInstancePointer, toStringz(name), flat.fInstancePointer);
	}

	status_t ReplaceFlat(char [] name, int32 index, BFlattenable flat) {
		return be_BMessage_ReplaceFlat_2(fInstancePointer, toStringz(name), index, flat.fInstancePointer);
	}

	status_t ReplaceData(char [] name, type_code type, void [] data) {
		return be_BMessage_ReplaceData_1(fInstancePointer, toStringz(name), type, data.ptr, data.length);
	}

	status_t ReplaceData(char [] name, type_code type, int32 index, void [] data) {
		return be_BMessage_ReplaceData_2(fInstancePointer, toStringz(name), type, index, data.ptr, data.length);
	}


/*
		// Comparing data - Haiku experimental API
		bool			HasSameData(BMessage &other,
							bool ignoreFieldOrder = true, bool deep = false) const;

		void			*operator new(size_t size);
		void			*operator new(size_t, void *pointer);
		void			operator delete(void *pointer, size_t size);
*/

		// Private, reserved, or obsolete
	bool HasRect(char [] name, int32 n) {
		return be_BMessage_HasRect(fInstancePointer, toStringz(name), n);
	}
	
	bool HasPoint(char [] name, int32 n) {
		return be_BMessage_HasPoint(fInstancePointer, toStringz(name), n);
	}
	
	bool HasString(char [] name, int32 n) {
		return be_BMessage_HasString(fInstancePointer, toStringz(name), n);
	}
	
	bool HasInt8(char [] name, int32 n) {
		return be_BMessage_HasInt8(fInstancePointer, toStringz(name), n);
	}
	
	bool HasUInt8(char [] name, int32 n) {
		return be_BMessage_HasUInt8(fInstancePointer, toStringz(name), n);
	}
	
	bool HasInt16(char [] name, int32 n) {
		return be_BMessage_HasInt16(fInstancePointer, toStringz(name), n);
	}
	
	bool HasUInt16(char [] name, int32 n) {
		return be_BMessage_HasUInt16(fInstancePointer, toStringz(name), n);
	}
	
	bool HasInt32(char [] name, int32 n) {
		return be_BMessage_HasInt32(fInstancePointer, toStringz(name), n);
	}
	
	bool HasUInt32(char [] name, int32 n) {
		return be_BMessage_HasUInt32(fInstancePointer, toStringz(name), n);
	}
	
	bool HasInt64(char [] name, int32 n) {
		return be_BMessage_HasInt64(fInstancePointer, toStringz(name), n);
	}
	
	bool HasUInt64(char [] name, int32 n) {
		return be_BMessage_HasUInt64(fInstancePointer, toStringz(name), n);
	}
	
	bool HasBool(char [] name, int32 n) {
		return be_BMessage_HasBool(fInstancePointer, toStringz(name), n);
	}
	
	bool HasFloat(char [] name, int32 n) {
		return be_BMessage_HasFloat(fInstancePointer, toStringz(name), n);
	}
	
	bool HasDouble(char [] name, int32 n) {
		return be_BMessage_HasDouble(fInstancePointer, toStringz(name), n);
	}
	
	bool HasPointer(char [] name, int32 n) {
		return be_BMessage_HasPointer(fInstancePointer, toStringz(name), n);
	}
	
	bool HasMessenger(char [] name, int32 n) {
		return be_BMessage_HasMessenger(fInstancePointer, toStringz(name), n);
	}
	
	bool HasRef(char [] name, int32 n) {
		return be_BMessage_HasRef(fInstancePointer, toStringz(name), n);
	}
	
	bool HasMessage(char [] name, int32 n) {
		return be_BMessage_HasMessage(fInstancePointer, toStringz(name), n);
	}
	
	bool HasFlat(char [] name, BFlattenable flat) {
		return be_BMessage_HasFlat_1(fInstancePointer, toStringz(name), flat.fInstancePointer);
	}
	
	bool HasFlat(char [] name, int32 n, BFlattenable flat) {
		return be_BMessage_HasFlat_2(fInstancePointer, toStringz(name), n, flat.fInstancePointer);
	}
	
	bool HasData(char [] name, type_code type, int32 n) {
		return be_BMessage_HasData(fInstancePointer, toStringz(name), type, n);
	}
	
/*		
	void * FindRect(char [] name, int32 n) {
		return be_BMessage_FindRect(fInstancePointer, toStringz(name), n);
	}


	void *FindPoint(char [] name, int32 n) {
		return be_BMessage_FindPoint(fInstancePointer, toStringz(name), n);
	}
*/

	char [] FindString(char [] name, int32 n) {
		return fromStringz(be_BMessage_FindString(fInstancePointer, toStringz(name), n));
	}

	int8 FindInt8(char [] name, int32 n) {
		return be_BMessage_FindInt8(fInstancePointer, toStringz(name), n);
	}

	int16 FindInt16(char [] name, int32 n) {
		return be_BMessage_FindInt16(fInstancePointer, toStringz(name), n);
	}

	int32 FindInt32(char [] name, int32 n) {
		return be_BMessage_FindInt32(fInstancePointer, toStringz(name), n);
	}

	int64 FindInt64(char [] name, int32 n) {
		return be_BMessage_FindInt64(fInstancePointer, toStringz(name), n);
	}

	bool FindBool(char [] name, int32 n) {
		return be_BMessage_FindBool(fInstancePointer, toStringz(name), n);
	}

	float FindFloat(char [] name, int32 n) {
		return be_BMessage_FindFloat(fInstancePointer, toStringz(name), n);
	}

	double FindDouble(char [] name, int32 n) {
		return be_BMessage_FindDouble(fInstancePointer, toStringz(name), n);
	}


}
