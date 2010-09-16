/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <String.h>



extern "C" {
	BString* be_BString_ctor(void *bindInstPtr)
	{
		return new BString();
	}

	BString* be_BString_ctor_1(void *bindInstPtr, const char * string)
	{
		return new BString(string);
	}

	BString* be_BString_ctor_2(void *bindInstPtr, const BString * string)
	{
		return new BString(*string);
	}

	BString* be_BString_ctor_3(void *bindInstPtr, const char * string, int32 maxLength)
	{
		return new BString(string, maxLength);
	}

	void be_BString_dtor(BString* self)
	{
		delete self;
	}

	const char* be_BString_String(BString *self)
	{
		return self->String();
	}

	int32 be_BString_Length(BString *self)
	{
		return self->Length();
	}

	int32 be_BString_CountChars(BString *self)
	{
		return self->CountChars();
	}

	int32 be_BString_CountBytes(BString *self, int32 fromCharOffset, int32 charCount)
	{
		return self->CountBytes(fromCharOffset, charCount);
	}

	BString * be_BString_opAssign(BString *self, const BString * string)
	{
		return &self->operator=(*string);
	}

	BString * be_BString_opAssign_1(BString *self, const char * string)
	{
		return &self->operator=(string);
	}

	BString * be_BString_opAssign_2(BString *self, char c)
	{
		return &self->operator=(c);
	}

	BString * be_BString_SetTo(BString *self, const char * string)
	{
		return &self->SetTo(string);
	}

	BString * be_BString_SetTo_1(BString *self, const char * string, int32 maxLength)
	{
		return &self->SetTo(string, maxLength);
	}

	BString * be_BString_SetTo_2(BString *self, const BString * string)
	{
		return &self->SetTo(*string);
	}

	BString * be_BString_Adopt(BString *self, BString * from)
	{
		return &self->Adopt(*from);
	}

	BString * be_BString_SetTo_3(BString *self, const BString * string, int32 maxLength)
	{
		return &self->SetTo(*string, maxLength);
	}

	BString * be_BString_Adopt_1(BString *self, BString * from, int32 maxLength)
	{
		return &self->Adopt(*from, maxLength);
	}

	BString * be_BString_SetTo_4(BString *self, char c, int32 count)
	{
		return &self->SetTo(c, count);
	}

	BString * be_BString_SetToChars(BString *self, const char * string, int32 charCount)
	{
		return &self->SetToChars(string, charCount);
	}

	BString * be_BString_SetToChars_1(BString *self, const BString * string, int32 charCount)
	{
		return &self->SetToChars(*string, charCount);
	}

	BString * be_BString_AdoptChars(BString *self, BString * from, int32 charCount)
	{
		return &self->AdoptChars(*from, charCount);
	}

	BString * be_BString_CopyInto(BString *self, BString* into, int32 fromOffset, int32 length)
	{
		return &self->CopyInto(*into, fromOffset, length);
	}

	void be_BString_CopyInto_1(BString *self, char* into, int32 fromOffset, int32 length)
	{
		self->CopyInto(into, fromOffset, length);
	}

	BString * be_BString_CopyCharsInto(BString *self, BString* into, int32 fromCharOffset, int32 charCount)
	{
		return &self->CopyCharsInto(*into, fromCharOffset, charCount);
	}

	void be_BString_CopyCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount)
	{
		self->CopyCharsInto(into, intoLength, fromCharOffset, charCount);
	}

	BString * be_BString_opAddAssign(BString *self, const BString* string)
	{
		return &self->operator+=(*string);
	}

	BString * be_BString_opAddAssign_1(BString *self, const char* string)
	{
		return &self->operator+=(string);
	}

	BString * be_BString_opAddAssign_2(BString *self, char c)
	{
		return &self->operator+=(c);
	}

	BString * be_BString_Append(BString *self, const BString* string)
	{
		return &self->Append(*string);
	}

	BString * be_BString_Append_1(BString *self, const char* string)
	{
		return &self->Append(string);
	}

	BString * be_BString_Append_2(BString *self, const BString* string, int32 length)
	{
		return &self->Append(*string, length);
	}

	BString * be_BString_Append_3(BString *self, const char* string, int32 length)
	{
		return &self->Append(string, length);
	}

	BString * be_BString_Append_4(BString *self, char c, int32 count)
	{
		return &self->Append(c, count);
	}

	BString * be_BString_AppendChars(BString *self, const BString* string, int32 charCount)
	{
		return &self->AppendChars(*string, charCount);
	}

	BString * be_BString_AppendChars_1(BString *self, const char* string, int32 charCount)
	{
		return &self->AppendChars(string, charCount);
	}

	BString * be_BString_Prepend(BString *self, const char* string)
	{
		return &self->Prepend(string);
	}

	BString * be_BString_Prepend_1(BString *self, const BString* string)
	{
		return &self->Prepend(*string);
	}

	BString * be_BString_Prepend_2(BString *self, const char* string, int32 length)
	{
		return &self->Prepend(string, length);
	}

	BString * be_BString_Prepend_3(BString *self, const BString* string, int32 length)
	{
		return &self->Prepend(*string, length);
	}

	BString * be_BString_Prepend_4(BString *self, char c, int32 count)
	{
		return &self->Prepend(c, count);
	}

	BString * be_BString_PrependChars(BString *self, const char* string, int32 charCount)
	{
		return &self->PrependChars(string, charCount);
	}

	BString * be_BString_PrependChars_1(BString *self, const BString* string, int32 charCount)
	{
		return &self->PrependChars(*string, charCount);
	}

	BString * be_BString_Insert(BString *self, const char* string, int32 position)
	{
		return &self->Insert(string, position);
	}

	BString * be_BString_Insert_1(BString *self, const char* string, int32 length, int32 position)
	{
		return &self->Insert(string, length, position);
	}

	BString * be_BString_Insert_2(BString *self, const char* string, int32 fromOffset, int32 length, int32 position)
	{
		return &self->Insert(string, fromOffset, length, position);
	}

	BString * be_BString_Insert_3(BString *self, const BString* string, int32 position)
	{
		return &self->Insert(*string, position);
	}

	BString * be_BString_Insert_4(BString *self, const BString* string, int32 length, int32 position)
	{
		return &self->Insert(*string, length, position);
	}

	BString * be_BString_Insert_5(BString *self, const BString* string, int32 fromOffset, int32 length, int32 position)
	{
		return &self->Insert(*string, fromOffset, length, position);
	}

	BString * be_BString_Insert_6(BString *self, char c, int32 count, int32 position)
	{
		return &self->Insert(c, count, position);
	}

	BString * be_BString_InsertChars(BString *self, const char* string, int32 charPosition)
	{
		return &self->InsertChars(string, charPosition);
	}

	BString * be_BString_InsertChars_1(BString *self, const char* string, int32 charCount, int32 charPosition)
	{
		return &self->InsertChars(string, charCount, charPosition);
	}

	BString * be_BString_InsertChars_2(BString *self, const char* string, int32 fromCharOffset, int32 charCount, int32 charPosition)
	{
		return &self->InsertChars(string, fromCharOffset, charCount, charPosition);
	}

	BString * be_BString_InsertChars_3(BString *self, const BString* string, int32 charPosition)
	{
		return &self->InsertChars(*string, charPosition);
	}

	BString * be_BString_InsertChars_4(BString *self, const BString* string, int32 charCount, int32 charPosition)
	{
		return &self->InsertChars(*string, charCount, charPosition);
	}

	BString * be_BString_InsertChars_5(BString *self, const BString* string, int32 fromCharOffset, int32 charCount, int32 charPosition)
	{
		return &self->InsertChars(*string, fromCharOffset, charCount, charPosition);
	}

	BString * be_BString_Truncate(BString *self, int32 newLength, bool lazy)
	{
		return &self->Truncate(newLength, lazy);
	}

	BString * be_BString_TruncateChars(BString *self, int32 newCharCount, bool lazy)
	{
		return &self->TruncateChars(newCharCount, lazy);
	}

	BString * be_BString_Remove(BString *self, int32 from, int32 length)
	{
		return &self->Remove(from, length);
	}

	BString * be_BString_RemoveChars(BString *self, int32 fromCharOffset, int32 charCount)
	{
		return &self->RemoveChars(fromCharOffset, charCount);
	}

	BString * be_BString_RemoveFirst(BString *self, const BString* string)
	{
		return &self->RemoveFirst(*string);
	}

	BString * be_BString_RemoveLast(BString *self, const BString* string)
	{
		return &self->RemoveLast(*string);
	}

	BString * be_BString_RemoveAll(BString *self, const BString* string)
	{
		return &self->RemoveAll(*string);
	}

	BString * be_BString_RemoveFirst_1(BString *self, const char* string)
	{
		return &self->RemoveFirst(string);
	}

	BString * be_BString_RemoveLast_1(BString *self, const char* string)
	{
		return &self->RemoveLast(string);
	}

	BString * be_BString_RemoveAll_1(BString *self, const char* string)
	{
		return &self->RemoveAll(string);
	}

	BString * be_BString_RemoveSet(BString *self, const char* setOfBytesToRemove)
	{
		return &self->RemoveSet(setOfBytesToRemove);
	}

	BString * be_BString_RemoveCharsSet(BString *self, const char* setOfCharsToRemove)
	{
		return &self->RemoveCharsSet(setOfCharsToRemove);
	}

	BString * be_BString_MoveInto(BString *self, BString* into, int32 from, int32 length)
	{
		return &self->MoveInto(*into, from, length);
	}

	void be_BString_MoveInto_1(BString *self, char* into, int32 from, int32 length)
	{
		self->MoveInto(into, from, length);
	}

	BString * be_BString_MoveCharsInto(BString *self, BString* into, int32 fromCharOffset, int32 charCount)
	{
		return &self->MoveCharsInto(*into, fromCharOffset, charCount);
	}

	void be_BString_MoveCharsInto_1(BString *self, char* into, int32* intoLength, int32 fromCharOffset, int32 charCount)
	{
		self->MoveCharsInto(into, intoLength, fromCharOffset, charCount);
	}

	bool be_BString_opCmpLess(BString *self, const BString* string)
	{
		return self->operator<(*string);
	}

	bool be_BString_opCmpLessEqual(BString *self, const BString* string)
	{
		return self->operator<=(*string);
	}

	bool be_BString_opEquals(BString *self, const BString* string)
	{
		return self->operator==(*string);
	}

	bool be_BString_opCmpGreaterEqual(BString *self, const BString* string)
	{
		return self->operator>=(*string);
	}

	bool be_BString_opCmpGreater(BString *self, const BString* string)
	{
		return self->operator>(*string);
	}

	bool be_BString_opNotEquals(BString *self, const BString* string)
	{
		return self->operator!=(*string);
	}

	bool be_BString_opCmpLess_1(BString *self, const char* string)
	{
		return self->operator<(string);
	}

	bool be_BString_opCmpLessEqual_1(BString *self, const char* string)
	{
		return self->operator<=(string);
	}

	bool be_BString_opEquals_1(BString *self, const char* string)
	{
		return self->operator==(string);
	}

	bool be_BString_opCmpGreaterEqual_1(BString *self, const char* string)
	{
		return self->operator>=(string);
	}

	bool be_BString_opCmpGreater_1(BString *self, const char* string)
	{
		return self->operator>(string);
	}

	bool be_BString_opNotEquals_1(BString *self, const char* string)
	{
		return self->operator!=(string);
	}

	int be_BString_Compare(BString *self, const BString* string)
	{
		return self->Compare(*string);
	}

	int be_BString_Compare_1(BString *self, const char* string)
	{
		return self->Compare(string);
	}

	int be_BString_Compare_2(BString *self, const BString* string, int32 length)
	{
		return self->Compare(*string, length);
	}

	int be_BString_Compare_3(BString *self, const char* string, int32 length)
	{
		return self->Compare(string, length);
	}

	int be_BString_CompareChars(BString *self, const BString* string, int32 charCount)
	{
		return self->CompareChars(*string, charCount);
	}

	int be_BString_CompareChars_1(BString *self, const char* string, int32 charCount)
	{
		return self->CompareChars(string, charCount);
	}

	int be_BString_ICompare(BString *self, const BString* string)
	{
		return self->ICompare(*string);
	}

	int be_BString_ICompare_1(BString *self, const char* string)
	{
		return self->ICompare(string);
	}

	int be_BString_ICompare_2(BString *self, const BString* string, int32 length)
	{
		return self->ICompare(*string, length);
	}

	int be_BString_ICompare_3(BString *self, const char* string, int32 length)
	{
		return self->ICompare(string, length);
	}

	int32 be_BString_FindFirst(BString *self, const BString* string)
	{
		return self->FindFirst(*string);
	}

	int32 be_BString_FindFirst_1(BString *self, const char* string)
	{
		return self->FindFirst(string);
	}

	int32 be_BString_FindFirst_2(BString *self, const BString* string, int32 fromOffset)
	{
		return self->FindFirst(*string, fromOffset);
	}

	int32 be_BString_FindFirst_3(BString *self, const char* string, int32 fromOffset)
	{
		return self->FindFirst(string, fromOffset);
	}

	int32 be_BString_FindFirst_4(BString *self, char c)
	{
		return self->FindFirst(c);
	}

	int32 be_BString_FindFirst_5(BString *self, char c, int32 fromOffset)
	{
		return self->FindFirst(c, fromOffset);
	}

	int32 be_BString_FindFirstChars(BString *self, const BString* string, int32 fromCharOffset)
	{
		return self->FindFirstChars(*string, fromCharOffset);
	}

	int32 be_BString_FindFirstChars_1(BString *self, const char* string, int32 fromCharOffset)
	{
		return self->FindFirstChars(string, fromCharOffset);
	}

	int32 be_BString_FindLast(BString *self, const BString* string)
	{
		return self->FindLast(*string);
	}

	int32 be_BString_FindLast_1(BString *self, const char* string)
	{
		return self->FindLast(string);
	}

	int32 be_BString_FindLast_2(BString *self, const BString* string, int32 beforeOffset)
	{
		return self->FindLast(*string, beforeOffset);
	}

	int32 be_BString_FindLast_3(BString *self, const char* string, int32 beforeOffset)
	{
		return self->FindLast(string, beforeOffset);
	}

	int32 be_BString_FindLast_4(BString *self, char c)
	{
		return self->FindLast(c);
	}

	int32 be_BString_FindLast_5(BString *self, char c, int32 beforeOffset)
	{
		return self->FindLast(c, beforeOffset);
	}

	int32 be_BString_FindLastChars(BString *self, const BString* string, int32 beforeCharOffset)
	{
		return self->FindLastChars(*string, beforeCharOffset);
	}

	int32 be_BString_FindLastChars_1(BString *self, const char* string, int32 beforeCharOffset)
	{
		return self->FindLastChars(string, beforeCharOffset);
	}

	int32 be_BString_IFindFirst(BString *self, const BString* string)
	{
		return self->IFindFirst(*string);
	}

	int32 be_BString_IFindFirst_1(BString *self, const char* string)
	{
		return self->IFindFirst(string);
	}

	int32 be_BString_IFindFirst_2(BString *self, const BString* string, int32 fromOffset)
	{
		return self->IFindFirst(*string, fromOffset);
	}

	int32 be_BString_IFindFirst_3(BString *self, const char* string, int32 fromOffset)
	{
		return self->IFindFirst(string, fromOffset);
	}

	int32 be_BString_IFindLast(BString *self, const BString* string)
	{
		return self->IFindLast(*string);
	}

	int32 be_BString_IFindLast_1(BString *self, const char* string)
	{
		return self->IFindLast(string);
	}

	int32 be_BString_IFindLast_2(BString *self, const BString* string, int32 beforeOffset)
	{
		return self->IFindLast(*string, beforeOffset);
	}

	int32 be_BString_IFindLast_3(BString *self, const char* string, int32 beforeOffset)
	{
		return self->IFindLast(string, beforeOffset);
	}

	BString * be_BString_ReplaceFirst(BString *self, char replaceThis, char withThis)
	{
		return &self->ReplaceFirst(replaceThis, withThis);
	}

	BString * be_BString_ReplaceLast(BString *self, char replaceThis, char withThis)
	{
		return &self->ReplaceLast(replaceThis, withThis);
	}

	BString * be_BString_ReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset)
	{
		return &self->ReplaceAll(replaceThis, withThis, fromOffset);
	}

	BString * be_BString_Replace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset)
	{
		return &self->Replace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	BString * be_BString_ReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis)
	{
		return &self->ReplaceFirst(replaceThis, withThis);
	}

	BString * be_BString_ReplaceLast_1(BString *self, const char* replaceThis, const char* withThis)
	{
		return &self->ReplaceLast(replaceThis, withThis);
	}

	BString * be_BString_ReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset)
	{
		return &self->ReplaceAll(replaceThis, withThis, fromOffset);
	}

	BString * be_BString_Replace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset)
	{
		return &self->Replace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	BString * be_BString_ReplaceAllChars(BString *self, const char* replaceThis, const char* withThis, int32 fromCharOffset)
	{
		return &self->ReplaceAllChars(replaceThis, withThis, fromCharOffset);
	}

	BString * be_BString_ReplaceChars(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset)
	{
		return &self->ReplaceChars(replaceThis, withThis, maxReplaceCount, fromCharOffset);
	}

	BString * be_BString_IReplaceFirst(BString *self, char replaceThis, char withThis)
	{
		return &self->IReplaceFirst(replaceThis, withThis);
	}

	BString * be_BString_IReplaceLast(BString *self, char replaceThis, char withThis)
	{
		return &self->IReplaceLast(replaceThis, withThis);
	}

	BString * be_BString_IReplaceAll(BString *self, char replaceThis, char withThis, int32 fromOffset)
	{
		return &self->IReplaceAll(replaceThis, withThis, fromOffset);
	}

	BString * be_BString_IReplace(BString *self, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset)
	{
		return &self->IReplace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	BString * be_BString_IReplaceFirst_1(BString *self, const char* replaceThis, const char* withThis)
	{
		return &self->IReplaceFirst(replaceThis, withThis);
	}

	BString * be_BString_IReplaceLast_1(BString *self, const char* replaceThis, const char* withThis)
	{
		return &self->IReplaceLast(replaceThis, withThis);
	}

	BString * be_BString_IReplaceAll_1(BString *self, const char* replaceThis, const char* withThis, int32 fromOffset)
	{
		return &self->IReplaceAll(replaceThis, withThis, fromOffset);
	}

	BString * be_BString_IReplace_1(BString *self, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset)
	{
		return &self->IReplace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	BString * be_BString_ReplaceSet(BString *self, const char* setOfBytes, char with)
	{
		return &self->ReplaceSet(setOfBytes, with);
	}

	BString * be_BString_ReplaceSet_1(BString *self, const char* setOfBytes, const char* with)
	{
		return &self->ReplaceSet(setOfBytes, with);
	}

	BString * be_BString_ReplaceCharsSet(BString *self, const char* setOfChars, const char* with)
	{
		return &self->ReplaceCharsSet(setOfChars, with);
	}

	char be_BString_ByteAt(BString *self, int32 index)
	{
		return self->ByteAt(index);
	}

	const char* be_BString_CharAt(BString *self, int32 charIndex, int32* bytes)
	{
		return self->CharAt(charIndex, bytes);
	}

	bool be_BString_CharAt_1(BString *self, int32 charIndex, char* buffer, int32* bytes)
	{
		return self->CharAt(charIndex, buffer, bytes);
	}

	char* be_BString_LockBuffer(BString *self, int32 maxLength)
	{
		return self->LockBuffer(maxLength);
	}

	BString * be_BString_UnlockBuffer(BString *self, int32 length)
	{
		return &self->UnlockBuffer(length);
	}

	BString * be_BString_ToLower(BString *self)
	{
		return &self->ToLower();
	}

	BString * be_BString_ToUpper(BString *self)
	{
		return &self->ToUpper();
	}

	BString * be_BString_Capitalize(BString *self)
	{
		return &self->Capitalize();
	}

	BString * be_BString_CapitalizeEachWord(BString *self)
	{
		return &self->CapitalizeEachWord();
	}

	BString * be_BString_CharacterEscape(BString *self, const char* original, const char* setOfCharsToEscape, char escapeWith)
	{
		return &self->CharacterEscape(original, setOfCharsToEscape, escapeWith);
	}

	BString * be_BString_CharacterEscape_1(BString *self, const char* setOfCharsToEscape, char escapeWith)
	{
		return &self->CharacterEscape(setOfCharsToEscape, escapeWith);
	}

	BString * be_BString_CharacterDeescape(BString *self, const char* original, char escapeChar)
	{
		return &self->CharacterDeescape(original, escapeChar);
	}

	BString * be_BString_CharacterDeescape_1(BString *self, char escapeChar)
	{
		return &self->CharacterDeescape(escapeChar);
	}

	BString * be_BString_Trim(BString *self)
	{
		return &self->Trim();
	}

	BString * be_BString_opShl(BString *self, const char* string)
	{
		return &self->operator<<(string);
	}

	BString * be_BString_opShl_1(BString *self, const BString* string)
	{
		return &self->operator<<(*string);
	}

	BString * be_BString_opShl_2(BString *self, char c)
	{
		return &self->operator<<(c);
	}

	BString * be_BString_opShl_3(BString *self, int value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_4(BString *self, unsigned int value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_5(BString *self, uint32 value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_6(BString *self, int32 value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_7(BString *self, uint64 value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_8(BString *self, int64 value)
	{
		return &self->operator<<(value);
	}

	BString * be_BString_opShl_9(BString *self, float value)
	{
		return &self->operator<<(value);
	}

}

