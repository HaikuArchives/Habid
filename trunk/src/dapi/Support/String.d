/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import tango.stdc.stringz;
import tango.stdc.posix.stdlib;

extern (C) extern {
	// BString* be_BString_ctor(void *bindInstPtr);
	void * be_BString_ctor(void *bindInstPtr);

	// BString* be_BString_ctor_1(void *bindInstPtr, const char * string);
	void * be_BString_ctor_1(void *bindInstPtr, char * string);

	// BString* be_BString_ctor_2(void *bindInstPtr, const BString * string);
	void * be_BString_ctor_2(void *bindInstPtr, void * string);

	// BString* be_BString_ctor_3(void *bindInstPtr, const char * string, int32 maxLength);
	void * be_BString_ctor_3(void *bindInstPtr, char * string, int32 maxLength);

	// void be_BString_dtor(BString* self);
	void be_BString_dtor(void* self);

	// const char* be_BString_String(BString *self);
	char* be_BString_String(void *self);

	// int32 be_BString_Length(BString *self);
	int32 be_BString_Length(void *self);

	// int32 be_BString_CountChars(BString *self);
	int32 be_BString_CountChars(void *self);

	// int32 be_BString_CountBytes(BString *self, int32 fromCharOffset, int32 charCount);
	int32 be_BString_CountBytes(void *self, int32 fromCharOffset, int32 charCount);

	// BString * be_BString_opAssign(BString *self, const BString * string);
	void * be_BString_opAssign(void *self, void * string);

	// BString * be_BString_opAssign_1(BString *self, const char * string);
	void * be_BString_opAssign_1(void *self, char * string);

	// BString * be_BString_opAssign_2(BString *self, char c);
	void * be_BString_opAssign_2(void *self, char c);

	// BString * be_BString_SetTo(BString *self, const char * string);
	void * be_BString_SetTo(void *self, char * string);

	// BString * be_BString_SetTo_1(BString *self, const char * string, int32 maxLength);
	void * be_BString_SetTo_1(void *self, char * string, int32 maxLength);

	// BString * be_BString_SetTo_2(BString *self, const BString * string);
	void * be_BString_SetTo_2(void *self, void * string);

	// BString * be_BString_Adopt(BString *self, BString * from);
	void * be_BString_Adopt(void *self, void * from);

	// BString * be_BString_SetTo_3(BString *self, const BString * string, int32 maxLength);
	void * be_BString_SetTo_3(void *self, void * string, int32 maxLength);

	// BString * be_BString_Adopt_1(BString *self, BString * from, int32 maxLength);
	void * be_BString_Adopt_1(void *self, void * from, int32 maxLength);

	// BString * be_BString_SetTo_4(BString *self, char c, int32 count);
	void * be_BString_SetTo_4(void *self, char c, int32 count);

	// BString * be_BString_SetToChars(BString *self, const char * string, int32 charCount);
	void * be_BString_SetToChars(void *self, char * string, int32 charCount);

	// BString * be_BString_SetToChars_1(BString *self, const BString * string, int32 charCount);
	void * be_BString_SetToChars_1(void *self, void * string, int32 charCount);

	// BString * be_BString_AdoptChars(BString *self, BString * from, int32 charCount);
	void * be_BString_AdoptChars(void *self, void * from, int32 charCount);

	// BString * be_BString_CopyInto(BString *self, BString* into, int32 fromOffset, int32 length);
	void * be_BString_CopyInto(void *self, void* into, int32 fromOffset, int32 length);

	// void be_BString_CopyInto_1(BString *self, char* into, int32 fromOffset, int32 length);
	void be_BString_CopyInto_1(void *self, char* into, int32 fromOffset, int32 length);

	// BString * be_BString_CopyCharsInto(BString *self, BString* into, int32 fromCharOffset, int32 charCount);
	void * be_BString_CopyCharsInto(void *self, void* into, int32 fromCharOffset, int32 charCount);

	// void be_BString_CopyCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void be_BString_CopyCharsInto_1(void *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);

	// BString * be_BString_opAddAssign(BString *self, const BString* string);
	void * be_BString_opAddAssign(void *self, void* string);

	// BString * be_BString_opAddAssign_1(BString *self, const char* string);
	void * be_BString_opAddAssign_1(void *self, char* string);

	// BString * be_BString_opAddAssign_2(BString *self, char c);
	void * be_BString_opAddAssign_2(void *self, char c);

	// BString * be_BString_Append(BString *self, const BString* string);
	void * be_BString_Append(void *self, void* string);

	// BString * be_BString_Append_1(BString *self, const char* string);
	void * be_BString_Append_1(void *self, char* string);

	// BString * be_BString_Append_2(BString *self, const BString* string, int32 length);
	void * be_BString_Append_2(void *self, void* string, int32 length);

	// BString * be_BString_Append_3(BString *self, const char* string, int32 length);
	void * be_BString_Append_3(void *self, char* string, int32 length);

	// BString * be_BString_Append_4(BString *self, char c, int32 count);
	void * be_BString_Append_4(void *self, char c, int32 count);

	// BString * be_BString_AppendChars(BString *self, const BString* string, int32 charCount);
	void * be_BString_AppendChars(void *self, void* string, int32 charCount);

	// BString * be_BString_AppendChars_1(BString *self, const char* string, int32 charCount);
	void * be_BString_AppendChars_1(void *self, char* string, int32 charCount);

	// BString * be_BString_Prepend(BString *self, const char* string);
	void * be_BString_Prepend(void *self, char* string);

	// BString * be_BString_Prepend_1(BString *self, const BString* string);
	void * be_BString_Prepend_1(void *self, void* string);

	// BString * be_BString_Prepend_2(BString *self, const char* string, int32 length);
	void * be_BString_Prepend_2(void *self, char* string, int32 length);

	// BString * be_BString_Prepend_3(BString *self, const BString* string, int32 length);
	void * be_BString_Prepend_3(void *self, void* string, int32 length);

	// BString * be_BString_Prepend_4(BString *self, char c, int32 count);
	void * be_BString_Prepend_4(void *self, char c, int32 count);

	// BString * be_BString_PrependChars(BString *self, const char* string, int32 charCount);
	void * be_BString_PrependChars(void *self, char* string, int32 charCount);

	// BString * be_BString_PrependChars_1(BString *self, const BString* string, int32 charCount);
	void * be_BString_PrependChars_1(void *self, void* string, int32 charCount);

	// BString * be_BString_Insert(BString *self, const char* string, int32 position);
	void * be_BString_Insert(void *self, char* string, int32 position);

	// BString * be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position);
	void * be_BString_Insert_1(void *self, char* string, int32 length, int32 position);

	// BString * be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position);
	void * be_BString_Insert_2(void *self, char* string, int32 fromOffset, int32 length, int32 position);

	// BString * be_BString_Insert_3(BString *self, const BString* string, int32 position);
	void * be_BString_Insert_3(void *self, void* string, int32 position);

	// BString * be_BString_Insert_4(BString *self, const BString* string, int32 length, int32 position);
	void * be_BString_Insert_4(void *self, void* string, int32 length, int32 position);

	// BString * be_BString_Insert_5(BString *self, const BString* string, int32 fromOffset, int32 length, int32 position);
	void * be_BString_Insert_5(void *self, void* string, int32 fromOffset, int32 length, int32 position);

	// BString * be_BString_Insert_6(BString *self, char c, int32 count, int32 position);
	void * be_BString_Insert_6(void *self, char c, int32 count, int32 position);

	// BString * be_BString_InsertChars(BString *self, const char* string, int32 charPosition);
	void * be_BString_InsertChars(void *self, char* string, int32 charPosition);

	// BString * be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_1(void *self, char* string, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_2(void *self, char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_3(BString *self, const BString* string, int32 charPosition);
	void * be_BString_InsertChars_3(void *self, void* string, int32 charPosition);

	// BString * be_BString_InsertChars_4(BString *self, const BString* string, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_4(void *self, void* string, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_5(BString *self, const BString* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_5(void *self, void* string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString * be_BString_Truncate(BString *self, int32 newLength, bool _lazy);
	void * be_BString_Truncate(void *self, int32 newLength, bool _lazy);

	// BString * be_BString_TruncateChars(BString *self, int32 newCharCount, bool _lazy);
	void * be_BString_TruncateChars(void *self, int32 newCharCount, bool _lazy);

	// BString * be_BString_Remove(BString *self, int32 from, int32 length);
	void * be_BString_Remove(void *self, int32 from, int32 length);

	// BString * be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount);
	void * be_BString_RemoveChars(void *self, int32 fromCharOffset, int32 charCount);

	// BString * be_BString_RemoveFirst(BString *self, const BString* string);
	void * be_BString_RemoveFirst(void *self, void* string);

	// BString * be_BString_RemoveLast(BString *self, const BString* string);
	void * be_BString_RemoveLast(void *self, void* string);

	// BString * be_BString_RemoveAll(BString *self, const BString* string);
	void * be_BString_RemoveAll(void *self, void* string);

	// BString * be_BString_RemoveFirst_1(BString *self, const char* string);
	void * be_BString_RemoveFirst_1(void *self, char* string);

	// BString * be_BString_RemoveLast_1(BString *self, const char* string);
	void * be_BString_RemoveLast_1(void *self, char* string);

	// BString * be_BString_RemoveAll_1(BString *self, const char* string);
	void * be_BString_RemoveAll_1(void *self, char* string);

	// BString * be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove);
	void * be_BString_RemoveSet(void *self, char* setOfBytesToRemove);

	// BString * be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove);
	void * be_BString_RemoveCharsSet(void *self, char* setOfCharsToRemove);

	// BString * be_BString_MoveInto(BString *self, BString* into, int32 from, int32 length);
	void * be_BString_MoveInto(void *self, void* into, int32 from, int32 length);

	// void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length);
	void be_BString_MoveInto_1(void *self, char* into, int32 from, int32 length);

	// BString * be_BString_MoveCharsInto(BString *self, BString* into, int32 fromCharOffset, int32 charCount);
	void * be_BString_MoveCharsInto(void *self, void* into, int32 fromCharOffset, int32 charCount);

	// void be_BString_MoveCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void be_BString_MoveCharsInto_1(void *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);

	// bool be_BString_opCmpLess(BString *self, const BString* string);
	bool be_BString_opCmpLess(void *self, void* string);

	// bool be_BString_opCmpLessEqual(BString *self, const BString* string);
	bool be_BString_opCmpLessEqual(void *self, void* string);

	// bool be_BString_opEquals(BString *self, const BString* string);
	bool be_BString_opEquals(void *self, void* string);

	// bool be_BString_opCmpGreaterEqual(BString *self, const BString* string);
	bool be_BString_opCmpGreaterEqual(void *self, void* string);

	// bool be_BString_opCmpGreater(BString *self, const BString* string);
	bool be_BString_opCmpGreater(void *self, void* string);

	// bool be_BString_opNotEquals(BString *self, const BString* string);
	bool be_BString_opNotEquals(void *self, void* string);

	// bool be_BString_opCmpLess_1(BString *self, const char* string);
	bool be_BString_opCmpLess_1(void *self, char* string);

	// bool be_BString_opCmpLessEqual_1(BString *self, const char* string);
	bool be_BString_opCmpLessEqual_1(void *self, char* string);

	// bool be_BString_opEquals_1(BString *self, const char* string);
	bool be_BString_opEquals_1(void *self, char* string);

	// bool be_BString_opCmpGreaterEqual_1(BString *self, const char* string);
	bool be_BString_opCmpGreaterEqual_1(void *self, char* string);

	// bool be_BString_opCmpGreater_1(BString *self, const char* string);
	bool be_BString_opCmpGreater_1(void *self, char* string);

	// bool be_BString_opNotEquals_1(BString *self, const char* string);
	bool be_BString_opNotEquals_1(void *self, char* string);

	// int be_BString_Compare(BString *self, const BString* string);
	int be_BString_Compare(void *self, void* string);

	// int be_BString_Compare_1(BString *self, const char* string);
	int be_BString_Compare_1(void *self, char* string);

	// int be_BString_Compare_2(BString *self, const BString* string, int32 length);
	int be_BString_Compare_2(void *self, void* string, int32 length);

	// int be_BString_Compare_3(BString *self, const char* string, int32 length);
	int be_BString_Compare_3(void *self, char* string, int32 length);

	// int be_BString_CompareChars(BString *self, const BString* string, int32 charCount);
	int be_BString_CompareChars(void *self, void* string, int32 charCount);

	// int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount);
	int be_BString_CompareChars_1(void *self, char* string, int32 charCount);

	// int be_BString_ICompare(BString *self, const BString* string);
	int be_BString_ICompare(void *self, void* string);

	// int be_BString_ICompare_1(BString *self, const char* string);
	int be_BString_ICompare_1(void *self, char* string);

	// int be_BString_ICompare_2(BString *self, const BString* string, int32 length);
	int be_BString_ICompare_2(void *self, void* string, int32 length);

	// int be_BString_ICompare_3(BString *self, const char* string, int32 length);
	int be_BString_ICompare_3(void *self, char* string, int32 length);

	// int32 be_BString_FindFirst(BString *self, const BString* string);
	int32 be_BString_FindFirst(void *self, void* string);

	// int32 be_BString_FindFirst_1(BString *self, const char* string);
	int32 be_BString_FindFirst_1(void *self, char* string);

	// int32 be_BString_FindFirst_2(BString *self, const BString* string, int32 fromOffset);
	int32 be_BString_FindFirst_2(void *self, void* string, int32 fromOffset);

	// int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 be_BString_FindFirst_3(void *self, char* string, int32 fromOffset);

	// int32 be_BString_FindFirst_4(BString *self, char c);
	int32 be_BString_FindFirst_4(void *self, char c);

	// int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset);
	int32 be_BString_FindFirst_5(void *self, char c, int32 fromOffset);

	// int32 be_BString_FindFirstChars(BString *self, const BString* string, int32 fromCharOffset);
	int32 be_BString_FindFirstChars(void *self, void* string, int32 fromCharOffset);

	// int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset);
	int32 be_BString_FindFirstChars_1(void *self, char* string, int32 fromCharOffset);

	// int32 be_BString_FindLast(BString *self, const BString* string);
	int32 be_BString_FindLast(void *self, void* string);

	// int32 be_BString_FindLast_1(BString *self, const char* string);
	int32 be_BString_FindLast_1(void *self, char* string);

	// int32 be_BString_FindLast_2(BString *self, const BString* string, int32 beforeOffset);
	int32 be_BString_FindLast_2(void *self, void* string, int32 beforeOffset);

	// int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 be_BString_FindLast_3(void *self, char* string, int32 beforeOffset);

	// int32 be_BString_FindLast_4(BString *self, char c);
	int32 be_BString_FindLast_4(void *self, char c);

	// int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset);
	int32 be_BString_FindLast_5(void *self, char c, int32 beforeOffset);

	// int32 be_BString_FindLastChars(BString *self, const BString* string, int32 beforeCharOffset);
	int32 be_BString_FindLastChars(void *self, void* string, int32 beforeCharOffset);

	// int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset);
	int32 be_BString_FindLastChars_1(void *self, char* string, int32 beforeCharOffset);

	// int32 be_BString_IFindFirst(BString *self, const BString* string);
	int32 be_BString_IFindFirst(void *self, void* string);

	// int32 be_BString_IFindFirst_1(BString *self, const char* string);
	int32 be_BString_IFindFirst_1(void *self, char* string);

	// int32 be_BString_IFindFirst_2(BString *self, const BString* string, int32 fromOffset);
	int32 be_BString_IFindFirst_2(void *self, void* string, int32 fromOffset);

	// int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 be_BString_IFindFirst_3(void *self, char* string, int32 fromOffset);

	// int32 be_BString_IFindLast(BString *self, const BString* string);
	int32 be_BString_IFindLast(void *self, void* string);

	// int32 be_BString_IFindLast_1(BString *self, const char* string);
	int32 be_BString_IFindLast_1(void *self, char* string);

	// int32 be_BString_IFindLast_2(BString *self, const BString* string, int32 beforeOffset);
	int32 be_BString_IFindLast_2(void *self, void* string, int32 beforeOffset);

	// int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 be_BString_IFindLast_3(void *self, char* string, int32 beforeOffset);

	// BString * be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis);
	void * be_BString_ReplaceFirst(void *self, char replaceThis, char withThis);

	// BString * be_BString_ReplaceLast(BString *self, char replaceThis, char withThis);
	void * be_BString_ReplaceLast(void *self, char replaceThis, char withThis);

	// BString * be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	void * be_BString_ReplaceAll(void *self, char replaceThis, char withThis, int32 fromOffset);

	// BString * be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_Replace(void *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_ReplaceFirst_1(void *self, char* replaceThis,  char* withThis);

	// BString * be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_ReplaceLast_1(void *self, char* replaceThis,  char* withThis);

	// BString * be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	void * be_BString_ReplaceAll_1(void *self, char* replaceThis,  char* withThis, int32 fromOffset);

	// BString * be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_Replace_1(void *self, char* replaceThis,  char* withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset);
	void * be_BString_ReplaceAllChars(void *self, char* replaceThis,  char* withThis, int32 fromCharOffset);

	// BString * be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset);
	void * be_BString_ReplaceChars(void *self, char* replaceThis,  char* withThis, int32 maxReplaceCount, int32 fromCharOffset);

	// BString * be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis);
	void * be_BString_IReplaceFirst(void *self, char replaceThis, char withThis);

	// BString * be_BString_IReplaceLast(BString *self, char replaceThis, char withThis);
	void * be_BString_IReplaceLast(void *self, char replaceThis, char withThis);

	// BString * be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	void * be_BString_IReplaceAll(void *self, char replaceThis, char withThis, int32 fromOffset);

	// BString * be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_IReplace(void *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_IReplaceFirst_1(void *self, char* replaceThis,  char* withThis);

	// BString * be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_IReplaceLast_1(void *self, char* replaceThis,  char* withThis);

	// BString * be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	void * be_BString_IReplaceAll_1(void *self, char* replaceThis,  char* withThis, int32 fromOffset);

	// BString * be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_IReplace_1(void *self, char* replaceThis,  char* withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceSet(BString *self, const char* setOfBytes, char _with);
	void * be_BString_ReplaceSet(void *self, char* setOfBytes, char _with);

	// BString * be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* _with);
	void * be_BString_ReplaceSet_1(void *self, char* setOfBytes,  char* _with);

	// BString * be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* _with);
	void * be_BString_ReplaceCharsSet(void *self, char* setOfChars,  char* _with);

	// char be_BString_ByteAt(BString *self, int32 index);
	char be_BString_ByteAt(void *self, int32 index);

	// const char* be_BString_CharAt(BString *self, int32 charIndex, int32* bytes);
	char* be_BString_CharAt(void *self, int32 charIndex, int32* bytes);

	// bool be_BString_CharAt_1(BString *self, int32 charIndex, char* buffer, int32* bytes);
	bool be_BString_CharAt_1(void *self, int32 charIndex, char* buffer, int32* bytes);

	// char* be_BString_LockBuffer(BString *self, int32 maxLength);
	char* be_BString_LockBuffer(void *self, int32 maxLength);

	// BString * be_BString_UnlockBuffer(BString *self, int32 length);
	void * be_BString_UnlockBuffer(void *self, int32 length);

	// BString * be_BString_ToLower(BString *self);
	void * be_BString_ToLower(void *self);

	// BString * be_BString_ToUpper(BString *self);
	void * be_BString_ToUpper(void *self);

	// BString * be_BString_Capitalize(BString *self);
	void * be_BString_Capitalize(void *self);

	// BString * be_BString_CapitalizeEachWord(BString *self);
	void * be_BString_CapitalizeEachWord(void *self);

	// BString * be_BString_CharacterEscape(BString *self, const char* original, const char* setOfCharsToEscape, char escapeWith);
	void * be_BString_CharacterEscape(void *self, char* original,  char* setOfCharsToEscape, char escapeWith);

	// BString * be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith);
	void * be_BString_CharacterEscape_1(void *self, char* setOfCharsToEscape, char escapeWith);

	// BString * be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar);
	void * be_BString_CharacterDeescape(void *self, char* original, char escapeChar);

	// BString * be_BString_CharacterDeescape_1(BString *self, char escapeChar);
	void * be_BString_CharacterDeescape_1(void *self, char escapeChar);

	// BString * be_BString_Trim(BString *self);
	void * be_BString_Trim(void *self);

	// BString * be_BString_opShl(BString *self, const char* string);
	void * be_BString_opShl(void *self, char* string);

	// BString * be_BString_opShl_1(BString *self, const BString* string);
	void * be_BString_opShl_1(void *self, void* string);

	// BString * be_BString_opShl_2(BString *self, char c);
	void * be_BString_opShl_2(void *self, char c);

	// BString * be_BString_opShl_3(BString *self, int value);
	void * be_BString_opShl_3(void *self, int value);

	// BString * be_BString_opShl_4(BString *self, unsigned int value);
	void * be_BString_opShl_4(void *self, int value);

	// BString * be_BString_opShl_5(BString *self, uint32 value);
	void * be_BString_opShl_5(void *self, uint32 value);

	// BString * be_BString_opShl_6(BString *self, int32 value);
	void * be_BString_opShl_6(void *self, int32 value);

	// BString * be_BString_opShl_7(BString *self, uint64 value);
	void * be_BString_opShl_7(void *self, uint64 value);

	// BString * be_BString_opShl_8(BString *self, int64 value);
	void * be_BString_opShl_8(void *self, int64 value);

	// BString * be_BString_opShl_9(BString *self, float value);
	void * be_BString_opShl_9(void *self, float value);

}


