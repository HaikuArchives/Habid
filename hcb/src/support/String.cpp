#include <support/String.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_String.h>

extern "C" {

}

/* end class BFlattenableBridge */

BStringBridge::BStringBridge()
: BString()
{ }

BStringBridge::BStringBridge(const char* string)
: BString(string)
{ }

BStringBridge::BStringBridge(const BString& string)
: BString(string)
{ }

BStringBridge::BStringBridge(const char* string, int32 maxLength)
: BString(string, maxLength)
{ }

BStringBridge::~BStringBridge()
{ }

/* end class BFlattenableBridge */

/* begin class BFlattenableProxy */

BStringProxy::BStringProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BStringBridge()
{ }

BStringProxy::BStringProxy(void *bindInstPointer, const char* string)
: fBindInstPointer(bindInstPointer), BStringBridge(string)
{ }

BStringProxy::BStringProxy(void *bindInstPointer, const BString& string)
: fBindInstPointer(bindInstPointer), BStringBridge(string)
{ }

BStringProxy::BStringProxy(void *bindInstPointer, const char* string, int32 maxLength)
: fBindInstPointer(bindInstPointer), BStringBridge(string, maxLength)
{ }

BStringProxy::~BStringProxy()
{ }

/* end class BFlattenableProxy */

extern "C" {
	be_BString *be_BString_ctor_1(void *bindInstPointer) {
		return (be_BString *)new BStringProxy(bindInstPointer);
	}
	
	be_BString *be_BString_ctor_2(void *bindInstPointer, const char* string) {
		return (be_BString *)new BStringProxy(bindInstPointer, string);
	}
	
	be_BString *be_BString_ctor_3(void *bindInstPointer, const be_BString *string) {
		return (be_BString *)new BStringProxy(bindInstPointer, *(BString *)string);
	}
	
	be_BString *be_BString_ctor_4(void *bindInstPointer, const char* string, int32 maxLength) {
		return (be_BString *)new BStringProxy(bindInstPointer, string, maxLength);
	}
	
	void be_BString_dtor(void *instPointer) {
		delete (BStringProxy *)instPointer;
	}

	// Access	
	const char*	be_BString_String(be_BString *instPointer) {
		return ((BStringProxy *)instPointer)->String();
	}
	
	int32 be_BString_Length(be_BString *instPointer) {
		return ((BStringProxy *)instPointer)->Length();
	}
	
	int32 be_BString_CountChars(be_BString *instPointer) {
		return ((BStringProxy *)instPointer)->CountChars();
	}
	
	int32 be_BString_CountBytes(be_BString *instPointer, int32 fromCharOffset, int32 charCount) {
		return ((BStringProxy *)instPointer)->CountBytes(fromCharOffset, charCount);
	}

	// Assignment
/*
			BString&		operator=(const BString& string);
			BString&		operator=(const char* string);
			BString&		operator=(char c);
*/

	be_BString * be_BString_SetTo_1(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetTo(string);
	}

	be_BString * be_BString_SetTo_2(be_BString *instPointer, const char *string, int32 maxLength) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetTo(string, maxLength);
	}

	be_BString * be_BString_SetTo_3(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetTo(*(BString *)string);
	}
		
	be_BString * be_BString_Adopt_1(be_BString *instPointer, be_BString *from) {
		return (be_BString *)&((BStringProxy *)instPointer)->Adopt(*(BString *)from);
	}
	
	be_BString * be_BString_SetTo_4(be_BString *instPointer, const be_BString *string, int32 maxLength) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetTo(*(BString *)string, maxLength);
	}

	be_BString * be_BString_Adopt_2(be_BString *instPointer, be_BString *from, int32 maxLength) {
		return (be_BString *)&((BStringProxy *)instPointer)->Adopt(*(BString *)from, maxLength);
	}

	be_BString * be_BString_SetTo_5(be_BString *instPointer, char c, int32 count) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetTo(c, count);
	}
	
	be_BString * be_BString_SetToChars_1(be_BString *instPointer, const char *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetToChars(string, charCount);
	}

	be_BString * be_BString_SetToChars_2(be_BString *instPointer, const be_BString *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->SetToChars(*(BString *)string, charCount);
	}

	be_BString * be_BString_AdoptChars(be_BString *instPointer, be_BString *from, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->AdoptChars(*(BString *)from, charCount);
	}

	// Substring copying	
	be_BString * be_BString_CopyInto_1(be_BString *instPointer, be_BString *into, int32 fromOffset, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->CopyInto(*(BString *)into, fromOffset, length);
	}
	
	void be_BString_CopyInto_2(be_BString *instPointer, char *into, int32 fromOffset, int32 length) {
		((BStringProxy *)instPointer)->CopyInto(into, fromOffset, length);
	}

	be_BString * be_BString_CopyCharsInto_1(be_BString *instPointer, be_BString *into, int32 fromOffset, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->CopyCharsInto(*(BString *)into, fromOffset, length);
	}

	void be_BString_CopyCharsInto_2(be_BString *instPointer, char *into, int32 *intoLength, int32 fromOffset, int32 length) {
		((BStringProxy *)instPointer)->CopyCharsInto(into, intoLength, fromOffset, length);
	}
		

	// Appending

