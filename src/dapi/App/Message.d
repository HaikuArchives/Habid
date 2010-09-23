/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Support.SupportDefs;
import Support.types;
import Support.BObject;

struct entry_ref { }

extern (C) extern {
	// BMessage* be_BMessage_ctor(void *bindInstPtr);
	void * be_BMessage_ctor(void *bindInstPtr);

	// BMessage* be_BMessage_ctor_1(void *bindInstPtr, uint32 what);
	void * be_BMessage_ctor_1(void *bindInstPtr, uint32 what);

	// BMessage* be_BMessage_ctor_2(void *bindInstPtr, const BMessage * other);
	void * be_BMessage_ctor_2(void *bindInstPtr, void * other);

	// void be_BMessage_dtor(BMessage* self);
	void be_BMessage_dtor(void* self);

	// void be_BMessage_what_varSet(BMessage *self, uint32 what);
	void be_BMessage_what_varSet(void *self, uint32 what);

	// uint32 be_BMessage_what_varGet(BMessage *self);
	uint32 be_BMessage_what_varGet(void *self);

	// status_t be_BMessage_GetInfo(BMessage *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound);
	status_t be_BMessage_GetInfo(void *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound);

	// status_t be_BMessage_GetInfo_1(BMessage *self, const char * name, type_code * typeFound, int32 * countFound);
	status_t be_BMessage_GetInfo_1(void *self, char * name, type_code * typeFound, int32 * countFound);

	// status_t be_BMessage_GetInfo_2(BMessage *self, const char * name, type_code * typeFound, bool * fixedSize);
	status_t be_BMessage_GetInfo_2(void *self, char * name, type_code * typeFound, bool * fixedSize);

	// int32 be_BMessage_CountNames(BMessage *self, type_code type);
	int32 be_BMessage_CountNames(void *self, type_code type);

	// bool be_BMessage_IsEmpty(BMessage *self);
	bool be_BMessage_IsEmpty(void *self);

	// bool be_BMessage_IsSystem(BMessage *self);
	bool be_BMessage_IsSystem(void *self);

	// bool be_BMessage_IsReply(BMessage *self);
	bool be_BMessage_IsReply(void *self);

	// void be_BMessage_PrintToStream(BMessage *self);
	void be_BMessage_PrintToStream(void *self);

	// status_t be_BMessage_Rename(BMessage *self, const char * oldEntry, const char * newEntry);
	status_t be_BMessage_Rename(void *self, char * oldEntry,  char * newEntry);

	// bool be_BMessage_WasDelivered(BMessage *self);
	bool be_BMessage_WasDelivered(void *self);

	// bool be_BMessage_IsSourceWaiting(BMessage *self);
	bool be_BMessage_IsSourceWaiting(void *self);

	// bool be_BMessage_IsSourceRemote(BMessage *self);
	bool be_BMessage_IsSourceRemote(void *self);

	// BMessenger * be_BMessage_ReturnAddress(BMessage *self);
	void * be_BMessage_ReturnAddress(void *self);

	// const BMessage * be_BMessage_Previous(BMessage *self);
	void * be_BMessage_Previous(void *self);

	// bool be_BMessage_WasDropped(BMessage *self);
	bool be_BMessage_WasDropped(void *self);

	// BPoint * be_BMessage_DropPoint(BMessage *self, BPoint * offset);
	void * be_BMessage_DropPoint(void *self, void * offset);

	// status_t be_BMessage_SendReply(BMessage *self, uint32 command, BHandler * replyTo);
	status_t be_BMessage_SendReply(void *self, uint32 command, void * replyTo);

	// status_t be_BMessage_SendReply_1(BMessage *self, BMessage * reply, BHandler * replyTo, bigtime_t timeout);
	status_t be_BMessage_SendReply_1(void *self, void * reply, void * replyTo, bigtime_t timeout);

	// status_t be_BMessage_SendReply_2(BMessage *self, BMessage * reply, BMessenger *replyTo, bigtime_t timeout);
	status_t be_BMessage_SendReply_2(void *self, void * reply, void *replyTo, bigtime_t timeout);

	// status_t be_BMessage_SendReply_3(BMessage *self, uint32 command, BMessage * replyToReply);
	status_t be_BMessage_SendReply_3(void *self, uint32 command, void * replyToReply);

	// status_t be_BMessage_SendReply_4(BMessage *self, BMessage * the_reply, BMessage * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout);
	status_t be_BMessage_SendReply_4(void *self, void * the_reply, void * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout);

	// ssize_t be_BMessage_FlattenedSize(BMessage *self);
	ssize_t be_BMessage_FlattenedSize(void *self);

	// status_t be_BMessage_Flatten(BMessage *self, char * buffer, ssize_t size);
	status_t be_BMessage_Flatten(void *self, char * buffer, ssize_t size);

	// status_t be_BMessage_Flatten_1(BMessage *self, BDataIO * stream, ssize_t * size);
	status_t be_BMessage_Flatten_1(void *self, void * stream, ssize_t * size);

	// status_t be_BMessage_Unflatten(BMessage *self, const char * flatBuffer);
	status_t be_BMessage_Unflatten(void *self, char * flatBuffer);

	// status_t be_BMessage_Unflatten_1(BMessage *self, BDataIO * stream);
	status_t be_BMessage_Unflatten_1(void *self, void * stream);

	// status_t be_BMessage_AddSpecifier(BMessage *self, const char * property);
	status_t be_BMessage_AddSpecifier(void *self, char * property);

	// status_t be_BMessage_AddSpecifier_1(BMessage *self, const char * property, int32 index);
	status_t be_BMessage_AddSpecifier_1(void *self, char * property, int32 index);

	// status_t be_BMessage_AddSpecifier_2(BMessage *self, const char * property, int32 index, int32 range);
	status_t be_BMessage_AddSpecifier_2(void *self, char * property, int32 index, int32 range);

	// status_t be_BMessage_AddSpecifier_3(BMessage *self, const char * property, const char * name);
	status_t be_BMessage_AddSpecifier_3(void *self, char * property,  char * name);

	// status_t be_BMessage_AddSpecifier_4(BMessage *self, const BMessage * specifier);
	status_t be_BMessage_AddSpecifier_4(void *self, void * specifier);

	// status_t be_BMessage_SetCurrentSpecifier(BMessage *self, int32 index);
	status_t be_BMessage_SetCurrentSpecifier(void *self, int32 index);

	// status_t be_BMessage_GetCurrentSpecifier(BMessage *self, int32 * index, BMessage * specifier, int32 * what, const char ** property);
	status_t be_BMessage_GetCurrentSpecifier(void *self, int32 * index, void * specifier, int32 * what,  char ** property);

	// status_t be_BMessage_HasSpecifiers(BMessage *self);
	status_t be_BMessage_HasSpecifiers(void *self);

	// status_t be_BMessage_PopSpecifier(BMessage *self);
	status_t be_BMessage_PopSpecifier(void *self);

	// status_t be_BMessage_AddAlignment(BMessage *self, const char* name, const BAlignment* alignment);
	status_t be_BMessage_AddAlignment(void *self, char* name, void * alignment);

	// status_t be_BMessage_AddRect(BMessage *self, const char * name, BRect *aRect);
	status_t be_BMessage_AddRect(void *self, char * name, void *aRect);

	// status_t be_BMessage_AddPoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t be_BMessage_AddPoint(void *self, char * name, void *aPoint);

	// status_t be_BMessage_AddSize(BMessage *self, const char* name, BSize *aSize);
	status_t be_BMessage_AddSize(void *self, char* name, void *aSize);

	// status_t be_BMessage_AddString(BMessage *self, const char * name, const char * aString);
	status_t be_BMessage_AddString(void *self, char * name,  char * aString);

	// status_t be_BMessage_AddString_1(BMessage *self, const char * name, const BString * aString);
	status_t be_BMessage_AddString_1(void *self, char * name, void * aString);

	// status_t be_BMessage_AddInt8(BMessage *self, const char * name, int8 value);
	status_t be_BMessage_AddInt8(void *self, char * name, int8 value);

	// status_t be_BMessage_AddUInt8(BMessage *self, const char * name, uint8 value);
	status_t be_BMessage_AddUInt8(void *self, char * name, uint8 value);

	// status_t be_BMessage_AddInt16(BMessage *self, const char * name, int16 value);
	status_t be_BMessage_AddInt16(void *self, char * name, int16 value);

	// status_t be_BMessage_AddUInt16(BMessage *self, const char * name, uint16 value);
	status_t be_BMessage_AddUInt16(void *self, char * name, uint16 value);

	// status_t be_BMessage_AddInt32(BMessage *self, const char * name, int32 value);
	status_t be_BMessage_AddInt32(void *self, char * name, int32 value);

	// status_t be_BMessage_AddUInt32(BMessage *self, const char * name, uint32 value);
	status_t be_BMessage_AddUInt32(void *self, char * name, uint32 value);

	// status_t be_BMessage_AddInt64(BMessage *self, const char * name, int64 value);
	status_t be_BMessage_AddInt64(void *self, char * name, int64 value);

	// status_t be_BMessage_AddUInt64(BMessage *self, const char * name, uint64 value);
	status_t be_BMessage_AddUInt64(void *self, char * name, uint64 value);

	// status_t be_BMessage_AddBool(BMessage *self, const char * name, bool aBoolean);
	status_t be_BMessage_AddBool(void *self, char * name, bool aBoolean);

	// status_t be_BMessage_AddFloat(BMessage *self, const char * name, float aFloat);
	status_t be_BMessage_AddFloat(void *self, char * name, float aFloat);

	// status_t be_BMessage_AddDouble(BMessage *self, const char * name, double aDouble);
	status_t be_BMessage_AddDouble(void *self, char * name, double aDouble);

	// status_t be_BMessage_AddPointer(BMessage *self, const char * name, const void * aPointer);
	status_t be_BMessage_AddPointer(void *self, char * name,  void * aPointer);

	// status_t be_BMessage_AddMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t be_BMessage_AddMessenger(void *self, char * name, void *messenger);

	// status_t be_BMessage_AddRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t be_BMessage_AddRef(void *self, char * name,  entry_ref * _ref);

	// status_t be_BMessage_AddMessage(BMessage *self, const char * name, const BMessage * message);
	status_t be_BMessage_AddMessage(void *self, char * name, void * message);

	// status_t be_BMessage_AddFlat(BMessage *self, const char * name, BFlattenable * object, int32 count);
	status_t be_BMessage_AddFlat(void *self, char * name, void * object, int32 count);

	// status_t be_BMessage_AddData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes, bool isFixedSize, int32 count);
	status_t be_BMessage_AddData(void *self, char * name, type_code type,  void * data, ssize_t numBytes, bool isFixedSize, int32 count);

	// status_t be_BMessage_RemoveData(BMessage *self, const char * name, int32 index);
	status_t be_BMessage_RemoveData(void *self, char * name, int32 index);

	// status_t be_BMessage_RemoveName(BMessage *self, const char * name);
	status_t be_BMessage_RemoveName(void *self, char * name);

	// status_t be_BMessage_MakeEmpty(BMessage *self);
	status_t be_BMessage_MakeEmpty(void *self);

	// status_t be_BMessage_FindAlignment(BMessage *self, const char* name, BAlignment* alignment);
	status_t be_BMessage_FindAlignment(void *self, char* name, void * alignment);

	// status_t be_BMessage_FindAlignment_1(BMessage *self, const char* name, int32 index, BAlignment* alignment);
	status_t be_BMessage_FindAlignment_1(void *self, char* name, int32 index, void * alignment);

	// status_t be_BMessage_FindRect(BMessage *self, const char * name, BRect * rect);
	status_t be_BMessage_FindRect(void *self, char * name, void * rect);

	// status_t be_BMessage_FindRect_1(BMessage *self, const char * name, int32 index, BRect * rect);
	status_t be_BMessage_FindRect_1(void *self, char * name, int32 index, void * rect);

	// status_t be_BMessage_FindPoint(BMessage *self, const char * name, BPoint * point);
	status_t be_BMessage_FindPoint(void *self, char * name, void * point);

	// status_t be_BMessage_FindPoint_1(BMessage *self, const char * name, int32 index, BPoint * point);
	status_t be_BMessage_FindPoint_1(void *self, char * name, int32 index, void * point);

	// status_t be_BMessage_FindSize(BMessage *self, const char * name, BSize* size);
	status_t be_BMessage_FindSize(void *self, char * name, void * size);

	// status_t be_BMessage_FindSize_1(BMessage *self, const char * name, int32 index, BSize* size);
	status_t be_BMessage_FindSize_1(void *self, char * name, int32 index, void * size);

	// status_t be_BMessage_FindString(BMessage *self, const char * name, const char ** string);
	status_t be_BMessage_FindString(void *self, char * name,  char ** string);

	// status_t be_BMessage_FindString_1(BMessage *self, const char * name, int32 index, const char ** string);
	status_t be_BMessage_FindString_1(void *self, char * name, int32 index,  char ** string);

	// status_t be_BMessage_FindString_2(BMessage *self, const char * name, BString * string);
	status_t be_BMessage_FindString_2(void *self, char * name, void * string);

	// status_t be_BMessage_FindString_3(BMessage *self, const char * name, int32 index, BString * string);
	status_t be_BMessage_FindString_3(void *self, char * name, int32 index, void * string);

	// status_t be_BMessage_FindInt8(BMessage *self, const char * name, int8 * value);
	status_t be_BMessage_FindInt8(void *self, char * name, int8 * value);

	// status_t be_BMessage_FindInt8_1(BMessage *self, const char * name, int32 index, int8 * value);
	status_t be_BMessage_FindInt8_1(void *self, char * name, int32 index, int8 * value);

	// status_t be_BMessage_FindUInt8(BMessage *self, const char * name, uint8 * value);
	status_t be_BMessage_FindUInt8(void *self, char * name, uint8 * value);

	// status_t be_BMessage_FindUInt8_1(BMessage *self, const char * name, int32 index, uint8 * value);
	status_t be_BMessage_FindUInt8_1(void *self, char * name, int32 index, uint8 * value);

	// status_t be_BMessage_FindInt16(BMessage *self, const char * name, int16 * value);
	status_t be_BMessage_FindInt16(void *self, char * name, int16 * value);

	// status_t be_BMessage_FindInt16_1(BMessage *self, const char * name, int32 index, int16 * value);
	status_t be_BMessage_FindInt16_1(void *self, char * name, int32 index, int16 * value);

	// status_t be_BMessage_FindUInt16(BMessage *self, const char * name, uint16 * value);
	status_t be_BMessage_FindUInt16(void *self, char * name, uint16 * value);

	// status_t be_BMessage_FindUInt16_1(BMessage *self, const char * name, int32 index, uint16 * value);
	status_t be_BMessage_FindUInt16_1(void *self, char * name, int32 index, uint16 * value);

	// status_t be_BMessage_FindInt32(BMessage *self, const char * name, int32 * value);
	status_t be_BMessage_FindInt32(void *self, char * name, int32 * value);

	// status_t be_BMessage_FindInt32_1(BMessage *self, const char * name, int32 index, int32 * value);
	status_t be_BMessage_FindInt32_1(void *self, char * name, int32 index, int32 * value);

	// status_t be_BMessage_FindUInt32(BMessage *self, const char * name, uint32 * value);
	status_t be_BMessage_FindUInt32(void *self, char * name, uint32 * value);

	// status_t be_BMessage_FindUInt32_1(BMessage *self, const char * name, int32 index, uint32 * value);
	status_t be_BMessage_FindUInt32_1(void *self, char * name, int32 index, uint32 * value);

	// status_t be_BMessage_FindInt64(BMessage *self, const char * name, int64 * value);
	status_t be_BMessage_FindInt64(void *self, char * name, int64 * value);

	// status_t be_BMessage_FindInt64_1(BMessage *self, const char * name, int32 index, int64 * value);
	status_t be_BMessage_FindInt64_1(void *self, char * name, int32 index, int64 * value);

	// status_t be_BMessage_FindUInt64(BMessage *self, const char * name, uint64 * value);
	status_t be_BMessage_FindUInt64(void *self, char * name, uint64 * value);

	// status_t be_BMessage_FindUInt64_1(BMessage *self, const char * name, int32 index, uint64 * value);
	status_t be_BMessage_FindUInt64_1(void *self, char * name, int32 index, uint64 * value);

	// status_t be_BMessage_FindBool(BMessage *self, const char * name, bool * value);
	status_t be_BMessage_FindBool(void *self, char * name, bool * value);

	// status_t be_BMessage_FindBool_1(BMessage *self, const char * name, int32 index, bool * value);
	status_t be_BMessage_FindBool_1(void *self, char * name, int32 index, bool * value);

	// status_t be_BMessage_FindFloat(BMessage *self, const char * name, float * value);
	status_t be_BMessage_FindFloat(void *self, char * name, float * value);

	// status_t be_BMessage_FindFloat_1(BMessage *self, const char * name, int32 index, float * value);
	status_t be_BMessage_FindFloat_1(void *self, char * name, int32 index, float * value);

	// status_t be_BMessage_FindDouble(BMessage *self, const char * name, double * value);
	status_t be_BMessage_FindDouble(void *self, char * name, double * value);

	// status_t be_BMessage_FindDouble_1(BMessage *self, const char * name, int32 index, double * value);
	status_t be_BMessage_FindDouble_1(void *self, char * name, int32 index, double * value);

	// status_t be_BMessage_FindPointer(BMessage *self, const char * name, void ** pointer);
	status_t be_BMessage_FindPointer(void *self, char * name, void ** pointer);

	// status_t be_BMessage_FindPointer_1(BMessage *self, const char * name, int32 index, void ** pointer);
	status_t be_BMessage_FindPointer_1(void *self, char * name, int32 index, void ** pointer);

	// status_t be_BMessage_FindMessenger(BMessage *self, const char * name, BMessenger * messenger);
	status_t be_BMessage_FindMessenger(void *self, char * name, void * messenger);

	// status_t be_BMessage_FindMessenger_1(BMessage *self, const char * name, int32 index, BMessenger * messenger);
	status_t be_BMessage_FindMessenger_1(void *self, char * name, int32 index, void * messenger);

	// status_t be_BMessage_FindRef(BMessage *self, const char * name, entry_ref * _ref);
	status_t be_BMessage_FindRef(void *self, char * name, entry_ref * _ref);

	// status_t be_BMessage_FindRef_1(BMessage *self, const char * name, int32 index, entry_ref * _ref);
	status_t be_BMessage_FindRef_1(void *self, char * name, int32 index, entry_ref * _ref);

	// status_t be_BMessage_FindMessage(BMessage *self, const char * name, BMessage * message);
	status_t be_BMessage_FindMessage(void *self, char * name, void * message);

	// status_t be_BMessage_FindMessage_1(BMessage *self, const char * name, int32 index, BMessage * message);
	status_t be_BMessage_FindMessage_1(void *self, char * name, int32 index, void * message);

	// status_t be_BMessage_FindFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t be_BMessage_FindFlat(void *self, char * name, void * object);

	// status_t be_BMessage_FindFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t be_BMessage_FindFlat_1(void *self, char * name, int32 index, void * object);

	// status_t be_BMessage_FindData(BMessage *self, const char * name, type_code type, const void ** data, ssize_t * numBytes);
	status_t be_BMessage_FindData(void *self, char * name, type_code type,  void ** data, ssize_t * numBytes);

	// status_t be_BMessage_FindData_1(BMessage *self, const char * name, type_code type, int32 index, const void ** data, ssize_t * numBytes);
	status_t be_BMessage_FindData_1(void *self, char * name, type_code type, int32 index,  void ** data, ssize_t * numBytes);

	// status_t be_BMessage_ReplaceAlignment(BMessage *self, const char* name, const BAlignment* alignment);
	status_t be_BMessage_ReplaceAlignment(void *self, char* name, void * alignment);

	// status_t be_BMessage_ReplaceAlignment_1(BMessage *self, const char* name, int32 index, const BAlignment* alignment);
	status_t be_BMessage_ReplaceAlignment_1(void *self, char* name, int32 index, void * alignment);

	// status_t be_BMessage_ReplaceRect(BMessage *self, const char * name, BRect *aRect);
	status_t be_BMessage_ReplaceRect(void *self, char * name, void *aRect);

	// status_t be_BMessage_ReplaceRect_1(BMessage *self, const char * name, int32 index, BRect *aRect);
	status_t be_BMessage_ReplaceRect_1(void *self, char * name, int32 index, void *aRect);

	// status_t be_BMessage_ReplacePoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t be_BMessage_ReplacePoint(void *self, char * name, void *aPoint);

	// status_t be_BMessage_ReplacePoint_1(BMessage *self, const char * name, int32 index, BPoint *aPoint);
	status_t be_BMessage_ReplacePoint_1(void *self, char * name, int32 index, void *aPoint);

	// status_t be_BMessage_ReplaceSize(BMessage *self, const char* name, BSize *aSize);
	status_t be_BMessage_ReplaceSize(void *self, char* name, void *aSize);

	// status_t be_BMessage_ReplaceSize_1(BMessage *self, const char* name, int32 index, BSize *aSize);
	status_t be_BMessage_ReplaceSize_1(void *self, char* name, int32 index, void *aSize);

	// status_t be_BMessage_ReplaceString(BMessage *self, const char * name, const char * aString);
	status_t be_BMessage_ReplaceString(void *self, char * name,  char * aString);

	// status_t be_BMessage_ReplaceString_1(BMessage *self, const char * name, int32 index, const char * aString);
	status_t be_BMessage_ReplaceString_1(void *self, char * name, int32 index,  char * aString);

	// status_t be_BMessage_ReplaceString_2(BMessage *self, const char * name, const BString * aString);
	status_t be_BMessage_ReplaceString_2(void *self, char * name, void * aString);

	// status_t be_BMessage_ReplaceString_3(BMessage *self, const char * name, int32 index, const BString * aString);
	status_t be_BMessage_ReplaceString_3(void *self, char * name, int32 index, void * aString);

	// status_t be_BMessage_ReplaceInt8(BMessage *self, const char * name, int8 value);
	status_t be_BMessage_ReplaceInt8(void *self, char * name, int8 value);

	// status_t be_BMessage_ReplaceInt8_1(BMessage *self, const char * name, int32 index, int8 value);
	status_t be_BMessage_ReplaceInt8_1(void *self, char * name, int32 index, int8 value);

	// status_t be_BMessage_ReplaceUInt8(BMessage *self, const char * name, uint8 value);
	status_t be_BMessage_ReplaceUInt8(void *self, char * name, uint8 value);

	// status_t be_BMessage_ReplaceUInt8_1(BMessage *self, const char * name, int32 index, uint8 value);
	status_t be_BMessage_ReplaceUInt8_1(void *self, char * name, int32 index, uint8 value);

	// status_t be_BMessage_ReplaceInt16(BMessage *self, const char * name, int16 value);
	status_t be_BMessage_ReplaceInt16(void *self, char * name, int16 value);

	// status_t be_BMessage_ReplaceInt16_1(BMessage *self, const char * name, int32 index, int16 value);
	status_t be_BMessage_ReplaceInt16_1(void *self, char * name, int32 index, int16 value);

	// status_t be_BMessage_ReplaceUInt16(BMessage *self, const char * name, uint16 value);
	status_t be_BMessage_ReplaceUInt16(void *self, char * name, uint16 value);

	// status_t be_BMessage_ReplaceUInt16_1(BMessage *self, const char * name, int32 index, uint16 value);
	status_t be_BMessage_ReplaceUInt16_1(void *self, char * name, int32 index, uint16 value);

	// status_t be_BMessage_ReplaceInt32(BMessage *self, const char * name, int32 value);
	status_t be_BMessage_ReplaceInt32(void *self, char * name, int32 value);

	// status_t be_BMessage_ReplaceInt32_1(BMessage *self, const char * name, int32 index, int32 value);
	status_t be_BMessage_ReplaceInt32_1(void *self, char * name, int32 index, int32 value);

	// status_t be_BMessage_ReplaceUInt32(BMessage *self, const char * name, uint32 value);
	status_t be_BMessage_ReplaceUInt32(void *self, char * name, uint32 value);

	// status_t be_BMessage_ReplaceUInt32_1(BMessage *self, const char * name, int32 index, uint32 value);
	status_t be_BMessage_ReplaceUInt32_1(void *self, char * name, int32 index, uint32 value);

	// status_t be_BMessage_ReplaceInt64(BMessage *self, const char * name, int64 value);
	status_t be_BMessage_ReplaceInt64(void *self, char * name, int64 value);

	// status_t be_BMessage_ReplaceInt64_1(BMessage *self, const char * name, int32 index, int64 value);
	status_t be_BMessage_ReplaceInt64_1(void *self, char * name, int32 index, int64 value);

	// status_t be_BMessage_ReplaceUInt64(BMessage *self, const char * name, uint64 value);
	status_t be_BMessage_ReplaceUInt64(void *self, char * name, uint64 value);

	// status_t be_BMessage_ReplaceUInt64_1(BMessage *self, const char * name, int32 index, uint64 value);
	status_t be_BMessage_ReplaceUInt64_1(void *self, char * name, int32 index, uint64 value);

	// status_t be_BMessage_ReplaceBool(BMessage *self, const char * name, bool aBoolean);
	status_t be_BMessage_ReplaceBool(void *self, char * name, bool aBoolean);

	// status_t be_BMessage_ReplaceBool_1(BMessage *self, const char * name, int32 index, bool aBoolean);
	status_t be_BMessage_ReplaceBool_1(void *self, char * name, int32 index, bool aBoolean);

	// status_t be_BMessage_ReplaceFloat(BMessage *self, const char * name, float aFloat);
	status_t be_BMessage_ReplaceFloat(void *self, char * name, float aFloat);

	// status_t be_BMessage_ReplaceFloat_1(BMessage *self, const char * name, int32 index, float aFloat);
	status_t be_BMessage_ReplaceFloat_1(void *self, char * name, int32 index, float aFloat);

	// status_t be_BMessage_ReplaceDouble(BMessage *self, const char * name, double aDouble);
	status_t be_BMessage_ReplaceDouble(void *self, char * name, double aDouble);

	// status_t be_BMessage_ReplaceDouble_1(BMessage *self, const char * name, int32 index, double aDouble);
	status_t be_BMessage_ReplaceDouble_1(void *self, char * name, int32 index, double aDouble);

	// status_t be_BMessage_ReplacePointer(BMessage *self, const char * name, const void * pointer);
	status_t be_BMessage_ReplacePointer(void *self, char * name,  void * pointer);

	// status_t be_BMessage_ReplacePointer_1(BMessage *self, const char * name, int32 index, const void * pointer);
	status_t be_BMessage_ReplacePointer_1(void *self, char * name, int32 index,  void * pointer);

	// status_t be_BMessage_ReplaceMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t be_BMessage_ReplaceMessenger(void *self, char * name, void *messenger);

	// status_t be_BMessage_ReplaceMessenger_1(BMessage *self, const char * name, int32 index, BMessenger *messenger);
	status_t be_BMessage_ReplaceMessenger_1(void *self, char * name, int32 index, void *messenger);

	// status_t be_BMessage_ReplaceRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t be_BMessage_ReplaceRef(void *self, char * name,  entry_ref * _ref);

	// status_t be_BMessage_ReplaceRef_1(BMessage *self, const char * name, int32 index, const entry_ref * _ref);
	status_t be_BMessage_ReplaceRef_1(void *self, char * name, int32 index,  entry_ref * _ref);

	// status_t be_BMessage_ReplaceMessage(BMessage *self, const char * name, const BMessage * message);
	status_t be_BMessage_ReplaceMessage(void *self, char * name, void * message);

	// status_t be_BMessage_ReplaceMessage_1(BMessage *self, const char * name, int32 index, const BMessage * message);
	status_t be_BMessage_ReplaceMessage_1(void *self, char * name, int32 index, void * message);

	// status_t be_BMessage_ReplaceFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t be_BMessage_ReplaceFlat(void *self, char * name, void * object);

	// status_t be_BMessage_ReplaceFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t be_BMessage_ReplaceFlat_1(void *self, char * name, int32 index, void * object);

	// status_t be_BMessage_ReplaceData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes);
	status_t be_BMessage_ReplaceData(void *self, char * name, type_code type,  void * data, ssize_t numBytes);

	// status_t be_BMessage_ReplaceData_1(BMessage *self, const char * name, type_code type, int32 index, const void * data, ssize_t numBytes);
	status_t be_BMessage_ReplaceData_1(void *self, char * name, type_code type, int32 index,  void * data, ssize_t numBytes);

	// bool be_BMessage_HasSameData(BMessage *self, const BMessage * other, bool ignoreFieldOrder, bool deep);
	bool be_BMessage_HasSameData(void *self, void * other, bool ignoreFieldOrder, bool deep);

	// bool be_BMessage_HasAlignment(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasAlignment(void *self, char* name, int32 n);

	// bool be_BMessage_HasRect(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasRect(void *self, char* name, int32 n);

	// bool be_BMessage_HasPoint(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasPoint(void *self, char* name, int32 n);

	// bool be_BMessage_HasSize(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasSize(void *self, char* name, int32 n);

	// bool be_BMessage_HasString(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasString(void *self, char* name, int32 n);

	// bool be_BMessage_HasInt8(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasInt8(void *self, char* name, int32 n);

	// bool be_BMessage_HasUInt8(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasUInt8(void *self, char* name, int32 n);

	// bool be_BMessage_HasInt16(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasInt16(void *self, char* name, int32 n);

	// bool be_BMessage_HasUInt16(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasUInt16(void *self, char* name, int32 n);

	// bool be_BMessage_HasInt32(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasInt32(void *self, char* name, int32 n);

	// bool be_BMessage_HasUInt32(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasUInt32(void *self, char* name, int32 n);

	// bool be_BMessage_HasInt64(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasInt64(void *self, char* name, int32 n);

	// bool be_BMessage_HasUInt64(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasUInt64(void *self, char* name, int32 n);

	// bool be_BMessage_HasBool(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasBool(void *self, char* name, int32 n);

	// bool be_BMessage_HasFloat(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasFloat(void *self, char* name, int32 n);

	// bool be_BMessage_HasDouble(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasDouble(void *self, char* name, int32 n);

	// bool be_BMessage_HasPointer(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasPointer(void *self, char* name, int32 n);

	// bool be_BMessage_HasMessenger(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasMessenger(void *self, char* name, int32 n);

	// bool be_BMessage_HasRef(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasRef(void *self, char* name, int32 n);

	// bool be_BMessage_HasMessage(BMessage *self, const char* name, int32 n);
	bool be_BMessage_HasMessage(void *self, char* name, int32 n);

	// bool be_BMessage_HasFlat(BMessage *self, const char* name, const BFlattenable * flat);
	bool be_BMessage_HasFlat(void *self, char* name, void * flat);

	// bool be_BMessage_HasFlat_1(BMessage *self, const char* name, int32 n, const BFlattenable * flat);
	bool be_BMessage_HasFlat_1(void *self, char* name, int32 n, void * flat);

	// bool be_BMessage_HasData(BMessage *self, const char* name, type_code code, int32 n);
	bool be_BMessage_HasData(void *self, char* name, type_code code, int32 n);

	// BRect * be_BMessage_FindRect_2(BMessage *self, const char* name, int32 n);
	void * be_BMessage_FindRect_2(void *self, char* name, int32 n);

	// BPoint * be_BMessage_FindPoint_2(BMessage *self, const char* name, int32 n);
	void * be_BMessage_FindPoint_2(void *self, char* name, int32 n);

	// const char * be_BMessage_FindString_4(BMessage *self, const char* name, int32 n);
	char * be_BMessage_FindString_4(void *self, char* name, int32 n);

	// int8 be_BMessage_FindInt8_2(BMessage *self, const char* name, int32 n);
	int8 be_BMessage_FindInt8_2(void *self, char* name, int32 n);

	// int16 be_BMessage_FindInt16_2(BMessage *self, const char* name, int32 n);
	int16 be_BMessage_FindInt16_2(void *self, char* name, int32 n);

	// int32 be_BMessage_FindInt32_2(BMessage *self, const char* name, int32 n);
	int32 be_BMessage_FindInt32_2(void *self, char* name, int32 n);

	// int64 be_BMessage_FindInt64_2(BMessage *self, const char* name, int32 n);
	int64 be_BMessage_FindInt64_2(void *self, char* name, int32 n);

	// bool be_BMessage_FindBool_2(BMessage *self, const char* name, int32 n);
	bool be_BMessage_FindBool_2(void *self, char* name, int32 n);

	// float be_BMessage_FindFloat_2(BMessage *self, const char* name, int32 n);
	float be_BMessage_FindFloat_2(void *self, char* name, int32 n);

	// double be_BMessage_FindDouble_2(BMessage *self, const char* name, int32 n);
	double be_BMessage_FindDouble_2(void *self, char* name, int32 n);

}