extern (C) {
}

interface IBString
{
	// const char* be_BString_String(BString *self);
	char [] String();

	// int32 be_BString_Length(BString *self);
	int32 Length();

	// int32 be_BString_CountChars(BString *self);
	int32 CountChars();

	// int32 be_BString_CountBytes(BString *self, int32 fromCharOffset, int32 charCount);
	int32 CountBytes(int32 fromCharOffset, int32 charCount);

	// BString & be_BString_opAssign(BString *self, const BString & string);
	//BString & opAssign();

	// BString & be_BString_opAssign_1(BString *self, const char * string);
	//BString & opAssign();

	// BString & be_BString_opAssign_2(BString *self, char c);
	//BString & opAssign();

	// BString & be_BString_SetTo(BString *self, const char * string);
	IBString SetTo(char [] string);

	// BString & be_BString_SetTo_1(BString *self, const char * string, int32 maxLength);
	IBString SetTo(char [] string, int32 maxLength);

	// BString & be_BString_SetTo_2(BString *self, const BString & string);
	IBString SetTo(IBString string);

	// BString & be_BString_Adopt(BString *self, BString & from);
	IBString Adopt(IBString from);

	// BString & be_BString_SetTo_3(BString *self, const BString & string, int32 maxLength);
	IBString SetTo(IBString string, int32 maxLength);

