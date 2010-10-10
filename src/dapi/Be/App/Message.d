/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Message;


import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.DataIO;
import Be.Support.String;

import Be.Support.Flattenable;
import Be.Support.Errors;

import Be.Storage.Entry;

import Be.App.Messenger;
import Be.App.Handler;

import Be.Interface.Point;
import Be.Interface.Alignment;
import Be.Interface.Size;
import Be.Interface.Rect;

import tango.stdc.stringz;
import tango.io.Stdout;

import Be.Support.HelperFunctions;

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


final class BMessage
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMessage* be_BMessage_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BMessage_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BMessage* be_BMessage_ctor_1(void *bindInstPtr, uint32 what);
	this(uint32 what) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessage_ctor_1(cast(void *)this, what);
			_OwnsPtr = true;
		}
	}

	// BMessage* be_BMessage_ctor_2(void *bindInstPtr, const BMessage * other);
	this(BMessage other) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessage_ctor_2(cast(void *)this, other._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BMessage_dtor(BMessage* self);
	~this() {
		Stdout.formatln("Deleting Message: \"{}\" OwnsPtr: {}", getValueString(what), _OwnsPtr);
		if(_InstPtr !is null && fOwnsPointer) {
			be_BMessage_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
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

	// status_t be_BMessage_GetInfo(BMessage *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound);
	status_t GetInfo(type_code typeRequested, int32 index, inout char [] nameFound, inout type_code typeFound, inout int32 countFound) {
		char *ptr;
		status_t error = be_BMessage_GetInfo(_InstPtr(), typeRequested, index, &ptr, &typeFound, &countFound);
		
		if(error == B_OK)
			nameFound = fromStringz(ptr).dup;
			
		return error;
	}

	// status_t be_BMessage_GetInfo_1(BMessage *self, const char * name, type_code * typeFound, int32 * countFound);
	status_t GetInfo(char [] name, inout type_code typeFound, inout int32 countFound) {
		return be_BMessage_GetInfo_1(_InstPtr(), toStringz(name), &typeFound, &countFound);
	}

	// status_t be_BMessage_GetInfo_2(BMessage *self, const char * name, type_code * typeFound, bool * fixedSize);
	status_t GetInfo(char [] name, inout type_code typeFound, inout bool fixedSize) {
		return be_BMessage_GetInfo_2(_InstPtr(), toStringz(name), &typeFound, &fixedSize);
	}

	// int32 be_BMessage_CountNames(BMessage *self, type_code type);
	int32 CountNames(type_code type) {
		return be_BMessage_CountNames(_InstPtr(), type);
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
	status_t Rename(char [] oldEntry, char [] newEntry) {
		return be_BMessage_Rename(_InstPtr(), toStringz(oldEntry), toStringz(newEntry));
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
		return new BMessenger(be_BMessage_ReturnAddress(_InstPtr()), false);
	}

	// const BMessage * be_BMessage_Previous(BMessage *self);
	BMessage Previous() {
		return new BMessage(be_BMessage_Previous(_InstPtr()), false);
	}

	// bool be_BMessage_WasDropped(BMessage *self);
	bool WasDropped() {
		return be_BMessage_WasDropped(_InstPtr());
	}

	// BPoint * be_BMessage_DropPoint(BMessage *self, BPoint * offset);
	BPoint DropPoint(IBPoint offset) {
		return new BPoint(be_BMessage_DropPoint(_InstPtr(), offset._InstPtr()), false);
	}

	// status_t be_BMessage_SendReply(BMessage *self, uint32 command, BHandler * replyTo);
	status_t SendReply(uint32 command, IBHandler replyTo) {
		return be_BMessage_SendReply(_InstPtr(), command, replyTo._InstPtr);
	}

	// status_t be_BMessage_SendReply_1(BMessage *self, BMessage * reply, BHandler * replyTo, bigtime_t timeout);
	status_t SendReply(BMessage reply, IBHandler replyTo, bigtime_t timeout) {
		return be_BMessage_SendReply_1(_InstPtr(), reply._InstPtr(), replyTo._InstPtr(), timeout);
	}

	// status_t be_BMessage_SendReply_2(BMessage *self, BMessage * reply, BMessenger *replyTo, bigtime_t timeout);
	status_t SendReply(BMessage reply, BMessenger replyTo, bigtime_t timeout) {
		return be_BMessage_SendReply_2(_InstPtr(), reply._InstPtr(), replyTo._InstPtr(), timeout);
	}

	// status_t be_BMessage_SendReply_3(BMessage *self, uint32 command, BMessage * replyToReply);
	status_t SendReply(uint32 command, BMessage replyToReply) {
		return be_BMessage_SendReply_3(_InstPtr(), command, replyToReply._InstPtr());
	}

	// status_t be_BMessage_SendReply_4(BMessage *self, BMessage * the_reply, BMessage * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout);
	status_t SendReply(BMessage the_reply, BMessage replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout) {
		return be_BMessage_SendReply_4(_InstPtr(), the_reply._InstPtr(), replyToReply._InstPtr(), sendTimeout, replyTimeout);
	}

	// ssize_t be_BMessage_FlattenedSize(BMessage *self);
	ssize_t FlattenedSize() {
		return be_BMessage_FlattenedSize(_InstPtr());
	}

	// status_t be_BMessage_Flatten(BMessage *self, char * buffer, ssize_t size);
	status_t Flatten(char [] buffer, ssize_t size) {
		return be_BMessage_Flatten(_InstPtr(), buffer.ptr, size);
	}

	// status_t be_BMessage_Flatten_1(BMessage *self, BDataIO * stream, ssize_t * size);
	status_t Flatten(IBDataIO stream, inout ssize_t size) {
		return be_BMessage_Flatten_1(_InstPtr(), stream._InstPtr, &size);
	}

	// status_t be_BMessage_Unflatten(BMessage *self, const char * flatBuffer);
	status_t Unflatten(inout char [] flatBuffer) {
		return be_BMessage_Unflatten(_InstPtr(), flatBuffer.ptr);
	}

	// status_t be_BMessage_Unflatten_1(BMessage *self, BDataIO * stream);
	status_t Unflatten(IBDataIO stream) {
		return be_BMessage_Unflatten_1(_InstPtr(), stream._InstPtr);
	}

	// status_t be_BMessage_AddSpecifier(BMessage *self, const char * property);
	status_t AddSpecifier(char [] property) {
		return be_BMessage_AddSpecifier(_InstPtr(), toStringz(property));
	}

	// status_t be_BMessage_AddSpecifier_1(BMessage *self, const char * property, int32 index);
	status_t AddSpecifier(char [] property, int32 index) {
		return be_BMessage_AddSpecifier_1(_InstPtr(), toStringz(property), index);
	}

	// status_t be_BMessage_AddSpecifier_2(BMessage *self, const char * property, int32 index, int32 range);
	status_t AddSpecifier(char [] property, int32 index, int32 range) {
		return be_BMessage_AddSpecifier_2(_InstPtr(), toStringz(property), index, range);
	}

	// status_t be_BMessage_AddSpecifier_3(BMessage *self, const char * property, const char * name);
	status_t AddSpecifier(char [] property, char [] name) {
		return be_BMessage_AddSpecifier_3(_InstPtr(), toStringz(property), toStringz(name));
	}

	// status_t be_BMessage_AddSpecifier_4(BMessage *self, const BMessage * specifier);
	status_t AddSpecifier(BMessage specifier) {
		return be_BMessage_AddSpecifier_4(_InstPtr(), specifier._InstPtr);
	}

	// status_t be_BMessage_SetCurrentSpecifier(BMessage *self, int32 index);
	status_t SetCurrentSpecifier(int32 index) {
		return be_BMessage_SetCurrentSpecifier(_InstPtr(), index);
	}
/*
	// status_t be_BMessage_GetCurrentSpecifier(BMessage *self, int32 * index, BMessage * specifier, int32 * what, const char ** property);
	status_t GetCurrentSpecifier(inout int32 index, BMessage specifier, inout int32 what, inout char [] property) {
		status_t result = be_BMessage_GetCurrentSpecifier(_InstPtr(), &index, specifier._InstPtr, &what, propPtr);
		
		property = fromStringz(tmpProp.ptr).dup;
		
		return result;
	}
*/
	// status_t be_BMessage_HasSpecifiers(BMessage *self);
	status_t HasSpecifiers() {
		return be_BMessage_HasSpecifiers(_InstPtr());
	}

	// status_t be_BMessage_PopSpecifier(BMessage *self);
	status_t PopSpecifier() {
		return be_BMessage_PopSpecifier(_InstPtr());
	}

	// status_t be_BMessage_AddAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t AddAlignment(char [] name, BAlignment alignment) {
		return be_BMessage_AddAlignment(_InstPtr(), toStringz(name), alignment._InstPtr);
	}

	// status_t be_BMessage_AddRect(BMessage *self, const char * name, BRect *aRect);
	status_t AddRect(char [] name, BRect aRect) {
		return be_BMessage_AddRect(_InstPtr(), toStringz(name), aRect._InstPtr);
	}

	// status_t be_BMessage_AddPoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t AddPoint(char [] name, BPoint aPoint) {
		return be_BMessage_AddPoint(_InstPtr(), toStringz(name), aPoint._InstPtr);
	}

	// status_t be_BMessage_AddSize(BMessage *self, const char* name, BSize *aSize);
	status_t AddSize(char [] name, BSize aSize) {
		return be_BMessage_AddSize(_InstPtr(), toStringz(name), aSize._InstPtr);
	}

	// status_t be_BMessage_AddString(BMessage *self, const char * name, const char * aString);
	status_t AddString(char [] name, char [] aString) {
		return be_BMessage_AddString(_InstPtr(), toStringz(name), toStringz(aString));
	}

	// status_t be_BMessage_AddString_1(BMessage *self, const char * name, const BString & aString);
	status_t AddString(char [] name, BString aString) {
		return be_BMessage_AddString_1(_InstPtr(), toStringz(name), aString._InstPtr);
	}

	// status_t be_BMessage_AddInt8(BMessage *self, const char * name, int8 value);
	status_t AddInt8(char [] name, int8 value) {
		return be_BMessage_AddInt8(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddUInt8(BMessage *self, const char * name, uint8 value);
	status_t AddUInt8(char [] name, uint8 value) {
		return be_BMessage_AddUInt8(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddInt16(BMessage *self, const char * name, int16 value);
	status_t AddInt16(char [] name, int16 value) {
		return be_BMessage_AddInt16(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddUInt16(BMessage *self, const char * name, uint16 value);
	status_t AddUInt16(char [] name, uint16 value) {
		return be_BMessage_AddUInt16(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddInt32(BMessage *self, const char * name, int32 value);
	status_t AddInt32(char [] name, int32 value) {
		return be_BMessage_AddInt32(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddUInt32(BMessage *self, const char * name, uint32 value);
	status_t AddUInt32(char [] name, uint32 value) {
		return be_BMessage_AddUInt32(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddInt64(BMessage *self, const char * name, int64 value);
	status_t AddInt64(char [] name, int64 value) {
		return be_BMessage_AddInt64(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddUInt64(BMessage *self, const char * name, uint64 value);
	status_t AddUInt64(char [] name, uint64 value) {
		return be_BMessage_AddUInt64(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_AddBool(BMessage *self, const char * name, bool aBoolean);
	status_t AddBool(char [] name, bool aBoolean) {
		return be_BMessage_AddBool(_InstPtr(), toStringz(name), aBoolean);
	}

	// status_t be_BMessage_AddFloat(BMessage *self, const char * name, float aFloat);
	status_t AddFloat(char [] name, float aFloat) {
		return be_BMessage_AddFloat(_InstPtr(), toStringz(name), aFloat);
	}

	// status_t be_BMessage_AddDouble(BMessage *self, const char * name, double aDouble);
	status_t AddDouble(char [] name, double aDouble) {
		return be_BMessage_AddDouble(_InstPtr(), toStringz(name), aDouble);
	}

	// status_t be_BMessage_AddPointer(BMessage *self, const char * name, const void * aPointer);
	status_t AddPointer(char [] name, void *aPointer) {
		return be_BMessage_AddPointer(_InstPtr(), toStringz(name), aPointer);
	}

	// status_t be_BMessage_AddMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t AddMessenger(char [] name, BMessenger messenger) {
		return be_BMessage_AddMessenger(_InstPtr(), toStringz(name), messenger._InstPtr);
	}

	// status_t be_BMessage_AddRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t AddRef(char [] name, entry_ref _ref) {
		return be_BMessage_AddRef(_InstPtr(), toStringz(name), &_ref);
	}

	// status_t be_BMessage_AddMessage(BMessage *self, const char * name, const BMessage * message);
	status_t AddMessage(char [] name, BMessage message) {
		return be_BMessage_AddMessage(_InstPtr(), toStringz(name), message._InstPtr);
	}

	// status_t be_BMessage_AddFlat(BMessage *self, const char * name, BFlattenable * object, int32 count);
	status_t AddFlat(char [] name, IBFlattenable object, int32 count) {
		return be_BMessage_AddFlat(_InstPtr(), toStringz(name), object._InstPtr, count);
	}

	// status_t be_BMessage_AddData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes, bool isFixedSize, int32 count);
	status_t AddData(char [] name, type_code type, void [] data, ssize_t numBytes, bool isFixed, int32 count) {
		return be_BMessage_AddData(_InstPtr(), toStringz(name), type, data.ptr, numBytes, isFixed, count);
	}

	// status_t be_BMessage_RemoveData(BMessage *self, const char * name, int32 index);
	status_t RemoveData(char [] name, int32 index) {
		return be_BMessage_RemoveData(_InstPtr(), toStringz(name), index);
	}

	// status_t be_BMessage_RemoveName(BMessage *self, const char * name);
	status_t RemoveName(char [] name) {
		return be_BMessage_RemoveName(_InstPtr(), toStringz(name));
	}

	// status_t be_BMessage_MakeEmpty(BMessage *self);
	status_t MakeEmpty() {
		return be_BMessage_MakeEmpty(_InstPtr());
	}

	// status_t be_BMessage_FindAlignment(BMessage *self, const char* name, BAlignment* alignment);
	status_t FindAlignment(char [] name, BAlignment alignment) {
		return be_BMessage_FindAlignment(_InstPtr(), toStringz(name), alignment._InstPtr);
	}

	// status_t be_BMessage_FindAlignment_1(BMessage *self, const char* name, int32 index, BAlignment* alignment);
	status_t FindAlignment(char [] name, int32 index, BAlignment alignment) {
		return be_BMessage_FindAlignment_1(_InstPtr(), toStringz(name), index, alignment._InstPtr);
	}

	// status_t be_BMessage_FindRect(BMessage *self, const char * name, BRect * rect);
	status_t FindRect(char [] name, BRect rect) {
		return be_BMessage_FindRect(_InstPtr(), toStringz(name), rect._InstPtr);
	}

	// status_t be_BMessage_FindRect_1(BMessage *self, const char * name, int32 index, BRect * rect);
	status_t FindRect(char [] name, int32 index, BRect rect) {
		return be_BMessage_FindRect_1(_InstPtr(), toStringz(name), index, rect._InstPtr);
	}

	// status_t be_BMessage_FindPoint(BMessage *self, const char * name, BPoint * point);
	status_t FindPoint(char [] name, BPoint point) {
		return be_BMessage_FindPoint(_InstPtr(), toStringz(name), point._InstPtr);
	}

	// status_t be_BMessage_FindPoint_1(BMessage *self, const char * name, int32 index, BPoint * point);
	status_t FindPoint(char [] name, int32 index, BPoint point) {
		return be_BMessage_FindPoint_1(_InstPtr(), toStringz(name), index, point._InstPtr);
	}

	// status_t be_BMessage_FindSize(BMessage *self, const char * name, BSize* size);
	status_t FindSize(char [] name, BSize size) {
		return be_BMessage_FindSize(_InstPtr(), toStringz(name), size._InstPtr);
	}

	// status_t be_BMessage_FindSize_1(BMessage *self, const char * name, int32 index, BSize* size);
	status_t FindSize(char [] name, int32 index, BSize size) {
		return be_BMessage_FindSize_1(_InstPtr(), toStringz(name), index, size._InstPtr);
	}

	// status_t be_BMessage_FindString(BMessage *self, const char * name, const char ** string);
	status_t FindString(char [] name, inout char [] string) {
		char *tmpPtr;
		
		status_t error = be_BMessage_FindString(_InstPtr(), toStringz(name), &tmpPtr);
		
		if(error == B_OK)
			string = fromStringz(tmpPtr).dup;
		
		return error;
	}

	// status_t be_BMessage_FindString_1(BMessage *self, const char * name, int32 index, const char ** string);
	status_t FindString(char [] name, int32 index, inout char [] string) {
		char *tmpPtr;
		status_t error = be_BMessage_FindString_1(_InstPtr(), toStringz(name), index, &tmpPtr);
		
		if(error == B_OK)
			string = fromStringz(tmpPtr).dup;
		
		return error;
	}

	// status_t be_BMessage_FindString_2(BMessage *self, const char * name, BString * string);
	status_t FindString(char [] name, BString string) {
		return be_BMessage_FindString_2(_InstPtr(), toStringz(name), string._InstPtr);
	}

	// status_t be_BMessage_FindString_3(BMessage *self, const char * name, int32 index, BString * string);
	status_t FindString(char [] name, int32 index, BString string) {
		return be_BMessage_FindString_3(_InstPtr(), toStringz(name), index, string._InstPtr);
	}

	// status_t be_BMessage_FindInt8(BMessage *self, const char * name, int8 * value);
	status_t FindInt8(char [] name, inout int8 value) {
		return be_BMessage_FindInt8(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindInt8_1(BMessage *self, const char * name, int32 index, int8 * value);
	status_t FindInt8(char [] name, int32 index, inout int8 value) {
		return be_BMessage_FindInt8_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindUInt8(BMessage *self, const char * name, uint8 * value);
	status_t FindUInt8(char [] name, inout uint8 value) {
		return be_BMessage_FindUInt8(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindUInt8_1(BMessage *self, const char * name, int32 index, uint8 * value);
	status_t FindUInt8(char [] name, int32 index, inout uint8 value) {
		return be_BMessage_FindUInt8_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindInt16(BMessage *self, const char * name, int16 * value);
	status_t FindInt16(char [] name, inout int16 value) {
		return be_BMessage_FindInt16(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindInt16_1(BMessage *self, const char * name, int32 index, int16 * value);
	status_t FindInt16(char [] name, int32 index, inout int16 value) {
		return be_BMessage_FindInt16_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindUInt16(BMessage *self, const char * name, uint16 * value);
	status_t FindUInt16(char [] name, inout uint16 value) {
		return be_BMessage_FindUInt16(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindUInt16_1(BMessage *self, const char * name, int32 index, uint16 * value);
	status_t FindUInt16(char [] name, int32 index, inout uint16 value) {
		return be_BMessage_FindUInt16_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindInt32(BMessage *self, const char * name, int32 * value);
	status_t FindInt32(char [] name, inout int32 value) {
		return be_BMessage_FindInt32(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindInt32_1(BMessage *self, const char * name, int32 index, int32 * value);
	status_t FindInt32(char [] name, int32 index, inout int32 value) {
		return be_BMessage_FindInt32_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindUInt32(BMessage *self, const char * name, uint32 * value);
	status_t FindUInt32(char [] name, inout uint32 value) {
		return be_BMessage_FindUInt32(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindUInt32_1(BMessage *self, const char * name, int32 index, uint32 * value);
	status_t FindUInt32(char [] name, int32 index, inout uint32 value) {
		return be_BMessage_FindUInt32_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindInt64(BMessage *self, const char * name, int64 * value);
	status_t FindInt64(char [] name, inout int64 value) {
		return be_BMessage_FindInt64(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindInt64_1(BMessage *self, const char * name, int32 index, int64 * value);
	status_t FindInt64(char [] name, int32 index, inout int64 value) {
		return be_BMessage_FindInt64_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindUInt64(BMessage *self, const char * name, uint64 * value);
	status_t FindUInt64(char [] name, inout uint64 value) {
		return be_BMessage_FindUInt64(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindUInt64_1(BMessage *self, const char * name, int32 index, uint64 * value);
	status_t FindUInt64(char [] name, int32 index, inout uint64 value) {
		return be_BMessage_FindUInt64_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindBool(BMessage *self, const char * name, bool * value);
	status_t FindBool(char [] name, inout bool value) {
		return be_BMessage_FindBool(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindBool_1(BMessage *self, const char * name, int32 index, bool * value);
	status_t FindBool(char [] name, int32 index, inout bool value) {
		return be_BMessage_FindBool_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindFloat(BMessage *self, const char * name, float * value);
	status_t FindFloat(char [] name, inout float value) {
		return be_BMessage_FindFloat(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindFloat_1(BMessage *self, const char * name, int32 index, float * value);
	status_t FindFloat(char [] name, int32 index, inout float value) {
		return be_BMessage_FindFloat_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindDouble(BMessage *self, const char * name, double * value);
	status_t FindDouble(char [] name, inout double value) {
		return be_BMessage_FindDouble(_InstPtr(), toStringz(name), &value);
	}

	// status_t be_BMessage_FindDouble_1(BMessage *self, const char * name, int32 index, double * value);
	status_t FindDouble(char [] name, int32 index, inout double value) {
		return be_BMessage_FindDouble_1(_InstPtr(), toStringz(name), index, &value);
	}

	// status_t be_BMessage_FindPointer(BMessage *self, const char * name, void ** pointer);
	status_t FindPointer(char [] name, inout void *pointer) {
		return be_BMessage_FindPointer(_InstPtr(), toStringz(name), &pointer);
	}

	// status_t be_BMessage_FindPointer_1(BMessage *self, const char * name, int32 index, void ** pointer);
	status_t FindPointer(char [] name, int32 index, inout void *pointer) {
		return be_BMessage_FindPointer_1(_InstPtr(), toStringz(name), index, &pointer);
	}

	// status_t be_BMessage_FindMessenger(BMessage *self, const char * name, BMessenger * messenger);
	status_t FindMessenger(char [] name, BMessenger messenger) {
		return be_BMessage_FindMessenger(_InstPtr(), toStringz(name), messenger._InstPtr);
	}

	// status_t be_BMessage_FindMessenger_1(BMessage *self, const char * name, int32 index, BMessenger * messenger);
	status_t FindMessenger(char [] name, int32 index, BMessenger messenger) {
		return be_BMessage_FindMessenger_1(_InstPtr(), toStringz(name), index, messenger._InstPtr);
	}

	// status_t be_BMessage_FindRef(BMessage *self, const char * name, entry_ref * _ref);
	status_t FindRef(char [] name, inout entry_ref _ref) {
		return be_BMessage_FindRef(_InstPtr(), toStringz(name), &_ref);
	}

	// status_t be_BMessage_FindRef_1(BMessage *self, const char * name, int32 index, entry_ref * _ref);
	status_t FindRef(char [] name, int32 index, inout entry_ref _ref) {
		return be_BMessage_FindRef_1(_InstPtr(), toStringz(name), index, &_ref);
	}

	// status_t be_BMessage_FindMessage(BMessage *self, const char * name, BMessage * message);
	status_t FindMessage(char [] name, BMessage message) {
		return be_BMessage_FindMessage(_InstPtr(), toStringz(name), message._InstPtr);
	}

	// status_t be_BMessage_FindMessage_1(BMessage *self, const char * name, int32 index, BMessage * message);
	status_t FindMessage(char [] name, int32 index, BMessage message) {
		return be_BMessage_FindMessage_1(_InstPtr(), toStringz(name), index, message._InstPtr);
	}

	// status_t be_BMessage_FindFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t FindFlat(char [] name, BFlattenable object) {
		return be_BMessage_FindFlat(_InstPtr(), toStringz(name), object._InstPtr);
	}

	// status_t be_BMessage_FindFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t FindFlat(char [] name, int32 index, BFlattenable object) {
		return be_BMessage_FindFlat_1(_InstPtr(), toStringz(name), index, object._InstPtr);
	}

	// status_t be_BMessage_FindData(BMessage *self, const char * name, type_code type, const void ** data, ssize_t * numBytes);
	status_t FindData(char [] name, type_code type, inout void [] data, inout ssize_t numBytes) {
		void *tmpPtr;
		
		status_t error = be_BMessage_FindData(_InstPtr(), toStringz(name), type, &tmpPtr, &numBytes);
		
		if(error == B_OK) {
			data.length = numBytes;
			data = tmpPtr[0..numBytes].dup;	
		}
		
		return error;
	}

	// status_t be_BMessage_FindData_1(BMessage *self, const char * name, type_code type, int32 index, const void ** data, ssize_t * numBytes);
	status_t FindData(char [] name, type_code type, int32 index, inout void [] data, inout ssize_t numBytes) {
		void *tmpPtr;
		status_t error = be_BMessage_FindData_1(_InstPtr(), toStringz(name), type, index, &tmpPtr, &numBytes);
		
		if(error == B_OK) {
			data.length = numBytes;
			data = tmpPtr[0..numBytes].dup;	
		}
		
		return error;
	}

	// status_t be_BMessage_ReplaceAlignment(BMessage *self, const char* name, const BAlignment& alignment);
	status_t ReplaceAlignment(char [] name, BAlignment alignment) {
		return be_BMessage_ReplaceAlignment(_InstPtr(), toStringz(name), alignment._InstPtr);
	}

	// status_t be_BMessage_ReplaceAlignment_1(BMessage *self, const char* name, int32 index, const BAlignment& alignment);
	status_t ReplaceAlignment(char [] name, int32 index, BAlignment alignment) {
		return be_BMessage_ReplaceAlignment_1(_InstPtr(), toStringz(name), index, alignment._InstPtr);
	}

	// status_t be_BMessage_ReplaceRect(BMessage *self, const char * name, BRect *aRect);
	status_t ReplaceRect(char [] name, BRect aRect) {
		return be_BMessage_ReplaceRect(_InstPtr(), toStringz(name), aRect._InstPtr);
	}

	// status_t be_BMessage_ReplaceRect_1(BMessage *self, const char * name, int32 index, BRect *aRect);
	status_t ReplaceRect(char [] name, int32 index, BRect aRect) {
		return be_BMessage_ReplaceRect_1(_InstPtr(), toStringz(name), index, aRect._InstPtr);
	}

	// status_t be_BMessage_ReplacePoint(BMessage *self, const char * name, BPoint *aPoint);
	status_t ReplacePoint(char [] name, BPoint aPoint) {
		return be_BMessage_ReplacePoint(_InstPtr(), toStringz(name), aPoint._InstPtr);
	}

	// status_t be_BMessage_ReplacePoint_1(BMessage *self, const char * name, int32 index, BPoint *aPoint);
	status_t ReplacePoint(char [] name, int32 index, BPoint aPoint) {
		return be_BMessage_ReplacePoint_1(_InstPtr(), toStringz(name), index, aPoint._InstPtr);
	}

	// status_t be_BMessage_ReplaceSize(BMessage *self, const char* name, BSize *aSize);
	status_t ReplaceSize(char [] name, BSize size) {
		return be_BMessage_ReplaceSize(_InstPtr(), toStringz(name), size._InstPtr);
	}

	// status_t be_BMessage_ReplaceSize_1(BMessage *self, const char* name, int32 index, BSize *aSize);
	status_t ReplaceSize(char [] name, int32 index, BSize size) {
		return be_BMessage_ReplaceSize_1(_InstPtr(), toStringz(name), index, size._InstPtr);
	}

	// status_t be_BMessage_ReplaceString(BMessage *self, const char * name, const char * aString);
	status_t ReplaceString(char [] name, char [] aString) {
		return be_BMessage_ReplaceString(_InstPtr(), toStringz(name), toStringz(aString));
	}

	// status_t be_BMessage_ReplaceString_1(BMessage *self, const char * name, int32 index, const char * aString);
	status_t ReplaceString(char [] name, int32 index, char [] aString) {
		return be_BMessage_ReplaceString_1(_InstPtr(), toStringz(name), index, toStringz(aString));
	}

	// status_t be_BMessage_ReplaceString_2(BMessage *self, const char * name, const BString & aString);
	status_t ReplaceString(char [] name, BString aString) {
		return be_BMessage_ReplaceString_2(_InstPtr(), toStringz(name), aString._InstPtr);
	}

	// status_t be_BMessage_ReplaceString_3(BMessage *self, const char * name, int32 index, const BString & aString);
	status_t ReplaceString(char [] name, int32 index, BString aString) {
		return be_BMessage_ReplaceString_3(_InstPtr(), toStringz(name), index, aString._InstPtr);
	}

	// status_t be_BMessage_ReplaceInt8(BMessage *self, const char * name, int8 value);
	status_t ReplaceInt8(char [] name, int8 value) {
		return be_BMessage_ReplaceInt8(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceInt8_1(BMessage *self, const char * name, int32 index, int8 value);
	status_t ReplaceInt8(char [] name, int32 index, int8 value) {
		return be_BMessage_ReplaceInt8_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceUInt8(BMessage *self, const char * name, uint8 value);
	status_t ReplaceUInt8(char [] name, uint8 value) {
		return be_BMessage_ReplaceUInt8(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceUInt8_1(BMessage *self, const char * name, int32 index, uint8 value);
	status_t ReplaceUInt8(char [] name, int32 index, uint8 value) {
		return be_BMessage_ReplaceUInt8_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceInt16(BMessage *self, const char * name, int16 value);
	status_t ReplaceInt16(char [] name, int16 value) {
		return be_BMessage_ReplaceInt16(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceInt16_1(BMessage *self, const char * name, int32 index, int16 value);
	status_t ReplaceInt16(char [] name, int32 index, int16 value) {
		return be_BMessage_ReplaceInt16_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceUInt16(BMessage *self, const char * name, uint16 value);
	status_t ReplaceUInt16(char [] name, uint16 value) {
		return be_BMessage_ReplaceUInt16(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceUInt16_1(BMessage *self, const char * name, int32 index, uint16 value);
	status_t ReplaceUInt16(char [] name, int32 index, uint16 value) {
		return be_BMessage_ReplaceUInt16_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceInt32(BMessage *self, const char * name, int32 value);
	status_t ReplaceInt32(char [] name, int32 value) {
		return be_BMessage_ReplaceInt32(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceInt32_1(BMessage *self, const char * name, int32 index, int32 value);
	status_t ReplaceInt32(char [] name, int32 index, int32 value) {
		return be_BMessage_ReplaceInt32_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceUInt32(BMessage *self, const char * name, uint32 value);
	status_t ReplaceUInt32(char [] name, uint32 value) {
		return be_BMessage_ReplaceUInt32(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceUInt32_1(BMessage *self, const char * name, int32 index, uint32 value);
	status_t ReplaceUInt32(char [] name, int32 index, uint32 value) {
		return be_BMessage_ReplaceUInt32_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceInt64(BMessage *self, const char * name, int64 value);
	status_t ReplaceInt64(char [] name, int64 value) {
		return be_BMessage_ReplaceInt64(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceInt64_1(BMessage *self, const char * name, int32 index, int64 value);
	status_t ReplaceInt64(char [] name, int32 index, int64 value) {
		return be_BMessage_ReplaceInt64_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceUInt64(BMessage *self, const char * name, uint64 value);
	status_t ReplaceUInt64(char [] name, uint64 value) {
		return be_BMessage_ReplaceUInt64(_InstPtr(), toStringz(name), value);
	}

	// status_t be_BMessage_ReplaceUInt64_1(BMessage *self, const char * name, int32 index, uint64 value);
	status_t ReplaceUInt64(char [] name, int32 index, uint64 value) {
		return be_BMessage_ReplaceUInt64_1(_InstPtr(), toStringz(name), index, value);
	}

	// status_t be_BMessage_ReplaceBool(BMessage *self, const char * name, bool aBoolean);
	status_t ReplaceBool(char [] name, bool aBoolean) {
		return be_BMessage_ReplaceBool(_InstPtr(), toStringz(name), aBoolean);
	}

	// status_t be_BMessage_ReplaceBool_1(BMessage *self, const char * name, int32 index, bool aBoolean);
	status_t ReplaceBool(char [] name, int32 index, bool aBoolean) {
		return be_BMessage_ReplaceBool_1(_InstPtr(), toStringz(name), index, aBoolean);
	}

	// status_t be_BMessage_ReplaceFloat(BMessage *self, const char * name, float aFloat);
	status_t ReplaceFloat(char [] name, float aFloat) {
		return be_BMessage_ReplaceFloat(_InstPtr(), toStringz(name), aFloat);
	}

	// status_t be_BMessage_ReplaceFloat_1(BMessage *self, const char * name, int32 index, float aFloat);
	status_t ReplaceFloat(char [] name, int32 index, float aFloat) {
		return be_BMessage_ReplaceFloat_1(_InstPtr(), toStringz(name), index, aFloat);
	}

	// status_t be_BMessage_ReplaceDouble(BMessage *self, const char * name, double aDouble);
	status_t ReplaceDouble(char [] name, double aDouble) {
		return be_BMessage_ReplaceDouble(_InstPtr(), toStringz(name), aDouble);
	}

	// status_t be_BMessage_ReplaceDouble_1(BMessage *self, const char * name, int32 index, double aDouble);
	status_t ReplaceDouble(char [] name, int32 index, double aDouble) {
		return be_BMessage_ReplaceDouble_1(_InstPtr(), toStringz(name), index, aDouble);
	}

	// status_t be_BMessage_ReplacePointer(BMessage *self, const char * name, const void * pointer);
	status_t ReplacePointer(char [] name, void *pointer) {
		return be_BMessage_ReplacePointer(_InstPtr(), toStringz(name), pointer);
	}

	// status_t be_BMessage_ReplacePointer_1(BMessage *self, const char * name, int32 index, const void * pointer);
	status_t ReplacePointer(char [] name, int32 index, void *pointer) {
		return be_BMessage_ReplacePointer_1(_InstPtr(), toStringz(name), index, pointer);
	}

	// status_t be_BMessage_ReplaceMessenger(BMessage *self, const char * name, BMessenger *messenger);
	status_t ReplaceMessenger(char [] name, BMessenger messenger) {
		return be_BMessage_ReplaceMessenger(_InstPtr(), toStringz(name), messenger._InstPtr);
	}

	// status_t be_BMessage_ReplaceMessenger_1(BMessage *self, const char * name, int32 index, BMessenger *messenger);
	status_t ReplaceMessenger(char [] name, int32 index, BMessenger messenger) {
		return be_BMessage_ReplaceMessenger_1(_InstPtr(), toStringz(name), index, messenger._InstPtr);
	}

	// status_t be_BMessage_ReplaceRef(BMessage *self, const char * name, const entry_ref * _ref);
	status_t ReplaceRef(char [] name, entry_ref _ref) {
		return be_BMessage_ReplaceRef(_InstPtr(), toStringz(name), &_ref);
	}

	// status_t be_BMessage_ReplaceRef_1(BMessage *self, const char * name, int32 index, const entry_ref * _ref);
	status_t ReplaceRef(char [] name, int32 index, entry_ref _ref) {
		return be_BMessage_ReplaceRef_1(_InstPtr(), toStringz(name), index, &_ref);
	}

	// status_t be_BMessage_ReplaceMessage(BMessage *self, const char * name, const BMessage * message);
	status_t ReplaceMessage(char [] name, BMessage message) {
		return be_BMessage_ReplaceMessage(_InstPtr(), toStringz(name), message._InstPtr);
	}

	// status_t be_BMessage_ReplaceMessage_1(BMessage *self, const char * name, int32 index, const BMessage * message);
	status_t ReplaceMessage(char [] name, int32 index, BMessage message) {
		return be_BMessage_ReplaceMessage_1(_InstPtr(), toStringz(name), index, message._InstPtr);
	}

	// status_t be_BMessage_ReplaceFlat(BMessage *self, const char * name, BFlattenable * object);
	status_t ReplaceFlat(char [] name, BFlattenable object) {
		return be_BMessage_ReplaceFlat(_InstPtr(), toStringz(name), object._InstPtr);
	}

	// status_t be_BMessage_ReplaceFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object);
	status_t ReplaceFlat(char [] name, int32 index, BFlattenable object) {
		return be_BMessage_ReplaceFlat_1(_InstPtr(), toStringz(name), index, object._InstPtr);
	}

	// status_t be_BMessage_ReplaceData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes);
	status_t ReplaceData(char [] name, type_code type, void [] data, ssize_t numBytes) {
		return be_BMessage_ReplaceData(_InstPtr(), toStringz(name), type, data.ptr, numBytes);
	}

	// status_t be_BMessage_ReplaceData_1(BMessage *self, const char * name, type_code type, int32 index, const void * data, ssize_t numBytes);
	status_t ReplaceData(char [] name, type_code type, int32 index, void [] data, ssize_t numBytes) {
		return be_BMessage_ReplaceData_1(_InstPtr(), toStringz(name), type, index, data.ptr, numBytes);
	}

	// bool be_BMessage_HasSameData(BMessage *self, const BMessage & other, bool ignoreFieldOrder, bool deep);
	bool HasSameData(BMessage other, bool ignoreFileOrder, bool deep = true) {
		return be_BMessage_HasSameData(_InstPtr(), other._InstPtr, ignoreFileOrder, deep);
	}

	// bool be_BMessage_HasAlignment(BMessage *self, const char* name, int32 n);
	bool HasAlignment(char [] name, int32 n) {
		return be_BMessage_HasAlignment(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasRect(BMessage *self, const char* name, int32 n);
	bool HasRect(char [] name, int32 n) {
		return be_BMessage_HasRect(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasPoint(BMessage *self, const char* name, int32 n);
	bool HasPoint(char [] name, int32 n) {
		return be_BMessage_HasPoint(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasSize(BMessage *self, const char* name, int32 n);
	bool HasSize(char [] name, int32 n) {
		return be_BMessage_HasSize(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasString(BMessage *self, const char* name, int32 n);
	bool HasString(char [] name, int32 n) {
		return be_BMessage_HasString(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasInt8(BMessage *self, const char* name, int32 n);
	bool HasInt8(char [] name, int32 n) {
		return be_BMessage_HasInt8(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasUInt8(BMessage *self, const char* name, int32 n);
	bool HasUInt8(char [] name, int32 n) {
		return be_BMessage_HasUInt8(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasInt16(BMessage *self, const char* name, int32 n);
	bool HasInt16(char [] name, int32 n) {
		return be_BMessage_HasInt16(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasUInt16(BMessage *self, const char* name, int32 n);
	bool HasUInt16(char [] name, int32 n) {
		return be_BMessage_HasUInt16(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasInt32(BMessage *self, const char* name, int32 n);
	bool HasInt32(char [] name, int32 n) {
		return be_BMessage_HasInt32(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasUInt32(BMessage *self, const char* name, int32 n);
	bool HasUInt32(char [] name, int32 n) {
		return be_BMessage_HasUInt32(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasInt64(BMessage *self, const char* name, int32 n);
	bool HasInt64(char [] name, int32 n) {
		return be_BMessage_HasInt64(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasUInt64(BMessage *self, const char* name, int32 n);
	bool HasUInt64(char [] name, int32 n) {
		return be_BMessage_HasUInt64(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasBool(BMessage *self, const char* name, int32 n);
	bool HasBool(char [] name, int32 n) {
		return be_BMessage_HasBool(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasFloat(BMessage *self, const char* name, int32 n);
	bool HasFloat(char [] name, int32 n) {
		return be_BMessage_HasFloat(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasDouble(BMessage *self, const char* name, int32 n);
	bool HasDouble(char [] name, int32 n) {
		return be_BMessage_HasDouble(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasPointer(BMessage *self, const char* name, int32 n);
	bool HasPointer(char [] name, int32 n) {
		return be_BMessage_HasPointer(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasMessenger(BMessage *self, const char* name, int32 n);
	bool HasMessenger(char [] name, int32 n) {
		return be_BMessage_HasMessenger(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasRef(BMessage *self, const char* name, int32 n);
	bool HasRef(char [] name, int32 n) {
		return be_BMessage_HasRef(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasMessage(BMessage *self, const char* name, int32 n);
	bool HasMessage(char [] name, int32 n) {
		return be_BMessage_HasMessage(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_HasFlat(BMessage *self, const char* name, const BFlattenable * flat);
	bool HasFlat(char [] name, BFlattenable flat) {
		return be_BMessage_HasFlat(_InstPtr(), toStringz(name), flat._InstPtr);
	}

	// bool be_BMessage_HasFlat_1(BMessage *self, const char* name, int32 n, const BFlattenable * flat);
	bool HasFlat(char [] name, int32 n, BFlattenable flat) {
		return be_BMessage_HasFlat_1(_InstPtr(), toStringz(name), n, flat._InstPtr);
	}

	// bool be_BMessage_HasData(BMessage *self, const char* name, type_code code, int32 n);
	bool HasData(char [] name, type_code code, int32 n) {
		return be_BMessage_HasData(_InstPtr(), toStringz(name), code, n);
	}

	// BRect * be_BMessage_FindRect_2(BMessage *self, const char* name, int32 n);
	BRect FindRect(char [] name, int32 n) {
		return new BRect(be_BMessage_FindRect_2(_InstPtr(), toStringz(name), n), false);
	}

	// BPoint * be_BMessage_FindPoint_2(BMessage *self, const char* name, int32 n);
	BPoint FindPoint(char [] name, int32 n) {
		return new BPoint(be_BMessage_FindPoint_2(_InstPtr(), toStringz(name), n), false);
	}

	// const char * be_BMessage_FindString_4(BMessage *self, const char* name, int32 n);
	char [] FindString(char [] name, int32 n) {
		return fromStringz(be_BMessage_FindString_4(_InstPtr(), toStringz(name), n)).dup;
	}

	// int8 be_BMessage_FindInt8_2(BMessage *self, const char* name, int32 n);
	int8 FindInt8(char [] name, int32 n) {
		return be_BMessage_FindInt8_2(_InstPtr(), toStringz(name), n);
	}

	// int16 be_BMessage_FindInt16_2(BMessage *self, const char* name, int32 n);
	int16 FindInt16(char [] name, int32 n) {
		return be_BMessage_FindInt16_2(_InstPtr(), toStringz(name), n);
	}

	// int32 be_BMessage_FindInt32_2(BMessage *self, const char* name, int32 n);
	int32 FindInt32(char [] name, int32 n) {
		return be_BMessage_FindInt32_2(_InstPtr(), toStringz(name), n);
	}

	// int64 be_BMessage_FindInt64_2(BMessage *self, const char* name, int32 n);
	int64 FindInt64(char [] name, int32 n) {
		return be_BMessage_FindInt64_2(_InstPtr(), toStringz(name), n);
	}

	// bool be_BMessage_FindBool_2(BMessage *self, const char* name, int32 n);
	bool FindBool(char [] name, int32 n) {
		return be_BMessage_FindBool_2(_InstPtr(), toStringz(name), n);
	}

	// float be_BMessage_FindFloat_2(BMessage *self, const char* name, int32 n);
	float FindFloat(char [] name, int32 n) {
		return be_BMessage_FindFloat_2(_InstPtr(), toStringz(name), n);
	}

	// double be_BMessage_FindDouble_2(BMessage *self, const char* name, int32 n);
	double FindDouble(char [] name, int32 n) {
		return be_BMessage_FindDouble_2(_InstPtr(), toStringz(name), n);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