extern (C) {
}


interface IBMessage
{
/*
	// status_t be_BMessage_GetInfo(BMessage *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound);
	status_t GetInfo();

	// status_t be_BMessage_GetInfo_1(BMessage *self, const char * name, type_code * typeFound, int32 * countFound);
	status_t GetInfo();

	// status_t be_BMessage_GetInfo_2(BMessage *self, const char * name, type_code * typeFound, bool * fixedSize);
	status_t GetInfo();

	// int32 be_BMessage_CountNames(BMessage *self, type_code type);
	int32 CountNames();

	// bool be_BMessage_IsEmpty(BMessage *self);
	bool IsEmpty();

	// bool be_BMessage_IsSystem(BMessage *self);
	bool IsSystem();

	// bool be_BMessage_IsReply(BMessage *self);
	bool IsReply();

	// void be_BMessage_PrintToStream(BMessage *self);
	void PrintToStream();

	// status_t be_BMessage_Rename(BMessage *self, const char * oldEntry, const char * newEntry);
	status_t Rename();

	// bool be_BMessage_WasDelivered(BMessage *self);
	bool WasDelivered();

	// bool be_BMessage_IsSourceWaiting(BMessage *self);
	bool IsSourceWaiting();

	// bool be_BMessage_IsSourceRemote(BMessage *self);
	bool IsSourceRemote();

	// BMessenger * be_BMessage_ReturnAddress(BMessage *self);
	BMessenger ReturnAddress();

	// const BMessage * be_BMessage_Previous(BMessage *self);
	BMessage * Previous();

	// bool be_BMessage_WasDropped(BMessage *self);
	bool WasDropped();

	// BPoint * be_BMessage_DropPoint(BMessage *self, BPoint * offset);
	BPoint DropPoint();

	// status_t be_BMessage_SendReply(BMessage *self, uint32 command, BHandler * replyTo);
	status_t SendReply();

	// status_t be_BMessage_SendReply_1(BMessage *self, BMessage * reply, BHandler * replyTo, bigtime_t timeout);
	status_t SendReply();

	// status_t be_BMessage_SendReply_2(BMessage *self, BMessage * reply, BMessenger *replyTo, bigtime_t timeout);
	status_t SendReply();

	// status_t be_BMessage_SendReply_3(BMessage *self, uint32 command, BMessage * replyToReply);
	status_t SendReply();

	// status_t be_BMessage_SendReply_4(BMessage *self, BMessage * the_reply, BMessage * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout);
	status_t SendReply();

	// ssize_t be_BMessage_FlattenedSize(BMessage *self);
	ssize_t FlattenedSize();

	// status_t be_BMessage_Flatten(BMessage *self, char * buffer, ssize_t size);
	status_t Flatten();

	// status_t be_BMessage_Flatten_1(BMessage *self, BDataIO * stream, ssize_t * size);
	status_t Flatten();

	// status_t be_BMessage_Unflatten(BMessage *self, const char * flatBuffer);
	status_t Unflatten();

	// status_t be_BMessage_Unflatten_1(BMessage *self, BDataIO * stream);
	status_t Unflatten();

	// status_t be_BMessage_AddSpecifier(BMessage *self, const char * property);
	status_t AddSpecifier();

	// status_t be_BMessage_AddSpecifier_1(BMessage *self, const char * property, int32 index);
	status_t AddSpecifier();

	// status_t be_BMessage_AddSpecifier_2(BMessage *self, const char * property, int32 index, int32 range);
	status_t AddSpecifier();

	// status_t be_BMessage_AddSpecifier_3(BMessage *self, const char * property, const char * name);
	status_t AddSpecifier();

	// status_t be_BMessage_AddSpecifier_4(BMessage *self, const BMessage * specifier);
	status_t AddSpecifier();

	// status_t be_BMessage_SetCurrentSpecifier(BMessage *self, int32 index);
	status_t SetCurrentSpecifier();

	// status_t be_BMessage_GetCurrentSpecifier(BMessage *self, int32 * index, BMessage * specifier, int32 * what, const char ** property);
	status_t GetCurrentSpecifier();

	// status_t be_BMessage_HasSpecifiers(BMessage *self);
	status_t HasSpecifiers();

	// status_t be_BMessage_PopSpecifier(BMessage *self);
	status_t PopSpecifier();

	// status_t be_BMessage_AddAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t AddAlignment();

	// status_t be_BMessage_AddRect(BMessage *self, const char * name, BRect *aRect);
	status_t AddRect();

	// status_t be_BMessage_AddPoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t AddPoint();

	// status_t be_BMessage_AddSize(BMessage *self, const char* name, BSize *aSize);
	status_t AddSize();

	// status_t be_BMessage_AddString(BMessage *self, const char * name, const char * aString);
	status_t AddString();

	// status_t be_BMessage_AddString_1(BMessage *self, const char * name, const BString & aString);
	status_t AddString();

	// status_t be_BMessage_AddInt8(BMessage *self, const char * name, int8 value);
	status_t AddInt8();

	// status_t be_BMessage_AddUInt8(BMessage *self, const char * name, uint8 value);
	status_t AddUInt8();

	// status_t be_BMessage_AddInt16(BMessage *self, const char * name, int16 value);
	status_t AddInt16();

	// status_t be_BMessage_AddUInt16(BMessage *self, const char * name, uint16 value);
	status_t AddUInt16();

	// status_t be_BMessage_AddInt32(BMessage *self, const char * name, int32 value);
	status_t AddInt32();

	// status_t be_BMessage_AddUInt32(BMessage *self, const char * name, uint32 value);
	status_t AddUInt32();

	// status_t be_BMessage_AddInt64(BMessage *self, const char * name, int64 value);
	status_t AddInt64();

	// status_t be_BMessage_AddUInt64(BMessage *self, const char * name, uint64 value);
	status_t AddUInt64();

	// status_t be_BMessage_AddBool(BMessage *self, const char * name, bool aBoolean);
	status_t AddBool();

	// status_t be_BMessage_AddFloat(BMessage *self, const char * name, float aFloat);
	status_t AddFloat();

	// status_t be_BMessage_AddDouble(BMessage *self, const char * name, double aDouble);
	status_t AddDouble();

	// status_t be_BMessage_AddPointer(BMessage *self, const char * name, const void * aPointer);
	status_t AddPointer();

	// status_t be_BMessage_AddMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t AddMessenger();

	// status_t be_BMessage_AddRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t AddRef();

	// status_t be_BMessage_AddMessage(BMessage *self, const char * name, const BMessage * message);
	status_t AddMessage();

	// status_t be_BMessage_AddFlat(BMessage *self, const char * name, BFlattenable * object, int32 count);
	status_t AddFlat();

	// status_t be_BMessage_AddData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes, bool isFixedSize, int32 count);
	status_t AddData();

	// status_t be_BMessage_RemoveData(BMessage *self, const char * name, int32 index);
	status_t RemoveData();

	// status_t be_BMessage_RemoveName(BMessage *self, const char * name);
	status_t RemoveName();

	// status_t be_BMessage_MakeEmpty(BMessage *self);
	status_t MakeEmpty();

	// status_t be_BMessage_FindAlignment(BMessage *self, const char* name, BAlignment* alignment);
	status_t FindAlignment();

	// status_t be_BMessage_FindAlignment_1(BMessage *self, const char* name, int32 index, BAlignment* alignment);
	status_t FindAlignment();

	// status_t be_BMessage_FindRect(BMessage *self, const char * name, BRect * rect);
	status_t FindRect();

	// status_t be_BMessage_FindRect_1(BMessage *self, const char * name, int32 index, BRect * rect);
	status_t FindRect();

	// status_t be_BMessage_FindPoint(BMessage *self, const char * name, BPoint * point);
	status_t FindPoint();

	// status_t be_BMessage_FindPoint_1(BMessage *self, const char * name, int32 index, BPoint * point);
	status_t FindPoint();

	// status_t be_BMessage_FindSize(BMessage *self, const char * name, BSize* size);
	status_t FindSize();

	// status_t be_BMessage_FindSize_1(BMessage *self, const char * name, int32 index, BSize* size);
	status_t FindSize();

	// status_t be_BMessage_FindString(BMessage *self, const char * name, const char ** string);
	status_t FindString();

	// status_t be_BMessage_FindString_1(BMessage *self, const char * name, int32 index, const char ** string);
	status_t FindString();

	// status_t be_BMessage_FindString_2(BMessage *self, const char * name, BString * string);
	status_t FindString();

	// status_t be_BMessage_FindString_3(BMessage *self, const char * name, int32 index, BString * string);
	status_t FindString();

	// status_t be_BMessage_FindInt8(BMessage *self, const char * name, int8 * value);
	status_t FindInt8();

	// status_t be_BMessage_FindInt8_1(BMessage *self, const char * name, int32 index, int8 * value);
	status_t FindInt8();

	// status_t be_BMessage_FindUInt8(BMessage *self, const char * name, uint8 * value);
	status_t FindUInt8();

	// status_t be_BMessage_FindUInt8_1(BMessage *self, const char * name, int32 index, uint8 * value);
	status_t FindUInt8();

	// status_t be_BMessage_FindInt16(BMessage *self, const char * name, int16 * value);
	status_t FindInt16();

	// status_t be_BMessage_FindInt16_1(BMessage *self, const char * name, int32 index, int16 * value);
	status_t FindInt16();

	// status_t be_BMessage_FindUInt16(BMessage *self, const char * name, uint16 * value);
	status_t FindUInt16();

	// status_t be_BMessage_FindUInt16_1(BMessage *self, const char * name, int32 index, uint16 * value);
	status_t FindUInt16();

	// status_t be_BMessage_FindInt32(BMessage *self, const char * name, int32 * value);
	status_t FindInt32();

	// status_t be_BMessage_FindInt32_1(BMessage *self, const char * name, int32 index, int32 * value);
	status_t FindInt32();

	// status_t be_BMessage_FindUInt32(BMessage *self, const char * name, uint32 * value);
	status_t FindUInt32();

	// status_t be_BMessage_FindUInt32_1(BMessage *self, const char * name, int32 index, uint32 * value);
	status_t FindUInt32();

	// status_t be_BMessage_FindInt64(BMessage *self, const char * name, int64 * value);
	status_t FindInt64();

	// status_t be_BMessage_FindInt64_1(BMessage *self, const char * name, int32 index, int64 * value);
	status_t FindInt64();

	// status_t be_BMessage_FindUInt64(BMessage *self, const char * name, uint64 * value);
	status_t FindUInt64();

	// status_t be_BMessage_FindUInt64_1(BMessage *self, const char * name, int32 index, uint64 * value);
	status_t FindUInt64();

	// status_t be_BMessage_FindBool(BMessage *self, const char * name, bool * value);
	status_t FindBool();

	// status_t be_BMessage_FindBool_1(BMessage *self, const char * name, int32 index, bool * value);
	status_t FindBool();

	// status_t be_BMessage_FindFloat(BMessage *self, const char * name, float * value);
	status_t FindFloat();

	// status_t be_BMessage_FindFloat_1(BMessage *self, const char * name, int32 index, float * value);
	status_t FindFloat();

	// status_t be_BMessage_FindDouble(BMessage *self, const char * name, double * value);
	status_t FindDouble();

	// status_t be_BMessage_FindDouble_1(BMessage *self, const char * name, int32 index, double * value);
	status_t FindDouble();

	// status_t be_BMessage_FindPointer(BMessage *self, const char * name, void ** pointer);
	status_t FindPointer();

	// status_t be_BMessage_FindPointer_1(BMessage *self, const char * name, int32 index, void ** pointer);
	status_t FindPointer();

	// status_t be_BMessage_FindMessenger(BMessage *self, const char * name, BMessenger * messenger);
	status_t FindMessenger();

	// status_t be_BMessage_FindMessenger_1(BMessage *self, const char * name, int32 index, BMessenger * messenger);
	status_t FindMessenger();

	// status_t be_BMessage_FindRef(BMessage *self, const char * name, entry_ref * _ref);
	status_t FindRef();

	// status_t be_BMessage_FindRef_1(BMessage *self, const char * name, int32 index, entry_ref * _ref);
	status_t FindRef();

	// status_t be_BMessage_FindMessage(BMessage *self, const char * name, BMessage * message);
	status_t FindMessage();

	// status_t be_BMessage_FindMessage_1(BMessage *self, const char * name, int32 index, BMessage * message);
	status_t FindMessage();

	// status_t be_BMessage_FindFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t FindFlat();

	// status_t be_BMessage_FindFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t FindFlat();

	// status_t be_BMessage_FindData(BMessage *self, const char * name, type_code type, const void ** data, ssize_t * numBytes);
	status_t FindData();

	// status_t be_BMessage_FindData_1(BMessage *self, const char * name, type_code type, int32 index, const void ** data, ssize_t * numBytes);
	status_t FindData();

	// status_t be_BMessage_ReplaceAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t ReplaceAlignment();

	// status_t be_BMessage_ReplaceAlignment_1(BMessage *self, const char* name, int32 index, const BAlignment& alignment);
	status_t ReplaceAlignment();

	// status_t be_BMessage_ReplaceRect(BMessage *self, const char * name, BRect *aRect);
	status_t ReplaceRect();

	// status_t be_BMessage_ReplaceRect_1(BMessage *self, const char * name, int32 index, BRect *aRect);
	status_t ReplaceRect();

	// status_t be_BMessage_ReplacePoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t ReplacePoint();

	// status_t be_BMessage_ReplacePoint_1(BMessage *self, const char * name, int32 index, BPoint *aPoint);
	status_t ReplacePoint();

	// status_t be_BMessage_ReplaceSize(BMessage *self, const char* name, BSize *aSize);
	status_t ReplaceSize();

	// status_t be_BMessage_ReplaceSize_1(BMessage *self, const char* name, int32 index, BSize *aSize);
	status_t ReplaceSize();

	// status_t be_BMessage_ReplaceString(BMessage *self, const char * name, const char * aString);
	status_t ReplaceString();

	// status_t be_BMessage_ReplaceString_1(BMessage *self, const char * name, int32 index, const char * aString);
	status_t ReplaceString();

	// status_t be_BMessage_ReplaceString_2(BMessage *self, const char * name, const BString & aString);
	status_t ReplaceString();

	// status_t be_BMessage_ReplaceString_3(BMessage *self, const char * name, int32 index, const BString & aString);
	status_t ReplaceString();

	// status_t be_BMessage_ReplaceInt8(BMessage *self, const char * name, int8 value);
	status_t ReplaceInt8();

	// status_t be_BMessage_ReplaceInt8_1(BMessage *self, const char * name, int32 index, int8 value);
	status_t ReplaceInt8();

	// status_t be_BMessage_ReplaceUInt8(BMessage *self, const char * name, uint8 value);
	status_t ReplaceUInt8();

	// status_t be_BMessage_ReplaceUInt8_1(BMessage *self, const char * name, int32 index, uint8 value);
	status_t ReplaceUInt8();

	// status_t be_BMessage_ReplaceInt16(BMessage *self, const char * name, int16 value);
	status_t ReplaceInt16();

	// status_t be_BMessage_ReplaceInt16_1(BMessage *self, const char * name, int32 index, int16 value);
	status_t ReplaceInt16();

	// status_t be_BMessage_ReplaceUInt16(BMessage *self, const char * name, uint16 value);
	status_t ReplaceUInt16();

	// status_t be_BMessage_ReplaceUInt16_1(BMessage *self, const char * name, int32 index, uint16 value);
	status_t ReplaceUInt16();

	// status_t be_BMessage_ReplaceInt32(BMessage *self, const char * name, int32 value);
	status_t ReplaceInt32();

	// status_t be_BMessage_ReplaceInt32_1(BMessage *self, const char * name, int32 index, int32 value);
	status_t ReplaceInt32();

	// status_t be_BMessage_ReplaceUInt32(BMessage *self, const char * name, uint32 value);
	status_t ReplaceUInt32();

	// status_t be_BMessage_ReplaceUInt32_1(BMessage *self, const char * name, int32 index, uint32 value);
	status_t ReplaceUInt32();

	// status_t be_BMessage_ReplaceInt64(BMessage *self, const char * name, int64 value);
	status_t ReplaceInt64();

	// status_t be_BMessage_ReplaceInt64_1(BMessage *self, const char * name, int32 index, int64 value);
	status_t ReplaceInt64();

	// status_t be_BMessage_ReplaceUInt64(BMessage *self, const char * name, uint64 value);
	status_t ReplaceUInt64();

	// status_t be_BMessage_ReplaceUInt64_1(BMessage *self, const char * name, int32 index, uint64 value);
	status_t ReplaceUInt64();

	// status_t be_BMessage_ReplaceBool(BMessage *self, const char * name, bool aBoolean);
	status_t ReplaceBool();

	// status_t be_BMessage_ReplaceBool_1(BMessage *self, const char * name, int32 index, bool aBoolean);
	status_t ReplaceBool();

	// status_t be_BMessage_ReplaceFloat(BMessage *self, const char * name, float aFloat);
	status_t ReplaceFloat();

	// status_t be_BMessage_ReplaceFloat_1(BMessage *self, const char * name, int32 index, float aFloat);
	status_t ReplaceFloat();

	// status_t be_BMessage_ReplaceDouble(BMessage *self, const char * name, double aDouble);
	status_t ReplaceDouble();

	// status_t be_BMessage_ReplaceDouble_1(BMessage *self, const char * name, int32 index, double aDouble);
	status_t ReplaceDouble();

	// status_t be_BMessage_ReplacePointer(BMessage *self, const char * name, const void * pointer);
	status_t ReplacePointer();

	// status_t be_BMessage_ReplacePointer_1(BMessage *self, const char * name, int32 index, const void * pointer);
	status_t ReplacePointer();

	// status_t be_BMessage_ReplaceMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t ReplaceMessenger();

	// status_t be_BMessage_ReplaceMessenger_1(BMessage *self, const char * name, int32 index, BMessenger *messenger);
	status_t ReplaceMessenger();

	// status_t be_BMessage_ReplaceRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t ReplaceRef();

	// status_t be_BMessage_ReplaceRef_1(BMessage *self, const char * name, int32 index, const entry_ref * _ref);
	status_t ReplaceRef();

	// status_t be_BMessage_ReplaceMessage(BMessage *self, const char * name, const BMessage * message);
	status_t ReplaceMessage();

	// status_t be_BMessage_ReplaceMessage_1(BMessage *self, const char * name, int32 index, const BMessage * message);
	status_t ReplaceMessage();

	// status_t be_BMessage_ReplaceFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t ReplaceFlat();

	// status_t be_BMessage_ReplaceFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t ReplaceFlat();

	// status_t be_BMessage_ReplaceData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes);
	status_t ReplaceData();

	// status_t be_BMessage_ReplaceData_1(BMessage *self, const char * name, type_code type, int32 index, const void * data, ssize_t numBytes);
	status_t ReplaceData();

	// bool be_BMessage_HasSameData(BMessage *self, const BMessage & other, bool ignoreFieldOrder, bool deep);
	bool HasSameData();

	// bool be_BMessage_HasAlignment(BMessage *self, const char* name, int32 n);
	bool HasAlignment();

	// bool be_BMessage_HasRect(BMessage *self, const char* name, int32 n);
	bool HasRect();

	// bool be_BMessage_HasPoint(BMessage *self, const char* name, int32 n);
	bool HasPoint();

	// bool be_BMessage_HasSize(BMessage *self, const char* name, int32 n);
	bool HasSize();

	// bool be_BMessage_HasString(BMessage *self, const char* name, int32 n);
	bool HasString();

	// bool be_BMessage_HasInt8(BMessage *self, const char* name, int32 n);
	bool HasInt8();

	// bool be_BMessage_HasUInt8(BMessage *self, const char* name, int32 n);
	bool HasUInt8();

	// bool be_BMessage_HasInt16(BMessage *self, const char* name, int32 n);
	bool HasInt16();

	// bool be_BMessage_HasUInt16(BMessage *self, const char* name, int32 n);
	bool HasUInt16();

	// bool be_BMessage_HasInt32(BMessage *self, const char* name, int32 n);
	bool HasInt32();

	// bool be_BMessage_HasUInt32(BMessage *self, const char* name, int32 n);
	bool HasUInt32();

	// bool be_BMessage_HasInt64(BMessage *self, const char* name, int32 n);
	bool HasInt64();

	// bool be_BMessage_HasUInt64(BMessage *self, const char* name, int32 n);
	bool HasUInt64();

	// bool be_BMessage_HasBool(BMessage *self, const char* name, int32 n);
	bool HasBool();

	// bool be_BMessage_HasFloat(BMessage *self, const char* name, int32 n);
	bool HasFloat();

	// bool be_BMessage_HasDouble(BMessage *self, const char* name, int32 n);
	bool HasDouble();

	// bool be_BMessage_HasPointer(BMessage *self, const char* name, int32 n);
	bool HasPointer();

	// bool be_BMessage_HasMessenger(BMessage *self, const char* name, int32 n);
	bool HasMessenger();

	// bool be_BMessage_HasRef(BMessage *self, const char* name, int32 n);
	bool HasRef();

	// bool be_BMessage_HasMessage(BMessage *self, const char* name, int32 n);
	bool HasMessage();

	// bool be_BMessage_HasFlat(BMessage *self, const char* name, const BFlattenable * flat);
	bool HasFlat();

	// bool be_BMessage_HasFlat_1(BMessage *self, const char* name, int32 n, const BFlattenable * flat);
	bool HasFlat();

	// bool be_BMessage_HasData(BMessage *self, const char* name, type_code code, int32 n);
	bool HasData();

	// BRect * be_BMessage_FindRect_2(BMessage *self, const char* name, int32 n);
	BRect FindRect();

	// BPoint * be_BMessage_FindPoint_2(BMessage *self, const char* name, int32 n);
	BPoint FindPoint();

	// const char * be_BMessage_FindString_4(BMessage *self, const char* name, int32 n);
	char * FindString();

	// int8 be_BMessage_FindInt8_2(BMessage *self, const char* name, int32 n);
	int8 FindInt8();

	// int16 be_BMessage_FindInt16_2(BMessage *self, const char* name, int32 n);
	int16 FindInt16();

	// int32 be_BMessage_FindInt32_2(BMessage *self, const char* name, int32 n);
	int32 FindInt32();

	// int64 be_BMessage_FindInt64_2(BMessage *self, const char* name, int32 n);
	int64 FindInt64();

	// bool be_BMessage_FindBool_2(BMessage *self, const char* name, int32 n);
	bool FindBool();

	// float be_BMessage_FindFloat_2(BMessage *self, const char* name, int32 n);
	float FindFloat();

	// double be_BMessage_FindDouble_2(BMessage *self, const char* name, int32 n);
	double FindDouble();
*/
	void * _InstPtr();
	bool _OwnsPtr();
}

