/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Message.h>
#include <Messenger.h>

extern "C" {
	BMessage* be_BMessage_ctor(void *bindInstPtr)
	{
		return new BMessage();
	}

	BMessage* be_BMessage_ctor_1(void *bindInstPtr, uint32 what)
	{
		return new BMessage(what);
	}

	BMessage* be_BMessage_ctor_2(void *bindInstPtr, const BMessage * other)
	{
		return new BMessage(*other);
	}

	void be_BMessage_dtor(BMessage* self)
	{
		delete self;
	}

	void be_BMessage_what_varSet(BMessage *self, uint32 what)
	{
		self->what = what;
	}

	uint32 be_BMessage_what_varGet(BMessage *self)
	{
		return self->what;
	}
	status_t be_BMessage_GetInfo(BMessage *self, type_code typeRequested, int32 index, char ** nameFound, type_code * typeFound, int32 * countFound)
	{
		return self->GetInfo(typeRequested, index, nameFound, typeFound, countFound);
	}

	status_t be_BMessage_GetInfo_1(BMessage *self, const char * name, type_code * typeFound, int32 * countFound)
	{
		return self->GetInfo(name, typeFound, countFound);
	}

	status_t be_BMessage_GetInfo_2(BMessage *self, const char * name, type_code * typeFound, bool * fixedSize)
	{
		return self->GetInfo(name, typeFound, fixedSize);
	}

	int32 be_BMessage_CountNames(BMessage *self, type_code type)
	{
		return self->CountNames(type);
	}

	bool be_BMessage_IsEmpty(BMessage *self)
	{
		return self->IsEmpty();
	}

	bool be_BMessage_IsSystem(BMessage *self)
	{
		return self->IsSystem();
	}

	bool be_BMessage_IsReply(BMessage *self)
	{
		return self->IsReply();
	}

	void be_BMessage_PrintToStream(BMessage *self)
	{
		self->PrintToStream();
	}

	status_t be_BMessage_Rename(BMessage *self, const char * oldEntry, const char * newEntry)
	{
		return self->Rename(oldEntry, newEntry);
	}

	bool be_BMessage_WasDelivered(BMessage *self)
	{
		return self->WasDelivered();
	}

	bool be_BMessage_IsSourceWaiting(BMessage *self)
	{
		return self->IsSourceWaiting();
	}

	bool be_BMessage_IsSourceRemote(BMessage *self)
	{
		return self->IsSourceRemote();
	}

	BMessenger be_BMessage_ReturnAddress(BMessage *self)
	{
		return self->ReturnAddress();
	}

	const BMessage * be_BMessage_Previous(BMessage *self)
	{
		return self->Previous();
	}

	bool be_BMessage_WasDropped(BMessage *self)
	{
		return self->WasDropped();
	}

	BPoint be_BMessage_DropPoint(BMessage *self, BPoint * offset)
	{
		return self->DropPoint(offset);
	}

	status_t be_BMessage_SendReply(BMessage *self, uint32 command, BHandler * replyTo)
	{
		return self->SendReply(command, replyTo);
	}

	status_t be_BMessage_SendReply_1(BMessage *self, BMessage * reply, BHandler * replyTo, bigtime_t timeout)
	{
		return self->SendReply(reply, replyTo, timeout);
	}

	status_t be_BMessage_SendReply_2(BMessage *self, BMessage * reply, BMessenger replyTo, bigtime_t timeout)
	{
		return self->SendReply(reply, replyTo, timeout);
	}

	status_t be_BMessage_SendReply_3(BMessage *self, uint32 command, BMessage * replyToReply)
	{
		return self->SendReply(command, replyToReply);
	}

	status_t be_BMessage_SendReply_4(BMessage *self, BMessage * the_reply, BMessage * replyToReply, bigtime_t sendTimeout, bigtime_t replyTimeout)
	{
		return self->SendReply(the_reply, replyToReply, sendTimeout, replyTimeout);
	}

	ssize_t be_BMessage_FlattenedSize(BMessage *self)
	{
		return self->FlattenedSize();
	}

	status_t be_BMessage_Flatten(BMessage *self, char * buffer, ssize_t size)
	{
		return self->Flatten(buffer, size);
	}

	status_t be_BMessage_Flatten_1(BMessage *self, BDataIO * stream, ssize_t * size)
	{
		return self->Flatten(stream, size);
	}

	status_t be_BMessage_Unflatten(BMessage *self, const char * flatBuffer)
	{
		return self->Unflatten(flatBuffer);
	}

	status_t be_BMessage_Unflatten_1(BMessage *self, BDataIO * stream)
	{
		return self->Unflatten(stream);
	}

	status_t be_BMessage_AddSpecifier(BMessage *self, const char * property)
	{
		return self->AddSpecifier(property);
	}

	status_t be_BMessage_AddSpecifier_1(BMessage *self, const char * property, int32 index)
	{
		return self->AddSpecifier(property, index);
	}

	status_t be_BMessage_AddSpecifier_2(BMessage *self, const char * property, int32 index, int32 range)
	{
		return self->AddSpecifier(property, index, range);
	}

	status_t be_BMessage_AddSpecifier_3(BMessage *self, const char * property, const char * name)
	{
		return self->AddSpecifier(property, name);
	}

	status_t be_BMessage_AddSpecifier_4(BMessage *self, const BMessage * specifier)
	{
		return self->AddSpecifier(specifier);
	}

	status_t be_BMessage_SetCurrentSpecifier(BMessage *self, int32 index)
	{
		return self->SetCurrentSpecifier(index);
	}

	status_t be_BMessage_GetCurrentSpecifier(BMessage *self, int32 * index, BMessage * specifier, int32 * what, const char ** property)
	{
		return self->GetCurrentSpecifier(index, specifier, what, property);
	}

	status_t be_BMessage_HasSpecifiers(BMessage *self)
	{
		return self->HasSpecifiers();
	}

	status_t be_BMessage_PopSpecifier(BMessage *self)
	{
		return self->PopSpecifier();
	}

	status_t be_BMessage_AddAlignment(BMessage *self, const char* name, const BAlignment* alignment)
	{
		return self->AddAlignment(name, *alignment);
	}

	status_t be_BMessage_AddRect(BMessage *self, const char * name, BRect aRect)
	{
		return self->AddRect(name, aRect);
	}

	status_t be_BMessage_AddPoint(BMessage *self, const char * name, BPoint aPoint)
	{
		return self->AddPoint(name, aPoint);
	}

	status_t be_BMessage_AddSize(BMessage *self, const char* name, BSize aSize)
	{
		return self->AddSize(name, aSize);
	}

	status_t be_BMessage_AddString(BMessage *self, const char * name, const char * aString)
	{
		return self->AddString(name, aString);
	}

	status_t be_BMessage_AddString_1(BMessage *self, const char * name, const BString * aString)
	{
		return self->AddString(name, *aString);
	}

	status_t be_BMessage_AddInt8(BMessage *self, const char * name, int8 value)
	{
		return self->AddInt8(name, value);
	}

	status_t be_BMessage_AddUInt8(BMessage *self, const char * name, uint8 value)
	{
		return self->AddUInt8(name, value);
	}

	status_t be_BMessage_AddInt16(BMessage *self, const char * name, int16 value)
	{
		return self->AddInt16(name, value);
	}

	status_t be_BMessage_AddUInt16(BMessage *self, const char * name, uint16 value)
	{
		return self->AddUInt16(name, value);
	}

	status_t be_BMessage_AddInt32(BMessage *self, const char * name, int32 value)
	{
		return self->AddInt32(name, value);
	}

	status_t be_BMessage_AddUInt32(BMessage *self, const char * name, uint32 value)
	{
		return self->AddUInt32(name, value);
	}

	status_t be_BMessage_AddInt64(BMessage *self, const char * name, int64 value)
	{
		return self->AddInt64(name, value);
	}

	status_t be_BMessage_AddUInt64(BMessage *self, const char * name, uint64 value)
	{
		return self->AddUInt64(name, value);
	}

	status_t be_BMessage_AddBool(BMessage *self, const char * name, bool aBoolean)
	{
		return self->AddBool(name, aBoolean);
	}

	status_t be_BMessage_AddFloat(BMessage *self, const char * name, float aFloat)
	{
		return self->AddFloat(name, aFloat);
	}

	status_t be_BMessage_AddDouble(BMessage *self, const char * name, double aDouble)
	{
		return self->AddDouble(name, aDouble);
	}

	status_t be_BMessage_AddPointer(BMessage *self, const char * name, const void * aPointer)
	{
		return self->AddPointer(name, aPointer);
	}

	status_t be_BMessage_AddMessenger(BMessage *self, const char * name, BMessenger messenger)
	{
		return self->AddMessenger(name, messenger);
	}

	status_t be_BMessage_AddRef(BMessage *self, const char * name, const entry_ref * ref)
	{
		return self->AddRef(name, ref);
	}

	status_t be_BMessage_AddMessage(BMessage *self, const char * name, const BMessage * message)
	{
		return self->AddMessage(name, message);
	}

	status_t be_BMessage_AddFlat(BMessage *self, const char * name, BFlattenable * object, int32 count)
	{
		return self->AddFlat(name, object, count);
	}

	status_t be_BMessage_AddData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes, bool isFixedSize, int32 count)
	{
		return self->AddData(name, type, data, numBytes, isFixedSize, count);
	}

	status_t be_BMessage_RemoveData(BMessage *self, const char * name, int32 index)
	{
		return self->RemoveData(name, index);
	}

	status_t be_BMessage_RemoveName(BMessage *self, const char * name)
	{
		return self->RemoveName(name);
	}

	status_t be_BMessage_MakeEmpty(BMessage *self)
	{
		return self->MakeEmpty();
	}

	status_t be_BMessage_FindAlignment(BMessage *self, const char* name, BAlignment* alignment)
	{
		return self->FindAlignment(name, alignment);
	}

	status_t be_BMessage_FindAlignment_1(BMessage *self, const char* name, int32 index, BAlignment* alignment)
	{
		return self->FindAlignment(name, index, alignment);
	}

	status_t be_BMessage_FindRect(BMessage *self, const char * name, BRect * rect)
	{
		return self->FindRect(name, rect);
	}

	status_t be_BMessage_FindRect_1(BMessage *self, const char * name, int32 index, BRect * rect)
	{
		return self->FindRect(name, index, rect);
	}

	status_t be_BMessage_FindPoint(BMessage *self, const char * name, BPoint * point)
	{
		return self->FindPoint(name, point);
	}

	status_t be_BMessage_FindPoint_1(BMessage *self, const char * name, int32 index, BPoint * point)
	{
		return self->FindPoint(name, index, point);
	}

	status_t be_BMessage_FindSize(BMessage *self, const char * name, BSize* size)
	{
		return self->FindSize(name, size);
	}

	status_t be_BMessage_FindSize_1(BMessage *self, const char * name, int32 index, BSize* size)
	{
		return self->FindSize(name, index, size);
	}

	status_t be_BMessage_FindString(BMessage *self, const char * name, const char ** string)
	{
		return self->FindString(name, string);
	}

	status_t be_BMessage_FindString_1(BMessage *self, const char * name, int32 index, const char ** string)
	{
		return self->FindString(name, index, string);
	}

	status_t be_BMessage_FindString_2(BMessage *self, const char * name, BString * string)
	{
		return self->FindString(name, string);
	}

	status_t be_BMessage_FindString_3(BMessage *self, const char * name, int32 index, BString * string)
	{
		return self->FindString(name, index, string);
	}

	status_t be_BMessage_FindInt8(BMessage *self, const char * name, int8 * value)
	{
		return self->FindInt8(name, value);
	}

	status_t be_BMessage_FindInt8_1(BMessage *self, const char * name, int32 index, int8 * value)
	{
		return self->FindInt8(name, index, value);
	}

	status_t be_BMessage_FindUInt8(BMessage *self, const char * name, uint8 * value)
	{
		return self->FindUInt8(name, value);
	}

	status_t be_BMessage_FindUInt8_1(BMessage *self, const char * name, int32 index, uint8 * value)
	{
		return self->FindUInt8(name, index, value);
	}

	status_t be_BMessage_FindInt16(BMessage *self, const char * name, int16 * value)
	{
		return self->FindInt16(name, value);
	}

	status_t be_BMessage_FindInt16_1(BMessage *self, const char * name, int32 index, int16 * value)
	{
		return self->FindInt16(name, index, value);
	}

	status_t be_BMessage_FindUInt16(BMessage *self, const char * name, uint16 * value)
	{
		return self->FindUInt16(name, value);
	}

	status_t be_BMessage_FindUInt16_1(BMessage *self, const char * name, int32 index, uint16 * value)
	{
		return self->FindUInt16(name, index, value);
	}

	status_t be_BMessage_FindInt32(BMessage *self, const char * name, int32 * value)
	{
		return self->FindInt32(name, value);
	}

	status_t be_BMessage_FindInt32_1(BMessage *self, const char * name, int32 index, int32 * value)
	{
		return self->FindInt32(name, index, value);
	}

	status_t be_BMessage_FindUInt32(BMessage *self, const char * name, uint32 * value)
	{
		return self->FindUInt32(name, value);
	}

	status_t be_BMessage_FindUInt32_1(BMessage *self, const char * name, int32 index, uint32 * value)
	{
		return self->FindUInt32(name, index, value);
	}

	status_t be_BMessage_FindInt64(BMessage *self, const char * name, int64 * value)
	{
		return self->FindInt64(name, value);
	}

	status_t be_BMessage_FindInt64_1(BMessage *self, const char * name, int32 index, int64 * value)
	{
		return self->FindInt64(name, index, value);
	}

	status_t be_BMessage_FindUInt64(BMessage *self, const char * name, uint64 * value)
	{
		return self->FindUInt64(name, value);
	}

	status_t be_BMessage_FindUInt64_1(BMessage *self, const char * name, int32 index, uint64 * value)
	{
		return self->FindUInt64(name, index, value);
	}

	status_t be_BMessage_FindBool(BMessage *self, const char * name, bool * value)
	{
		return self->FindBool(name, value);
	}

	status_t be_BMessage_FindBool_1(BMessage *self, const char * name, int32 index, bool * value)
	{
		return self->FindBool(name, index, value);
	}

	status_t be_BMessage_FindFloat(BMessage *self, const char * name, float * value)
	{
		return self->FindFloat(name, value);
	}

	status_t be_BMessage_FindFloat_1(BMessage *self, const char * name, int32 index, float * value)
	{
		return self->FindFloat(name, index, value);
	}

	status_t be_BMessage_FindDouble(BMessage *self, const char * name, double * value)
	{
		return self->FindDouble(name, value);
	}

	status_t be_BMessage_FindDouble_1(BMessage *self, const char * name, int32 index, double * value)
	{
		return self->FindDouble(name, index, value);
	}

	status_t be_BMessage_FindPointer(BMessage *self, const char * name, void ** pointer)
	{
		return self->FindPointer(name, pointer);
	}

	status_t be_BMessage_FindPointer_1(BMessage *self, const char * name, int32 index, void ** pointer)
	{
		return self->FindPointer(name, index, pointer);
	}

	status_t be_BMessage_FindMessenger(BMessage *self, const char * name, BMessenger * messenger)
	{
		return self->FindMessenger(name, messenger);
	}

	status_t be_BMessage_FindMessenger_1(BMessage *self, const char * name, int32 index, BMessenger * messenger)
	{
		return self->FindMessenger(name, index, messenger);
	}

	status_t be_BMessage_FindRef(BMessage *self, const char * name, entry_ref * ref)
	{
		return self->FindRef(name, ref);
	}

	status_t be_BMessage_FindRef_1(BMessage *self, const char * name, int32 index, entry_ref * ref)
	{
		return self->FindRef(name, index, ref);
	}

	status_t be_BMessage_FindMessage(BMessage *self, const char * name, BMessage * message)
	{
		return self->FindMessage(name, message);
	}

	status_t be_BMessage_FindMessage_1(BMessage *self, const char * name, int32 index, BMessage * message)
	{
		return self->FindMessage(name, index, message);
	}

	status_t be_BMessage_FindFlat(BMessage *self, const char * name, BFlattenable * object)
	{
		return self->FindFlat(name, object);
	}

	status_t be_BMessage_FindFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object)
	{
		return self->FindFlat(name, index, object);
	}

	status_t be_BMessage_FindData(BMessage *self, const char * name, type_code type, const void ** data, ssize_t * numBytes)
	{
		return self->FindData(name, type, data, numBytes);
	}

	status_t be_BMessage_FindData_1(BMessage *self, const char * name, type_code type, int32 index, const void ** data, ssize_t * numBytes)
	{
		return self->FindData(name, type, index, data, numBytes);
	}

	status_t be_BMessage_ReplaceAlignment(BMessage *self, const char* name, const BAlignment* alignment)
	{
		return self->ReplaceAlignment(name, *alignment);
	}

	status_t be_BMessage_ReplaceAlignment_1(BMessage *self, const char* name, int32 index, const BAlignment* alignment)
	{
		return self->ReplaceAlignment(name, index, *alignment);
	}

	status_t be_BMessage_ReplaceRect(BMessage *self, const char * name, BRect aRect)
	{
		return self->ReplaceRect(name, aRect);
	}

	status_t be_BMessage_ReplaceRect_1(BMessage *self, const char * name, int32 index, BRect aRect)
	{
		return self->ReplaceRect(name, index, aRect);
	}

	status_t be_BMessage_ReplacePoint(BMessage *self, const char * name, BPoint aPoint)
	{
		return self->ReplacePoint(name, aPoint);
	}

	status_t be_BMessage_ReplacePoint_1(BMessage *self, const char * name, int32 index, BPoint aPoint)
	{
		return self->ReplacePoint(name, index, aPoint);
	}

	status_t be_BMessage_ReplaceSize(BMessage *self, const char* name, BSize aSize)
	{
		return self->ReplaceSize(name, aSize);
	}

	status_t be_BMessage_ReplaceSize_1(BMessage *self, const char* name, int32 index, BSize aSize)
	{
		return self->ReplaceSize(name, index, aSize);
	}

	status_t be_BMessage_ReplaceString(BMessage *self, const char * name, const char * aString)
	{
		return self->ReplaceString(name, aString);
	}

	status_t be_BMessage_ReplaceString_1(BMessage *self, const char * name, int32 index, const char * aString)
	{
		return self->ReplaceString(name, index, aString);
	}

	status_t be_BMessage_ReplaceString_2(BMessage *self, const char * name, const BString * aString)
	{
		return self->ReplaceString(name, *aString);
	}

	status_t be_BMessage_ReplaceString_3(BMessage *self, const char * name, int32 index, const BString * aString)
	{
		return self->ReplaceString(name, index, *aString);
	}

	status_t be_BMessage_ReplaceInt8(BMessage *self, const char * name, int8 value)
	{
		return self->ReplaceInt8(name, value);
	}

	status_t be_BMessage_ReplaceInt8_1(BMessage *self, const char * name, int32 index, int8 value)
	{
		return self->ReplaceInt8(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt8(BMessage *self, const char * name, uint8 value)
	{
		return self->ReplaceUInt8(name, value);
	}

	status_t be_BMessage_ReplaceUInt8_1(BMessage *self, const char * name, int32 index, uint8 value)
	{
		return self->ReplaceUInt8(name, index, value);
	}

	status_t be_BMessage_ReplaceInt16(BMessage *self, const char * name, int16 value)
	{
		return self->ReplaceInt16(name, value);
	}

	status_t be_BMessage_ReplaceInt16_1(BMessage *self, const char * name, int32 index, int16 value)
	{
		return self->ReplaceInt16(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt16(BMessage *self, const char * name, uint16 value)
	{
		return self->ReplaceUInt16(name, value);
	}

	status_t be_BMessage_ReplaceUInt16_1(BMessage *self, const char * name, int32 index, uint16 value)
	{
		return self->ReplaceUInt16(name, index, value);
	}

	status_t be_BMessage_ReplaceInt32(BMessage *self, const char * name, int32 value)
	{
		return self->ReplaceInt32(name, value);
	}

	status_t be_BMessage_ReplaceInt32_1(BMessage *self, const char * name, int32 index, int32 value)
	{
		return self->ReplaceInt32(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt32(BMessage *self, const char * name, uint32 value)
	{
		return self->ReplaceUInt32(name, value);
	}

	status_t be_BMessage_ReplaceUInt32_1(BMessage *self, const char * name, int32 index, uint32 value)
	{
		return self->ReplaceUInt32(name, index, value);
	}

	status_t be_BMessage_ReplaceInt64(BMessage *self, const char * name, int64 value)
	{
		return self->ReplaceInt64(name, value);
	}

	status_t be_BMessage_ReplaceInt64_1(BMessage *self, const char * name, int32 index, int64 value)
	{
		return self->ReplaceInt64(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt64(BMessage *self, const char * name, uint64 value)
	{
		return self->ReplaceUInt64(name, value);
	}

	status_t be_BMessage_ReplaceUInt64_1(BMessage *self, const char * name, int32 index, uint64 value)
	{
		return self->ReplaceUInt64(name, index, value);
	}

	status_t be_BMessage_ReplaceBool(BMessage *self, const char * name, bool aBoolean)
	{
		return self->ReplaceBool(name, aBoolean);
	}

	status_t be_BMessage_ReplaceBool_1(BMessage *self, const char * name, int32 index, bool aBoolean)
	{
		return self->ReplaceBool(name, index, aBoolean);
	}

	status_t be_BMessage_ReplaceFloat(BMessage *self, const char * name, float aFloat)
	{
		return self->ReplaceFloat(name, aFloat);
	}

	status_t be_BMessage_ReplaceFloat_1(BMessage *self, const char * name, int32 index, float aFloat)
	{
		return self->ReplaceFloat(name, index, aFloat);
	}

	status_t be_BMessage_ReplaceDouble(BMessage *self, const char * name, double aDouble)
	{
		return self->ReplaceDouble(name, aDouble);
	}

	status_t be_BMessage_ReplaceDouble_1(BMessage *self, const char * name, int32 index, double aDouble)
	{
		return self->ReplaceDouble(name, index, aDouble);
	}

	status_t be_BMessage_ReplacePointer(BMessage *self, const char * name, const void * pointer)
	{
		return self->ReplacePointer(name, pointer);
	}

	status_t be_BMessage_ReplacePointer_1(BMessage *self, const char * name, int32 index, const void * pointer)
	{
		return self->ReplacePointer(name, index, pointer);
	}

	status_t be_BMessage_ReplaceMessenger(BMessage *self, const char * name, BMessenger messenger)
	{
		return self->ReplaceMessenger(name, messenger);
	}

	status_t be_BMessage_ReplaceMessenger_1(BMessage *self, const char * name, int32 index, BMessenger messenger)
	{
		return self->ReplaceMessenger(name, index, messenger);
	}

	status_t be_BMessage_ReplaceRef(BMessage *self, const char * name, const entry_ref * ref)
	{
		return self->ReplaceRef(name, ref);
	}

	status_t be_BMessage_ReplaceRef_1(BMessage *self, const char * name, int32 index, const entry_ref * ref)
	{
		return self->ReplaceRef(name, index, ref);
	}

	status_t be_BMessage_ReplaceMessage(BMessage *self, const char * name, const BMessage * message)
	{
		return self->ReplaceMessage(name, message);
	}

	status_t be_BMessage_ReplaceMessage_1(BMessage *self, const char * name, int32 index, const BMessage * message)
	{
		return self->ReplaceMessage(name, index, message);
	}

	status_t be_BMessage_ReplaceFlat(BMessage *self, const char * name, BFlattenable * object)
	{
		return self->ReplaceFlat(name, object);
	}

	status_t be_BMessage_ReplaceFlat_1(BMessage *self, const char * name, int32 index, BFlattenable * object)
	{
		return self->ReplaceFlat(name, index, object);
	}

	status_t be_BMessage_ReplaceData(BMessage *self, const char * name, type_code type, const void * data, ssize_t numBytes)
	{
		return self->ReplaceData(name, type, data, numBytes);
	}

	status_t be_BMessage_ReplaceData_1(BMessage *self, const char * name, type_code type, int32 index, const void * data, ssize_t numBytes)
	{
		return self->ReplaceData(name, type, index, data, numBytes);
	}

	bool be_BMessage_HasSameData(BMessage *self, const BMessage * other, bool ignoreFieldOrder, bool deep)
	{
		return self->HasSameData(*other, ignoreFieldOrder, deep);
	}

	bool be_BMessage_HasAlignment(BMessage *self, const char* name, int32 n)
	{
		return self->HasAlignment(name, n);
	}

	bool be_BMessage_HasRect(BMessage *self, const char* name, int32 n)
	{
		return self->HasRect(name, n);
	}

	bool be_BMessage_HasPoint(BMessage *self, const char* name, int32 n)
	{
		return self->HasPoint(name, n);
	}

	bool be_BMessage_HasSize(BMessage *self, const char* name, int32 n)
	{
		return self->HasSize(name, n);
	}

	bool be_BMessage_HasString(BMessage *self, const char* name, int32 n)
	{
		return self->HasString(name, n);
	}

	bool be_BMessage_HasInt8(BMessage *self, const char* name, int32 n)
	{
		return self->HasInt8(name, n);
	}

	bool be_BMessage_HasUInt8(BMessage *self, const char* name, int32 n)
	{
		return self->HasUInt8(name, n);
	}

	bool be_BMessage_HasInt16(BMessage *self, const char* name, int32 n)
	{
		return self->HasInt16(name, n);
	}

	bool be_BMessage_HasUInt16(BMessage *self, const char* name, int32 n)
	{
		return self->HasUInt16(name, n);
	}

	bool be_BMessage_HasInt32(BMessage *self, const char* name, int32 n)
	{
		return self->HasInt32(name, n);
	}

	bool be_BMessage_HasUInt32(BMessage *self, const char* name, int32 n)
	{
		return self->HasUInt32(name, n);
	}

	bool be_BMessage_HasInt64(BMessage *self, const char* name, int32 n)
	{
		return self->HasInt64(name, n);
	}

	bool be_BMessage_HasUInt64(BMessage *self, const char* name, int32 n)
	{
		return self->HasUInt64(name, n);
	}

	bool be_BMessage_HasBool(BMessage *self, const char* name, int32 n)
	{
		return self->HasBool(name, n);
	}

	bool be_BMessage_HasFloat(BMessage *self, const char* name, int32 n)
	{
		return self->HasFloat(name, n);
	}

	bool be_BMessage_HasDouble(BMessage *self, const char* name, int32 n)
	{
		return self->HasDouble(name, n);
	}

	bool be_BMessage_HasPointer(BMessage *self, const char* name, int32 n)
	{
		return self->HasPointer(name, n);
	}

	bool be_BMessage_HasMessenger(BMessage *self, const char* name, int32 n)
	{
		return self->HasMessenger(name, n);
	}

	bool be_BMessage_HasRef(BMessage *self, const char* name, int32 n)
	{
		return self->HasRef(name, n);
	}

	bool be_BMessage_HasMessage(BMessage *self, const char* name, int32 n)
	{
		return self->HasMessage(name, n);
	}

	bool be_BMessage_HasFlat(BMessage *self, const char* name, const BFlattenable * flat)
	{
		return self->HasFlat(name, flat);
	}

	bool be_BMessage_HasFlat_1(BMessage *self, const char* name, int32 n, const BFlattenable * flat)
	{
		return self->HasFlat(name, n, flat);
	}

	bool be_BMessage_HasData(BMessage *self, const char* name, type_code code, int32 n)
	{
		return self->HasData(name, code, n);
	}

	BRect be_BMessage_FindRect_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindRect(name, n);
	}

	BPoint be_BMessage_FindPoint_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindPoint(name, n);
	}

	const char * be_BMessage_FindString_4(BMessage *self, const char* name, int32 n)
	{
		return self->FindString(name, n);
	}

	int8 be_BMessage_FindInt8_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindInt8(name, n);
	}

	int16 be_BMessage_FindInt16_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindInt16(name, n);
	}

	int32 be_BMessage_FindInt32_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindInt32(name, n);
	}

	int64 be_BMessage_FindInt64_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindInt64(name, n);
	}

	bool be_BMessage_FindBool_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindBool(name, n);
	}

	float be_BMessage_FindFloat_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindFloat(name, n);
	}

	double be_BMessage_FindDouble_2(BMessage *self, const char* name, int32 n)
	{
		return self->FindDouble(name, n);
	}

}