	// BString & be_BString_Adopt_1(BString *self, BString & from, int32 maxLength);
	IBString Adopt(IBString from, int32 maxLength);

	// BString & be_BString_SetTo_4(BString *self, char c, int32 count);
	IBString SetTo(IBString from, int32 maxLength);

	// BString & be_BString_SetToChars(BString *self, const char * string, int32 charCount);
	IBString SetToChars(char [] string, int32 charCount);

	// BString & be_BString_SetToChars_1(BString *self, const BString & string, int32 charCount);
	IBString SetToChars(IBString string, int32 charCount);

	// BString & be_BString_AdoptChars(BString *self, BString & from, int32 charCount);
	IBString AdoptChars(IBString from, int32 charCount);

	// BString & be_BString_CopyInto(BString *self, BString& into, int32 fromOffset, int32 length);
	IBString CopyInto(IBString into, int32 fromOffset, int32 length);

	// void be_BString_CopyInto_1(BString *self, char* into, int32 fromOffset, int32 length);
	void CopyInto(inout char [] into, int32 fromOffset, int32 length);

	// BString & be_BString_CopyCharsInto(BString *self, BString& into, int32 fromCharOffset, int32 charCount);
	IBString CopyCharsInto(IBString into, int32 fromCharOffset, int32 charCount);