final class BMessage : IBMessage
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMessage* be_BMessage_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMessage_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BMessage* be_BMessage_ctor_1(void *bindInstPtr, uint32 what);
	this(uint32 what) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMessage_ctor_1(cast(void *)this, what);
			fOwnsPointer = true;
		}
	}

	// BMessage* be_BMessage_ctor_2(void *bindInstPtr, const BMessage * other);
	this(IBMessage other) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMessage_ctor_2(cast(void *)this, other._InstPtr());
			fOwnsPointer = true;
		}
	}

	// void be_BMessage_dtor(BMessage* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BMessage_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	//void be_BMessage_what_varSet(BMessage *self, uint32 what)
	void what(uint32 _what) {
		be_BMessage_what_varSet(_InstPtr(), _what);
	}

	//uint32 be_BMessage_what_varGet(BMessage *self)
	uint32 what() {
		return be_BMessage_what_varGet(_InstPtr());
	}
/*
	// status_t be_BMessage_GetInfo(BMessage *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound);
	status_t GetInfo() {
		return be_BMessage_GetInfo(_InstPtr());
	}

	// status_t be_BMessage_GetInfo_1(BMessage *self, const char * name, type_code * typeFound, int32 * countFound);
	status_t GetInfo() {
		return be_BMessage_GetInfo_1(_InstPtr());
	}

	// status_t be_BMessage_GetInfo_2(BMessage *self, const char * name, type_code * typeFound, bool * fixedSize);
	status_t GetInfo() {
		return be_BMessage_GetInfo_2(_InstPtr());
	}

	// int32 be_BMessage_CountNames(BMessage *self, type_code type);
	int32 CountNames() {
		return be_BMessage_CountNames(_InstPtr());
	}

	// bool be_BMessage_IsEmpty(BMessage *self);
	bool IsEmpty() {
		return be_BMessage_IsEmpty(_InstPtr());
	}

	// bool be_BMessage_IsSystem(BMessage *self);
	bool IsSystem() {
		return be_BMessage_IsSystem(_InstPtr());
	}

	// bool be_BMessage_IsReply(BMessage *self);
	bool IsReply() {
		return be_BMessage_IsReply(_InstPtr());
	}

	// void be_BMessage_PrintToStream(BMessage *self);
	void PrintToStream() {
		be_BMessage_PrintToStream(_InstPtr());
	}

	// status_t be_BMessage_Rename(BMessage *self, const char * oldEntry, const char * newEntry);
	status_t Rename() {
		return be_BMessage_Rename(_InstPtr());
	}

	// bool be_BMessage_WasDelivered(BMessage *self);
	bool WasDelivered() {
		return be_BMessage_WasDelivered(_InstPtr());
	}

	// bool be_BMessage_IsSourceWaiting(BMessage *self);
	bool IsSourceWaiting() {
		return be_BMessage_IsSourceWaiting(_InstPtr());
	}

	// bool be_BMessage_IsSourceRemote(BMessage *self);
	bool IsSourceRemote() {
		return be_BMessage_IsSourceRemote(_InstPtr());
	}

	// BMessenger * be_BMessage_ReturnAddress(BMessage *self);
	BMessenger ReturnAddress() {
		return be_BMessage_ReturnAddress(_InstPtr());
	}

	// const BMessage * be_BMessage_Previous(BMessage *self);
	BMessage * Previous() {
		return be_BMessage_Previous(_InstPtr());
	}

	// bool be_BMessage_WasDropped(BMessage *self);
	bool WasDropped() {
		return be_BMessage_WasDropped(_InstPtr());
	}

	// BPoint * be_BMessage_DropPoint(BMessage *self, BPoint * offset);
	BPoint DropPoint() {
		return be_BMessage_DropPoint(_InstPtr());
	}

	// status_t be_BMessage_SendReply(BMessage *self, uint32 command, BHandler * replyTo);
	status_t SendReply() {
		return be_BMessage_SendReply(_InstPtr());
	}

	// status_t be_BMessage_SendReply_1(BMessage *self, BMessage * reply, BHandler * replyTo, bigtime_t timeout);
	status_t SendReply() {
		return be_BMessage_SendReply_1(_InstPtr());
	}

	// status_t be_BMessage_SendReply_2(BMessage *self, BMessage * reply, BMessenger *replyTo, bigtime_t timeout);
	status_t SendReply() {
		return be_BMessage_SendReply_2(_InstPtr());
	}

	// status_t be_BMessage_SendReply_3(BMessage *self, uint32 command, BMessage * replyToReply);
	status_t SendReply() {
		return be_BMessage_SendReply_3(_InstPtr());
	}

	// status_t be_BMessage_SendReply_4(BMessage *self, BMessage * the_reply, BMessage * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout);
	status_t SendReply() {
		return be_BMessage_SendReply_4(_InstPtr());
	}

	// ssize_t be_BMessage_FlattenedSize(BMessage *self);
	ssize_t FlattenedSize() {
		return be_BMessage_FlattenedSize(_InstPtr());
	}

	// status_t be_BMessage_Flatten(BMessage *self, char * buffer, ssize_t size);
	status_t Flatten() {
		return be_BMessage_Flatten(_InstPtr());
	}

	// status_t be_BMessage_Flatten_1(BMessage *self, BDataIO * stream, ssize_t * size);
	status_t Flatten() {
		return be_BMessage_Flatten_1(_InstPtr());
	}

	// status_t be_BMessage_Unflatten(BMessage *self, const char * flatBuffer);
	status_t Unflatten() {
		return be_BMessage_Unflatten(_InstPtr());
	}

	// status_t be_BMessage_Unflatten_1(BMessage *self, BDataIO * stream);
	status_t Unflatten() {
		return be_BMessage_Unflatten_1(_InstPtr());
	}

	// status_t be_BMessage_AddSpecifier(BMessage *self, const char * property);
	status_t AddSpecifier() {
		return be_BMessage_AddSpecifier(_InstPtr());
	}

	// status_t be_BMessage_AddSpecifier_1(BMessage *self, const char * property, int32 index);
	status_t AddSpecifier() {
		return be_BMessage_AddSpecifier_1(_InstPtr());
	}

	// status_t be_BMessage_AddSpecifier_2(BMessage *self, const char * property, int32 index, int32 range);
	status_t AddSpecifier() {
		return be_BMessage_AddSpecifier_2(_InstPtr());
	}

	// status_t be_BMessage_AddSpecifier_3(BMessage *self, const char * property, const char * name);
	status_t AddSpecifier() {
		return be_BMessage_AddSpecifier_3(_InstPtr());
	}

	// status_t be_BMessage_AddSpecifier_4(BMessage *self, const BMessage * specifier);
	status_t AddSpecifier() {
		return be_BMessage_AddSpecifier_4(_InstPtr());
	}

	// status_t be_BMessage_SetCurrentSpecifier(BMessage *self, int32 index);
	status_t SetCurrentSpecifier() {
		return be_BMessage_SetCurrentSpecifier(_InstPtr());
	}

	// status_t be_BMessage_GetCurrentSpecifier(BMessage *self, int32 * index, BMessage * specifier, int32 * what, const char ** property);
	status_t GetCurrentSpecifier() {
		return be_BMessage_GetCurrentSpecifier(_InstPtr());
	}

	// status_t be_BMessage_HasSpecifiers(BMessage *self);
	status_t HasSpecifiers() {
		return be_BMessage_HasSpecifiers(_InstPtr());
	}

	// status_t be_BMessage_PopSpecifier(BMessage *self);
	status_t PopSpecifier() {
		return be_BMessage_PopSpecifier(_InstPtr());
	}

	// status_t be_BMessage_AddAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t AddAlignment() {
		return be_BMessage_AddAlignment(_InstPtr());
	}

	// status_t be_BMessage_AddRect(BMessage *self, const char * name, BRect *aRect);
	status_t AddRect() {
		return be_BMessage_AddRect(_InstPtr());
	}

	// status_t be_BMessage_AddPoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t AddPoint() {
		return be_BMessage_AddPoint(_InstPtr());
	}

	// status_t be_BMessage_AddSize(BMessage *self, const char* name, BSize *aSize);
	status_t AddSize() {
		return be_BMessage_AddSize(_InstPtr());
	}

	// status_t be_BMessage_AddString(BMessage *self, const char * name, const char * aString);
	status_t AddString() {
		return be_BMessage_AddString(_InstPtr());
	}

	// status_t be_BMessage_AddString_1(BMessage *self, const char * name, const BString & aString);
	status_t AddString() {
		return be_BMessage_AddString_1(_InstPtr());
	}

	// status_t be_BMessage_AddInt8(BMessage *self, const char * name, int8 value);
	status_t AddInt8() {
		return be_BMessage_AddInt8(_InstPtr());
	}

	// status_t be_BMessage_AddUInt8(BMessage *self, const char * name, uint8 value);
	status_t AddUInt8() {
		return be_BMessage_AddUInt8(_InstPtr());
	}

	// status_t be_BMessage_AddInt16(BMessage *self, const char * name, int16 value);
	status_t AddInt16() {
		return be_BMessage_AddInt16(_InstPtr());
	}

	// status_t be_BMessage_AddUInt16(BMessage *self, const char * name, uint16 value);
	status_t AddUInt16() {
		return be_BMessage_AddUInt16(_InstPtr());
	}

	// status_t be_BMessage_AddInt32(BMessage *self, const char * name, int32 value);
	status_t AddInt32() {
		return be_BMessage_AddInt32(_InstPtr());
	}

	// status_t be_BMessage_AddUInt32(BMessage *self, const char * name, uint32 value);
	status_t AddUInt32() {
		return be_BMessage_AddUInt32(_InstPtr());
	}

	// status_t be_BMessage_AddInt64(BMessage *self, const char * name, int64 value);
	status_t AddInt64() {
		return be_BMessage_AddInt64(_InstPtr());
	}

	// status_t be_BMessage_AddUInt64(BMessage *self, const char * name, uint64 value);
	status_t AddUInt64() {
		return be_BMessage_AddUInt64(_InstPtr());
	}

	// status_t be_BMessage_AddBool(BMessage *self, const char * name, bool aBoolean);
	status_t AddBool() {
		return be_BMessage_AddBool(_InstPtr());
	}

	// status_t be_BMessage_AddFloat(BMessage *self, const char * name, float aFloat);
	status_t AddFloat() {
		return be_BMessage_AddFloat(_InstPtr());
	}

	// status_t be_BMessage_AddDouble(BMessage *self, const char * name, double aDouble);
	status_t AddDouble() {
		return be_BMessage_AddDouble(_InstPtr());
	}

	// status_t be_BMessage_AddPointer(BMessage *self, const char * name, const void * aPointer);
	status_t AddPointer() {
		return be_BMessage_AddPointer(_InstPtr());
	}

	// status_t be_BMessage_AddMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t AddMessenger() {
		return be_BMessage_AddMessenger(_InstPtr());
	}

	// status_t be_BMessage_AddRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t AddRef() {
		return be_BMessage_AddRef(_InstPtr());
	}

	// status_t be_BMessage_AddMessage(BMessage *self, const char * name, const BMessage * message);
	status_t AddMessage() {
		return be_BMessage_AddMessage(_InstPtr());
	}

	// status_t be_BMessage_AddFlat(BMessage *self, const char * name, BFlattenable * object, int32 count);
	status_t AddFlat() {
		return be_BMessage_AddFlat(_InstPtr());
	}

	// status_t be_BMessage_AddData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes, bool isFixedSize, int32 count);
	status_t AddData() {
		return be_BMessage_AddData(_InstPtr());
	}

	// status_t be_BMessage_RemoveData(BMessage *self, const char * name, int32 index);
	status_t RemoveData() {
		return be_BMessage_RemoveData(_InstPtr());
	}

	// status_t be_BMessage_RemoveName(BMessage *self, const char * name);
	status_t RemoveName() {
		return be_BMessage_RemoveName(_InstPtr());
	}

	// status_t be_BMessage_MakeEmpty(BMessage *self);
	status_t MakeEmpty() {
		return be_BMessage_MakeEmpty(_InstPtr());
	}

	// status_t be_BMessage_FindAlignment(BMessage *self, const char* name, BAlignment* alignment);
	status_t FindAlignment() {
		return be_BMessage_FindAlignment(_InstPtr());
	}

	// status_t be_BMessage_FindAlignment_1(BMessage *self, const char* name, int32 index, BAlignment* alignment);
	status_t FindAlignment() {
		return be_BMessage_FindAlignment_1(_InstPtr());
	}

	// status_t be_BMessage_FindRect(BMessage *self, const char * name, BRect * rect);
	status_t FindRect() {
		return be_BMessage_FindRect(_InstPtr());
	}

	// status_t be_BMessage_FindRect_1(BMessage *self, const char * name, int32 index, BRect * rect);
	status_t FindRect() {
		return be_BMessage_FindRect_1(_InstPtr());
	}

	// status_t be_BMessage_FindPoint(BMessage *self, const char * name, BPoint * point);
	status_t FindPoint() {
		return be_BMessage_FindPoint(_InstPtr());
	}

	// status_t be_BMessage_FindPoint_1(BMessage *self, const char * name, int32 index, BPoint * point);
	status_t FindPoint() {
		return be_BMessage_FindPoint_1(_InstPtr());
	}

	// status_t be_BMessage_FindSize(BMessage *self, const char * name, BSize* size);
	status_t FindSize() {
		return be_BMessage_FindSize(_InstPtr());
	}

	// status_t be_BMessage_FindSize_1(BMessage *self, const char * name, int32 index, BSize* size);
	status_t FindSize() {
		return be_BMessage_FindSize_1(_InstPtr());
	}

	// status_t be_BMessage_FindString(BMessage *self, const char * name, const char ** string);
	status_t FindString() {
		return be_BMessage_FindString(_InstPtr());
	}

	// status_t be_BMessage_FindString_1(BMessage *self, const char * name, int32 index, const char ** string);
	status_t FindString() {
		return be_BMessage_FindString_1(_InstPtr());
	}

	// status_t be_BMessage_FindString_2(BMessage *self, const char * name, BString * string);
	status_t FindString() {
		return be_BMessage_FindString_2(_InstPtr());
	}

	// status_t be_BMessage_FindString_3(BMessage *self, const char * name, int32 index, BString * string);
	status_t FindString() {
		return be_BMessage_FindString_3(_InstPtr());
	}

	// status_t be_BMessage_FindInt8(BMessage *self, const char * name, int8 * value);
	status_t FindInt8() {
		return be_BMessage_FindInt8(_InstPtr());
	}

	// status_t be_BMessage_FindInt8_1(BMessage *self, const char * name, int32 index, int8 * value);
	status_t FindInt8() {
		return be_BMessage_FindInt8_1(_InstPtr());
	}

	// status_t be_BMessage_FindUInt8(BMessage *self, const char * name, uint8 * value);
	status_t FindUInt8() {
		return be_BMessage_FindUInt8(_InstPtr());
	}

	// status_t be_BMessage_FindUInt8_1(BMessage *self, const char * name, int32 index, uint8 * value);
	status_t FindUInt8() {
		return be_BMessage_FindUInt8_1(_InstPtr());
	}

	// status_t be_BMessage_FindInt16(BMessage *self, const char * name, int16 * value);
	status_t FindInt16() {
		return be_BMessage_FindInt16(_InstPtr());
	}

	// status_t be_BMessage_FindInt16_1(BMessage *self, const char * name, int32 index, int16 * value);
	status_t FindInt16() {
		return be_BMessage_FindInt16_1(_InstPtr());
	}

	// status_t be_BMessage_FindUInt16(BMessage *self, const char * name, uint16 * value);
	status_t FindUInt16() {
		return be_BMessage_FindUInt16(_InstPtr());
	}

	// status_t be_BMessage_FindUInt16_1(BMessage *self, const char * name, int32 index, uint16 * value);
	status_t FindUInt16() {
		return be_BMessage_FindUInt16_1(_InstPtr());
	}

	// status_t be_BMessage_FindInt32(BMessage *self, const char * name, int32 * value);
	status_t FindInt32() {
		return be_BMessage_FindInt32(_InstPtr());
	}

	// status_t be_BMessage_FindInt32_1(BMessage *self, const char * name, int32 index, int32 * value);
	status_t FindInt32() {
		return be_BMessage_FindInt32_1(_InstPtr());
	}

	// status_t be_BMessage_FindUInt32(BMessage *self, const char * name, uint32 * value);
	status_t FindUInt32() {
		return be_BMessage_FindUInt32(_InstPtr());
	}

	// status_t be_BMessage_FindUInt32_1(BMessage *self, const char * name, int32 index, uint32 * value);
	status_t FindUInt32() {
		return be_BMessage_FindUInt32_1(_InstPtr());
	}

	// status_t be_BMessage_FindInt64(BMessage *self, const char * name, int64 * value);
	status_t FindInt64() {
		return be_BMessage_FindInt64(_InstPtr());
	}

	// status_t be_BMessage_FindInt64_1(BMessage *self, const char * name, int32 index, int64 * value);
	status_t FindInt64() {
		return be_BMessage_FindInt64_1(_InstPtr());
	}

	// status_t be_BMessage_FindUInt64(BMessage *self, const char * name, uint64 * value);
	status_t FindUInt64() {
		return be_BMessage_FindUInt64(_InstPtr());
	}

	// status_t be_BMessage_FindUInt64_1(BMessage *self, const char * name, int32 index, uint64 * value);
	status_t FindUInt64() {
		return be_BMessage_FindUInt64_1(_InstPtr());
	}

	// status_t be_BMessage_FindBool(BMessage *self, const char * name, bool * value);
	status_t FindBool() {
		return be_BMessage_FindBool(_InstPtr());
	}

	// status_t be_BMessage_FindBool_1(BMessage *self, const char * name, int32 index, bool * value);
	status_t FindBool() {
		return be_BMessage_FindBool_1(_InstPtr());
	}

	// status_t be_BMessage_FindFloat(BMessage *self, const char * name, float * value);
	status_t FindFloat() {
		return be_BMessage_FindFloat(_InstPtr());
	}

	// status_t be_BMessage_FindFloat_1(BMessage *self, const char * name, int32 index, float * value);
	status_t FindFloat() {
		return be_BMessage_FindFloat_1(_InstPtr());
	}

	// status_t be_BMessage_FindDouble(BMessage *self, const char * name, double * value);
	status_t FindDouble() {
		return be_BMessage_FindDouble(_InstPtr());
	}

	// status_t be_BMessage_FindDouble_1(BMessage *self, const char * name, int32 index, double * value);
	status_t FindDouble() {
		return be_BMessage_FindDouble_1(_InstPtr());
	}

	// status_t be_BMessage_FindPointer(BMessage *self, const char * name, void ** pointer);
	status_t FindPointer() {
		return be_BMessage_FindPointer(_InstPtr());
	}

	// status_t be_BMessage_FindPointer_1(BMessage *self, const char * name, int32 index, void ** pointer);
	status_t FindPointer() {
		return be_BMessage_FindPointer_1(_InstPtr());
	}

	// status_t be_BMessage_FindMessenger(BMessage *self, const char * name, BMessenger * messenger);
	status_t FindMessenger() {
		return be_BMessage_FindMessenger(_InstPtr());
	}

	// status_t be_BMessage_FindMessenger_1(BMessage *self, const char * name, int32 index, BMessenger * messenger);
	status_t FindMessenger() {
		return be_BMessage_FindMessenger_1(_InstPtr());
	}

	// status_t be_BMessage_FindRef(BMessage *self, const char * name, entry_ref * _ref);
	status_t FindRef() {
		return be_BMessage_FindRef(_InstPtr());
	}

	// status_t be_BMessage_FindRef_1(BMessage *self, const char * name, int32 index, entry_ref * _ref);
	status_t FindRef() {
		return be_BMessage_FindRef_1(_InstPtr());
	}

	// status_t be_BMessage_FindMessage(BMessage *self, const char * name, BMessage * message);
	status_t FindMessage() {
		return be_BMessage_FindMessage(_InstPtr());
	}

	// status_t be_BMessage_FindMessage_1(BMessage *self, const char * name, int32 index, BMessage * message);
	status_t FindMessage() {
		return be_BMessage_FindMessage_1(_InstPtr());
	}

	// status_t be_BMessage_FindFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t FindFlat() {
		return be_BMessage_FindFlat(_InstPtr());
	}

	// status_t be_BMessage_FindFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t FindFlat() {
		return be_BMessage_FindFlat_1(_InstPtr());
	}

	// status_t be_BMessage_FindData(BMessage *self, const char * name, type_code type, const void ** data, ssize_t * numBytes);
	status_t FindData() {
		return be_BMessage_FindData(_InstPtr());
	}

	// status_t be_BMessage_FindData_1(BMessage *self, const char * name, type_code type, int32 index, const void ** data, ssize_t * numBytes);
	status_t FindData() {
		return be_BMessage_FindData_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t ReplaceAlignment() {
		return be_BMessage_ReplaceAlignment(_InstPtr());
	}

	// status_t be_BMessage_ReplaceAlignment_1(BMessage *self, const char* name, int32 index, const BAlignment& alignment);
	status_t ReplaceAlignment() {
		return be_BMessage_ReplaceAlignment_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceRect(BMessage *self, const char * name, BRect *aRect);
	status_t ReplaceRect() {
		return be_BMessage_ReplaceRect(_InstPtr());
	}

	// status_t be_BMessage_ReplaceRect_1(BMessage *self, const char * name, int32 index, BRect *aRect);
	status_t ReplaceRect() {
		return be_BMessage_ReplaceRect_1(_InstPtr());
	}

	// status_t be_BMessage_ReplacePoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t ReplacePoint() {
		return be_BMessage_ReplacePoint(_InstPtr());
	}

	// status_t be_BMessage_ReplacePoint_1(BMessage *self, const char * name, int32 index, BPoint *aPoint);
	status_t ReplacePoint() {
		return be_BMessage_ReplacePoint_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceSize(BMessage *self, const char* name, BSize *aSize);
	status_t ReplaceSize() {
		return be_BMessage_ReplaceSize(_InstPtr());
	}

	// status_t be_BMessage_ReplaceSize_1(BMessage *self, const char* name, int32 index, BSize *aSize);
	status_t ReplaceSize() {
		return be_BMessage_ReplaceSize_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceString(BMessage *self, const char * name, const char * aString);
	status_t ReplaceString() {
		return be_BMessage_ReplaceString(_InstPtr());
	}

	// status_t be_BMessage_ReplaceString_1(BMessage *self, const char * name, int32 index, const char * aString);
	status_t ReplaceString() {
		return be_BMessage_ReplaceString_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceString_2(BMessage *self, const char * name, const BString & aString);
	status_t ReplaceString() {
		return be_BMessage_ReplaceString_2(_InstPtr());
	}

	// status_t be_BMessage_ReplaceString_3(BMessage *self, const char * name, int32 index, const BString & aString);
	status_t ReplaceString() {
		return be_BMessage_ReplaceString_3(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt8(BMessage *self, const char * name, int8 value);
	status_t ReplaceInt8() {
		return be_BMessage_ReplaceInt8(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt8_1(BMessage *self, const char * name, int32 index, int8 value);
	status_t ReplaceInt8() {
		return be_BMessage_ReplaceInt8_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt8(BMessage *self, const char * name, uint8 value);
	status_t ReplaceUInt8() {
		return be_BMessage_ReplaceUInt8(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt8_1(BMessage *self, const char * name, int32 index, uint8 value);
	status_t ReplaceUInt8() {
		return be_BMessage_ReplaceUInt8_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt16(BMessage *self, const char * name, int16 value);
	status_t ReplaceInt16() {
		return be_BMessage_ReplaceInt16(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt16_1(BMessage *self, const char * name, int32 index, int16 value);
	status_t ReplaceInt16() {
		return be_BMessage_ReplaceInt16_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt16(BMessage *self, const char * name, uint16 value);
	status_t ReplaceUInt16() {
		return be_BMessage_ReplaceUInt16(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt16_1(BMessage *self, const char * name, int32 index, uint16 value);
	status_t ReplaceUInt16() {
		return be_BMessage_ReplaceUInt16_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt32(BMessage *self, const char * name, int32 value);
	status_t ReplaceInt32() {
		return be_BMessage_ReplaceInt32(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt32_1(BMessage *self, const char * name, int32 index, int32 value);
	status_t ReplaceInt32() {
		return be_BMessage_ReplaceInt32_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt32(BMessage *self, const char * name, uint32 value);
	status_t ReplaceUInt32() {
		return be_BMessage_ReplaceUInt32(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt32_1(BMessage *self, const char * name, int32 index, uint32 value);
	status_t ReplaceUInt32() {
		return be_BMessage_ReplaceUInt32_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt64(BMessage *self, const char * name, int64 value);
	status_t ReplaceInt64() {
		return be_BMessage_ReplaceInt64(_InstPtr());
	}

	// status_t be_BMessage_ReplaceInt64_1(BMessage *self, const char * name, int32 index, int64 value);
	status_t ReplaceInt64() {
		return be_BMessage_ReplaceInt64_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt64(BMessage *self, const char * name, uint64 value);
	status_t ReplaceUInt64() {
		return be_BMessage_ReplaceUInt64(_InstPtr());
	}

	// status_t be_BMessage_ReplaceUInt64_1(BMessage *self, const char * name, int32 index, uint64 value);
	status_t ReplaceUInt64() {
		return be_BMessage_ReplaceUInt64_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceBool(BMessage *self, const char * name, bool aBoolean);
	status_t ReplaceBool() {
		return be_BMessage_ReplaceBool(_InstPtr());
	}

	// status_t be_BMessage_ReplaceBool_1(BMessage *self, const char * name, int32 index, bool aBoolean);
	status_t ReplaceBool() {
		return be_BMessage_ReplaceBool_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceFloat(BMessage *self, const char * name, float aFloat);
	status_t ReplaceFloat() {
		return be_BMessage_ReplaceFloat(_InstPtr());
	}

	// status_t be_BMessage_ReplaceFloat_1(BMessage *self, const char * name, int32 index, float aFloat);
	status_t ReplaceFloat() {
		return be_BMessage_ReplaceFloat_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceDouble(BMessage *self, const char * name, double aDouble);
	status_t ReplaceDouble() {
		return be_BMessage_ReplaceDouble(_InstPtr());
	}

	// status_t be_BMessage_ReplaceDouble_1(BMessage *self, const char * name, int32 index, double aDouble);
	status_t ReplaceDouble() {
		return be_BMessage_ReplaceDouble_1(_InstPtr());
	}

	// status_t be_BMessage_ReplacePointer(BMessage *self, const char * name, const void * pointer);
	status_t ReplacePointer() {
		return be_BMessage_ReplacePointer(_InstPtr());
	}

	// status_t be_BMessage_ReplacePointer_1(BMessage *self, const char * name, int32 index, const void * pointer);
	status_t ReplacePointer() {
		return be_BMessage_ReplacePointer_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t ReplaceMessenger() {
		return be_BMessage_ReplaceMessenger(_InstPtr());
	}

	// status_t be_BMessage_ReplaceMessenger_1(BMessage *self, const char * name, int32 index, BMessenger *messenger);
	status_t ReplaceMessenger() {
		return be_BMessage_ReplaceMessenger_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t ReplaceRef() {
		return be_BMessage_ReplaceRef(_InstPtr());
	}

	// status_t be_BMessage_ReplaceRef_1(BMessage *self, const char * name, int32 index, const entry_ref * _ref);
	status_t ReplaceRef() {
		return be_BMessage_ReplaceRef_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceMessage(BMessage *self, const char * name, const BMessage * message);
	status_t ReplaceMessage() {
		return be_BMessage_ReplaceMessage(_InstPtr());
	}

	// status_t be_BMessage_ReplaceMessage_1(BMessage *self, const char * name, int32 index, const BMessage * message);
	status_t ReplaceMessage() {
		return be_BMessage_ReplaceMessage_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t ReplaceFlat() {
		return be_BMessage_ReplaceFlat(_InstPtr());
	}

	// status_t be_BMessage_ReplaceFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t ReplaceFlat() {
		return be_BMessage_ReplaceFlat_1(_InstPtr());
	}

	// status_t be_BMessage_ReplaceData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes);
	status_t ReplaceData() {
		return be_BMessage_ReplaceData(_InstPtr());
	}

	// status_t be_BMessage_ReplaceData_1(BMessage *self, const char * name, type_code type, int32 index, const void * data, ssize_t numBytes);
	status_t ReplaceData() {
		return be_BMessage_ReplaceData_1(_InstPtr());
	}

	// bool be_BMessage_HasSameData(BMessage *self, const BMessage & other, bool ignoreFieldOrder, bool deep);
	bool HasSameData() {
		return be_BMessage_HasSameData(_InstPtr());
	}

	// bool be_BMessage_HasAlignment(BMessage *self, const char* name, int32 n);
	bool HasAlignment() {
		return be_BMessage_HasAlignment(_InstPtr());
	}

	// bool be_BMessage_HasRect(BMessage *self, const char* name, int32 n);
	bool HasRect() {
		return be_BMessage_HasRect(_InstPtr());
	}

	// bool be_BMessage_HasPoint(BMessage *self, const char* name, int32 n);
	bool HasPoint() {
		return be_BMessage_HasPoint(_InstPtr());
	}

	// bool be_BMessage_HasSize(BMessage *self, const char* name, int32 n);
	bool HasSize() {
		return be_BMessage_HasSize(_InstPtr());
	}

	// bool be_BMessage_HasString(BMessage *self, const char* name, int32 n);
	bool HasString() {
		return be_BMessage_HasString(_InstPtr());
	}

	// bool be_BMessage_HasInt8(BMessage *self, const char* name, int32 n);
	bool HasInt8() {
		return be_BMessage_HasInt8(_InstPtr());
	}

	// bool be_BMessage_HasUInt8(BMessage *self, const char* name, int32 n);
	bool HasUInt8() {
		return be_BMessage_HasUInt8(_InstPtr());
	}

	// bool be_BMessage_HasInt16(BMessage *self, const char* name, int32 n);
	bool HasInt16() {
		return be_BMessage_HasInt16(_InstPtr());
	}

	// bool be_BMessage_HasUInt16(BMessage *self, const char* name, int32 n);
	bool HasUInt16() {
		return be_BMessage_HasUInt16(_InstPtr());
	}

	// bool be_BMessage_HasInt32(BMessage *self, const char* name, int32 n);
	bool HasInt32() {
		return be_BMessage_HasInt32(_InstPtr());
	}

	// bool be_BMessage_HasUInt32(BMessage *self, const char* name, int32 n);
	bool HasUInt32() {
		return be_BMessage_HasUInt32(_InstPtr());
	}

	// bool be_BMessage_HasInt64(BMessage *self, const char* name, int32 n);
	bool HasInt64() {
		return be_BMessage_HasInt64(_InstPtr());
	}

	// bool be_BMessage_HasUInt64(BMessage *self, const char* name, int32 n);
	bool HasUInt64() {
		return be_BMessage_HasUInt64(_InstPtr());
	}

	// bool be_BMessage_HasBool(BMessage *self, const char* name, int32 n);
	bool HasBool() {
		return be_BMessage_HasBool(_InstPtr());
	}

	// bool be_BMessage_HasFloat(BMessage *self, const char* name, int32 n);
	bool HasFloat() {
		return be_BMessage_HasFloat(_InstPtr());
	}

	// bool be_BMessage_HasDouble(BMessage *self, const char* name, int32 n);
	bool HasDouble() {
		return be_BMessage_HasDouble(_InstPtr());
	}

	// bool be_BMessage_HasPointer(BMessage *self, const char* name, int32 n);
	bool HasPointer() {
		return be_BMessage_HasPointer(_InstPtr());
	}

	// bool be_BMessage_HasMessenger(BMessage *self, const char* name, int32 n);
	bool HasMessenger() {
		return be_BMessage_HasMessenger(_InstPtr());
	}

	// bool be_BMessage_HasRef(BMessage *self, const char* name, int32 n);
	bool HasRef() {
		return be_BMessage_HasRef(_InstPtr());
	}

	// bool be_BMessage_HasMessage(BMessage *self, const char* name, int32 n);
	bool HasMessage() {
		return be_BMessage_HasMessage(_InstPtr());
	}

	// bool be_BMessage_HasFlat(BMessage *self, const char* name, const BFlattenable * flat);
	bool HasFlat() {
		return be_BMessage_HasFlat(_InstPtr());
	}

	// bool be_BMessage_HasFlat_1(BMessage *self, const char* name, int32 n, const BFlattenable * flat);
	bool HasFlat() {
		return be_BMessage_HasFlat_1(_InstPtr());
	}

	// bool be_BMessage_HasData(BMessage *self, const char* name, type_code code, int32 n);
	bool HasData() {
		return be_BMessage_HasData(_InstPtr());
	}

	// BRect * be_BMessage_FindRect_2(BMessage *self, const char* name, int32 n);
	BRect FindRect() {
		return be_BMessage_FindRect_2(_InstPtr());
	}

	// BPoint * be_BMessage_FindPoint_2(BMessage *self, const char* name, int32 n);
	BPoint FindPoint() {
		return be_BMessage_FindPoint_2(_InstPtr());
	}

	// const char * be_BMessage_FindString_4(BMessage *self, const char* name, int32 n);
	char * FindString() {
		return be_BMessage_FindString_4(_InstPtr());
	}

	// int8 be_BMessage_FindInt8_2(BMessage *self, const char* name, int32 n);
	int8 FindInt8() {
		return be_BMessage_FindInt8_2(_InstPtr());
	}

	// int16 be_BMessage_FindInt16_2(BMessage *self, const char* name, int32 n);
	int16 FindInt16() {
		return be_BMessage_FindInt16_2(_InstPtr());
	}

	// int32 be_BMessage_FindInt32_2(BMessage *self, const char* name, int32 n);
	int32 FindInt32() {
		return be_BMessage_FindInt32_2(_InstPtr());
	}

	// int64 be_BMessage_FindInt64_2(BMessage *self, const char* name, int32 n);
	int64 FindInt64() {
		return be_BMessage_FindInt64_2(_InstPtr());
	}

	// bool be_BMessage_FindBool_2(BMessage *self, const char* name, int32 n);
	bool FindBool() {
		return be_BMessage_FindBool_2(_InstPtr());
	}

	// float be_BMessage_FindFloat_2(BMessage *self, const char* name, int32 n);
	float FindFloat() {
		return be_BMessage_FindFloat_2(_InstPtr());
	}

	// double be_BMessage_FindDouble_2(BMessage *self, const char* name, int32 n);
	double FindDouble() {
		return be_BMessage_FindDouble_2(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


