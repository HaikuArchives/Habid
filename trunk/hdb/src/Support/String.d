module Support.String;

import Support.BObject;

import tango.stdc.stringz;
import tango.stdc.stdlib;

import Support.SupportDefs;

import Support.types;

extern (C) extern  {
	be_BString * be_BString_ctor_1(be_BString *);
	be_BString * be_BString_ctor_2(be_BString *, char*);
	be_BString * be_BString_ctor_3(be_BString *, be_BString *);	
	be_BString * be_BString_ctor_4(be_BString *, char*, int32);
	
	void be_BString_dtor(be_BString *);

	// Access	
	char*	be_BString_String(be_BString *);
	
	int32 be_BString_Length(be_BString *);
	
	int32 be_BString_CountChars(be_BString *);
	
	int32 be_BString_CountBytes(be_BString *, int32, int32);

	// Assignment
	be_BString * be_BString_operator_assign_1(be_BString *, be_BString *);
	be_BString * be_BString_operator_assign_2(be_BString *, char *);
	be_BString * be_BString_operator_assign_3(be_BString *, char);


	be_BString * be_BString_SetTo_1(be_BString *, char *);
	be_BString * be_BString_SetTo_2(be_BString *, char *, int32);
	be_BString * be_BString_SetTo_3(be_BString *, be_BString *);
		
	be_BString * be_BString_Adopt_1(be_BString *, be_BString *);
	be_BString * be_BString_SetTo_4(be_BString *, be_BString *, int32);
	be_BString * be_BString_Adopt_2(be_BString *, be_BString *, int32);
	be_BString * be_BString_SetTo_5(be_BString *, char c, int32);
	be_BString * be_BString_SetToChars_1(be_BString *, char *, int32);
	be_BString * be_BString_SetToChars_2(be_BString *, be_BString *, int32);
	be_BString * be_BString_AdoptChars(be_BString *, be_BString *, int32);

	// Substring copying	
	be_BString * be_BString_CopyInto_1(be_BString *, be_BString *, int32, int32);
	void be_BString_CopyInto_2(be_BString *, char *, int32, int32);
	be_BString * be_BString_CopyCharsInto_1(be_BString *, be_BString *, int32, int32);
	void be_BString_CopyCharsInto_2(be_BString *, char *, int32 *, int32, int32);

	// Appending

	be_BString * be_BString_operator_addassign_1(be_BString *, be_BString *);
	be_BString * be_BString_operator_addassign_2(be_BString *, char *);
	be_BString * be_BString_operator_addassign_3(be_BString *, char);

	be_BString * be_BString_Append_1(be_BString *, be_BString *);
	be_BString * be_BString_Append_2(be_BString *, char *);
	be_BString * be_BString_Append_3(be_BString *, be_BString *, int32);
	be_BString * be_BString_Append_4(be_BString *, char *, int32);
	be_BString * be_BString_Append_5(be_BString *, char, int32);
	be_BString * be_BString_AppendChars_1(be_BString *, be_BString *, int32);
	be_BString * be_BString_AppendChars_2(be_BString *, char *, int32);

	// Prepending
	be_BString * be_BString_Prepend_1(be_BString *, char *);
	be_BString * be_BString_Prepend_2(be_BString *, be_BString *);
	be_BString * be_BString_Prepend_3(be_BString *, char *, int32);
	be_BString * be_BString_Prepend_4(be_BString *, be_BString *, int32);
	be_BString * be_BString_Prepend_5(be_BString *, char, int32);
	be_BString * be_BString_PrependChars_1(be_BString *, char *, int32);
	be_BString * be_BString_PrependChars_2(be_BString *, be_BString *, int32);

	// Inserting
	be_BString * be_BString_Insert_1(be_BString *, char *, int32);
	be_BString * be_BString_Insert_2(be_BString *, char *, int32, int32);
	be_BString * be_BString_Insert_3(be_BString *, char *, int32, int32, int32);
	be_BString * be_BString_Insert_4(be_BString *, be_BString *, int32);
	be_BString * be_BString_Insert_5(be_BString *, be_BString *, int32, int32);
	be_BString * be_BString_Insert_6(be_BString *, be_BString *, int32, int32, int32);
	be_BString * be_BString_Insert_7(be_BString *, char c, int32, int32);
	be_BString * be_BString_InsertChars_1(be_BString *, char *, int32);
	be_BString * be_BString_InsertChars_2(be_BString *, char *, int32, int32);
	be_BString * be_BString_InsertChars_3(be_BString *, char *, int32, int32, int32);
	be_BString * be_BString_InsertChars_4(be_BString *, be_BString *, int32);
	be_BString * be_BString_InsertChars_5(be_BString *, be_BString *, int32, int32);
	be_BString * be_BString_InsertChars_6(be_BString *, be_BString *, int32, int32, int32);

	// Removing
	be_BString * be_BString_Truncate(be_BString *, int32, bool);
	be_BString * be_BString_TruncateChars(be_BString *, int32, bool);
	be_BString * be_BString_Remove(be_BString *, int32, int32);
	be_BString * be_BString_RemoveChars(be_BString *, int32, int32);
	be_BString * be_BString_RemoveFirst_1(be_BString *, be_BString *);
	be_BString * be_BString_RemoveLast_1(be_BString *, be_BString *);
	be_BString * be_BString_RemoveAll_1(be_BString *, be_BString *);
	be_BString * be_BString_RemoveFirst_2(be_BString *, char *);
	be_BString * be_BString_RemoveLast_2(be_BString *, char *);
	be_BString * be_BString_RemoveAll_2(be_BString *, char *);
	be_BString * be_BString_RemoveSet(be_BString *, char *);
	be_BString * be_BString_RemoveCharsSet(be_BString *, char *);
	be_BString * be_BString_MoveInto_1(be_BString *, be_BString *, int32, int32);
	void be_BString_MoveInto_2(be_BString *, char *, int32, int32);
	be_BString * be_BString_MoveCharsInto_1(be_BString *, be_BString *, int32, int32);
	bool be_BString_MoveCharsInto_2(be_BString *, char *, int32 *, int32, int32);
	
	// Compare functions
/*
							operator char*() const;
*/

	bool be_BString_operator_cmp_less_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_less_equals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_quals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_greater_equals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_greater_1(be_BString *, be_BString *);
	bool be_BString_operator_not_equals_1(be_BString *, be_BString *);

	bool be_BString_operator_cmp_less_2(be_BString *, char *);
	bool be_BString_operator_cmp_less_equals_2(be_BString *, char *);
	bool be_BString_operator_cmp_quals_2(be_BString *, char *);
	bool be_BString_operator_cmp_greater_equals_2(be_BString *, char *);
	bool be_BString_operator_cmp_greater_2(be_BString *, char *);
	bool be_BString_operator_not_equals_2(be_BString *, char *);


	int be_BString_Compare_1(be_BString *, be_BString *);
	int be_BString_Compare_2(be_BString *, char *);
	int be_BString_Compare_3(be_BString *, be_BString *, int32);
	int be_BString_Compare_4(be_BString *, char *, int32);
	int	be_BString_CompareChars_1(be_BString *, be_BString *, int32);
	int	be_BString_CompareChars_2(be_BString *, char* string, int32);
	int	be_BString_ICompare_1(be_BString *, be_BString *);
	int	be_BString_ICompare_2(be_BString *, char* );
	int	be_BString_ICompare_3(be_BString *, be_BString *, int32);
	int	be_BString_ICompare_4(be_BString *, char* , int32);

	// Searching
	int32 be_BString_FindFirst_1(be_BString *, be_BString *);
	int32 be_BString_FindFirst_2(be_BString *, char* );
	int32 be_BString_FindFirst_3(be_BString *, be_BString *, int32);
	int32 be_BString_FindFirst_4(be_BString *, char*, int32);
	int32 be_BString_FindFirst_5(be_BString *, char);
	int32 be_BString_FindFirst_6(be_BString *, char, int32 );
	int32 be_BString_FindFirstChars_1(be_BString *, be_BString *, int32);
	int32 be_BString_FindFirstChars_2(be_BString *, char*, int32);
	int32 be_BString_FindLast_1(be_BString *, be_BString *);
	int32 be_BString_FindLast_2(be_BString *, char*);
	int32 be_BString_FindLast_3(be_BString *, be_BString *, int32 );
	int32 be_BString_FindLast_4(be_BString *, char*, int32 );
	int32 be_BString_FindLast_5(be_BString *, char);
	int32 be_BString_FindLast_6(be_BString *, char, int32);
	int32 be_BString_FindLastChars_1(be_BString *, be_BString *, int32);
	int32 be_BString_FindLastChars_2(be_BString *, char* string, int32);
	int32 be_BString_IFindFirst_1(be_BString *, be_BString *);
	int32 be_BString_IFindFirst_2(be_BString *, char*);
	int32 be_BString_IFindFirst_3(be_BString *, be_BString *, int32);
	int32 be_BString_IFindFirst_4(be_BString *, char*, int32);
	int32 be_BString_IFindLast_1(be_BString *, be_BString *);
	int32 be_BString_IFindLast_2(be_BString *, char*);
	int32 be_BString_IFindLast_3(be_BString *, be_BString *, int32);
	int32 be_BString_IFindLast_4(be_BString *, char*, int32);

	// Replacing
	be_BString * be_BString_ReplaceFirst_1(be_BString *, char, char );
	be_BString * be_BString_ReplaceLast_1(be_BString *, char, char );
	be_BString * be_BString_ReplaceAll_1(be_BString *, char, char , int32);
	be_BString * be_BString_Replace_1(be_BString *, char, char , int32, int32);
	be_BString * be_BString_ReplaceFirst_2(be_BString *, char*, char* );
	be_BString * be_BString_ReplaceLast_2(be_BString *, char*, char* );
	be_BString * be_BString_ReplaceAll_2(be_BString *, char*, char* , int32);
	be_BString * be_BString_Replace_2(be_BString *, char*, char* , int32, int32);
	be_BString * be_BString_ReplaceAllChars(be_BString *, char*, char* , int32);
	be_BString * be_BString_ReplaceChars(be_BString *, char*, char* , int32, int32);
	be_BString * be_BString_IReplaceFirst_1(be_BString *, char, char );
	be_BString * be_BString_IReplaceLast_1(be_BString *, char, char );
	be_BString * be_BString_IReplaceAll_1(be_BString *, char, char , int32);
	be_BString * be_BString_IReplace_1(be_BString *, char, char , int32, int32);
	be_BString * be_BString_IReplaceFirst_2(be_BString *, char*, char* );
	be_BString * be_BString_IReplaceLast_2(be_BString *, char*, char* );
	be_BString * be_BString_IReplaceAll_2(be_BString *, char*, char* , int32);
	be_BString * be_BString_IReplace_2(be_BString *, char*, char* , int32, int32 );
	be_BString * be_BString_ReplaceSet_1(be_BString *, char*, char );
	be_BString * be_BString_ReplaceSet_2(be_BString *, char*, char* );
	be_BString * be_BString_ReplaceCharsSet(be_BString *, char*, char* );

	// Unchecked char access
/*	
			char			operator[](int32 index) const;

#if __GNUC__ > 3
			BStringRef		operator[](int32 index);
#else
			char&			operator[](int32 index);
#endif

*/
	char be_BString_operator_index(be_BString *, int32);

	// Checked char access
	char be_BString_ByteAt(be_BString *, int32);
	char * be_BString_CharAt_1(be_BString *, int32, int32*);
	bool be_BString_CharAt_2(be_BString *, int32, char*, int32*);

	// Fast low-level manipulation
	char * be_BString_LockBuffer(be_BString *, int32);
	be_BString * be_BString_UnlockBuffer(be_BString *, int32);

	// Upercase <-> Lowercase
	be_BString * be_BString_ToLower(be_BString *);
	be_BString * be_BString_ToUpper(be_BString *);
	be_BString * be_BString_Capitalize(be_BString *);
	be_BString * be_BString_CapitalizeEachWord(be_BString *);

	// Escaping and De-escaping
	be_BString * be_BString_CharacterEscape_1(be_BString *, char*, char*, char);
	be_BString * be_BString_CharacterEscape_2(be_BString *, char*, char);
	be_BString * be_BString_CharacterDeescape_1(be_BString *, char*, char);
	be_BString * be_BString_CharacterDeescape_2(be_BString *, char);

	// Trimming
	be_BString * be_BString_Trim(be_BString *);
	
	// Insert
	be_BString * be_BString_operator_shift_left_1(be_BString *, char *);

	be_BString * be_BString_operator_shift_left_2(be_BString *, be_BString *);

	be_BString * be_BString_operator_shift_left_3(be_BString *, char);

	be_BString * be_BString_operator_shift_left_4(be_BString *, int);

	be_BString * be_BString_operator_shift_left_5(be_BString *, uint);

	be_BString * be_BString_operator_shift_left_6(be_BString *, uint32);

	be_BString * be_BString_operator_shift_left_7(be_BString *, int32);

	be_BString * be_BString_operator_shift_left_8(be_BString *, uint64);

	be_BString * be_BString_operator_shift_left_9(be_BString *, int64);

	be_BString * be_BString_operator_shift_left_10(be_BString *, float);
}


