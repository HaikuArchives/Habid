/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.String;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

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

final class BString
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BString* be_BString_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BString_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BString* be_BString_ctor_1(void *bindInstPtr, const char * string);
	this(char [] string) {
		if(_InstPtr is null) {
			_InstPtr = be_BString_ctor_1(cast(void *)this, toStringz(string));
			_OwnsPtr = true;
		}
	}

	// BString* be_BString_ctor_2(void *bindInstPtr, const BString * string);
	this(BString string) {
		if(_InstPtr is null) {
			_InstPtr = be_BString_ctor_2(cast(void *)this, string._InstPtr());
			_OwnsPtr = true;
		}
	}

	// BString* be_BString_ctor_3(void *bindInstPtr, const char * string, int32 maxLength);
	this(char [] string, int32 maxLength) {
		if(_InstPtr is null) {
			_InstPtr = be_BString_ctor_3(cast(void *)this, toStringz(string), maxLength);
			_OwnsPtr = true;
		}
	}

	// void be_BString_dtor(BString* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BString_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
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
/*
	BString opAssign(BString string) {
		be_BString_opAssign(_InstPtr(), string._InstPtr());
		return this;
	}
*/
	// BString & be_BString_opAssign_1(BString *self, const char * string);
	BString opAssign(char [] string) {
		be_BString_opAssign_1(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_opAssign_2(BString *self, char c);
	BString opAssign(char c) {
		be_BString_opAssign_2(_InstPtr(), c);
		return this;	
	}

	// BString & be_BString_SetTo(BString *self, const char * string);
	BString SetTo(char [] string) {
		be_BString_SetTo(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_SetTo_1(BString *self, const char * string, int32 maxLength);
	BString SetTo(char [] string, int32 maxLength) {
		be_BString_SetTo_1(_InstPtr(), toStringz(string), maxLength);
		return this;
	}

	// BString & be_BString_SetTo_2(BString *self, const BString & string);
	BString SetTo(BString string) {
		be_BString_SetTo_2(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_Adopt(BString *self, BString & from);
	BString Adopt(BString from) {
		be_BString_Adopt(_InstPtr(), from._InstPtr());
		return this;
	}

	// BString & be_BString_SetTo_3(BString *self, const BString & string, int32 maxLength);
	BString SetTo(BString string, int32 maxLength) {
		be_BString_SetTo_3(_InstPtr(), string._InstPtr(), maxLength);
		return this;
	}

	// BString & be_BString_Adopt_1(BString *self, BString & from, int32 maxLength);
	BString Adopt(BString from, int32 maxLength) {
		be_BString_Adopt_1(_InstPtr(), from._InstPtr(), maxLength);
		return this;
	}

	// BString & be_BString_SetTo_4(BString *self, char c, int32 count);
	BString SetTo(char c, int32 count) {
		be_BString_SetTo_4(_InstPtr(), c, count);
		return this;
	}

	// BString & be_BString_SetToChars(BString *self, const char * string, int32 charCount);
	BString SetToChars(char [] string, int32 charCount) {
		be_BString_SetToChars(_InstPtr(), toStringz(string), charCount);
		return this;
	}

	// BString & be_BString_SetToChars_1(BString *self, const BString & string, int32 charCount);
	BString SetToChars(BString string, int32 charCount) {
		be_BString_SetToChars_1(_InstPtr(), string._InstPtr(), charCount);
		return this;
	}

	// BString & be_BString_AdoptChars(BString *self, BString & from, int32 charCount);
	BString AdoptChars(BString from, int32 charCount) {
		be_BString_AdoptChars(_InstPtr(), from._InstPtr(), charCount);
		return this;
	}

	// BString & be_BString_CopyInto(BString *self, BString& into, int32 fromOffset, int32 length);
	BString CopyInto(BString into, int32 fromOffset, int32 length) {
		be_BString_CopyInto(_InstPtr(), into._InstPtr(), fromOffset, length);
		return this;
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
	BString CopyCharsInto(BString into, int32 fromCharOffset, int32 charCount) {
		be_BString_CopyCharsInto(_InstPtr(), into._InstPtr(), fromCharOffset, charCount);
		return this;
	}

	// void be_BString_CopyCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void CopyCharsInto(char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount) {
		char * buffer = cast(char *)malloc(into.length);
		
		be_BString_CopyCharsInto_1(_InstPtr(), buffer, &intoLength, fromCharOffset, charCount);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}

	// BString & be_BString_opAddAssign(BString *self, const BString& string);
	BString opAddAssign(BString string) {
		be_BString_opAddAssign(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_opAddAssign_1(BString *self, const char* string);
	BString opAddAssign(char [] string) {
		be_BString_opAddAssign_1(_InstPtr(), toStringz(string));
		return this;	
	}

	// BString & be_BString_opAddAssign_2(BString *self, char c);
	BString opAddAssign(char c) {
		be_BString_opAddAssign_2(_InstPtr(), c);
		return this;
	}

	// BString & be_BString_Append(BString *self, const BString& string);
	BString Append(BString string) {
		be_BString_Append(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_Append_1(BString *self, const char* string);
	BString Append(char [] string) {
		be_BString_Append_1(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_Append_2(BString *self, const BString& string, int32 length);
	BString Append(BString string, int32 length) {
		be_BString_Append_2(_InstPtr(), string._InstPtr(), length);
		return this;
	}

	// BString & be_BString_Append_3(BString *self, const char* string, int32 length);
	BString Append(char [] string, int32 length) {
		be_BString_Append_3(_InstPtr(), toStringz(string), length);
		return this;
	}

	// BString & be_BString_Append_4(BString *self, char c, int32 count);
	BString Append(char c, int32 count) {
		be_BString_Append_4(_InstPtr(), c, count);
		return this;
	}

	// BString & be_BString_AppendChars(BString *self, const BString& string, int32 charCount);
	BString AppendChars(BString string, int32 charCount) {
		be_BString_AppendChars(_InstPtr(), string._InstPtr(), charCount);
		return this;
	}

	// BString & be_BString_AppendChars_1(BString *self, const char* string, int32 charCount);
	BString AppendChars(char [] string, int32 charCount) {
		be_BString_AppendChars_1(_InstPtr(), toStringz(string), charCount);
		return this;
	}

	// BString & be_BString_Prepend(BString *self, const char* string);
	BString Prepend(char [] string) {
		be_BString_Prepend(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_Prepend_1(BString *self, const BString& string);
	BString Prepend(BString string) {
		be_BString_Prepend_1(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_Prepend_2(BString *self, const char* string, int32 length);
	BString Prepend(char [] string, int32 length) {
		be_BString_Prepend_2(_InstPtr(), toStringz(string), length);
		return this;
	}

	// BString & be_BString_Prepend_3(BString *self, const BString& string, int32 length);
	BString Prepend(BString string, int32 length) {
		be_BString_Prepend_3(_InstPtr(), string._InstPtr(), length);
		return this;
	}

	// BString & be_BString_Prepend_4(BString *self, char c, int32 count);
	BString Prepend(char c, int32 count) {
		be_BString_Prepend_4(_InstPtr(), c, count);
		return this;
	}

	// BString & be_BString_PrependChars(BString *self, const char* string, int32 charCount);
	BString PrependChars(char [] string, int32 charCount) {
		be_BString_PrependChars(_InstPtr(), toStringz(string), charCount);
		return this;
	}

	// BString & be_BString_PrependChars_1(BString *self, const BString& string, int32 charCount);
	BString PrependChars(BString string, int32 charCount) {
		be_BString_PrependChars_1(_InstPtr(), string._InstPtr(), charCount);
		return this;
	}

	// BString & be_BString_Insert(BString *self, const char* string, int32 position);
	BString Insert(char [] string, int32 position) {
		be_BString_Insert(_InstPtr(), toStringz(string), position);
		return this;
	}

	// BString & be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position);
	BString Insert(char [] string, int32 length, int32 position) {
		be_BString_Insert_1(_InstPtr(), toStringz(string), length, position);
		return this;
	}

	// BString & be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position);
	BString Insert(char [] string, int32 fromOffset, int32 length, int32 position) {
		be_BString_Insert_2(_InstPtr(), toStringz(string), fromOffset, length, position);
		return this;
	}

	// BString & be_BString_Insert_3(BString *self, const BString& string, int32 position);
	BString Insert(BString string, int32 position) {
		be_BString_Insert_3(_InstPtr(), string._InstPtr(), position);
		return this;
	}

	// BString & be_BString_Insert_4(BString *self, const BString& string, int32 length, int32 position);
	BString Insert(BString string, int32 length, int32 position) {
		be_BString_Insert_4(_InstPtr(), string._InstPtr(), length, position);
		return this;
	}

	// BString & be_BString_Insert_5(BString *self, const BString& string, int32 fromOffset, int32 length, int32 position);
	BString Insert(BString string, int32 fromOffset, int32 length, int32 position) {
		be_BString_Insert_5(_InstPtr(), string._InstPtr(), fromOffset, length, position);
		return this;
	}

	// BString & be_BString_Insert_6(BString *self, char c, int32 count, int32 position);
	BString Insert(char c, int32 count, int32 position) {
		be_BString_Insert_6(_InstPtr(), c, count, position);
		return this;
	}

	// BString & be_BString_InsertChars(BString *self, const char* string, int32 charPosition);
	BString InsertChars(char [] string, int32 charPosition) {
		be_BString_InsertChars(_InstPtr(), toStringz(string), charPosition);
		return this;
	}

	// BString & be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition);
	BString InsertChars(char [] string, int32 charCount, int32 charPosition) {
		be_BString_InsertChars_1(_InstPtr(), toStringz(string), charCount, charPosition);
		return this;
	}

	// BString & be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	BString InsertChars(char [] string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		be_BString_InsertChars_2(_InstPtr(), toStringz(string), fromCharOffset, charCount, charPosition);
		return this;
	}

	// BString & be_BString_InsertChars_3(BString *self, const BString& string, int32 charPosition);
	BString InsertChars(BString string, int32 charPosition) {
		be_BString_InsertChars_3(_InstPtr(), string._InstPtr(), charPosition);
		return this;
	}

	// BString & be_BString_InsertChars_4(BString *self, const BString& string, int32 charCount, int32 charPosition);
	BString InsertChars(BString string, int32 charCount, int32 charPosition) {
		be_BString_InsertChars_4(_InstPtr(), string._InstPtr(), charCount, charPosition);
		return this;
	}

	// BString & be_BString_InsertChars_5(BString *self, const BString& string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	BString InsertChars(BString string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		be_BString_InsertChars_5(_InstPtr(), string._InstPtr(), fromCharOffset, charCount, charPosition);
		return this;
	}

	// BString & be_BString_Truncate(BString *self, int32 newLength, bool _lazy);
	BString Truncate(int32 newLength, bool _lazy = true) {
		be_BString_Truncate(_InstPtr(), newLength, _lazy);
		return this;
	}

	// BString & be_BString_TruncateChars(BString *self, int32 newCharCount, bool _lazy);
	BString TruncateChars(int32 newCharCount, bool _lazy = true) {
		be_BString_TruncateChars(_InstPtr(), newCharCount, _lazy);
		return this;
	}

	// BString & be_BString_Remove(BString *self, int32 from, int32 length);
	BString Remove(int32 from, int32 length) {
		be_BString_Remove(_InstPtr(), from, length);
		return this;
	}

	// BString & be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount);
	BString RemoveChars(int32 fromCharOffset, int32 charCount) {
		be_BString_RemoveChars(_InstPtr(), fromCharOffset, charCount);
		return this;
	}

	// BString & be_BString_RemoveFirst(BString *self, const BString& string);
	BString RemoveFirst(BString string) {
		be_BString_RemoveFirst(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_RemoveLast(BString *self, const BString& string);
	BString RemoveLast(BString string) {
		be_BString_RemoveLast(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_RemoveAll(BString *self, const BString& string);
	BString RemoveAll(BString string) {
		be_BString_RemoveAll(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_RemoveFirst_1(BString *self, const char* string);
	BString RemoveFirst(char [] string) {
		be_BString_RemoveFirst_1(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_RemoveLast_1(BString *self, const char* string);
	BString RemoveLast(char [] string) {
		be_BString_RemoveLast_1(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_RemoveAll_1(BString *self, const char* string);
	BString RemoveAll(char [] string) {
		be_BString_RemoveAll_1(_InstPtr(), toStringz(string));
		return this;
	}

	// BString & be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove);
	BString RemoveSet(char [] setOfBytesToRemove) {
		be_BString_RemoveSet(_InstPtr(), toStringz(setOfBytesToRemove));
		return this;
	}

	// BString & be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove);
	BString RemoveCharsSet(char [] setOfCharsToRemove) {
		be_BString_RemoveCharsSet(_InstPtr(), toStringz(setOfCharsToRemove));
		return this;
	}

	// BString & be_BString_MoveInto(BString *self, BString& into, int32 from, int32 length);
	BString MoveInto(BString into, int32 from, int32 length) {
		be_BString_MoveInto(_InstPtr(), into._InstPtr(), from, length);
		return this;
	}

	// void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length);
	void MoveInto(inout char [] into, int32 from, int32 length) {
		char *buffer = cast(char *)malloc(length + 1);
		
		be_BString_MoveInto_1(_InstPtr(), buffer, from, length);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}

	// BString & be_BString_MoveCharsInto(BString *self, BString& into, int32 fromCharOffset, int32 charCount);
	BString MoveCharsInto(BString into, int32 fromCharOffset, int32 charCount) {
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

	// int be_BString_Compare(BString *self, const BString& string);
	int Compare(BString string) {
		return be_BString_Compare(_InstPtr(), string._InstPtr());
	}

	// int be_BString_Compare_1(BString *self, const char* string);
	int Compare(char [] string) {
		return be_BString_Compare_1(_InstPtr(), toStringz(string));
	}

	// int be_BString_Compare_2(BString *self, const BString& string, int32 length);
	int Compare(BString string, int32 length) {
		return be_BString_Compare_2(_InstPtr(), string._InstPtr(), length);
	}

	// int be_BString_Compare_3(BString *self, const char* string, int32 length);
	int Compare(char [] string, int32 length) {
		return be_BString_Compare_3(_InstPtr(), toStringz(string), length);
	}

	// int be_BString_CompareChars(BString *self, const BString& string, int32 charCount);
	int CompareChars(BString string, int32 charCount) {
		return be_BString_CompareChars(_InstPtr(), string._InstPtr(), charCount);
	}

	// int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount);
	int CompareChars(char [] string, int32 charCount) {
		return be_BString_CompareChars_1(_InstPtr(), toStringz(string), charCount);
	}

	// int be_BString_ICompare(BString *self, const BString& string);
	int ICompare(BString string) {
		return be_BString_ICompare(_InstPtr(), string._InstPtr());
	}

	// int be_BString_ICompare_1(BString *self, const char* string);
	int ICompare(char [] string) {
		return be_BString_ICompare_1(_InstPtr(), toStringz(string));
	}

	// int be_BString_ICompare_2(BString *self, const BString& string, int32 length);
	int ICompare(BString string, int32 length) {
		return be_BString_ICompare_2(_InstPtr(), string._InstPtr(), length);
	}

	// int be_BString_ICompare_3(BString *self, const char* string, int32 length);
	int ICompare(char [] string, int32 length) {
		return be_BString_ICompare_3(_InstPtr(), toStringz(string), length);
	}

	// int32 be_BString_FindFirst(BString *self, const BString& string);
	int32 FindFirst(BString string) {
		return be_BString_FindFirst(_InstPtr(), string._InstPtr());
	}

	// int32 be_BString_FindFirst_1(BString *self, const char* string);
	int32 FindFirst(char [] string) {
		return be_BString_FindFirst_1(_InstPtr(), toStringz(string));
	}

	// int32 be_BString_FindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 FindFirst(BString string, int32 fromOffset) {
		return be_BString_FindFirst_2(_InstPtr(), string._InstPtr(), fromOffset);
	}

	// int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 FindFirst(char [] string, int32 fromOffset) {
		return be_BString_FindFirst_3(_InstPtr(), toStringz(string), fromOffset);
	}

	// int32 be_BString_FindFirst_4(BString *self, char c);
	int32 FindFirst(char c) {
		return be_BString_FindFirst_4(_InstPtr(), c);
	}

	// int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset);
	int32 FindFirst(char c, int32 fromOffset) {
		return be_BString_FindFirst_5(_InstPtr(), c, fromOffset);
	}

	// int32 be_BString_FindFirstChars(BString *self, const BString& string, int32 fromCharOffset);
	int32 FindFirstChars(BString string, int32 fromCharOffset) {
		return be_BString_FindFirstChars(_InstPtr(), string._InstPtr(), fromCharOffset);
	}

	// int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset);
	int32 FindFirstChars(char [] string, int32 fromCharOffset) {
		return be_BString_FindFirstChars_1(_InstPtr(), toStringz(string), fromCharOffset);
	}

	// int32 be_BString_FindLast(BString *self, const BString& string);
	int32 FindLast(BString string) {
		return be_BString_FindLast(_InstPtr(), string._InstPtr());
	}

	// int32 be_BString_FindLast_1(BString *self, const char* string);
	int32 FindLast(char [] string) {
		return be_BString_FindLast_1(_InstPtr(), toStringz(string));
	}

	// int32 be_BString_FindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 FindLast(BString string, int32 beforeOffset) {
		return be_BString_FindLast_2(_InstPtr(), string._InstPtr(), beforeOffset);
	}

	// int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 FindLast(char [] string, int32 beforeOffset) {
		return be_BString_FindLast_3(_InstPtr(), toStringz(string), beforeOffset);
	}

	// int32 be_BString_FindLast_4(BString *self, char c);
	int32 FindLast(char c) {
		return be_BString_FindLast_4(_InstPtr(), c);
	}

	// int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset);
	int32 FindLast(char c, int32 beforeOffset) {
		return be_BString_FindLast_5(_InstPtr(), c, beforeOffset);
	}

	// int32 be_BString_FindLastChars(BString *self, const BString& string, int32 beforeCharOffset);
	int32 FindLastChars(BString string, int32 beforeCharOffset) {
		return be_BString_FindLastChars(_InstPtr(), string._InstPtr(), beforeCharOffset);
	}

	// int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset);
	int32 FindLastChars(char [] string, int32 beforeCharOffset) {
		return be_BString_FindLastChars_1(_InstPtr(), toStringz(string), beforeCharOffset);
	}

	// int32 be_BString_IFindFirst(BString *self, const BString& string);
	int32 IFindFirst(BString string) {
		return be_BString_IFindFirst(_InstPtr(), string._InstPtr());
	}

	// int32 be_BString_IFindFirst_1(BString *self, const char* string);
	int32 IFindFirst(char [] string) {
		return be_BString_IFindFirst_1(_InstPtr(), toStringz(string));
	}

	// int32 be_BString_IFindFirst_2(BString *self, const BString& string, int32 fromOffset);
	int32 IFindFirst(BString string, int32 fromOffset) {
		return be_BString_IFindFirst_2(_InstPtr(), string._InstPtr(), fromOffset);
	}

	// int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 IFindFirst(char [] string, int32 fromOffset) {
		return be_BString_IFindFirst_3(_InstPtr(), toStringz(string), fromOffset);
	}

	// int32 be_BString_IFindLast(BString *self, const BString& string);
	int32 IFindLast(BString string) {
		return be_BString_IFindLast(_InstPtr(), string._InstPtr());
	}

	// int32 be_BString_IFindLast_1(BString *self, const char* string);
	int32 IFindLast(char [] string) {
		return be_BString_IFindLast_1(_InstPtr(), toStringz(string));
	}

	// int32 be_BString_IFindLast_2(BString *self, const BString& string, int32 beforeOffset);
	int32 IFindLast(BString string, int32 beforeOffset) {
		return be_BString_IFindLast_2(_InstPtr(), string._InstPtr(), beforeOffset);
	}

	// int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 IFindLast(char [] string, int32 beforeOffset) {
		return be_BString_IFindLast_3(_InstPtr(), toStringz(string), beforeOffset);
	}

	// BString & be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis);
	BString ReplaceFirst(char replaceThis, char withThis) {
		be_BString_ReplaceFirst(_InstPtr(), replaceThis, withThis);
		return this;
	}

	// BString & be_BString_ReplaceLast(BString *self, char replaceThis, char withThis);
	BString ReplaceLast(char replaceThis, char withThis) {
		be_BString_ReplaceLast(_InstPtr(), replaceThis, withThis);
		return this;
	}

	// BString & be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString ReplaceAll(char replaceThis, char withThis, int32 fromOffset) {
		be_BString_ReplaceAll(_InstPtr(), replaceThis, withThis, fromOffset);
		return this;
	}

	// BString & be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString Replace(char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset) {
		be_BString_Replace(_InstPtr(), replaceThis, withThis, maxReplaceCount, fromOffset);
		return this;
	}

	// BString & be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString ReplaceFirst(char [] replaceThis, char [] withThis) {
		be_BString_ReplaceFirst_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis));
		return this;
	}

	// BString & be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString ReplaceLast(char [] replaceThis, char [] withThis) {
		be_BString_ReplaceLast_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis));
		return this;
	}

	// BString & be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString ReplaceAll(char [] replaceThis, char [] withThis, int32 fromOffset) {
		be_BString_ReplaceAll_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis), fromOffset);
		return this;
	}

	// BString & be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString Replace(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromOffset) {
		be_BString_Replace_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromOffset);
		return this;
	}

	// BString & be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset);
	BString ReplaceAllChars(char [] replaceThis, char [] withThis, int32 fromCharOffset) {
		be_BString_ReplaceAllChars(_InstPtr(), toStringz(replaceThis), toStringz(withThis), fromCharOffset);
		return this;
	}

	// BString & be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset);
	BString ReplaceChars(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromCharOffset) {
		be_BString_ReplaceChars(_InstPtr(), toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromCharOffset);
		return this;
	}

	// BString & be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis);
	BString IReplaceFirst(char replaceThis, char withThis) {
		be_BString_IReplaceFirst(_InstPtr(), replaceThis, withThis);
		return this;
	}

	// BString & be_BString_IReplaceLast(BString *self, char replaceThis, char withThis);
	BString IReplaceLast(char replaceThis, char withThis) {
		be_BString_IReplaceLast(_InstPtr(), replaceThis, withThis);
		return this;
	}

	// BString & be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	BString IReplaceAll(char replaceThis, char withThis, int32 fromOffset) {
		be_BString_IReplaceAll(_InstPtr(), replaceThis, withThis, fromOffset);
		return this;
	}

	// BString & be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	BString IReplace(char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset) {
		be_BString_IReplace(_InstPtr(), replaceThis, withThis, maxReplaceCount, fromOffset);
		return this;
	}

	// BString & be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	BString IReplaceFirst(char [] replaceThis, char [] withThis) {
		be_BString_IReplaceFirst_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis));
		return this;
	}

	// BString & be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	BString IReplaceLast(char [] replaceThis, char [] withThis) {
		be_BString_IReplaceLast_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis));
		return this;
	}

	// BString & be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	BString IReplaceAll(char [] replaceThis, char [] withThis, int32 fromOffset) {
		be_BString_IReplaceAll_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis), fromOffset);
		return this;
	}

	// BString & be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	BString IReplace(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromOffset) {
		be_BString_IReplace_1(_InstPtr(), toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromOffset);
		return this;
	}

	// BString & be_BString_ReplaceSet(BString *self, const char* setOfBytes, char _with);
	BString ReplaceSet(char [] setOfBytes, char _with) {
		be_BString_ReplaceSet(_InstPtr(), toStringz(setOfBytes), _with);
		return this;
	}

	// BString & be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* _with);
	BString ReplaceSet(char [] setOfBytes, char [] _with) {
		be_BString_ReplaceSet_1(_InstPtr(), toStringz(setOfBytes), toStringz(_with));
		return this;
	}

	// BString & be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* _with);
	BString ReplaceCharsSet(char [] setOfChars, char [] _with) {
		be_BString_ReplaceCharsSet(_InstPtr(), toStringz(setOfChars), toStringz(_with));
		return this;
	}

	// char be_BString_ByteAt(BString *self, int32 index);
	char ByteAt(int32 index) {
		return be_BString_ByteAt(_InstPtr(), index);
	}

	// const char* be_BString_CharAt(BString *self, int32 charIndex, int32* bytes);
	char* CharAt(int32 charIndex, inout int32 bytes) {
		assert(false, "BString::CharAt fix me!");
//		return be_BString_CharAt(_InstPtr());
	}

	// bool be_BString_CharAt_1(BString *self, int32 charIndex, char* buffer, int32* bytes);
	bool CharAt(int32 charIndex, inout char [] buffer, inout int32 bytes) {
		assert(false, "BString::CharAt fix me!");
//		char *buff = cast(char *)malloc(bytes)
//		return be_BString_CharAt_1(_InstPtr());
	}

	// char* be_BString_LockBuffer(BString *self, int32 maxLength);
	char* LockBuffer(int32 maxLength) {
		return be_BString_LockBuffer(_InstPtr(), maxLength);
	}

	// BString & be_BString_UnlockBuffer(BString *self, int32 length);
	BString UnlockBuffer(int32 length) {
		be_BString_UnlockBuffer(_InstPtr(), length);
		return this;
	}

	// BString & be_BString_ToLower(BString *self);
	BString ToLower() {
		be_BString_ToLower(_InstPtr());
		return this;
	}

	// BString & be_BString_ToUpper(BString *self);
	BString ToUpper() {
		be_BString_ToUpper(_InstPtr());
		return this;
	}

	// BString & be_BString_Capitalize(BString *self);
	BString Capitalize() {
		be_BString_Capitalize(_InstPtr());
		return this;
	}

	// BString & be_BString_CapitalizeEachWord(BString *self);
	BString CapitalizeEachWord() {
		be_BString_CapitalizeEachWord(_InstPtr());
		return this;
	}

	// BString & be_BString_CharacterEscape(BString *self, const char* original, const char* setOfCharsToEscape, char escapeWith);
	BString CharacterEscape(char [] original, char [] setOfCharsToEscape, char escapeWith) {
		be_BString_CharacterEscape(_InstPtr(), toStringz(original), toStringz(setOfCharsToEscape), escapeWith);
		return this;
	}

	// BString & be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith);
	BString CharacterEscape(char [] setOfCharsToEscape, char escapeWith) {
		be_BString_CharacterEscape_1(_InstPtr(), toStringz(setOfCharsToEscape), escapeWith);
		return this;
	}

	// BString & be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar);
	BString CharacterDeescape(char [] original, char escapeChar) {
		be_BString_CharacterDeescape(_InstPtr(), toStringz(original), escapeChar);
		return this;
	}

	// BString & be_BString_CharacterDeescape_1(BString *self, char escapeChar);
	BString CharacterDeescape(char escapeChar) {
		be_BString_CharacterDeescape_1(_InstPtr(), escapeChar);
		return this;
	}

	// BString & be_BString_Trim(BString *self);
	BString Trim() {
		be_BString_Trim(_InstPtr());
		return this;
	}

	// BString & be_BString_opShl(BString *self, const char* string);
	BString opShl(char [] string) {
		be_BString_opShl(_InstPtr(), toStringz(string));
		return this;	
	}
	
	// BString & be_BString_opShl_1(BString *self, const BString& string);
	BString opShl(BString string) {
		be_BString_opShl_1(_InstPtr(), string._InstPtr());
		return this;
	}

	// BString & be_BString_opShl_2(BString *self, char c);
	BString opShl(char c) {
		be_BString_opShl_2(_InstPtr(), c);
		return this;	
	}

	// BString & be_BString_opShl_3(BString *self, int value);
	BString opShl(int value) {
		be_BString_opShl_3(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_4(BString *self, unsigned int value);
	BString opShl(uint value) {
		be_BString_opShl_4(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_5(BString *self, uint32 value);
	BString opShl(uint32 value) {
		be_BString_opShl_5(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_6(BString *self, int32 value);
	BString opShl(int32 value) {
		be_BString_opShl_6(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_7(BString *self, uint64 value);
	BString opShl(uint64 value) {
		be_BString_opShl_7(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_8(BString *self, int64 value);
	BString opShl(int64 value) {
		be_BString_opShl_8(_InstPtr(), value);
		return this;	
	}

	// BString & be_BString_opShl_9(BString *self, float value);
	BString opShl(float value) {
		be_BString_opShl_9(_InstPtr(), value);
		return this;	
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


