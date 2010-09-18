/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

extern (C) extern {
	// BString* be_BString_ctor(void *bindInstPtr);
	void * be_BString_ctor(void *bindInstPtr);

	// BString* be_BString_ctor_1(void *bindInstPtr, const char * string);
	void * be_BString_ctor_1(void *bindInstPtr,  char * string);

	// BString* be_BString_ctor_2(void *bindInstPtr, const BString * string);
	void * be_BString_ctor_2(void *bindInstPtr,  void * string);

	// BString* be_BString_ctor_3(void *bindInstPtr, const char * string, int32 maxLength);
	void * be_BString_ctor_3(void *bindInstPtr,  char * string, int32 maxLength);

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
	void * be_BString_opAssign(void *self,  void * string);

	// BString * be_BString_opAssign_1(BString *self, const char * string);
	void * be_BString_opAssign_1(void *self,  char * string);

	// BString * be_BString_opAssign_2(BString *self, char c);
	void * be_BString_opAssign_2(void *self, char c);

	// BString * be_BString_SetTo(BString *self, const char * string);
	void * be_BString_SetTo(void *self,  char * string);

	// BString * be_BString_SetTo_1(BString *self, const char * string, int32 maxLength);
	void * be_BString_SetTo_1(void *self,  char * string, int32 maxLength);

	// BString * be_BString_SetTo_2(BString *self, const BString * string);
	void * be_BString_SetTo_2(void *self,  void * string);

	// BString * be_BString_Adopt(BString *self, BString * from);
	void * be_BString_Adopt(void *self, void * from);

	// BString * be_BString_SetTo_3(BString *self, const BString * string, int32 maxLength);
	void * be_BString_SetTo_3(void *self,  void * string, int32 maxLength);

	// BString * be_BString_Adopt_1(BString *self, BString * from, int32 maxLength);
	void * be_BString_Adopt_1(void *self, void * from, int32 maxLength);

	// BString * be_BString_SetTo_4(BString *self, char c, int32 count);
	void * be_BString_SetTo_4(void *self, char c, int32 count);

	// BString * be_BString_SetToChars(BString *self, const char * string, int32 charCount);
	void * be_BString_SetToChars(void *self,  char * string, int32 charCount);

	// BString * be_BString_SetToChars_1(BString *self, const BString * string, int32 charCount);
	void * be_BString_SetToChars_1(void *self,  void * string, int32 charCount);

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
	void * be_BString_opAddAssign(void *self,  void* string);

	// BString * be_BString_opAddAssign_1(BString *self, const char* string);
	void * be_BString_opAddAssign_1(void *self,  char* string);

	// BString * be_BString_opAddAssign_2(BString *self, char c);
	void * be_BString_opAddAssign_2(void *self, char c);

	// BString * be_BString_Append(BString *self, const BString* string);
	void * be_BString_Append(void *self,  void* string);

	// BString * be_BString_Append_1(BString *self, const char* string);
	void * be_BString_Append_1(void *self,  char* string);

	// BString * be_BString_Append_2(BString *self, const BString* string, int32 length);
	void * be_BString_Append_2(void *self,  void* string, int32 length);

	// BString * be_BString_Append_3(BString *self, const char* string, int32 length);
	void * be_BString_Append_3(void *self,  char* string, int32 length);

	// BString * be_BString_Append_4(BString *self, char c, int32 count);
	void * be_BString_Append_4(void *self, char c, int32 count);

	// BString * be_BString_AppendChars(BString *self, const BString* string, int32 charCount);
	void * be_BString_AppendChars(void *self,  void* string, int32 charCount);

	// BString * be_BString_AppendChars_1(BString *self, const char* string, int32 charCount);
	void * be_BString_AppendChars_1(void *self,  char* string, int32 charCount);

	// BString * be_BString_Prepend(BString *self, const char* string);
	void * be_BString_Prepend(void *self,  char* string);

	// BString * be_BString_Prepend_1(BString *self, const BString* string);
	void * be_BString_Prepend_1(void *self,  void* string);

	// BString * be_BString_Prepend_2(BString *self, const char* string, int32 length);
	void * be_BString_Prepend_2(void *self,  char* string, int32 length);

	// BString * be_BString_Prepend_3(BString *self, const BString* string, int32 length);
	void * be_BString_Prepend_3(void *self,  void* string, int32 length);

	// BString * be_BString_Prepend_4(BString *self, char c, int32 count);
	void * be_BString_Prepend_4(void *self, char c, int32 count);

	// BString * be_BString_PrependChars(BString *self, const char* string, int32 charCount);
	void * be_BString_PrependChars(void *self,  char* string, int32 charCount);

	// BString * be_BString_PrependChars_1(BString *self, const BString* string, int32 charCount);
	void * be_BString_PrependChars_1(void *self,  void* string, int32 charCount);

	// BString * be_BString_Insert(BString *self, const char* string, int32 position);
	void * be_BString_Insert(void *self,  char* string, int32 position);

	// BString * be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position);
	void * be_BString_Insert_1(void *self,  char* string, int32 length, int32 position);

	// BString * be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position);
	void * be_BString_Insert_2(void *self,  char* string, int32 fromOffset, int32 length, int32 position);

	// BString * be_BString_Insert_3(BString *self, const BString* string, int32 position);
	void * be_BString_Insert_3(void *self,  void* string, int32 position);

	// BString * be_BString_Insert_4(BString *self, const BString* string, int32 length, int32 position);
	void * be_BString_Insert_4(void *self,  void* string, int32 length, int32 position);

	// BString * be_BString_Insert_5(BString *self, const BString* string, int32 fromOffset, int32 length, int32 position);
	void * be_BString_Insert_5(void *self,  void* string, int32 fromOffset, int32 length, int32 position);

	// BString * be_BString_Insert_6(BString *self, char c, int32 count, int32 position);
	void * be_BString_Insert_6(void *self, char c, int32 count, int32 position);

	// BString * be_BString_InsertChars(BString *self, const char* string, int32 charPosition);
	void * be_BString_InsertChars(void *self,  char* string, int32 charPosition);

	// BString * be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_1(void *self,  char* string, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_2(void *self,  char* string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_3(BString *self, const BString* string, int32 charPosition);
	void * be_BString_InsertChars_3(void *self,  void* string, int32 charPosition);

	// BString * be_BString_InsertChars_4(BString *self, const BString* string, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_4(void *self,  void* string, int32 charCount, int32 charPosition);

	// BString * be_BString_InsertChars_5(BString *self, const BString* string, int32 fromCharOffset, int32 charCount, int32 charPosition);
	void * be_BString_InsertChars_5(void *self,  void* string, int32 fromCharOffset, int32 charCount, int32 charPosition);

	// BString * be_BString_Truncate(BString *self, int32 newLength, bool lazy);
	void * be_BString_Truncate(void *self, int32 newLength, bool _lazy);

	// BString * be_BString_TruncateChars(BString *self, int32 newCharCount, bool lazy);
	void * be_BString_TruncateChars(void *self, int32 newCharCount, bool _lazy);

	// BString * be_BString_Remove(BString *self, int32 from, int32 length);
	void * be_BString_Remove(void *self, int32 from, int32 length);

	// BString * be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount);
	void * be_BString_RemoveChars(void *self, int32 fromCharOffset, int32 charCount);

	// BString * be_BString_RemoveFirst(BString *self, const BString* string);
	void * be_BString_RemoveFirst(void *self,  void* string);

	// BString * be_BString_RemoveLast(BString *self, const BString* string);
	void * be_BString_RemoveLast(void *self,  void* string);

	// BString * be_BString_RemoveAll(BString *self, const BString* string);
	void * be_BString_RemoveAll(void *self,  void* string);

	// BString * be_BString_RemoveFirst_1(BString *self, const char* string);
	void * be_BString_RemoveFirst_1(void *self,  char* string);

	// BString * be_BString_RemoveLast_1(BString *self, const char* string);
	void * be_BString_RemoveLast_1(void *self,  char* string);

	// BString * be_BString_RemoveAll_1(BString *self, const char* string);
	void * be_BString_RemoveAll_1(void *self,  char* string);

	// BString * be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove);
	void * be_BString_RemoveSet(void *self,  char* setOfBytesToRemove);

	// BString * be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove);
	void * be_BString_RemoveCharsSet(void *self,  char* setOfCharsToRemove);

	// BString * be_BString_MoveInto(BString *self, BString* into, int32 from, int32 length);
	void * be_BString_MoveInto(void *self, void* into, int32 from, int32 length);

	// void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length);
	void be_BString_MoveInto_1(void *self, char* into, int32 from, int32 length);

	// BString * be_BString_MoveCharsInto(BString *self, BString* into, int32 fromCharOffset, int32 charCount);
	void * be_BString_MoveCharsInto(void *self, void* into, int32 fromCharOffset, int32 charCount);

	// void be_BString_MoveCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);
	void be_BString_MoveCharsInto_1(void *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount);

	// bool be_BString_opCmpLess(BString *self, const BString* string);
	bool be_BString_opCmpLess(void *self,  void* string);

	// bool be_BString_opCmpLessEqual(BString *self, const BString* string);
	bool be_BString_opCmpLessEqual(void *self,  void* string);

	// bool be_BString_opEquals(BString *self, const BString* string);
	bool be_BString_opEquals(void *self,  void* string);

	// bool be_BString_opCmpGreaterEqual(BString *self, const BString* string);
	bool be_BString_opCmpGreaterEqual(void *self,  void* string);

	// bool be_BString_opCmpGreater(BString *self, const BString* string);
	bool be_BString_opCmpGreater(void *self,  void* string);

	// bool be_BString_opNotEquals(BString *self, const BString* string);
	bool be_BString_opNotEquals(void *self,  void* string);

	// bool be_BString_opCmpLess_1(BString *self, const char* string);
	bool be_BString_opCmpLess_1(void *self,  char* string);

	// bool be_BString_opCmpLessEqual_1(BString *self, const char* string);
	bool be_BString_opCmpLessEqual_1(void *self,  char* string);

	// bool be_BString_opEquals_1(BString *self, const char* string);
	bool be_BString_opEquals_1(void *self,  char* string);

	// bool be_BString_opCmpGreaterEqual_1(BString *self, const char* string);
	bool be_BString_opCmpGreaterEqual_1(void *self,  char* string);

	// bool be_BString_opCmpGreater_1(BString *self, const char* string);
	bool be_BString_opCmpGreater_1(void *self,  char* string);

	// bool be_BString_opNotEquals_1(BString *self, const char* string);
	bool be_BString_opNotEquals_1(void *self,  char* string);

	// int be_BString_Compare(BString *self, const BString* string);
	int be_BString_Compare(void *self,  void* string);

	// int be_BString_Compare_1(BString *self, const char* string);
	int be_BString_Compare_1(void *self,  char* string);

	// int be_BString_Compare_2(BString *self, const BString* string, int32 length);
	int be_BString_Compare_2(void *self,  void* string, int32 length);

	// int be_BString_Compare_3(BString *self, const char* string, int32 length);
	int be_BString_Compare_3(void *self,  char* string, int32 length);

	// int be_BString_CompareChars(BString *self, const BString* string, int32 charCount);
	int be_BString_CompareChars(void *self,  void* string, int32 charCount);

	// int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount);
	int be_BString_CompareChars_1(void *self,  char* string, int32 charCount);

	// int be_BString_ICompare(BString *self, const BString* string);
	int be_BString_ICompare(void *self,  void* string);

	// int be_BString_ICompare_1(BString *self, const char* string);
	int be_BString_ICompare_1(void *self,  char* string);

	// int be_BString_ICompare_2(BString *self, const BString* string, int32 length);
	int be_BString_ICompare_2(void *self,  void* string, int32 length);

	// int be_BString_ICompare_3(BString *self, const char* string, int32 length);
	int be_BString_ICompare_3(void *self,  char* string, int32 length);

	// int32 be_BString_FindFirst(BString *self, const BString* string);
	int32 be_BString_FindFirst(void *self,  void* string);

	// int32 be_BString_FindFirst_1(BString *self, const char* string);
	int32 be_BString_FindFirst_1(void *self,  char* string);

	// int32 be_BString_FindFirst_2(BString *self, const BString* string, int32 fromOffset);
	int32 be_BString_FindFirst_2(void *self,  void* string, int32 fromOffset);

	// int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 be_BString_FindFirst_3(void *self,  char* string, int32 fromOffset);

	// int32 be_BString_FindFirst_4(BString *self, char c);
	int32 be_BString_FindFirst_4(void *self, char c);

	// int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset);
	int32 be_BString_FindFirst_5(void *self, char c, int32 fromOffset);

	// int32 be_BString_FindFirstChars(BString *self, const BString* string, int32 fromCharOffset);
	int32 be_BString_FindFirstChars(void *self,  void* string, int32 fromCharOffset);

	// int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset);
	int32 be_BString_FindFirstChars_1(void *self,  char* string, int32 fromCharOffset);

	// int32 be_BString_FindLast(BString *self, const BString* string);
	int32 be_BString_FindLast(void *self,  void* string);

	// int32 be_BString_FindLast_1(BString *self, const char* string);
	int32 be_BString_FindLast_1(void *self,  char* string);

	// int32 be_BString_FindLast_2(BString *self, const BString* string, int32 beforeOffset);
	int32 be_BString_FindLast_2(void *self,  void* string, int32 beforeOffset);

	// int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 be_BString_FindLast_3(void *self,  char* string, int32 beforeOffset);

	// int32 be_BString_FindLast_4(BString *self, char c);
	int32 be_BString_FindLast_4(void *self, char c);

	// int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset);
	int32 be_BString_FindLast_5(void *self, char c, int32 beforeOffset);

	// int32 be_BString_FindLastChars(BString *self, const BString* string, int32 beforeCharOffset);
	int32 be_BString_FindLastChars(void *self,  void* string, int32 beforeCharOffset);

	// int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset);
	int32 be_BString_FindLastChars_1(void *self,  char* string, int32 beforeCharOffset);

	// int32 be_BString_IFindFirst(BString *self, const BString* string);
	int32 be_BString_IFindFirst(void *self,  void* string);

	// int32 be_BString_IFindFirst_1(BString *self, const char* string);
	int32 be_BString_IFindFirst_1(void *self,  char* string);

	// int32 be_BString_IFindFirst_2(BString *self, const BString* string, int32 fromOffset);
	int32 be_BString_IFindFirst_2(void *self,  void* string, int32 fromOffset);

	// int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset);
	int32 be_BString_IFindFirst_3(void *self,  char* string, int32 fromOffset);

	// int32 be_BString_IFindLast(BString *self, const BString* string);
	int32 be_BString_IFindLast(void *self,  void* string);

	// int32 be_BString_IFindLast_1(BString *self, const char* string);
	int32 be_BString_IFindLast_1(void *self,  char* string);

	// int32 be_BString_IFindLast_2(BString *self, const BString* string, int32 beforeOffset);
	int32 be_BString_IFindLast_2(void *self,  void* string, int32 beforeOffset);

	// int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset);
	int32 be_BString_IFindLast_3(void *self,  char* string, int32 beforeOffset);

	// BString * be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis);
	void * be_BString_ReplaceFirst(void *self, char replaceThis, char _withThis);

	// BString * be_BString_ReplaceLast(BString *self, char replaceThis, char withThis);
	void * be_BString_ReplaceLast(void *self, char replaceThis, char _withThis);

	// BString * be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	void * be_BString_ReplaceAll(void *self, char replaceThis, char _withThis, int32 fromOffset);

	// BString * be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_Replace(void *self, char replaceThis, char _withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_ReplaceFirst_1(void *self,  char* replaceThis,  char* _withThis);

	// BString * be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_ReplaceLast_1(void *self,  char* replaceThis,  char* _withThis);

	// BString * be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	void * be_BString_ReplaceAll_1(void *self,  char* replaceThis,  char* _withThis, int32 fromOffset);

	// BString * be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_Replace_1(void *self,  char* replaceThis,  char* _withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset);
	void * be_BString_ReplaceAllChars(void *self,  char* replaceThis,  char* _withThis, int32 fromCharOffset);

	// BString * be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset);
	void * be_BString_ReplaceChars(void *self,  char* replaceThis,  char* _withThis, int32 maxReplaceCount, int32 fromCharOffset);

	// BString * be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis);
	void * be_BString_IReplaceFirst(void *self, char replaceThis, char _withThis);

	// BString * be_BString_IReplaceLast(BString *self, char replaceThis, char withThis);
	void * be_BString_IReplaceLast(void *self, char replaceThis, char _withThis);

	// BString * be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset);
	void * be_BString_IReplaceAll(void *self, char replaceThis, char _withThis, int32 fromOffset);

	// BString * be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_IReplace(void *self, char replaceThis, char _withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_IReplaceFirst_1(void *self,  char* replaceThis,  char* _withThis);

	// BString * be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis);
	void * be_BString_IReplaceLast_1(void *self,  char* replaceThis,  char* _withThis);

	// BString * be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset);
	void * be_BString_IReplaceAll_1(void *self,  char* replaceThis,  char* _withThis, int32 fromOffset);

	// BString * be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset);
	void * be_BString_IReplace_1(void *self,  char* replaceThis,  char* _withThis, int32 maxReplaceCount, int32 fromOffset);

	// BString * be_BString_ReplaceSet(BString *self, const char* setOfBytes, char with);
	void * be_BString_ReplaceSet(void *self,  char* setOfBytes, char _with);

	// BString * be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* with);
	void * be_BString_ReplaceSet_1(void *self,  char* setOfBytes,  char* _with);

	// BString * be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* with);
	void * be_BString_ReplaceCharsSet(void *self,  char* setOfChars,  char* _with);

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
	void * be_BString_CharacterEscape(void *self,  char* original,  char* setOfCharsToEscape, char escapeWith);

	// BString * be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith);
	void * be_BString_CharacterEscape_1(void *self,  char* setOfCharsToEscape, char escapeWith);

	// BString * be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar);
	void * be_BString_CharacterDeescape(void *self,  char* original, char escapeChar);

	// BString * be_BString_CharacterDeescape_1(BString *self, char escapeChar);
	void * be_BString_CharacterDeescape_1(void *self, char escapeChar);

	// BString * be_BString_Trim(BString *self);
	void * be_BString_Trim(void *self);

	// BString * be_BString_opShl(BString *self, const char* string);
	void * be_BString_opShl(void *self,  char* string);

	// BString * be_BString_opShl_1(BString *self, const BString* string);
	void * be_BString_opShl_1(void *self,  void* string);

	// BString * be_BString_opShl_2(BString *self, char c);
	void * be_BString_opShl_2(void *self, char c);

	// BString * be_BString_opShl_3(BString *self, int value);
	void * be_BString_opShl_3(void *self, int value);

	// BString * be_BString_opShl_4(BString *self, unsigned int value);
	void * be_BString_opShl_4(void *self,  int value);

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