final class BString
{
public:
	mixin(BObject!("be_BString", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_1(cast(be_BString *)this);
	}
	
	this(char [] string) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_2(cast(be_BString *)this, toStringz(string));
	}
	
	this(BString string) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_3(cast(be_BString *)this, string.fInstancePointer);
	}
	
	this(char [] string, int32 maxLength) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_4(cast(be_BString *)this, toStringz(string), maxLength);
	}

	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BString_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	// Access	
	char [] String() {
		return fromStringz(be_BString_String(fInstancePointer)).dup;
	}
	
	int32 Length() {
		return be_BString_Length(fInstancePointer);
	}

	int32 CountChars() {	
		return be_BString_CountChars(fInstancePointer);
	}
	
	int32 CountBytes(int32 fromCharOffset, int32 toCharOffset) {
		return be_BString_CountBytes(fInstancePointer, fromCharOffset, toCharOffset);
	}

	// Assignment
/*
			BString&		operator=(BString& string);
*/
	BString opAssign(char [] string) {
		fInstancePointer = be_BString_operator_assign_2(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString opAssign(char c) {
		fInstancePointer = be_BString_operator_assign_3(fInstancePointer, c);
		return this;
	}
		
	
	BString SetTo(char [] string) {
		fInstancePointer = be_BString_SetTo_1(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString SetTo(char [] string, int32 maxLength) {
		fInstancePointer = be_BString_SetTo_2(fInstancePointer, toStringz(string), maxLength);
		return this;
	}

	BString SetTo(BString string) {
		fInstancePointer = be_BString_SetTo_3(fInstancePointer, string.fInstancePointer);
		return this;
	}

	BString Adopt(BString from) {
		fInstancePointer = be_BString_Adopt_1(fInstancePointer, from.fInstancePointer);
		return this;
	}
	
	BString SetTo(BString string, int32 maxLength) {
		fInstancePointer = be_BString_SetTo_4(fInstancePointer, string.fInstancePointer, maxLength);
		return this;
	}
	
	BString Adopt(BString from, int32 maxLength) {
		fInstancePointer = be_BString_Adopt_2(fInstancePointer, from.fInstancePointer, maxLength);
		return this;
	}
	
	BString SetTo(char c, int32 count) {
		fInstancePointer = be_BString_SetTo_5(fInstancePointer, c, count);
		return this;
	}

	BString SetToChars(char [] string, int32 charCount) {
		fInstancePointer = be_BString_SetToChars_1(fInstancePointer, toStringz(string), charCount);
		return this;
	}
	
	BString SetToChars(BString string, int32 charCount) {
		fInstancePointer = be_BString_SetToChars_2(fInstancePointer, string.fInstancePointer, charCount);
		return this;
	}
	
	BString AdoptChars(BString from, int32 charCount) {
		fInstancePointer = be_BString_AdoptChars(fInstancePointer, from.fInstancePointer, charCount);
		return this;
	}

	// Substring copying	
	BString CopyInto(BString into, int32 fromOffset, int32 length) {
		fInstancePointer = be_BString_CopyInto_1(fInstancePointer, into.fInstancePointer, fromOffset, length);
		return this;
	}
	
	void CopyInto(inout char [] into, int32 fromOffset, int32 length) {
		char *buffer = cast(char *)malloc(into.length);
		be_BString_CopyInto_2(fInstancePointer, buffer, fromOffset, length);
		into = fromStringz(buffer);
	
		free(buffer);
	}
	
	BString CopyCharsInto(BString into, int32 fromCharOffset, int32 charCount) {
		fInstancePointer = be_BString_CopyCharsInto_1(fInstancePointer, into.fInstancePointer, fromCharOffset, charCount);
		return this;
	}
	
	void CopyCharsInto(inout char [] into, int32 *intoLength, int32 fromCharOffset, int32 charCount) {
		be_BString_CopyCharsInto_2(fInstancePointer, into.ptr, intoLength, fromCharOffset, charCount);
	}
	
	// Appending
	
	BString opAddAssign(BString string) {
		fInstancePointer = be_BString_operator_addassign_1(fInstancePointer, string.fInstancePointer);
		return this;
	}

	BString opAddAssign(char [] string) {
		fInstancePointer = be_BString_operator_addassign_2(fInstancePointer, toStringz(string));
		return this;
	}

	BString opAddAssign(char c) {
		fInstancePointer = be_BString_operator_addassign_3(fInstancePointer, c);
		return this;
	}

	BString Append(BString string) {
		fInstancePointer = be_BString_Append_1(fInstancePointer, string.fInstancePointer);
		return this;
	}

	BString Append(char [] string) {
		fInstancePointer = be_BString_Append_2(fInstancePointer, toStringz(string));
		return this;
	}

	BString Append(BString string, int32 length) {
		fInstancePointer = be_BString_Append_3(fInstancePointer, string.fInstancePointer, length);
		return this;
	}
	
	BString Append(char [] string, int32 length) {
		fInstancePointer = 	be_BString_Append_4(fInstancePointer, toStringz(string), length);
		return this;
	}

	BString Append(char c, int32 count) {
		fInstancePointer = be_BString_Append_5(fInstancePointer, c, count);
		return this;
	}
	
	BString AppendChars(BString string, int32 charCount) {
		fInstancePointer = be_BString_AppendChars_1(fInstancePointer, string.fInstancePointer, charCount);
		return this;
	}

	BString AppendChars(char [] string, int32 charCount) {
		fInstancePointer = be_BString_AppendChars_2(fInstancePointer, toStringz(string), charCount);
		return this;
	}

	
	// Prepending
	BString Prepend(char [] string) {
		fInstancePointer = be_BString_Prepend_1(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString Prepend(BString string) {
		fInstancePointer = be_BString_Prepend_2(fInstancePointer, string.fInstancePointer);
		return this;
	}
	
	BString Prepend(char [] string, int32 length) {
		fInstancePointer = be_BString_Prepend_3(fInstancePointer, toStringz(string), length);
		return this;
	}
	
	BString Prepend(BString string, int32 length) {
		fInstancePointer = be_BString_Prepend_4(fInstancePointer, string.fInstancePointer, length);
		return this;
	}
	
	BString Prepend(char c, int32 count) {
		fInstancePointer = be_BString_Prepend_5(fInstancePointer, c, count);
		return this;
	}
		
	BString PrependChars(char [] string, int32 charCount) {
		fInstancePointer = be_BString_PrependChars_1(fInstancePointer, toStringz(string), charCount);
		return this;
	}

	BString PrependChars(BString string, int32 charCount) {
		fInstancePointer = be_BString_PrependChars_2(fInstancePointer, string.fInstancePointer, charCount);
		return this;
	}

	// Inserting
	BString Insert(char [] string, int32 position) {
		fInstancePointer = be_BString_Insert_1(fInstancePointer, toStringz(string), position);
		return this;
	}
	
	BString Insert(char [] string, int32 length, int32 position) {
		fInstancePointer = be_BString_Insert_2(fInstancePointer, toStringz(string), length, position);
		return this;
	}
	
	BString Insert(char [] string, int32 fromOffset, int32 length, int32 position) {
		fInstancePointer = be_BString_Insert_3(fInstancePointer, toStringz(string), fromOffset, length, position);
		return this;
	}
	
	BString Insert(BString string, int32 position) {
		fInstancePointer = be_BString_Insert_4(fInstancePointer, string.fInstancePointer, position);
		return this;
	}
	
	BString Insert(BString string, int32 length, int32 position) {
		fInstancePointer = be_BString_Insert_5(fInstancePointer, string.fInstancePointer, length, position);
		return this;
	}
	
	BString Insert(BString string, int32 fromOffset, int32 length, int32 position) {
		fInstancePointer = be_BString_Insert_6(fInstancePointer, string.fInstancePointer, fromOffset, length, position);
		return this;
	}
	
	BString Insert(char c, int32 count, int32 position) {
		fInstancePointer = be_BString_Insert_7(fInstancePointer, c, count, position);
		return this;
	}
	
	BString InsertChars(char [] string, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_1(fInstancePointer, toStringz(string), charPosition);
		return this;
	}
	
	BString InsertChars(char [] string, int32 charCount, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_2(fInstancePointer, toStringz(string), charCount, charPosition);
		return this;
	}
	
	BString InsertChars(char [] string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_3(fInstancePointer, toStringz(string), fromCharOffset, charCount, charPosition);
		return this;
	}
	
	BString InsertChars(BString string, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_4(fInstancePointer, string.fInstancePointer, charPosition);
		return this;
	}
	
	BString InsertChars(BString string, int32 charCount, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_5(fInstancePointer, string.fInstancePointer, charCount, charPosition);
		return this;
	}
	
	BString InsertChars(BString string, int32 fromCharOffset, int32 charCount, int32 charPosition) {
		fInstancePointer = be_BString_InsertChars_6(fInstancePointer, string.fInstancePointer, fromCharOffset, charCount, charPosition);
		return this;
	}


	// Removing
	BString Truncate(int32 newLength, bool _lazy = true) {
		fInstancePointer = be_BString_Truncate(fInstancePointer, newLength, _lazy);
		return this;
	}
	
	BString TruncateChars(int32 newCharCount, bool _lazy = true) {
		fInstancePointer = be_BString_TruncateChars(fInstancePointer, newCharCount, _lazy);
		return this;
	}
	
	BString Remove(int32 from, int32 length) {
		fInstancePointer = be_BString_Remove(fInstancePointer, from, length);
		return this;
	}
	
	BString RemoveChars(int32 fromCharOffset, int32 charCount) {
		fInstancePointer = be_BString_RemoveChars(fInstancePointer, fromCharOffset, charCount);
		return this;
	}
	
	BString RemoveFirst(BString string) {
		fInstancePointer = be_BString_RemoveFirst_1(fInstancePointer, string.fInstancePointer);
		return this;
	}
	
	BString RemoveLast(BString string) {
		fInstancePointer = be_BString_RemoveLast_1(fInstancePointer, string.fInstancePointer);
		return this;
	}
	
	BString RemoveAll(BString string) {
		fInstancePointer = be_BString_RemoveAll_1(fInstancePointer, string.fInstancePointer);
		return this;
	}
	
	BString RemoveFirst(char [] string) {
		fInstancePointer = be_BString_RemoveFirst_2(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString RemoveLast(char [] string) {
		fInstancePointer = be_BString_RemoveLast_2(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString RemoveAll(char [] string) {
		fInstancePointer = be_BString_RemoveAll_2(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString RemoveSet(char [] setOfBytesToRemove) {
		fInstancePointer = be_BString_RemoveSet(fInstancePointer, toStringz(setOfBytesToRemove));
		return this;
	}
	
	BString RemoveCharsSet(char [] setOfCharsToRemove) {
		fInstancePointer = be_BString_RemoveCharsSet(fInstancePointer, toStringz(setOfCharsToRemove));
		return this;
	}
	
	BString MoveInto(BString into, int32 from, int32 length) {
		fInstancePointer = be_BString_MoveInto_1(fInstancePointer, into.fInstancePointer, from, length);
		return this;
	}
	
	void MoveInto(inout char [] into, int32 from, int32 length) {
		char *buffer = cast(char *)malloc(into.length);
		be_BString_MoveInto_2(fInstancePointer, buffer, from, length);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
	}
	
	BString MoveCharsInto(BString into, int32 fromCharOffset, int32 charCount) {
		fInstancePointer = be_BString_MoveCharsInto_1(fInstancePointer, into.fInstancePointer, fromCharOffset, charCount);
		return this;
	}
	
	bool MoveCharsInto(inout char [] into, inout int32 intoLength, int32 fromCharOffset, int32 charCount) {
		char *buffer = cast(char *)malloc(into.length);
		
		bool ret = be_BString_MoveCharsInto_2(fInstancePointer, buffer, &intoLength, fromCharOffset, charCount);
		
		into = fromStringz(buffer).dup;
		
		free(buffer);
		
		return ret;
	}


	// Compare functions
/*
	bool be_BString_operator_cmp_less_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_less_equals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_quals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_greater_equals_1(be_BString *, be_BString *);
	bool be_BString_operator_cmp_greater_1(be_BString *, be_BString *);
	bool be_BString_operator_not_equals_1(be_BString *, be_BString *);

	bool be_BString_operator_cmp_less_2(be_BString *, char *);
	bool be_BString_operator_cmp_less_equals_2(be_BString *, char *);
	bool be_BString_operator_cmp_quals_2(be_BString *, char *);
	bool be_BString_operator_cmp_greater_equals_2(be_BString *, char *);
	bool be_BString_operator_cmp_greater_2(be_BString *, char *);
	bool be_BString_operator_not_equals_2(be_BString *, char *);
*/
	int Compare(BString string) {
		return be_BString_Compare_1(fInstancePointer, string.fInstancePointer);
	}
	
	int Compare(char [] string) {
		return be_BString_Compare_2(fInstancePointer, toStringz(string));
	}
	
	int Compare(BString string, int32 length) {
		return be_BString_Compare_3(fInstancePointer, string.fInstancePointer, length);
	}
	
	int Compare(char [] string, int32 length) {
		return be_BString_Compare_4(fInstancePointer, toStringz(string), length);
	}
	
	int	CompareChars(BString string, int32 charCount) {
		return be_BString_CompareChars_1(fInstancePointer, string.fInstancePointer, charCount);
	}
	
	int	CompareChars(char [] string, int32 charCount) {
		return be_BString_CompareChars_2(fInstancePointer, toStringz(string), charCount);
	}
	
	int	ICompare(BString string) {
		return be_BString_ICompare_1(fInstancePointer, string.fInstancePointer);
	}
	
	int	ICompare(char [] string) {
		return be_BString_ICompare_2(fInstancePointer, toStringz(string));
	}
	
	int	ICompare(BString string, int32 length) {
		return be_BString_ICompare_3(fInstancePointer, string.fInstancePointer, length);
	}
	
	int	ICompare(char [] string, int32 length) {
		return be_BString_ICompare_4(fInstancePointer, toStringz(string), length);
	}
	
	// Searching
	int32 FindFirst(BString string) {
		return be_BString_FindFirst_1(fInstancePointer, string.fInstancePointer);
	}
	
	int32 FindFirst(char [] string) {
		return be_BString_FindFirst_2(fInstancePointer, toStringz(string));
	}
	
	int32 FindFirst(BString string, int32 fromOffset) {
		return be_BString_FindFirst_3(fInstancePointer, string.fInstancePointer , fromOffset);
	}
	
	int32 FindFirst(char [] string, int32 fromOffset) {
		return be_BString_FindFirst_4(fInstancePointer, toStringz(string), fromOffset);
	}
	
	int32 FindFirst(char c) {
		return be_BString_FindFirst_5(fInstancePointer, c);
	}
	
	int32 FindFirst(char c, int32 fromOffset) {
		return be_BString_FindFirst_6(fInstancePointer, c, fromOffset);
	}

	int32 FindFirstChars(BString string, int32 fromCharOffset) {
		return be_BString_FindFirstChars_1(fInstancePointer, string.fInstancePointer , fromCharOffset);
	}
	
	int32 FindFirstChars(char [] string, int32 fromCharOffset) {
		return be_BString_FindFirstChars_2(fInstancePointer, toStringz(string), fromCharOffset);
	}
	
	int32 FindLast(BString string) {
		return be_BString_FindLast_1(fInstancePointer, string.fInstancePointer);
	}
	
	int32 FindLast(char [] string) {
		return be_BString_FindLast_2(fInstancePointer, toStringz(string));
	}
	
	int32 FindLast(BString string, int32 beforeOffset) {
		return be_BString_FindLast_3(fInstancePointer, string.fInstancePointer, beforeOffset);
	}
	
	int32 FindLast(char [] string, int32 beforeOffset) {
		return be_BString_FindLast_4(fInstancePointer, toStringz(string), beforeOffset);
	}
	
	int32 FindLast(char c) {
		return be_BString_FindLast_5(fInstancePointer, c);
	}
	
	int32 FindLast(char c, int32 beforeOffset) {
		return be_BString_FindLast_6(fInstancePointer, c, beforeOffset);
	}
	
	int32 FindLastChars(BString string, int32 beforeCharOffset) {
		return be_BString_FindLastChars_1(fInstancePointer, string.fInstancePointer, beforeCharOffset);
	}
	
	int32 FindLastChars(char [] string, int32 beforeCharOffset) {
		return be_BString_FindLastChars_2(fInstancePointer, toStringz(string), beforeCharOffset);
	}
	
	int32 IFindFirst(BString string) {
		return be_BString_IFindFirst_1(fInstancePointer, string.fInstancePointer);
	}
	
	int32 IFindFirst(char [] string) {
		return be_BString_IFindFirst_2(fInstancePointer, toStringz(string));
	}
	
	int32 IFindFirst(BString string, int32 fromOffset) {
		return be_BString_IFindFirst_3(fInstancePointer, string.fInstancePointer, fromOffset);
	}
	
	int32 IFindFirst(char [] string, int32 fromOffset) {
		return be_BString_IFindFirst_4(fInstancePointer, toStringz(string), fromOffset);
	}
	
	int32 IFindLast(BString string) {
		return be_BString_IFindLast_1(fInstancePointer, string.fInstancePointer);
	}
	
	int32 IFindLast(char [] string) {
		return be_BString_IFindLast_2(fInstancePointer, toStringz(string));
	}
	
	int32 IFindLast(BString string, int32 beforeOffset) {
		return be_BString_IFindLast_3(fInstancePointer, string.fInstancePointer, beforeOffset);
	}
	
	int32 IFindLast(char [] string, int32 beforeOffset) {
		return be_BString_IFindLast_4(fInstancePointer, toStringz(string), beforeOffset);
	}


	// Replacing
	BString ReplaceFirst(char replaceThis, char withThis) {
		fInstancePointer = be_BString_ReplaceFirst_1(fInstancePointer, replaceThis, withThis);
		return this;
	}
	
	BString ReplaceLast(char replaceThis, char withThis) {
		fInstancePointer = be_BString_ReplaceLast_1(fInstancePointer, replaceThis, withThis);
		return this;
	}
	
	BString ReplaceAll(char replaceThis, char withThis, int32 fromOffset = 0) {
		fInstancePointer = be_BString_ReplaceAll_1(fInstancePointer, replaceThis, withThis , fromOffset);
		return this;
	}
	
	BString Replace(char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset = 0) {
		fInstancePointer = be_BString_Replace_1(fInstancePointer, replaceThis, withThis, maxReplaceCount, fromOffset);
		return this;
	}
	
	BString ReplaceFirst(char [] replaceThis, char [] withThis) {
		fInstancePointer = be_BString_ReplaceFirst_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis));
		return this;
	}
	
	BString ReplaceLast(char [] replaceThis, char [] withThis) {
		fInstancePointer = be_BString_ReplaceLast_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis));
		return this;
	}
	
	BString ReplaceAll(char [] replaceThis, char [] withThis, int32 fromOffset = 0) {
		fInstancePointer = be_BString_ReplaceAll_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis), fromOffset);
		return this;
	}
	
	BString Replace(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromOffset = 0) {
		fInstancePointer = be_BString_Replace_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromOffset);
		return this;
	}
	
	BString ReplaceAllChars(char [] replaceThis, char [] withThis, int32 fromCharOffset) {
		fInstancePointer = be_BString_ReplaceAllChars(fInstancePointer, toStringz(replaceThis), toStringz(withThis), fromCharOffset);
		return this;
	}
	
	BString ReplaceChars(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromCharOffset) {
		fInstancePointer = be_BString_ReplaceChars(fInstancePointer, toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromCharOffset);
		return this;
	}
	
	BString IReplaceFirst(char replaceThis, char withThis) {
		fInstancePointer = be_BString_IReplaceFirst_1(fInstancePointer, replaceThis, withThis);
		return this;
	}
	
	BString IReplaceLast(char replaceThis, char withThis) {
		fInstancePointer = be_BString_IReplaceLast_1(fInstancePointer, replaceThis, withThis);
		return this;
	}
	
	BString IReplaceAll(char replaceThis, char withThis, int32 fromOffset = 0) {
		fInstancePointer = be_BString_IReplaceAll_1(fInstancePointer, replaceThis, withThis, fromOffset);
		return this;
	}
	
	BString IReplace(char replaceThis, char withThis, int32 maxReplaceCount, int32 fromOffset = 0) {
		fInstancePointer = be_BString_IReplace_1(fInstancePointer, replaceThis, withThis, maxReplaceCount, fromOffset);
		return this;
	}
	
	BString IReplaceFirst(char [] replaceThis, char [] withThis) {
		fInstancePointer = be_BString_IReplaceFirst_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis));
		return this;
	}
	
	BString IReplaceLast(char [] replaceThis, char [] withThis) {
		fInstancePointer = be_BString_IReplaceLast_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis));
		return this;
	}
	
	BString IReplaceAll(char [] replaceThis, char [] withThis, int32 fromOffset = 0) {
		fInstancePointer = be_BString_IReplaceAll_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis), fromOffset);
		return this;
	}
	
	BString IReplace(char [] replaceThis, char [] withThis, int32 maxReplaceCount, int32 fromOffset = 0) {
		fInstancePointer = be_BString_IReplace_2(fInstancePointer, toStringz(replaceThis), toStringz(withThis), maxReplaceCount, fromOffset);
		return this;
	}
	
	BString ReplaceSet(char [] setOfBytes, char withThis) {
		fInstancePointer = be_BString_ReplaceSet_1(fInstancePointer, toStringz(setOfBytes), withThis);
		return this;
	}
	
	BString ReplaceSet(char [] setOfBytes, char [] withThis) {
		fInstancePointer = be_BString_ReplaceSet_2(fInstancePointer, toStringz(setOfBytes), toStringz(withThis));
		return this;
	}
	
	BString ReplaceCharsSet(char [] setOfChars, char [] withThis) {
		fInstancePointer = be_BString_ReplaceCharsSet(fInstancePointer, toStringz(setOfChars), toStringz(withThis));
		return this;
	}

	// Unchecked Access
	