	// void be_BString_CopyCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void CopyCharsInto(char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount);

	// BString & be_BString_opAddAssign(BString *self, const BString& string);
	//BString & opAddAssign();

	// BString & be_BString_opAddAssign_1(BString *self, const char* string);
	//BString & opAddAssign();

	// BString & be_BString_opAddAssign_2(BString *self, char c);
	//BString & opAddAssign();

	// BString & be_BString_Append(BString *self, const BString& string);
	IBString Append(IBString string);

	// BString & be_BString_Append_1(BString *self, const char* string);
	IBString Append(char [] string);

	// BString & be_BString_Append_2(BString *self, const BString& string, int32 length);
	IBString Append(IBString string, int32 length);

	// BString & be_BString_Append_3(BString *self, const char* string, int32 length);
	IBString Append(char [] string, int32 length);

	// BString & be_BString_Append_4(BString *self, char c, int32 count);
	IBString Append(char c, int32 count);

	// BString & be_BString_AppendChars(BString *self, const BString& string, int32 charCount);
	IBString AppendChars(IBString string, int32 charCount);

	// BString & be_BString_AppendChars_1(BString *self, const char* string, int32 charCount);
	IBString AppendChars(char [] string, int32 charCount);

	// BString & be_BString_Prepend(BString *self, const char* string);
	IBString Prepend(char [] string);

	// BString & be_BString_Prepend_1(BString *self, const BString& string);
	IBString Prepend(IBString string);

	// BString & be_BString_Prepend_2(BString *self, const char* string, int32 length);
	IBString Prepend(char [] string, int32 length);

	// BString & be_BString_Prepend_3(BString *self, const BString& string, int32 length);
	IBString Prepend(IBString string, int32 length);

	// BString & be_BString_Prepend_4(BString *self, char c, int32 count);
	IBString Prepend(char c, int32 count);

	// BString & be_BString_PrependChars(BString *self, const char* string, int32 charCount);
	IBString PrependChars(char [] string, int32 charCount);

	// BString & be_BString_PrependChars_1(BString *self, const BString& string, int32 charCount);
	IBString PrependChars(IBString string, int32 charCount);

	// BString & be_BString_Insert(BString *self, const char* string, int32 position);
	IBString Insert(char [] string, int32 position);

	// BString & be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position);
	IBString Insert(char [] string, int32 length, int32 position);

	// BString & be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position);
	IBString Insert(char [] string, int32 fromOffset, int32 length, int32 position);

	// BString & be_BString_Insert_3(BString *self, const BString& string, int32 position);
	IBString Insert(IBString string, int32 position);

	// BString & be_BString_Insert_4(BString *self, const BString& string, int32 length, int32 position);
	IBString Insert(IBString string, int32 length, int32 position);

	// BString & be_BString_Insert_5(BString *self, const BString& string, int32 fromOffset, int32 length, int32 position);
	IBString Insert(IBString string, int32 fromOffset, int32 length, int32 position);

	// BString & be_BString_Insert_6(BString *self, char c, int32 count, int32 position);
	IBString Insert(char c, int32 count, int32 position);

	// BString & be_BString_InsertChars(BString *self, const char* string, int32 charPosition);
	IBString InsertChars(char [] string, int32 charPosition);

	// BString & be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition);
	IBString InsertChars(char [] string, int32 charCount, int32 charPosition);

	// BString & be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	IBString InsertChars(char [] string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString & be_BString_InsertChars_3(BString *self, const BString& string, int32 charPosition);
	IBString InsertChars(IBString string, int32 charPosition);

	// BString & be_BString_InsertChars_4(BString *self, const BString& string, int32 charCount, int32 charPosition);
	IBString InsertChars(IBString string, int32 charCount, int32 charPosition);

	// BString & be_BString_InsertChars_5(BString *self, const BString& string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	IBString InsertChars(IBString string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString & be_BString_Truncate(BString *self, int32 newLength, bool _lazy);
	IBString Truncate(int32 newLength, bool _lazy);

	// BString & be_BString_TruncateChars(BString *self, int32 newCharCount, bool _lazy);
	IBString TruncateChars(int32 newCharCount, bool _lazy);

	// BString & be_BString_Remove(BString *self, int32 from, int32 length);
	IBString Remove(int32 from, int32 length);

	// BString & be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount);
	IBString RemoveChars(int32 fromCharOffset, int32 charCount);

	// BString & be_BString_RemoveFirst(BString *self, const BString& string);
	IBString RemoveFirst(IBString string);

	// BString & be_BString_RemoveLast(BString *self, const BString& string);
	IBString RemoveLast(IBString string);

	// BString & be_BString_RemoveAll(BString *self, const BString& string);
	IBString RemoveAll(IBString string);

	// BString & be_BString_RemoveFirst_1(BString *self, const char* string);
	IBString RemoveFirst(char [] string);

	// BString & be_BString_RemoveLast_1(BString *self, const char* string);
	IBString RemoveLast(char [] string);

	// BString & be_BString_RemoveAll_1(BString *self, const char* string);
	IBString RemoveAll(char [] string);

	// BString & be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove);
	IBString RemoveSet(char [] setOfBytesToRemove);

	// BString & be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove);
	IBString RemoveCharsSet(char [] setOfCharsToRemove);

	// BString & be_BString_MoveInto(BString *self, BString& into, int32 from, int32 length);
	IBString MoveInto(IBString into, int32 from, int32 length);

	// void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length);
	void MoveInto(inout char [] into, int32 from, int32 length);

	// BString & be_BString_MoveCharsInto(BString *self, BString& into, int32 fromCharOffset, int32 charCount);
	IBString MoveCharsInto(IBString into, int32 fromCharOffset, int32 charCount);