/*
			BString&		operator+=(const BString& string);
			BString&		operator+=(const char* string);
			BString&		operator+=(char c);
*/

	be_BString * be_BString_Append_1(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->Append(*(BString *)string);	
	}

	be_BString * be_BString_Append_2(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->Append(string);	
	}

	be_BString * be_BString_Append_3(be_BString *instPointer, const be_BString *string, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->Append(*(BString *)string, length);	
	}

	be_BString * be_BString_Append_4(be_BString *instPointer, const char *string, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->Append(string, length);
	}

	be_BString * be_BString_Append_5(be_BString *instPointer, char c, int32 count) {
		return (be_BString *)&((BStringProxy *)instPointer)->Append(c, count);	
	}

	be_BString * be_BString_AppendChars_1(be_BString *instPointer, const be_BString *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->AppendChars(*(BString *)string, charCount);
	}

	be_BString * be_BString_AppendChars_2(be_BString *instPointer, const char *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->AppendChars(string, charCount);
	}

	// Prepending
	be_BString * be_BString_Prepend_1(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->Prepend(string);
	}

	be_BString * be_BString_Prepend_2(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->Prepend(*(BString *)string);
	}

	be_BString * be_BString_Prepend_3(be_BString *instPointer, const char *string, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->Prepend(string, length);
	}

	be_BString * be_BString_Prepend_4(be_BString *instPointer, const be_BString *string, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->Prepend(*(BString *)string, length);
	}

	be_BString * be_BString_Prepend_5(be_BString *instPointer, char c, int32 count) {
		return (be_BString *)&((BStringProxy *)instPointer)->Prepend(c, count);
	}

	be_BString * be_BString_PrependChars_1(be_BString *instPointer, const char *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->PrependChars(string, charCount);
	}

	be_BString * be_BString_PrependChars_2(be_BString *instPointer, const be_BString *string, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->PrependChars(*(BString *)string, charCount);
	}


	// Inserting
	be_BString * be_BString_Insert_1(be_BString *instPointer, const char *string, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(string, position);
	}

	be_BString * be_BString_Insert_2(be_BString *instPointer, const char *string, int32 length, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(string, length, position);
	}

	be_BString * be_BString_Insert_3(be_BString *instPointer, const char *string, int32 fromOffset, int32 length, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(string, fromOffset, length, position);
	}

	be_BString * be_BString_Insert_4(be_BString *instPointer, const be_BString *string, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(*(BString *)string, position);
	}

	be_BString * be_BString_Insert_5(be_BString *instPointer, const be_BString *string, int32 length, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(*(BString *)string, length, position);
	}

	be_BString * be_BString_Insert_6(be_BString *instPointer, const be_BString *string, int32 fromOffset, int32 length, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(*(BString *)string, fromOffset, length, position);
	}

	be_BString * be_BString_Insert_7(be_BString *instPointer, const char c, int32 count, int32 position) {
		return (be_BString *)&((BStringProxy *)instPointer)->Insert(c, count, position);
	}
	
	be_BString * be_BString_InsertChars_1(be_BString *instPointer, const char *string, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(string, charPosition);
	}

	be_BString * be_BString_InsertChars_2(be_BString *instPointer, const char *string, int32 charCount, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(string, charCount, charPosition);
	}

	be_BString * be_BString_InsertChars_3(be_BString *instPointer, const char *string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(string, fromCharOffset, charCount, charPosition);
	}

	be_BString * be_BString_InsertChars_4(be_BString *instPointer, const be_BString *string, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(*(BString *)string, charPosition);
	}

	be_BString * be_BString_InsertChars_5(be_BString *instPointer, const be_BString *string, int32 charCount, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(*(BString *)string, charCount, charPosition);
	}

	be_BString * be_BString_InsertChars_6(be_BString *instPointer, const be_BString *string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		return (be_BString *)&((BStringProxy *)instPointer)->InsertChars(*(BString *)string, fromCharOffset, charCount, charPosition);
	}

	// Removing
	
	be_BString * be_BString_Truncate(be_BString *instPointer, int32 newLength, bool lazy) {
		return (be_BString *)&((BStringProxy *)instPointer)->Truncate(newLength, lazy);
	}
	
	be_BString * be_BString_TruncateChars(be_BString *instPointer, int32 newCharCount, bool lazy) {
		return (be_BString *)&((BStringProxy *)instPointer)->TruncateChars(newCharCount, lazy);
	}


	be_BString * be_BString_Remove(be_BString *instPointer, int32 from, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->Remove(from, length);
	}

	be_BString * be_BString_RemoveChars(be_BString *instPointer, int32 fromCharOffset, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveChars(fromCharOffset, charCount);
	}

	be_BString * be_BString_RemoveFirst_1(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveFirst(*(BString *)string);
	}

	be_BString * be_BString_RemoveLast_1(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveLast(*(BString *)string);
	}

	be_BString * be_BString_RemoveAll_1(be_BString *instPointer, const be_BString *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveAll(*(BString *)string);
	}

	be_BString * be_BString_RemoveFirst_2(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveFirst(string);
	}

	be_BString * be_BString_RemoveLast_2(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveLast(string);
	}

	be_BString * be_BString_RemoveAll_2(be_BString *instPointer, const char *string) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveAll(string);
	}

	be_BString * be_BString_RemoveSet(be_BString *instPointer, const char *setOfBytesToRemove) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveSet(setOfBytesToRemove);
	}

	be_BString * be_BString_RemoveCharsSet(be_BString *instPointer, const char *setOfCharsToRemove) {
		return (be_BString *)&((BStringProxy *)instPointer)->RemoveCharsSet(setOfCharsToRemove);
	}
	
	be_BString * be_BString_MoveInto_1(be_BString *instPointer, const be_BString *into, int32 from, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->MoveInto(*(BString *)into, from, length);
	}

	void be_BString_MoveInto_2(be_BString *instPointer, char *into, int32 from, int32 length) {
		((BStringProxy *)instPointer)->MoveInto(into, from, length);
	}

	be_BString * be_BString_MoveCharsInto_1(be_BString *instPointer, const be_BString *into, int32 fromCharOffset, int32 charCount) {
		return (be_BString *)&((BStringProxy *)instPointer)->MoveCharsInto(*(BString *)into, fromCharOffset, charCount);
	}

	void be_BString_MoveCharsInto_2(be_BString *instPointer, char *into, int32 *intoLength, int32 fromCharOffset, int32 charCount) {
		((BStringProxy *)instPointer)->MoveCharsInto(into, intoLength, fromCharOffset, charCount);
	}