//	char be_BString_operator_index(be_BString *instPointer, int32 index);

	// Checked char access
	char ByteAt(int32 index) {
		return be_BString_ByteAt(fInstancePointer, index);
	}
	
	char [] CharAt(int32 charIndex, inout int32 bytes) {
		return fromStringz(be_BString_CharAt_1(fInstancePointer, charIndex, &bytes));
	}
	
	bool CharAt(int32 charIndex, inout char [] buffer, inout int32 bytes) {
		char *charbuffer;
		
		bool ret = be_BString_CharAt_2(fInstancePointer, charIndex, charbuffer, &bytes);
		
		buffer = fromStringz(charbuffer).dup;
		
		free(charbuffer);
		
		return ret;
	}
	
	// Fast low-level manipulation
	char [] LockBuffer(int32 maxLength) {
		return fromStringz(be_BString_LockBuffer(fInstancePointer, maxLength));
	}
	
	BString UnlockBuffer(int32 length = -1) {
		fInstancePointer = be_BString_UnlockBuffer(fInstancePointer, length);
		return this;
	}

	// Upercase <-> Lowercase
	BString ToLower() {
		fInstancePointer = be_BString_ToLower(fInstancePointer);
		return this;
	}
	
	BString ToUpper() {
		fInstancePointer = be_BString_ToUpper(fInstancePointer);
		return this;
	}
	
	BString Capitalize() {
		fInstancePointer = be_BString_Capitalize(fInstancePointer);
		return this;
	}
	
	BString CapitalizeEachWord() {
		fInstancePointer = be_BString_CapitalizeEachWord(fInstancePointer);
		return this;
	}

	// Escaping and De-escaping
	BString CharacterEscape(char [] original, char [] setOfCharsToEscape, char escapeWith) {
		fInstancePointer = be_BString_CharacterEscape_1(fInstancePointer, toStringz(original), toStringz(setOfCharsToEscape), escapeWith);
		return this;
	}
	
	BString CharacterEscape(char [] setOfCharsToEscape, char escapeWith) {
		fInstancePointer = be_BString_CharacterEscape_2(fInstancePointer, toStringz(setOfCharsToEscape), escapeWith);
		return this;
	}
	
	BString CharacterDeescape(char [] original, char escapeChar) {
		fInstancePointer = be_BString_CharacterDeescape_1(fInstancePointer, toStringz(original), escapeChar);
		return this;
	}
	
	BString CharacterDeescape(char escapeChar) {
		fInstancePointer = be_BString_CharacterDeescape_2(fInstancePointer, escapeChar);
		return this;
	}

	// Trimming
	BString Trim() {
		fInstancePointer = be_BString_Trim(fInstancePointer);
		return this;
	}

	// Insert
	BString opShl(char [] string) {
		fInstancePointer = be_BString_operator_shift_left_1(fInstancePointer, toStringz(string));
		return this;
	}
	
	BString opShl(BString string) {
		fInstancePointer = be_BString_operator_shift_left_2(fInstancePointer, string.fInstancePointer);
		return this;
	}
	
	BString opShl(char c) {
		fInstancePointer = be_BString_operator_shift_left_3(fInstancePointer, c);
		return this;
	}
	
	BString opShl(int value) {
		fInstancePointer = be_BString_operator_shift_left_4(fInstancePointer, value);
		return this;
	}
	
	BString opShl(uint value) {
		fInstancePointer = be_BString_operator_shift_left_5(fInstancePointer, value);
		return this;
	}
	
	BString opShl(uint32 value) {
		fInstancePointer = be_BString_operator_shift_left_6(fInstancePointer, value);
		return this;
	}
	
	BString opShl(int32 value) {
		fInstancePointer = be_BString_operator_shift_left_7(fInstancePointer, value);
		return this;
	}
	
	BString opShl(uint64 value) {
		fInstancePointer = be_BString_operator_shift_left_8(fInstancePointer, value);
		return this;
	}
	
	BString opShl(int64 value) {
		fInstancePointer = be_BString_operator_shift_left_9(fInstancePointer, value);
		return this;
	}
	
	BString opShl(float value) {
		fInstancePointer = be_BString_operator_shift_left_10(fInstancePointer, value);
		return this;
	}
}