	// void be_BString_MoveCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void MoveCharsInto(inout char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount);
/*
	// bool be_BString_opCmpLess(BString *self, const BString& string);
	//bool opCmpLess();

	// bool be_BString_opCmpLessEqual(BString *self, const BString& string);
	//bool opCmpLessEqual();

	// bool be_BString_opEquals(BString *self, const BString& string);
	//bool opEquals();

	// bool be_BString_opCmpGreaterEqual(BString *self, const BString& string);
	//bool opCmpGreaterEqual();

	// bool be_BString_opCmpGreater(BString *self, const BString& string);
	//bool opCmpGreater();

	// bool be_BString_opNotEquals(BString *self, const BString& string);
	//bool opNotEquals();

	// bool be_BString_opCmpLess_1(BString *self, const char* string);
	//bool opCmpLess();

	// bool be_BString_opCmpLessEqual_1(BString *self, const char* string);
	//bool opCmpLessEqual();

	// bool be_BString_opEquals_1(BString *self, const char* string);
	//bool opEquals();

	// bool be_BString_opCmpGreaterEqual_1(BString *self, const char* string);
	//bool opCmpGreaterEqual();

	// bool be_BString_opCmpGreater_1(BString *self, const char* string);
	//bool opCmpGreater();

	// bool be_BString_opNotEquals_1(BString *self, const char* string);
	//bool opNotEquals();
*/
/*
	// int be_BString_Compare(BString *self, const BString& string);
	int Compare();

	// int be_BString_Compare_1(BString *self, const char* string);
	int Compare();

	// int be_BString_Compare_2(BString *self, const BString& string, int32 length);
	int Compare();

	// int be_BString_Compare_3(BString *self, const char* string, int32 length);
	int Compare();

	// int be_BString_CompareChars(BString *self, const BString& string, int32 charCount);
	int CompareChars();

	// int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount);
	int CompareChars();

	// int be_BString_ICompare(BString *self, const BString& string);
	int ICompare();

	// int be_BString_ICompare_1(BString *self, const char* string);
	int ICompare();

	// int be_BString_ICompare_2(BString *self, const BString& string, int32 length);
	int ICompare();

	// int be_BString_ICompare_3(BString *self, const char* string, int32 length);
	int ICompare();

	// int32 be_BString_FindFirst(BString *self, const BString& string);
	int32 FindFirst();

	// int32 be_BString_FindFirst_1(BString *self, const char* string);
	int32 FindFirst();

	// int32 be_BString_FindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 FindFirst();

	// int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 FindFirst();

	// int32 be_BString_FindFirst_4(BString *self, char c);
	int32 FindFirst();

	// int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset);
	int32 FindFirst();

	// int32 be_BString_FindFirstChars(BString *self, const BString& string, int32 fromCharOffset);
	int32 FindFirstChars();

	// int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset);
	int32 FindFirstChars();

	// int32 be_BString_FindLast(BString *self, const BString& string);
	int32 FindLast();

	// int32 be_BString_FindLast_1(BString *self, const char* string);
	int32 FindLast();

	// int32 be_BString_FindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 FindLast();

	// int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 FindLast();

	// int32 be_BString_FindLast_4(BString *self, char c);
	int32 FindLast();

	// int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset);
	int32 FindLast();

	// int32 be_BString_FindLastChars(BString *self, const BString& string, int32 beforeCharOffset);
	int32 FindLastChars();

	// int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset);
	int32 FindLastChars();

	// int32 be_BString_IFindFirst(BString *self, const BString& string);
	int32 IFindFirst();

	// int32 be_BString_IFindFirst_1(BString *self, const char* string);
	int32 IFindFirst();

	// int32 be_BString_IFindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 IFindFirst();

	// int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 IFindFirst();

	// int32 be_BString_IFindLast(BString *self, const BString& string);
	int32 IFindLast();

	// int32 be_BString_IFindLast_1(BString *self, const char* string);
	int32 IFindLast();

	// int32 be_BString_IFindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 IFindLast();

	// int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 IFindLast();

	// BString & be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis);
	BString & ReplaceFirst();

	// BString & be_BString_ReplaceLast(BString *self, char replaceThis, char withThis);
	BString & ReplaceLast();

	// BString & be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString & ReplaceAll();

	// BString & be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & Replace();

	// BString & be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString & ReplaceFirst();

	// BString & be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString & ReplaceLast();

	// BString & be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString & ReplaceAll();

	// BString & be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & Replace();

	// BString & be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset);
	BString & ReplaceAllChars();

	// BString & be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset);
	BString & ReplaceChars();

	// BString & be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis);
	BString & IReplaceFirst();

	// BString & be_BString_IReplaceLast(BString *self, char replaceThis, char withThis);
	BString & IReplaceLast();

	// BString & be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString & IReplaceAll();

	// BString & be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & IReplace();

	// BString & be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString & IReplaceFirst();

	// BString & be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString & IReplaceLast();

	// BString & be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString & IReplaceAll();

	// BString & be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & IReplace();

	// BString & be_BString_ReplaceSet(BString *self, const char* setOfBytes, char _with);
	BString & ReplaceSet();

	// BString & be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* _with);
	BString & ReplaceSet();

	// BString & be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* _with);
	BString & ReplaceCharsSet();

	// char be_BString_ByteAt(BString *self, int32 index);
	char ByteAt();

	// const char* be_BString_CharAt(BString *self, int32 charIndex, int32* bytes);
	char* CharAt();

	// bool be_BString_CharAt_1(BString *self, int32 charIndex, char* buffer, int32* bytes);
	bool CharAt();

	// char* be_BString_LockBuffer(BString *self, int32 maxLength);
	char* LockBuffer();

	// BString & be_BString_UnlockBuffer(BString *self, int32 length);
	BString & UnlockBuffer();

	// BString & be_BString_ToLower(BString *self);
	BString & ToLower();

	// BString & be_BString_ToUpper(BString *self);
	BString & ToUpper();

	// BString & be_BString_Capitalize(BString *self);
	BString & Capitalize();

	// BString & be_BString_CapitalizeEachWord(BString *self);
	BString & CapitalizeEachWord();

	// BString & be_BString_CharacterEscape(BString *self, const char* original, const char* setOfCharsToEscape, char escapeWith);
	BString & CharacterEscape();

	// BString & be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith);
	BString & CharacterEscape();

	// BString & be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar);
	BString & CharacterDeescape();

	// BString & be_BString_CharacterDeescape_1(BString *self, char escapeChar);
	BString & CharacterDeescape();

	// BString & be_BString_Trim(BString *self);
	BString & Trim();

	// BString & be_BString_opShl(BString *self, const char* string);
	//BString & opShl();

	// BString & be_BString_opShl_1(BString *self, const BString& string);
	//BString & opShl();

	// BString & be_BString_opShl_2(BString *self, char c);
	//BString & opShl();

	// BString & be_BString_opShl_3(BString *self, int value);
	//BString & opShl();

	// BString & be_BString_opShl_4(BString *self, unsigned int value);
	//BString & opShl();

	// BString & be_BString_opShl_5(BString *self, uint32 value);
	//BString & opShl();

	// BString & be_BString_opShl_6(BString *self, int32 value);
	//BString & opShl();

	// BString & be_BString_opShl_7(BString *self, uint64 value);
	//BString & opShl();

	// BString & be_BString_opShl_8(BString *self, int64 value);
	//BString & opShl();

	// BString & be_BString_opShl_9(BString *self, float value);
	//BString & opShl();
*/
	void * _InstPtr();
	bool _OwnsPtr();
}