/*

			// Compare functions
			bool			operator<(const BString& string) const;
			bool			operator<=(const BString& string) const;
			bool			operator==(const BString& string) const;
			bool			operator>=(const BString& string) const;
			bool			operator>(const BString& string) const;
			bool			operator!=(const BString& string) const;

			bool			operator<(const char* string) const;
			bool			operator<=(const char* string) const;
			bool			operator==(const char* string) const;
			bool			operator>=(const char* string) const;
			bool			operator>(const char* string) const;
			bool			operator!=(const char* string) const;

							operator const char*() const;
*/

	int be_BString_Compare_1(be_BString *instPointer, const be_BString *string) {
		return ((BStringProxy *)instPointer)->Compare(*(BString *)string);
	}
	int be_BString_Compare_2(be_BString *instPointer, const char *string) {
		return ((BStringProxy *)instPointer)->Compare(string);
	}
	int be_BString_Compare_3(be_BString *instPointer, const be_BString *string, int32 length) {
		return ((BStringProxy *)instPointer)->Compare(*(BString *)string, length);
	}
	int be_BString_Compare_4(be_BString *instPointer, const char *string, int32 length) {
		return ((BStringProxy *)instPointer)->Compare(string, length);
	}

	int	be_BString_CompareChars_1(be_BString *instPointer, const be_BString* string, int32 charCount) {
		return ((BStringProxy *)instPointer)->CompareChars(*(BString *)string, charCount);
	}
	
	int	be_BString_CompareChars_2(be_BString *instPointer, const char* string, int32 charCount) {
		return ((BStringProxy *)instPointer)->CompareChars(string, charCount);
	}
	

	int	be_BString_ICompare_1(be_BString *instPointer, const be_BString* string) {
		return ((BStringProxy *)instPointer)->ICompare(*(BString *)string);
	}
	int	be_BString_ICompare_2(be_BString *instPointer, const char* string) {
		return ((BStringProxy *)instPointer)->ICompare(string);
	}
	int	be_BString_ICompare_3(be_BString *instPointer, const be_BString* string, int32 length) {
		return ((BStringProxy *)instPointer)->ICompare(*(BString *)string, length);
	}
	int	be_BString_ICompare_4(be_BString *instPointer, const char* string, int32 length) {
		return ((BStringProxy *)instPointer)->ICompare(string, length);
	}

	// Searching
	int32 be_BString_FindFirst_1(be_BString *instPointer, const be_BString* string) {
		return ((BStringProxy *)instPointer)->FindFirst(*(BString *)string);
	}
	
	int32 be_BString_FindFirst_2(be_BString *instPointer, const char* string) {
		return ((BStringProxy *)instPointer)->FindFirst(string);
	}

	int32 be_BString_FindFirst_3(be_BString *instPointer, const be_BString* string, int32 fromOffset) {
		return ((BStringProxy *)instPointer)->FindFirst(*(BString *)string, fromOffset);
	}

	int32 be_BString_FindFirst_4(be_BString *instPointer, const char* string, int32 fromOffset) {
		return ((BStringProxy *)instPointer)->FindFirst(string, fromOffset);
	}

	int32 be_BString_FindFirst_5(be_BString *instPointer, char c) {
		return ((BStringProxy *)instPointer)->FindFirst(c);
	}

	int32 be_BString_FindFirst_6(be_BString *instPointer, char c, int32 fromOffset) {
		return ((BStringProxy *)instPointer)->FindFirst(c, fromOffset);
	}


	int32 be_BString_FindFirstChars_1(be_BString *instPointer, const be_BString* string, int32 fromCharOffset) {
		return ((BStringProxy *)instPointer)->FindFirstChars(*(BString *)string, fromCharOffset);
	}

	int32 be_BString_FindFirstChars_2(be_BString *instPointer, const char* string, int32 fromCharOffset) {
		return ((BStringProxy *)instPointer)->FindFirstChars(string, fromCharOffset);
	}

	int32 be_BString_FindLast_1(be_BString *instPointer, const be_BString* string) {
		return ((BStringProxy *)instPointer)->FindLast(*(BString *)string);
	}
	
	int32 be_BString_FindLast_2(be_BString *instPointer, const char* string) {
		return ((BStringProxy *)instPointer)->FindLast(string);
	}
	
	int32 be_BString_FindLast_3(be_BString *instPointer, const be_BString* string, int32 beforeOffset) {
		return ((BStringProxy *)instPointer)->FindLast(*(BString *)string, beforeOffset);
	}
	
	int32 be_BString_FindLast_4(be_BString *instPointer, const char* string, int32 beforeOffset) {
		return ((BStringProxy *)instPointer)->FindLast(string, beforeOffset);
	}
	
	int32 be_BString_FindLast_5(be_BString *instPointer, char c) {
		return ((BStringProxy *)instPointer)->FindLast(c);
	}
	
	int32 be_BString_FindLast_6(be_BString *instPointer, char c, int32 beforeOffset) {
		return ((BStringProxy *)instPointer)->FindLast(c, beforeOffset);
	}

	int32 be_BString_FindLastChars_1(be_BString *instPointer, const be_BString* string, int32 beforeCharOffset) {
		return ((BStringProxy *)instPointer)->FindLastChars(*(BString *)string, beforeCharOffset);
	}
	
	int32 be_BString_FindLastChars_2(be_BString *instPointer, const char* string, int32 beforeCharOffset) {
		return ((BStringProxy *)instPointer)->FindLastChars(string, beforeCharOffset);
	}
	

	int32 be_BString_IFindFirst_1(be_BString *instPointer, const be_BString* string) {
		return ((BStringProxy *)instPointer)->IFindFirst(*(BString *)string);
	}
	
	int32 be_BString_IFindFirst_2(be_BString *instPointer, const char* string) {
		return ((BStringProxy *)instPointer)->IFindFirst(string);
	}

	int32 be_BString_IFindFirst_3(be_BString *instPointer, const be_BString* string, int32 fromOffset) {
		return ((BStringProxy *)instPointer)->IFindFirst(*(BString *)string, fromOffset);
	}

	int32 be_BString_IFindFirst_4(be_BString *instPointer, const char* string, int32 fromOffset) {
		return ((BStringProxy *)instPointer)->IFindFirst(string, fromOffset);
	}


	int32 be_BString_IFindLast_1(be_BString *instPointer, const be_BString* string) {
		return ((BStringProxy *)instPointer)->IFindFirst(*(BString *)string);
	}

	int32 be_BString_IFindLast_2(be_BString *instPointer, const char* string) {
		return ((BStringProxy *)instPointer)->IFindFirst(string);
	}

	int32 be_BString_IFindLast_3(be_BString *instPointer, const be_BString* string, int32 beforeOffset) {
		return ((BStringProxy *)instPointer)->IFindFirst(*(BString *)string, beforeOffset);
	}

	int32 be_BString_IFindLast_4(be_BString *instPointer, const char* string, int32 beforeOffset) {
		return ((BStringProxy *)instPointer)->IFindFirst(string, beforeOffset);
	}

	// Replacing
	be_BString * be_BString_ReplaceFirst_1(be_BString *instPointer, char replaceThis, char withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceFirst(replaceThis, withThis);
	}
	
	be_BString * be_BString_ReplaceLast_1(be_BString *instPointer, char replaceThis, char withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceLast(replaceThis, withThis);
	}

	be_BString * be_BString_ReplaceAll_1(be_BString *instPointer, char replaceThis, char withThis, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceAll(replaceThis, withThis, fromOffset);
	}

	be_BString * be_BString_Replace_1(be_BString *instPointer, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->Replace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	be_BString * be_BString_ReplaceFirst_2(be_BString *instPointer, const char* replaceThis, const char* withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceFirst(replaceThis, withThis);
	}

	be_BString * be_BString_ReplaceLast_2(be_BString *instPointer, const char* replaceThis, const char* withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceLast(replaceThis, withThis);
	}

	be_BString * be_BString_ReplaceAll_2(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceAll(replaceThis, withThis, fromOffset);
	}

	be_BString * be_BString_Replace_2(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->Replace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}


	be_BString * be_BString_ReplaceAllChars(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 fromCharOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceAllChars(replaceThis, withThis, fromCharOffset);
	}

	be_BString * be_BString_ReplaceChars(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromCharOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceChars(replaceThis, withThis, maxReplaceCount, fromCharOffset);
	}


	be_BString * be_BString_IReplaceFirst_1(be_BString *instPointer, char replaceThis, char withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceFirst(replaceThis, withThis);
	}

	be_BString * be_BString_IReplaceLast_1(be_BString *instPointer, char replaceThis, char withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceLast(replaceThis, withThis);
	}

	be_BString * be_BString_IReplaceAll_1(be_BString *instPointer, char replaceThis, char withThis, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceAll(replaceThis, withThis, fromOffset);
	}

	be_BString * be_BString_IReplace_1(be_BString *instPointer, char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}

	be_BString * be_BString_IReplaceFirst_2(be_BString *instPointer, const char* replaceThis, const char* withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceFirst(replaceThis, withThis);
	}

	be_BString * be_BString_IReplaceLast_2(be_BString *instPointer, const char* replaceThis, const char* withThis) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceLast(replaceThis, withThis);
	}

	be_BString * be_BString_IReplaceAll_2(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 fromOffset) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplaceAll(replaceThis, withThis, fromOffset);
	}

	be_BString * be_BString_IReplace_2(be_BString *instPointer, const char* replaceThis, const char* withThis, int32 maxReplaceCount, int32 fromOffset ) {
		return (be_BString *)&((BStringProxy *)instPointer)->IReplace(replaceThis, withThis, maxReplaceCount, fromOffset);
	}


	be_BString * be_BString_ReplaceSet_1(be_BString *instPointer, const char* setOfBytes, char with) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceSet(setOfBytes, with);
	}

	be_BString * be_BString_ReplaceSet_2(be_BString *instPointer, const char* setOfBytes, const char* with) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceSet(setOfBytes, with);
	}


	be_BString * be_BString_ReplaceCharsSet(be_BString *instPointer, const char* setOfChars, const char* with) {
		return (be_BString *)&((BStringProxy *)instPointer)->ReplaceCharsSet(setOfChars, with);
	}

