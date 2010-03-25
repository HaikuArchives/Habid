#include <app/Message.h>
#include <app/Messenger.h>

#include <hcb-types.h>
#include <stdio.h>

#include <app/HCB_Message.h>

/* begin import functions */

extern "C" {
}

/* end import functions */



/* begin export functions */

extern "C" {
	be_BMessage * be_BMessage_ctor_1(void *bindInstPointer) {
		return (be_BMessage *)new BMessage();
	}
	
	be_BMessage * be_BMessage_ctor_2(void *bindInstPointer, uint32 what) {
		return (be_BMessage *)new BMessage(what);
	}
	
	be_BMessage * be_BMessage_ctor_3(void *bindInstPointer, const be_BMessage *other) {
		return (be_BMessage *)new BMessage(*(BMessage *)other);
	}
	
	void be_BMessage_dtor(be_BMessage *instPointer) {
		delete (BMessage *)instPointer;
	}
	
	be_BMessage * be_BMessage_operator_assign(be_BMessage *instPointer, const be_BMessage *other) {
		return (be_BMessage *)&((BMessage *)instPointer)->operator=(*(BMessage *)other);
	}

		// Statistics and misc info
	status_t be_BMessage_GetInfo_1(be_BMessage *instPointer, type_code typeRequested, int32 index, char **nameFound, type_code *typeFound, int32 *countFound) {
		return ((BMessage *)instPointer)->GetInfo(typeRequested, index, nameFound, typeFound);
	}
	
	status_t be_BMessage_GetInfo_2(be_BMessage *instPointer, const char *name, type_code *typeFound, int32 *countFound) {
		return ((BMessage *)instPointer)->GetInfo(name, typeFound, countFound);
	}
	
	status_t be_BMessage_GetInfo_3(be_BMessage *instPointer, const char *name, type_code *typeFound, bool *fixedSize) {
		return ((BMessage *)instPointer)->GetInfo(name, typeFound, fixedSize);
	}

	int32 be_BMessage_CountNames(be_BMessage *instPointer, type_code type) {
		return ((BMessage *)instPointer)->CountNames(type);
	}

	bool be_BMessage_IsEmpty(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->IsEmpty();
	}

	bool be_BMessage_IsSystem(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->IsSystem();
	}

	bool be_BMessage_IsReply(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->IsReply();
	}

	void be_BMessage_PrintToStream(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->PrintToStream();
	}


	status_t be_BMessage_Rename(be_BMessage *instPointer, const char *oldEntry, const char *newEntry) {
		return ((BMessage *)instPointer)->Rename(oldEntry, newEntry);
	}


	// Delivery info
	bool be_BMessage_WasDelivered(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->WasDelivered();
	}

	bool be_BMessage_IsSourceWaiting(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->IsSourceWaiting();
	}

	bool be_BMessage_IsSourceRemote(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->IsSourceRemote();
	}

//	BMessenger		ReturnAddress() const;
	be_BMessage * be_BMessage_Previous(be_BMessage *instPointer) {
		return (be_BMessage *)((BMessage *)instPointer)->Previous();
	}

	bool be_BMessage_WasDropped(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->WasDropped();
	}

//	BPoint	DropPoint(BPoint *offset = NULL) const;


		// Replying
	status_t be_BMessage_SendReply_1(be_BMessage *instPointer, uint32 command, be_BHandler *replyTo) {
		return ((BMessage *)instPointer)->SendReply(command, (BHandler *)replyTo);
	}
	
	status_t be_BMessage_SendReply_2(be_BMessage *instPointer, be_BMessage *reply, be_BHandler *replyTo,
							bigtime_t timeout) {
		return ((BMessage *)instPointer)->SendReply((BMessage *)reply, (BHandler *)replyTo, timeout);
	}
	
	status_t be_BMessage_SendReply_3(be_BMessage *instPointer, be_BMessage *reply, be_BMessenger *replyTo,
							bigtime_t timeout) {
		return ((BMessage *)instPointer)->SendReply((BMessage *)reply, *(BMessenger *)replyTo, timeout);
	}

	status_t be_BMessage_SendReply_4(be_BMessage *instPointer, uint32 command, be_BMessage *replyToReply) {
		return ((BMessage *)instPointer)->SendReply(command, (BMessage *)replyToReply);
	}
	
	status_t be_BMessage_SendReply_5(be_BMessage *instPointer, be_BMessage *the_reply, be_BMessage *replyToReply,
							bigtime_t sendTimeout, bigtime_t replyTimeout) {
		return ((BMessage *)instPointer)->SendReply((BMessage *)the_reply, (BMessage *)replyToReply, sendTimeout, replyTimeout);
	}

		// Flattening data
	ssize_t be_BMessage_FlattenedSize(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->FlattenedSize();		
	}
		
	status_t be_BMessage_Flatten_1(be_BMessage *instPointer, char *buffer, ssize_t size) {
		return ((BMessage *)instPointer)->Flatten(buffer, size);
	}
	status_t be_BMessage_Flatten_2(be_BMessage *instPointer, be_BDataIO *stream, ssize_t *size) {
		return ((BMessage *)instPointer)->Flatten((BDataIO *)stream, size);
	}
	status_t be_BMessage_Unflatten_1(be_BMessage *instPointer, const char *flatBuffer) {
		return ((BMessage *)instPointer)->Unflatten(flatBuffer);
	}
	status_t be_BMessage_Unflatten_2(be_BMessage *instPointer, be_BDataIO *stream) {
		return ((BMessage *)instPointer)->Unflatten((BDataIO *)stream);
	}


		// Specifiers (scripting)
	status_t be_BMessage_AddSpecifier_1(be_BMessage *instPointer, const char *property) {
		return ((BMessage *)instPointer)->AddSpecifier(property);
	}

	status_t be_BMessage_AddSpecifier_2(be_BMessage *instPointer, const char *property, int32 index) {
		return ((BMessage *)instPointer)->AddSpecifier(property, index);
	}

	status_t be_BMessage_AddSpecifier_3(be_BMessage *instPointer, const char *property, int32 index, int32 range) {
		return ((BMessage *)instPointer)->AddSpecifier(property, index, range);
	}

	status_t be_BMessage_AddSpecifier_4(be_BMessage *instPointer, const char *property, const char *name) {
		return ((BMessage *)instPointer)->AddSpecifier(property, name);
	}

	status_t be_BMessage_AddSpecifier_5(be_BMessage *instPointer, const be_BMessage *specifier) {
		return ((BMessage *)instPointer)->AddSpecifier((BMessage *)specifier);
	}


	status_t be_BMessage_SetCurrentSpecifier(be_BMessage *instPointer, int32 index) {
		return ((BMessage *)instPointer)->SetCurrentSpecifier(index);
	}

	status_t be_BMessage_GetCurrentSpecifier(be_BMessage *instPointer, int32 *index, be_BMessage *specifier, int32 *what, const char **property) {
		return ((BMessage *)instPointer)->GetCurrentSpecifier(index, (BMessage *)specifier, what, property);
	}

	bool be_BMessage_HasSpecifiers(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->HasSpecifiers();
	}

	status_t be_BMessage_PopSpecifier(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->PopSpecifier();
	}



		// Adding data
	status_t be_BMessage_AddRect(be_BMessage *instPointer, const char *name, be_BRect *aRect) {
		return ((BMessage *)instPointer)->AddRect(name, *(BRect *)aRect);
	}
	
	status_t be_BMessage_AddPoint(be_BMessage *instPointer, const char *name, be_BPoint *aPoint) {
		return ((BMessage *)instPointer)->AddPoint(name, *(BPoint *)aPoint);
	}

	status_t be_BMessage_AddString_1(be_BMessage *instPointer, const char *name, const char *aString) {
		return ((BMessage *)instPointer)->AddString(name, aString);
	}

	status_t be_BMessage_AddString_2(be_BMessage *instPointer, const char *name, const be_BString *aString) {
		return ((BMessage *)instPointer)->AddString(name, *(BString *)aString);
	}

	status_t be_BMessage_AddInt8(be_BMessage *instPointer, const char *name, int8 value) {
		return ((BMessage *)instPointer)->AddInt8(name, value);
	}

	status_t be_BMessage_AddUInt8(be_BMessage *instPointer, const char *name, uint8 value) {
		return ((BMessage *)instPointer)->AddUInt8(name, value);
	}

	status_t be_BMessage_AddInt16(be_BMessage *instPointer, const char *name, int16 value) {
		return ((BMessage *)instPointer)->AddInt16(name, value);
	}

	status_t be_BMessage_AddUInt16(be_BMessage *instPointer, const char *name, uint16 value) {
		return ((BMessage *)instPointer)->AddUInt16(name, value);
	}

	status_t be_BMessage_AddInt32(be_BMessage *instPointer, const char *name, int32 value) {
		return ((BMessage *)instPointer)->AddInt32(name, value);
	}

	status_t be_BMessage_AddUInt32(be_BMessage *instPointer, const char *name, uint32 value) {
		return ((BMessage *)instPointer)->AddUInt32(name, value);
	}

	status_t be_BMessage_AddInt64(be_BMessage *instPointer, const char *name, int64 value) {
		return ((BMessage *)instPointer)->AddInt64(name, value);
	}

	status_t be_BMessage_AddUInt64(be_BMessage *instPointer, const char *name, uint64 value) {
		return ((BMessage *)instPointer)->AddUInt64(name, value);
	}

	status_t be_BMessage_AddBool(be_BMessage *instPointer, const char *name, bool aBoolean) {
		return ((BMessage *)instPointer)->AddBool(name, aBoolean);
	}

	status_t be_BMessage_AddFloat(be_BMessage *instPointer, const char *name, float aFloat) {
		return ((BMessage *)instPointer)->AddFloat(name, aFloat);
	}

	status_t be_BMessage_AddDouble(be_BMessage *instPointer, const char *name, double aDouble) {
		return ((BMessage *)instPointer)->AddDouble(name, aDouble);
	}

	status_t be_BMessage_AddPointer(be_BMessage *instPointer, const char *name, const void *aPointer) {
		return ((BMessage *)instPointer)->AddPointer(name, aPointer);
	}

	status_t be_BMessage_AddMessenger(be_BMessage *instPointer, const char *name, be_BMessenger *messenger) {
		return ((BMessage *)instPointer)->AddMessenger(name, *(BMessenger *)messenger);
	}

	status_t be_BMessage_AddRef(be_BMessage *instPointer, const char *name, const entry_ref *ref) {
		return ((BMessage *)instPointer)->AddRef(name, ref);
	}

	status_t be_BMessage_AddMessage(be_BMessage *instPointer, const char *name, const be_BMessage *message) {
		return ((BMessage *)instPointer)->AddMessage(name, (BMessage *)message);
	}

	status_t be_BMessage_AddFlat(be_BMessage *instPointer, const char *name, be_BFlattenable *object, int32 count) {
		return ((BMessage *)instPointer)->AddFlat(name, (BFlattenable *)object, count);
	}

	status_t be_BMessage_AddData(be_BMessage *instPointer, const char *name, type_code type, const void *data, ssize_t numBytes, bool isFixedSize, int32 count) {
		return ((BMessage *)instPointer)->AddData(name, type, data, numBytes, isFixedSize, count);
	}



		// Removing data
	status_t be_BMessage_RemoveData(be_BMessage *instPointer, const char *name, int32 index) {
		return ((BMessage *)instPointer)->RemoveData(name, index);
	}
	
	status_t be_BMessage_RemoveName(be_BMessage *instPointer, const char *name) {
		return ((BMessage *)instPointer)->RemoveName(name);
	}

	status_t be_BMessage_MakeEmpty(be_BMessage *instPointer) {
		return ((BMessage *)instPointer)->MakeEmpty();
	}


		// Finding data
	status_t be_BMessage_FindRect_1(be_BMessage *instPointer, const char *name, be_BRect *rect) {
		return ((BMessage *)instPointer)->FindRect(name, (BRect *)rect);
	}

	status_t be_BMessage_FindRect_2(be_BMessage *instPointer, const char *name, int32 index, be_BRect *rect) {
		return ((BMessage *)instPointer)->FindRect(name, index, (BRect *)rect);
	}

	status_t be_BMessage_FindPoint_1(be_BMessage *instPointer, const char *name, be_BPoint *point) {
		return ((BMessage *)instPointer)->FindPoint(name, (BPoint *)point);
	}

	status_t be_BMessage_FindPoint_2(be_BMessage *instPointer, const char *name, int32 index, be_BPoint *point) {
		return ((BMessage *)instPointer)->FindPoint(name, index, (BPoint *)point);
	}

	status_t be_BMessage_FindString_1(be_BMessage *instPointer, const char *name, const char **string) {
		return ((BMessage *)instPointer)->FindString(name, string);
	}

	status_t be_BMessage_FindString_2(be_BMessage *instPointer, const char *name, int32 index, const char **string) {
		return ((BMessage *)instPointer)->FindString(name, index, string);
	}

	status_t be_BMessage_FindString_3(be_BMessage *instPointer, const char *name, be_BString *string) {
		return ((BMessage *)instPointer)->FindString(name, (BString *)string);
	}

	status_t be_BMessage_FindString_4(be_BMessage *instPointer, const char *name, int32 index, be_BString *string) {
		return ((BMessage *)instPointer)->FindString(name, index, (BString *)string);
	}

	status_t be_BMessage_FindInt8_1(be_BMessage *instPointer, const char *name, int8 *value) {
		return ((BMessage *)instPointer)->FindInt8(name, value);
	}

	status_t be_BMessage_FindInt8_2(be_BMessage *instPointer, const char *name, int32 index, int8 *value) {
		return ((BMessage *)instPointer)->FindInt8(name, index, value);
	}

	status_t be_BMessage_FindUInt8_1(be_BMessage *instPointer, const char *name, uint8 *value) {
		return ((BMessage *)instPointer)->FindUInt8(name, value);
	}

	status_t be_BMessage_FindUInt8_2(be_BMessage *instPointer, const char *name, int32 index, uint8 *value) {
		return ((BMessage *)instPointer)->FindUInt8(name, index, value);
	}

	status_t be_BMessage_FindInt16_1(be_BMessage *instPointer, const char *name, int16 *value) {
		return ((BMessage *)instPointer)->FindInt16(name, value);
	}

	status_t be_BMessage_FindInt16_2(be_BMessage *instPointer, const char *name, int32 index, int16 *value) {
		return ((BMessage *)instPointer)->FindInt16(name, index, value);
	}

	status_t be_BMessage_FindUInt16_1(be_BMessage *instPointer, const char *name, uint16 *value) {
		return ((BMessage *)instPointer)->FindUInt16(name, value);
	}

	status_t be_BMessage_FindUInt16_2(be_BMessage *instPointer, const char *name, int32 index, uint16 *value) {
		return ((BMessage *)instPointer)->FindUInt16(name, index, value);
	}

	status_t be_BMessage_FindInt32_1(be_BMessage *instPointer, const char *name, int32 *value) {
		return ((BMessage *)instPointer)->FindInt32(name, value);
	}

	status_t be_BMessage_FindInt32_2(be_BMessage *instPointer, const char *name, int32 index, int32 *value) {
		return ((BMessage *)instPointer)->FindInt32(name, index, value);
	}

	status_t be_BMessage_FindUInt32_1(be_BMessage *instPointer, const char *name, uint32 *value) {
		return ((BMessage *)instPointer)->FindUInt32(name, value);
	}

	status_t be_BMessage_FindUInt32_2(be_BMessage *instPointer, const char *name, int32 index, uint32 *value) {
		return ((BMessage *)instPointer)->FindUInt32(name, index, value);
	}

	status_t be_BMessage_FindInt64_1(be_BMessage *instPointer, const char *name, int64 *value) {
		return ((BMessage *)instPointer)->FindInt64(name, value);
	}

	status_t be_BMessage_FindInt64_2(be_BMessage *instPointer, const char *name, int32 index, int64 *value) {
		return ((BMessage *)instPointer)->FindInt64(name, index, value);
	}

	status_t be_BMessage_FindUInt64_1(be_BMessage *instPointer, const char *name, uint64 *value) {
		return ((BMessage *)instPointer)->FindUInt64(name, value);
	}

	status_t be_BMessage_FindUInt64_2(be_BMessage *instPointer, const char *name, int32 index, uint64 *value) {
		return ((BMessage *)instPointer)->FindUInt64(name, index, value);
	}

	status_t be_BMessage_FindBool_1(be_BMessage *instPointer, const char *name, bool *value) {
		return ((BMessage *)instPointer)->FindBool(name, value);
	}

	status_t be_BMessage_FindBool_2(be_BMessage *instPointer, const char *name, int32 index, bool *value) {
		return ((BMessage *)instPointer)->FindBool(name, index, value);
	}

	status_t be_BMessage_FindFloat_1(be_BMessage *instPointer, const char *name, float *value) {
		return ((BMessage *)instPointer)->FindFloat(name, value);
	}

	status_t be_BMessage_FindFloat_2(be_BMessage *instPointer, const char *name, int32 index, float *value) {
		return ((BMessage *)instPointer)->FindFloat(name, index, value);
	}

	status_t be_BMessage_FindDouble_1(be_BMessage *instPointer, const char *name, double *value) {
		return ((BMessage *)instPointer)->FindDouble(name, value);
	}

	status_t be_BMessage_FindDouble_2(be_BMessage *instPointer, const char *name, int32 index, double *value) {
		return ((BMessage *)instPointer)->FindDouble(name, index, value);
	}

	status_t be_BMessage_FindPointer_1(be_BMessage *instPointer, const char *name, void **pointer) {
		return ((BMessage *)instPointer)->FindPointer(name, pointer);
	}

	status_t be_BMessage_FindPointer_2(be_BMessage *instPointer, const char *name, int32 index,  void **pointer) {
		return ((BMessage *)instPointer)->FindPointer(name, index, pointer);
	}

	status_t be_BMessage_FindMessenger_1(be_BMessage *instPointer, const char *name, be_BMessenger *messenger) {
		return ((BMessage *)instPointer)->FindMessenger(name, (BMessenger *)messenger);
	}

	status_t be_BMessage_FindMessenger_2(be_BMessage *instPointer, const char *name, int32 index, be_BMessenger *messenger) {
		return ((BMessage *)instPointer)->FindMessenger(name, index, (BMessenger *)messenger);
	}

	status_t be_BMessage_FindRef_1(be_BMessage *instPointer, const char *name, entry_ref *ref) {
		return ((BMessage *)instPointer)->FindRef(name, ref);
	}

	status_t be_BMessage_FindRef_2(be_BMessage *instPointer, const char *name, int32 index, entry_ref *ref) {
		return ((BMessage *)instPointer)->FindRef(name, index, ref);
	}

	status_t be_BMessage_FindMessage_1(be_BMessage *instPointer, const char *name, be_BMessage *message) {
		return ((BMessage *)instPointer)->FindMessage(name, (BMessage *)message);
	}

	status_t be_BMessage_FindMessage_2(be_BMessage *instPointer, const char *name, int32 index, be_BMessage *message) {
		return ((BMessage *)instPointer)->FindMessage(name, index, (BMessage *)message);
	}

	status_t be_BMessage_FindFlat_1(be_BMessage *instPointer, const char *name, be_BFlattenable *object) {
		return ((BMessage *)instPointer)->FindFlat(name, (BFlattenable *)object);
	}

	status_t be_BMessage_FindFlat_2(be_BMessage *instPointer, const char *name, int32 index, be_BFlattenable *object) {
		return ((BMessage *)instPointer)->FindFlat(name, index, (BFlattenable *)object);
	}

	status_t be_BMessage_FindData_1(be_BMessage *instPointer, const char *name, type_code type,
							const void **data, ssize_t *numBytes) {
		return ((BMessage *)instPointer)->FindData(name, type, data, numBytes);
	}

	status_t be_BMessage_FindData_2(be_BMessage *instPointer, const char *name, type_code type, int32 index,
							const void **data, ssize_t *numBytes) {
		return ((BMessage *)instPointer)->FindData(name, type, index, data, numBytes);
	}


		// Replacing data
	status_t be_BMessage_ReplaceRect_1(be_BMessage *instPointer, const char *name, be_BRect *aRect) {
		return ((BMessage *)instPointer)->ReplaceRect(name, *(BRect *)aRect);
	}

	status_t be_BMessage_ReplaceRect_2(be_BMessage *instPointer, const char *name, int32 index, be_BRect *aRect) {
		return ((BMessage *)instPointer)->ReplaceRect(name, index, *(BRect *)aRect);
	}

	status_t be_BMessage_ReplacePoint_1(be_BMessage *instPointer, const char *name, be_BPoint *aPoint) {
		return ((BMessage *)instPointer)->ReplacePoint(name, *(BPoint *)aPoint);
	}

	status_t be_BMessage_ReplacePoint_2(be_BMessage *instPointer, const char *name, int32 index, be_BPoint *aPoint) {
		return ((BMessage *)instPointer)->ReplacePoint(name, index, *(BPoint *)aPoint);
	}

	status_t be_BMessage_ReplaceString_1(be_BMessage *instPointer, const char *name, const char *aString) {
		return ((BMessage *)instPointer)->ReplaceString(name, aString);
	}

	status_t be_BMessage_ReplaceString_2(be_BMessage *instPointer, const char *name, int32 index, const char *aString) {
		return ((BMessage *)instPointer)->ReplaceString(name, index, aString);
	}

	status_t be_BMessage_ReplaceString_3(be_BMessage *instPointer, const char *name, const be_BString *aString) {
		return ((BMessage *)instPointer)->ReplaceString(name, *(BString *)aString);
	}

	status_t be_BMessage_ReplaceString_4(be_BMessage *instPointer, const char *name, int32 index, const be_BString *aString) {
		return ((BMessage *)instPointer)->ReplaceString(name, index, *(BString *)aString);
	}

	status_t be_BMessage_ReplaceInt8_1(be_BMessage *instPointer, const char *name, int8 value) {
		return ((BMessage *)instPointer)->ReplaceInt8(name, value);
	}

	status_t be_BMessage_ReplaceInt8_2(be_BMessage *instPointer, const char *name, int32 index, int8 value) {
		return ((BMessage *)instPointer)->ReplaceInt8(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt8_1(be_BMessage *instPointer, const char *name, uint8 value) {
		return ((BMessage *)instPointer)->ReplaceUInt8(name, value);
	}

	status_t be_BMessage_ReplaceUInt8_2(be_BMessage *instPointer, const char *name, int32 index, uint8 value) {
		return ((BMessage *)instPointer)->ReplaceUInt8(name, index, value);
	}

	status_t be_BMessage_ReplaceInt16_1(be_BMessage *instPointer, const char *name, int16 value) {
		return ((BMessage *)instPointer)->ReplaceInt16(name, value);
	}

	status_t be_BMessage_ReplaceInt16_2(be_BMessage *instPointer, const char *name, int32 index, int16 value) {
		return ((BMessage *)instPointer)->ReplaceInt16(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt16_1(be_BMessage *instPointer, const char *name, uint16 value) {
		return ((BMessage *)instPointer)->ReplaceUInt16(name, value);
	}

	status_t be_BMessage_ReplaceUInt16_2(be_BMessage *instPointer, const char *name, int32 index, uint16 value) {
		return ((BMessage *)instPointer)->ReplaceUInt16(name, index, value);
	}

	status_t be_BMessage_ReplaceInt32_1(be_BMessage *instPointer, const char *name, int32 value) {
		return ((BMessage *)instPointer)->ReplaceInt32(name, value);
	}

	status_t be_BMessage_ReplaceInt32_2(be_BMessage *instPointer, const char *name, int32 index, int32 value) {
		return ((BMessage *)instPointer)->ReplaceInt32(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt32_1(be_BMessage *instPointer, const char *name, uint32 value) {
		return ((BMessage *)instPointer)->ReplaceUInt32(name, value);
	}

	status_t be_BMessage_ReplaceUInt32_2(be_BMessage *instPointer, const char *name, int32 index, uint32 value) {
		return ((BMessage *)instPointer)->ReplaceUInt32(name, index, value);
	}

	status_t be_BMessage_ReplaceInt64_1(be_BMessage *instPointer, const char *name, int64 value) {
		return ((BMessage *)instPointer)->ReplaceInt64(name, value);
	}

	status_t be_BMessage_ReplaceInt64_2(be_BMessage *instPointer, const char *name, int32 index, int64 value) {
		return ((BMessage *)instPointer)->ReplaceInt64(name, index, value);
	}

	status_t be_BMessage_ReplaceUInt64_1(be_BMessage *instPointer, const char *name, uint64 value) {
		return ((BMessage *)instPointer)->ReplaceUInt64(name, value);
	}

	status_t be_BMessage_ReplaceUInt64_2(be_BMessage *instPointer, const char *name, int32 index, uint64 value) {
		return ((BMessage *)instPointer)->ReplaceUInt64(name, index, value);
	}

	status_t be_BMessage_ReplaceBool_1(be_BMessage *instPointer, const char *name, bool aBoolean) {
		return ((BMessage *)instPointer)->ReplaceBool(name, aBoolean);
	}

	status_t be_BMessage_ReplaceBool_2(be_BMessage *instPointer, const char *name, int32 index, bool aBoolean) {
		return ((BMessage *)instPointer)->ReplaceBool(name, index, aBoolean);
	}

	status_t be_BMessage_ReplaceFloat_1(be_BMessage *instPointer, const char *name, float aFloat) {
		return ((BMessage *)instPointer)->ReplaceFloat(name, aFloat);
	}

	status_t be_BMessage_ReplaceFloat_2(be_BMessage *instPointer, const char *name, int32 index, float aFloat) {
		return ((BMessage *)instPointer)->ReplaceFloat(name, index, aFloat);
	}

	status_t be_BMessage_ReplaceDouble_1(be_BMessage *instPointer, const char *name, double aDouble) {
		return ((BMessage *)instPointer)->ReplaceDouble(name, aDouble);
	}

	status_t be_BMessage_ReplaceDouble_2(be_BMessage *instPointer, const char *name, int32 index, double aDouble) {
		return ((BMessage *)instPointer)->ReplaceDouble(name, index, aDouble);
	}

	status_t be_BMessage_ReplacePointer_1(be_BMessage *instPointer, const char *name, const void *pointer) {
		return ((BMessage *)instPointer)->ReplacePointer(name, pointer);
	}

	status_t be_BMessage_ReplacePointer_2(be_BMessage *instPointer, const char *name, int32 index, const void *pointer) {
		return ((BMessage *)instPointer)->ReplacePointer(name, index, pointer);
	}

	status_t be_BMessage_ReplaceMessenger_1(be_BMessage *instPointer, const char *name, be_BMessenger *messenger) {
		return ((BMessage *)instPointer)->ReplaceMessenger(name, *(BMessenger *)messenger);
	}

	status_t be_BMessage_ReplaceMessenger_2(be_BMessage *instPointer, const char *name, int32 index, be_BMessenger *messenger) {
		return ((BMessage *)instPointer)->ReplaceMessenger(name, index, *(BMessenger *)messenger);
	}

	status_t be_BMessage_ReplaceRef_1(be_BMessage *instPointer, const char *name,const entry_ref *ref) {
		return ((BMessage *)instPointer)->ReplaceRef(name, ref);
	}

	status_t be_BMessage_ReplaceRef_2(be_BMessage *instPointer, const char *name, int32 index, const entry_ref *ref) {
		return ((BMessage *)instPointer)->ReplaceRef(name, index, ref);
	}

	status_t be_BMessage_ReplaceMessage_1(be_BMessage *instPointer, const char *name, const be_BMessage *message) {
		return ((BMessage *)instPointer)->ReplaceMessage(name, (BMessage *)message);
	}

	status_t be_BMessage_ReplaceMessage_2(be_BMessage *instPointer, const char *name, int32 index, const be_BMessage *message) {
		return ((BMessage *)instPointer)->ReplaceMessage(name, index, (BMessage *)message);
	}

	status_t be_BMessage_ReplaceFlat_1(be_BMessage *instPointer, const char *name, be_BFlattenable *object) {
		return ((BMessage *)instPointer)->ReplaceFlat(name, (BFlattenable *)object);
	}

	status_t be_BMessage_ReplaceFlat_2(be_BMessage *instPointer, const char *name, int32 index, be_BFlattenable *object) {
		return ((BMessage *)instPointer)->ReplaceFlat(name, index, (BFlattenable *)object);
	}

	status_t be_BMessage_ReplaceData_1(be_BMessage *instPointer, const char *name, type_code type,
							const void *data, ssize_t numBytes) {
		return ((BMessage *)instPointer)->ReplaceData(name, type, data, numBytes);
	}

	status_t be_BMessage_ReplaceData_2(be_BMessage *instPointer, const char *name, type_code type, int32 index,
							const void *data, ssize_t numBytes) {
		return ((BMessage *)instPointer)->ReplaceData(name, type, index, data, numBytes);
	}

/*
		// Comparing data - Haiku experimental API
		bool			HasSameData(const BMessage &other,
							bool ignoreFieldOrder = true, bool deep = false) const;

		void			*operator new(size_t size);
		void			*operator new(size_t, void *pointer);
		void			operator delete(void *pointer, size_t size);
*/

		// Private, reserved, or obsolete
	bool be_BMessage_HasRect(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasRect(name, n);
	}

	bool be_BMessage_HasPoint(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasPoint(name, n);
	}

	bool be_BMessage_HasString(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasString(name, n);
	}

	bool be_BMessage_HasInt8(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasInt8(name, n);
	}

	bool be_BMessage_HasUInt8(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasUInt8(name, n);
	}

	bool be_BMessage_HasInt16(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasInt16(name, n);
	}

	bool be_BMessage_HasUInt16(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasUInt16(name, n);
	}

	bool be_BMessage_HasInt32(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasInt32(name, n);
	}

	bool be_BMessage_HasUInt32(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasUInt32(name, n);
	}

	bool be_BMessage_HasInt64(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasInt64(name, n);
	}

	bool be_BMessage_HasUInt64(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasUInt64(name, n);
	}

	bool be_BMessage_HasBool(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasBool(name, n);
	}

	bool be_BMessage_HasFloat(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasFloat(name, n);
	}

	bool be_BMessage_HasDouble(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasDouble(name, n);
	}

	bool be_BMessage_HasPointer(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasPointer(name, n);
	}

	bool be_BMessage_HasMessenger(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasMessenger(name, n);
	}

	bool be_BMessage_HasRef(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasRef(name, n);
	}

	bool be_BMessage_HasMessage(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->HasMessage(name, n);
	}

	bool be_BMessage_HasFlat_1(be_BMessage *instPointer, const char *name, const be_BFlattenable *flat) {
		return ((BMessage *)instPointer)->HasFlat(name, (BFlattenable *)flat);
	}

	bool be_BMessage_HasFlat_2(be_BMessage *instPointer, const char *name, int32 n, const be_BFlattenable *flat) {
		return ((BMessage *)instPointer)->HasFlat(name, n, (BFlattenable *)flat);
	}

	bool be_BMessage_HasData(be_BMessage *instPointer, const char *name, type_code type, int32 n) {
		return ((BMessage *)instPointer)->HasData(name, type, n);
	}

	be_BRect *be_BMessage_FindRect(be_BMessage *instPointer, const char *name, int32 n) {
		return (be_BRect *)&((BMessage *)instPointer)->FindRect(name, n);
	}

	be_BPoint *be_BMessage_FindPoint(be_BMessage *instPointer, const char *name, int32 n) {
		return (be_BPoint *)&((BMessage *)instPointer)->FindPoint(name, n);
	}

	const char *be_BMessage_FindString(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindString(name, n);
	}

	int8 be_BMessage_FindInt8(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindInt8(name, n);
	}

	int16 be_BMessage_FindInt16(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindInt16(name, n);
	}

	int32 be_BMessage_FindInt32(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindInt32(name, n);
	}

	int64 be_BMessage_FindInt64(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindInt64(name, n);
	}

	bool be_BMessage_FindBool(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindBool(name, n);
	}

	float be_BMessage_FindFloat(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindFloat(name, n);
	}

	double be_BMessage_FindDouble(be_BMessage *instPointer, const char *name, int32 n) {
		return ((BMessage *)instPointer)->FindDouble(name, n);
	}
}

/* end export functions */