final class BString : IBString
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BString* be_BString_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BString_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BString* be_BString_ctor_1(void *bindInstPtr, const char * string);
	this(char [] string) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BString_ctor_1(cast(void *)this, toStringz(string));
			fOwnsPointer = true;
		}
	}

	// BString* be_BString_ctor_2(void *bindInstPtr, const BString * string);
	this(IBString string) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BString_ctor_2(cast(void *)this, string._InstPtr());
			fOwnsPointer = true;
		}
	}

	// BString* be_BString_ctor_3(void *bindInstPtr, const char * string, int32 maxLength);
	this(char [] string, int32 maxLength) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BString_ctor_3(cast(void *)this, toStringz(string), maxLength);
			fOwnsPointer = true;
		}
	}

	// void be_BString_dtor(BString* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BString_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// const char* be_BString_String(BString *self);
	char [] String() {
		return fromStringz(be_BString_String(_InstPtr()));
	}

	// int32 be_BString_Length(BString *self);
	int32 Length() {
		return be_BString_Length(_InstPtr());
	}

	// int32 be_BString_CountChars(BString *self);
	int32 CountChars() {
		return be_BString_CountChars(_InstPtr());
	}

	// int32 be_BString_CountBytes(BString *self, int32 fromCharOffset, int32 charCount);
	int32 CountBytes(int32 fromCharOffset, int32 charCount) {
		return be_BString_CountBytes(_InstPtr(), fromCharOffset, charCount);
	}

	// BString & be_BString_opAssign(BString *self, const BString & string);
	//BString & opAssign();

	// BString & be_BString_opAssign_1(BString *self, const char * string);
	//BString & opAssign();

	// BString & be_BString_opAssign_2(BString *self, char c);
	//BString & opAssign();

	// BString & be_BString_SetTo(BString *self, const char * string);
	IBString SetTo(char [] string) {
		return new BString(be_BString_SetTo(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_SetTo_1(BString *self, const char * string, int32 maxLength);
	IBString SetTo(char [] string, int32 maxLength) {
		return new BString(be_BString_SetTo_1(_InstPtr(), toStringz(string), maxLength), false);
	}

	// BString & be_BString_SetTo_2(BString *self, const BString & string);
	IBString SetTo(IBString string) {
		return new BString(be_BString_SetTo_2(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_Adopt(BString *self, BString & from);
	IBString Adopt(IBString from) {
		return new BString(be_BString_Adopt(_InstPtr(), from._InstPtr()), false);
	}

	// BString & be_BString_SetTo_3(BString *self, const BString & string, int32 maxLength);
	IBString SetTo(IBString string, int32 maxLength) {
		return new BString(be_BString_SetTo_3(_InstPtr(), string._InstPtr(), maxLength), false);
	}

	// BString & be_BString_Adopt_1(BString *self, BString & from, int32 maxLength);
	IBString Adopt(IBString from, int32 maxLength) {
		return new BString(be_BString_Adopt_1(_InstPtr(), from._InstPtr(), maxLength), false);
	}

	// BString & be_BString_SetTo_4(BString *self, char c, int32 count);
	IBString SetTo(char c, int32 count) {
		return new BString(be_BString_SetTo_4(_InstPtr(), c, count), false);
	}

	// BString & be_BString_SetToChars(BString *self, const char * string, int32 charCount);
	IBString SetToChars(char [] string, int32 charCount) {
		return new BString(be_BString_SetToChars(_InstPtr(), toStringz(string), charCount), false);
	}

	// BString & be_BString_SetToChars_1(BString *self, const BString & string, int32 charCount);
	IBString SetToChars(IBString string, int32 charCount) {
		return new BString(be_BString_SetToChars_1(_InstPtr(), string._InstPtr(), charCount), false);
	}

	// BString & be_BString_AdoptChars(BString *self, BString & from, int32 charCount);
	IBString AdoptChars(IBString from, int32 charCount) {
		return new BString(be_BString_AdoptChars(_InstPtr(), from._InstPtr(), charCount), false);
	}

	// BString & be_BString_CopyInto(BString *self, BString& into, int32 fromOffset, int32 length);
	IBString CopyInto(IBString into, int32 fromOffset, int32 length) {
		return new BString(be_BString_CopyInto(_InstPtr(), into._InstPtr(), fromOffset, length), false);
	}

	// void be_BString_CopyInto_1(BString *self, char* into, int32 fromOffset, int32 length);
	void CopyInto(inout char [] into, int32 fromOffset, int32 length = -1) {
		if(length == -1) length = into.length;

		char *buffer = cast(char *)malloc(length);
		
		
		be_BString_CopyInto_1(_InstPtr(), buffer, fromOffset, length);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}

	// BString & be_BString_CopyCharsInto(BString *self, BString& into, int32 fromCharOffset, int32 charCount);
	IBString CopyCharsInto(IBString into, int32 fromCharOffset, int32 charCount) {
		return new BString(be_BString_CopyCharsInto(_InstPtr(), into._InstPtr(), fromCharOffset, charCount), false);
	}

	// void be_BString_CopyCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void CopyCharsInto(char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount) {
		char * buffer = cast(char *)malloc(into.length);
		
		be_BString_CopyCharsInto_1(_InstPtr(), buffer, &intoLength, fromCharOffset, charCount);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}

	// BString & be_BString_opAddAssign(BString *self, const BString& string);
	//BString & opAddAssign();

	// BString & be_BString_opAddAssign_1(BString *self, const char* string);
	//BString & opAddAssign();

	// BString & be_BString_opAddAssign_2(BString *self, char c);
	//BString & opAddAssign();

	// BString & be_BString_Append(BString *self, const BString& string);
	IBString Append(IBString string) {
		return new BString(be_BString_Append(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_Append_1(BString *self, const char* string);
	IBString Append(char [] string) {
		return new BString(be_BString_Append_1(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_Append_2(BString *self, const BString& string, int32 length);
	IBString Append(IBString string, int32 length) {
		return new BString(be_BString_Append_2(_InstPtr(), string._InstPtr(), length), false);
	}

	// BString & be_BString_Append_3(BString *self, const char* string, int32 length);
	IBString Append(char [] string, int32 length) {
		return new BString(be_BString_Append_3(_InstPtr(), toStringz(string), length), false);
	}

	// BString & be_BString_Append_4(BString *self, char c, int32 count);
	IBString Append(char c, int32 count) {
		return new BString(be_BString_Append_4(_InstPtr(), c, count), false);
	}

	// BString & be_BString_AppendChars(BString *self, const BString& string, int32 charCount);
	IBString AppendChars(IBString string, int32 charCount) {
		return new BString(be_BString_AppendChars(_InstPtr(), string._InstPtr(), charCount), false);
	}

	// BString & be_BString_AppendChars_1(BString *self, const char* string, int32 charCount);
	BString AppendChars(char [] string, int32 charCount) {
		return new BString(be_BString_AppendChars_1(_InstPtr(), toStringz(string), charCount), false);
	}

	// BString & be_BString_Prepend(BString *self, const char* string);
	BString Prepend(char [] string) {
		return new BString(be_BString_Prepend(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_Prepend_1(BString *self, const BString& string);
	IBString Prepend(IBString string) {
		return new BString(be_BString_Prepend_1(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_Prepend_2(BString *self, const char* string, int32 length);
	IBString Prepend(char [] string, int32 length) {
		return new BString(be_BString_Prepend_2(_InstPtr(), toStringz(string), length), false);
	}

	// BString & be_BString_Prepend_3(BString *self, const BString& string, int32 length);
	IBString Prepend(IBString string, int32 length) {
		return new BString(be_BString_Prepend_3(_InstPtr(), string._InstPtr(), length), false);
	}

	// BString & be_BString_Prepend_4(BString *self, char c, int32 count);
	IBString Prepend(char c, int32 count) {
		return new BString(be_BString_Prepend_4(_InstPtr(), c, count), false);
	}

	// BString & be_BString_PrependChars(BString *self, const char* string, int32 charCount);
	IBString PrependChars(char [] string, int32 charCount) {
		return new BString(be_BString_PrependChars(_InstPtr(), toStringz(string), charCount), false);
	}

	// BString & be_BString_PrependChars_1(BString *self, const BString& string, int32 charCount);
	IBString PrependChars(IBString string, int32 charCount) {
		return new BString(be_BString_PrependChars_1(_InstPtr(), string._InstPtr(), charCount), false);
	}

	// BString & be_BString_Insert(BString *self, const char* string, int32 position);
	IBString Insert(char [] string, int32 position) {
		return new BString(be_BString_Insert(_InstPtr(), toStringz(string), position), false);
	}

	// BString & be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position);
	IBString Insert(char [] string, int32 length, int32 position) {
		return new BString(be_BString_Insert_1(_InstPtr(), toStringz(string), length, position), false);
	}

	// BString & be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position);
	IBString Insert(char [] string, int32 fromOffset, int32 length, int32 position) {
		return new BString(be_BString_Insert_2(_InstPtr(), toStringz(string), fromOffset, length, position), false);
	}

	// BString & be_BString_Insert_3(BString *self, const BString& string, int32 position);
	IBString Insert(IBString string, int32 position) {
		return new BString(be_BString_Insert_3(_InstPtr(), string._InstPtr(), position), false);
	}

	// BString & be_BString_Insert_4(BString *self, const BString& string, int32 length, int32 position);
	IBString Insert(IBString string, int32 length, int32 position) {
		return new BString(be_BString_Insert_4(_InstPtr(), string._InstPtr(), length, position), false);
	}

	// BString & be_BString_Insert_5(BString *self, const BString& string, int32 fromOffset, int32 length, int32 position);
	IBString Insert(IBString string, int32 fromOffset, int32 length, int32 position) {
		return new BString(be_BString_Insert_5(_InstPtr(), string._InstPtr(), fromOffset, length, position), false);
	}

	// BString & be_BString_Insert_6(BString *self, char c, int32 count, int32 position);
	IBString Insert(char c, int32 count, int32 position) {
		return new BString(be_BString_Insert_6(_InstPtr(), c, count, position), false);
	}

	// BString & be_BString_InsertChars(BString *self, const char* string, int32 charPosition);
	IBString InsertChars(char [] string, int32 charPosition) {
		return new BString(be_BString_InsertChars(_InstPtr(), toStringz(string), charPosition), false);
	}

	// BString & be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition);
	IBString InsertChars(char [] string, int32 charCount, int32 charPosition) {
		return new BString(be_BString_InsertChars_1(_InstPtr(), toStringz(string), charCount, charPosition), false);
	}

	// BString & be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	IBString InsertChars(char [] string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		return new BString(be_BString_InsertChars_2(_InstPtr(), toStringz(string), fromCharOffset, charCount, charPosition), false);
	}

	// BString & be_BString_InsertChars_3(BString *self, const BString& string, int32 charPosition);
	IBString InsertChars(IBString string, int32 charPosition) {
		return new BString(be_BString_InsertChars_3(_InstPtr(), string._InstPtr(), charPosition), false);
	}

	// BString & be_BString_InsertChars_4(BString *self, const BString& string, int32 charCount, int32 charPosition);
	IBString InsertChars(IBString string, int32 charCount, int32 charPosition) {
		return new BString(be_BString_InsertChars_4(_InstPtr(), string._InstPtr(), charCount, charPosition), false);
	}

	// BString & be_BString_InsertChars_5(BString *self, const BString& string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	IBString InsertChars(IBString string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		return new BString(be_BString_InsertChars_5(_InstPtr(), string._InstPtr(), fromCharOffset, charCount, charPosition), false);
	}

	// BString & be_BString_Truncate(BString *self, int32 newLength, bool _lazy);
	IBString Truncate(int32 newLength, bool _lazy = true) {
		return new BString(be_BString_Truncate(_InstPtr(), newLength, _lazy), false);
	}

	// BString & be_BString_TruncateChars(BString *self, int32 newCharCount, bool _lazy);
	IBString TruncateChars(int32 newCharCount, bool _lazy = true) {
		return new BString(be_BString_TruncateChars(_InstPtr(), newCharCount, _lazy), false);
	}

	// BString & be_BString_Remove(BString *self, int32 from, int32 length);
	IBString Remove(int32 from, int32 length) {
		return new BString(be_BString_Remove(_InstPtr(), from, length), false);
	}

	// BString & be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount);
	IBString RemoveChars(int32 fromCharOffset, int32 charCount) {
		return new BString(be_BString_RemoveChars(_InstPtr(), fromCharOffset, charCount), false);
	}

	// BString & be_BString_RemoveFirst(BString *self, const BString& string);
	IBString RemoveFirst(IBString string) {
		return new BString(be_BString_RemoveFirst(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_RemoveLast(BString *self, const BString& string);
	IBString RemoveLast(IBString string) {
		return new BString(be_BString_RemoveLast(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_RemoveAll(BString *self, const BString& string);
	IBString RemoveAll(IBString string) {
		return new BString(be_BString_RemoveAll(_InstPtr(), string._InstPtr()), false);
	}

	// BString & be_BString_RemoveFirst_1(BString *self, const char* string);
	IBString RemoveFirst(char [] string) {
		return new BString(be_BString_RemoveFirst_1(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_RemoveLast_1(BString *self, const char* string);
	IBString RemoveLast(char [] string) {
		return new BString(be_BString_RemoveLast_1(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_RemoveAll_1(BString *self, const char* string);
	IBString RemoveAll(char [] string) {
		return new BString(be_BString_RemoveAll_1(_InstPtr(), toStringz(string)), false);
	}

	// BString & be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove);
	IBString RemoveSet(char [] setOfBytesToRemove) {
		return new BString(be_BString_RemoveSet(_InstPtr(), toStringz(setOfBytesToRemove)), false);
	}

	// BString & be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove);
	IBString RemoveCharsSet(char [] setOfCharsToRemove) {
		return new BString(be_BString_RemoveCharsSet(_InstPtr(), toStringz(setOfCharsToRemove)), false);
	}

	// BString & be_BString_MoveInto(BString *self, BString& into, int32 from, int32 length);
	IBString MoveInto(IBString into, int32 from, int32 length) {
		return new BString(be_BString_MoveInto(_InstPtr(), into._InstPtr(), from, length), false);
	}

	// void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length);
	void MoveInto(inout char [] into, int32 from, int32 length) {
		char *buffer = cast(char *)malloc(length + 1);
		
		be_BString_MoveInto_1(_InstPtr(), buffer, from, length);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}

	// BString & be_BString_MoveCharsInto(BString *self, BString& into, int32 fromCharOffset, int32 charCount);
	IBString MoveCharsInto(IBString into, int32 fromCharOffset, int32 charCount) {
		return new BString(be_BString_MoveCharsInto(_InstPtr(), into._InstPtr(), fromCharOffset, charCount), false);
	}

	// void be_BString_MoveCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void MoveCharsInto(inout char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount) {
		char *buffer; // = cast(char *)malloc(length + 1);
		
		be_BString_MoveCharsInto_1(_InstPtr(), buffer, &intoLength, fromCharOffset, charCount);

		into = fromStringz(buffer).dup;
		
		free(buffer);
	}
/*
	// bool be_BString_opCmpLess(BString *self, const BString& string);
	//bool opCmpLess();

	// bool be_BString_opCmpLessEqual(BString *self, const BString& string);
	//bool opCmpLessEqual();

	// bool be_BString_opEquals(BString *self, const BString& string);
	//bool opEquals();

	// bool be_BString_opCmpGreaterEqual(BString *self, const BString& string);
	//bool opCmpGreaterEqual();

	// bool be_BString_opCmpGreater(BString *self, const BString& string);
	//bool opCmpGreater();

	// bool be_BString_opNotEquals(BString *self, const BString& string);
	//bool opNotEquals();

	// bool be_BString_opCmpLess_1(BString *self, const char* string);
	//bool opCmpLess();

	// bool be_BString_opCmpLessEqual_1(BString *self, const char* string);
	//bool opCmpLessEqual();

	// bool be_BString_opEquals_1(BString *self, const char* string);
	//bool opEquals();

	// bool be_BString_opCmpGreaterEqual_1(BString *self, const char* string);
	//bool opCmpGreaterEqual();

	// bool be_BString_opCmpGreater_1(BString *self, const char* string);
	//bool opCmpGreater();

	// bool be_BString_opNotEquals_1(BString *self, const char* string);
	//bool opNotEquals();
*/
/*
	// int be_BString_Compare(BString *self, const BString& string);
	int Compare() {
		return be_BString_Compare(_InstPtr());
	}

	// int be_BString_Compare_1(BString *self, const char* string);
	int Compare() {
		return be_BString_Compare_1(_InstPtr());
	}

	// int be_BString_Compare_2(BString *self, const BString& string, int32 length);
	int Compare() {
		return be_BString_Compare_2(_InstPtr());
	}

	// int be_BString_Compare_3(BString *self, const char* string, int32 length);
	int Compare() {
		return be_BString_Compare_3(_InstPtr());
	}

	// int be_BString_CompareChars(BString *self, const BString& string, int32 charCount);
	int CompareChars() {
		return be_BString_CompareChars(_InstPtr());
	}

	// int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount);
	int CompareChars() {
		return be_BString_CompareChars_1(_InstPtr());
	}

	// int be_BString_ICompare(BString *self, const BString& string);
	int ICompare() {
		return be_BString_ICompare(_InstPtr());
	}

	// int be_BString_ICompare_1(BString *self, const char* string);
	int ICompare() {
		return be_BString_ICompare_1(_InstPtr());
	}

	// int be_BString_ICompare_2(BString *self, const BString& string, int32 length);
	int ICompare() {
		return be_BString_ICompare_2(_InstPtr());
	}

	// int be_BString_ICompare_3(BString *self, const char* string, int32 length);
	int ICompare() {
		return be_BString_ICompare_3(_InstPtr());
	}

	// int32 be_BString_FindFirst(BString *self, const BString& string);
	int32 FindFirst() {
		return be_BString_FindFirst(_InstPtr());
	}

	// int32 be_BString_FindFirst_1(BString *self, const char* string);
	int32 FindFirst() {
		return be_BString_FindFirst_1(_InstPtr());
	}

	// int32 be_BString_FindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 FindFirst() {
		return be_BString_FindFirst_2(_InstPtr());
	}

	// int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 FindFirst() {
		return be_BString_FindFirst_3(_InstPtr());
	}

	// int32 be_BString_FindFirst_4(BString *self, char c);
	int32 FindFirst() {
		return be_BString_FindFirst_4(_InstPtr());
	}

	// int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset);
	int32 FindFirst() {
		return be_BString_FindFirst_5(_InstPtr());
	}

	// int32 be_BString_FindFirstChars(BString *self, const BString& string, int32 fromCharOffset);
	int32 FindFirstChars() {
		return be_BString_FindFirstChars(_InstPtr());
	}

	// int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset);
	int32 FindFirstChars() {
		return be_BString_FindFirstChars_1(_InstPtr());
	}

	// int32 be_BString_FindLast(BString *self, const BString& string);
	int32 FindLast() {
		return be_BString_FindLast(_InstPtr());
	}

	// int32 be_BString_FindLast_1(BString *self, const char* string);
	int32 FindLast() {
		return be_BString_FindLast_1(_InstPtr());
	}

	// int32 be_BString_FindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 FindLast() {
		return be_BString_FindLast_2(_InstPtr());
	}

	// int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 FindLast() {
		return be_BString_FindLast_3(_InstPtr());
	}

	// int32 be_BString_FindLast_4(BString *self, char c);
	int32 FindLast() {
		return be_BString_FindLast_4(_InstPtr());
	}

	// int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset);
	int32 FindLast() {
		return be_BString_FindLast_5(_InstPtr());
	}

	// int32 be_BString_FindLastChars(BString *self, const BString& string, int32 beforeCharOffset);
	int32 FindLastChars() {
		return be_BString_FindLastChars(_InstPtr());
	}

	// int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset);
	int32 FindLastChars() {
		return be_BString_FindLastChars_1(_InstPtr());
	}

	// int32 be_BString_IFindFirst(BString *self, const BString& string);
	int32 IFindFirst() {
		return be_BString_IFindFirst(_InstPtr());
	}

	// int32 be_BString_IFindFirst_1(BString *self, const char* string);
	int32 IFindFirst() {
		return be_BString_IFindFirst_1(_InstPtr());
	}

	// int32 be_BString_IFindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 IFindFirst() {
		return be_BString_IFindFirst_2(_InstPtr());
	}

	// int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 IFindFirst() {
		return be_BString_IFindFirst_3(_InstPtr());
	}

	// int32 be_BString_IFindLast(BString *self, const BString& string);
	int32 IFindLast() {
		return be_BString_IFindLast(_InstPtr());
	}

	// int32 be_BString_IFindLast_1(BString *self, const char* string);
	int32 IFindLast() {
		return be_BString_IFindLast_1(_InstPtr());
	}

	// int32 be_BString_IFindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 IFindLast() {
		return be_BString_IFindLast_2(_InstPtr());
	}

	// int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 IFindLast() {
		return be_BString_IFindLast_3(_InstPtr());
	}

	// BString & be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis);
	BString & ReplaceFirst() {
		return be_BString_ReplaceFirst(_InstPtr());
	}

	// BString & be_BString_ReplaceLast(BString *self, char replaceThis, char withThis);
	BString & ReplaceLast() {
		return be_BString_ReplaceLast(_InstPtr());
	}

	// BString & be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString & ReplaceAll() {
		return be_BString_ReplaceAll(_InstPtr());
	}

	// BString & be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & Replace() {
		return be_BString_Replace(_InstPtr());
	}

	// BString & be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString & ReplaceFirst() {
		return be_BString_ReplaceFirst_1(_InstPtr());
	}

	// BString & be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString & ReplaceLast() {
		return be_BString_ReplaceLast_1(_InstPtr());
	}

	// BString & be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString & ReplaceAll() {
		return be_BString_ReplaceAll_1(_InstPtr());
	}

	// BString & be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & Replace() {
		return be_BString_Replace_1(_InstPtr());
	}

	// BString & be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset);
	BString & ReplaceAllChars() {
		return be_BString_ReplaceAllChars(_InstPtr());
	}

	// BString & be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset);
	BString & ReplaceChars() {
		return be_BString_ReplaceChars(_InstPtr());
	}

	// BString & be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis);
	BString & IReplaceFirst() {
		return be_BString_IReplaceFirst(_InstPtr());
	}

	// BString & be_BString_IReplaceLast(BString *self, char replaceThis, char withThis);
	BString & IReplaceLast() {
		return be_BString_IReplaceLast(_InstPtr());
	}

	// BString & be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString & IReplaceAll() {
		return be_BString_IReplaceAll(_InstPtr());
	}

	// BString & be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & IReplace() {
		return be_BString_IReplace(_InstPtr());
	}

	// BString & be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString & IReplaceFirst() {
		return be_BString_IReplaceFirst_1(_InstPtr());
	}

	// BString & be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString & IReplaceLast() {
		return be_BString_IReplaceLast_1(_InstPtr());
	}

	// BString & be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString & IReplaceAll() {
		return be_BString_IReplaceAll_1(_InstPtr());
	}

	// BString & be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString & IReplace() {
		return be_BString_IReplace_1(_InstPtr());
	}

	// BString & be_BString_ReplaceSet(BString *self, const char* setOfBytes, char _with);
	BString & ReplaceSet() {
		return be_BString_ReplaceSet(_InstPtr());
	}

	// BString & be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* _with);
	BString & ReplaceSet() {
		return be_BString_ReplaceSet_1(_InstPtr());
	}

	// BString & be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* _with);
	BString & ReplaceCharsSet() {
		return be_BString_ReplaceCharsSet(_InstPtr());
	}

	// char be_BString_ByteAt(BString *self, int32 index);
	char ByteAt() {
		return be_BString_ByteAt(_InstPtr());
	}

	// const char* be_BString_CharAt(BString *self, int32 charIndex, int32* bytes);
	char* CharAt() {
		return be_BString_CharAt(_InstPtr());
	}

	// bool be_BString_CharAt_1(BString *self, int32 charIndex, char* buffer, int32* bytes);
	bool CharAt() {
		return be_BString_CharAt_1(_InstPtr());
	}

	// char* be_BString_LockBuffer(BString *self, int32 maxLength);
	char* LockBuffer() {
		return be_BString_LockBuffer(_InstPtr());
	}

	// BString & be_BString_UnlockBuffer(BString *self, int32 length);
	BString & UnlockBuffer() {
		return be_BString_UnlockBuffer(_InstPtr());
	}

	// BString & be_BString_ToLower(BString *self);
	BString & ToLower() {
		return be_BString_ToLower(_InstPtr());
	}

	// BString & be_BString_ToUpper(BString *self);
	BString & ToUpper() {
		return be_BString_ToUpper(_InstPtr());
	}

	// BString & be_BString_Capitalize(BString *self);
	BString & Capitalize() {
		return be_BString_Capitalize(_InstPtr());
	}

	// BString & be_BString_CapitalizeEachWord(BString *self);
	BString & CapitalizeEachWord() {
		return be_BString_CapitalizeEachWord(_InstPtr());
	}

	// BString & be_BString_CharacterEscape(BString *self, const char* original, const char* setOfCharsToEscape, char escapeWith);
	BString & CharacterEscape() {
		return be_BString_CharacterEscape(_InstPtr());
	}

	// BString & be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith);
	BString & CharacterEscape() {
		return be_BString_CharacterEscape_1(_InstPtr());
	}

	// BString & be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar);
	BString & CharacterDeescape() {
		return be_BString_CharacterDeescape(_InstPtr());
	}

	// BString & be_BString_CharacterDeescape_1(BString *self, char escapeChar);
	BString & CharacterDeescape() {
		return be_BString_CharacterDeescape_1(_InstPtr());
	}

	// BString & be_BString_Trim(BString *self);
	BString & Trim() {
		return be_BString_Trim(_InstPtr());
	}

	// BString & be_BString_opShl(BString *self, const char* string);
	//BString & opShl();

	// BString & be_BString_opShl_1(BString *self, const BString& string);
	//BString & opShl();

	// BString & be_BString_opShl_2(BString *self, char c);
	//BString & opShl();

	// BString & be_BString_opShl_3(BString *self, int value);
	//BString & opShl();

	// BString & be_BString_opShl_4(BString *self, unsigned int value);
	//BString & opShl();

	// BString & be_BString_opShl_5(BString *self, uint32 value);
	//BString & opShl();

	// BString & be_BString_opShl_6(BString *self, int32 value);
	//BString & opShl();

	// BString & be_BString_opShl_7(BString *self, uint64 value);
	//BString & opShl();

	// BString & be_BString_opShl_8(BString *self, int64 value);
	//BString & opShl();

	// BString & be_BString_opShl_9(BString *self, float value);
	//BString & opShl();
*/
	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