/*	
			// Unchecked char access
			char			operator[](int32 index) const;

#if __GNUC__ > 3
			BStringRef		operator[](int32 index);
#else
			char&			operator[](int32 index);
#endif

*/


	char be_BString_ByteAt(be_BString *instPointer, int32 index) {
		return ((BStringProxy *)instPointer)->ByteAt(index);
	}

	const char * be_BString_CharAt_1(be_BString *instPointer, int32 charIndex, int32* bytes) {
		return ((BStringProxy *)instPointer)->CharAt(charIndex, bytes);
	}

	bool be_BString_CharAt_2(be_BString *instPointer, int32 charIndex, char* buffer, int32* bytes) {
		return ((BStringProxy *)instPointer)->CharAt(charIndex, buffer, bytes);
	}


			// Fast low-level manipulation
	char * be_BString_LockBuffer(be_BString *instPointer, int32 maxLength) {
		return ((BStringProxy *)instPointer)->LockBuffer(maxLength);
	}

	be_BString * be_BString_UnlockBuffer(be_BString *instPointer, int32 length) {
		return (be_BString *)&((BStringProxy *)instPointer)->UnlockBuffer(length);
	}


			// Upercase <-> Lowercase
	be_BString * be_BString_ToLower(be_BString *instPointer) {
		return (be_BString *)&((BStringProxy *)instPointer)->ToLower();
	}

	be_BString * be_BString_ToUpper(be_BString *instPointer) {
		return (be_BString *)&((BStringProxy *)instPointer)->ToUpper();
	}


	be_BString * be_BString_Capitalize(be_BString *instPointer) {
		return (be_BString *)&((BStringProxy *)instPointer)->Capitalize();
	}

	be_BString * be_BString_CapitalizeEachWord(be_BString *instPointer) {
		return (be_BString *)&((BStringProxy *)instPointer)->CapitalizeEachWord();
	}

	// Escaping and De-escaping
	be_BString * be_BString_CharacterEscape_1(be_BString *instPointer, const char* original, const char* setOfCharsToEscape, char escapeWith) {
		return (be_BString *)&((BStringProxy *)instPointer)->CharacterEscape(original, setOfCharsToEscape, escapeWith);
	}

	be_BString * be_BString_CharacterEscape_2(be_BString *instPointer, const char* setOfCharsToEscape, char escapeWith) {
		return (be_BString *)&((BStringProxy *)instPointer)->CharacterEscape(setOfCharsToEscape, escapeWith);
	}

	be_BString * be_BString_CharacterDeescape_1(be_BString *instPointer, const char* original, char escapeChar) {
		return (be_BString *)&((BStringProxy *)instPointer)->CharacterDeescape(original, escapeChar);
	}

	be_BString * be_BString_CharacterDeescape_2(be_BString *instPointer, char escapeChar) {
		return (be_BString *)&((BStringProxy *)instPointer)->CharacterDeescape(escapeChar);
	}


	// Trimming
	be_BString * be_BString_Trim(be_BString *instPointer) {
		return (be_BString *)&((BStringProxy *)instPointer)->Trim();
	}
	
/*



			// Insert
			BString&		operator<<(const char* string);
			BString&		operator<<(const BString& string);
			BString&		operator<<(char c);
			BString&		operator<<(int value);
			BString&		operator<<(unsigned int value);
			BString&		operator<<(uint32 value);
			BString&		operator<<(int32 value);
			BString&		operator<<(uint64 value);
			BString&		operator<<(int64 value);
			// float output hardcodes %.2f style formatting
			BString&		operator<<(float value);
*/

}
