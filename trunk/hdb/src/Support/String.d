module Support.String;

import Support.BObject;

import tango.stdc.stringz;
import tango.stdc.stdlib;

import Support.SupportDefs;

extern (C) extern  {
	void *be_BString_ctor_1(void *);
	void *be_BString_ctor_2(void *, char*);
	void *be_BString_ctor_3(void *, void *);	
	void *be_BString_ctor_4(void *, char*, int32);
	
	void be_BString_dtor(void *);

	// Access	
	char*	be_BString_String(void *);
	
	int32 be_BString_Length(void *);
	
	int32 be_BString_CountChars(void *);
	
	int32 be_BString_CountBytes(void *, int32, int32);

	// Assignment
/*
			BString&		operator=(BString& string);
			BString&		operator=(char* string);
			BString&		operator=(char c);
*/

	void * be_BString_SetTo_1(void *, char *);
	void * be_BString_SetTo_2(void *, char *, int32);
	void * be_BString_SetTo_3(void *, void *);
		
	void * be_BString_Adopt_1(void *, void *);
	void * be_BString_SetTo_4(void *, void *, int32);
	void * be_BString_Adopt_2(void *, void *, int32);
	void * be_BString_SetTo_5(void *, char c, int32);
	void * be_BString_SetToChars_1(void *, char *, int32);
	void * be_BString_SetToChars_2(void *, void *, int32);
	void * be_BString_AdoptChars(void *, void *, int32);

	// Substring copying	
	void * be_BString_CopyInto_1(void *, void *, int32, int32);
	void be_BString_CopyInto_2(void *, char *, int32, int32);
	void * be_BString_CopyCharsInto_1(void *, void *, int32, int32);
	void be_BString_CopyCharsInto_2(void *, char *, int32 *, int32, int32);

	// Appending

/*
			BString&		operator+=(BString& string);
			BString&		operator+=(char* string);
			BString&		operator+=(char c);
*/

	void * be_BString_Append_1(void *, void *);
	void * be_BString_Append_2(void *, char *);
	void * be_BString_Append_3(void *, void *, int32);
	void * be_BString_Append_4(void *, char *, int32);
	void * be_BString_Append_5(void *, char, int32);
	void * be_BString_AppendChars_1(void *, void *, int32);
	void * be_BString_AppendChars_2(void *, char *, int32);

	// Prepending
	void * be_BString_Prepend_1(void *, char *);
	void * be_BString_Prepend_2(void *, void *);
	void * be_BString_Prepend_3(void *, char *, int32);
	void * be_BString_Prepend_4(void *, void *, int32);
	void * be_BString_Prepend_5(void *, char, int32);
	void * be_BString_PrependChars_1(void *, char *, int32);
	void * be_BString_PrependChars_2(void *, void *, int32);

	// Inserting
	void * be_BString_Insert_1(void *, char *, int32);
	void * be_BString_Insert_2(void *, char *, int32, int32);
	void * be_BString_Insert_3(void *, char *, int32, int32, int32);
	void * be_BString_Insert_4(void *, void *, int32);
	void * be_BString_Insert_5(void *, void *, int32, int32);
	void * be_BString_Insert_6(void *, void *, int32, int32, int32);
	void * be_BString_Insert_7(void *, char c, int32, int32);
	void * be_BString_InsertChars_1(void *, char *, int32);
	void * be_BString_InsertChars_2(void *, char *, int32, int32);
	void * be_BString_InsertChars_3(void *, char *, int32, int32, int32);
	void * be_BString_InsertChars_4(void *, void *, int32);
	void * be_BString_InsertChars_5(void *, void *, int32, int32);
	void * be_BString_InsertChars_6(void *, void *, int32, int32, int32);

	// Removing
	void * be_BString_Truncate(void *, int32, bool);
	void * be_BString_TruncateChars(void *, int32, bool);
	void * be_BString_Remove(void *, int32, int32);
	void * be_BString_RemoveChars(void *, int32, int32);
	void * be_BString_RemoveFirst_1(void *, void *);
	void * be_BString_RemoveLast_1(void *, void *);
	void * be_BString_RemoveAll_1(void *, void *);
	void * be_BString_RemoveFirst_2(void *, char *);
	void * be_BString_RemoveLast_2(void *, char *);
	void * be_BString_RemoveAll_2(void *, char *);
	void * be_BString_RemoveSet(void *, char *);
	void * be_BString_RemoveCharsSet(void *, char *);
	void * be_BString_MoveInto_1(void *, void *, int32, int32);
	void be_BString_MoveInto_2(void *, char *, int32, int32);
	void * be_BString_MoveCharsInto_1(void *, void *, int32, int32);
	void be_BString_MoveCharsInto_2(void *, char *, int32 *, int32, int32);
/*

			// Compare functions
			bool			operator<(BString& string) const;
			bool			operator<=(BString& string) const;
			bool			operator==(BString& string) const;
			bool			operator>=(BString& string) const;
			bool			operator>(BString& string) const;
			bool			operator!=(BString& string) const;

			bool			operator<(char* string) const;
			bool			operator<=(char* string) const;
			bool			operator==(char* string) const;
			bool			operator>=(char* string) const;
			bool			operator>(char* string) const;
			bool			operator!=(char* string) const;

							operator char*() const;
*/

	int be_BString_Compare_1(void *, void *);
	int be_BString_Compare_2(void *, char *);
	int be_BString_Compare_3(void *, void *, int32);
	int be_BString_Compare_4(void *, char *, int32);
	int	be_BString_CompareChars_1(void *, void* , int32);
	int	be_BString_CompareChars_2(void *, char* string, int32);
	int	be_BString_ICompare_1(void *, void* );
	int	be_BString_ICompare_2(void *, char* );
	int	be_BString_ICompare_3(void *, void* , int32);
	int	be_BString_ICompare_4(void *, char* , int32);

	// Searching
	int32 be_BString_FindFirst_1(void *, void* );
	int32 be_BString_FindFirst_2(void *, char* );
	int32 be_BString_FindFirst_3(void *, void* , int32);
	int32 be_BString_FindFirst_4(void *, char*, int32);
	int32 be_BString_FindFirst_5(void *, char);
	int32 be_BString_FindFirst_6(void *, char, int32 );
	int32 be_BString_FindFirstChars_1(void *, void* , int32);
	int32 be_BString_FindFirstChars_2(void *, char*, int32);
	int32 be_BString_FindLast_1(void *, void*);
	int32 be_BString_FindLast_2(void *, char*);
	int32 be_BString_FindLast_3(void *, void*, int32 );
	int32 be_BString_FindLast_4(void *, char*, int32 );
	int32 be_BString_FindLast_5(void *, char);
	int32 be_BString_FindLast_6(void *, char, int32);
	int32 be_BString_FindLastChars_1(void *, void*, int32);
	int32 be_BString_FindLastChars_2(void *, char* string, int32);
	int32 be_BString_IFindFirst_1(void *, void*);
	int32 be_BString_IFindFirst_2(void *, char*);
	int32 be_BString_IFindFirst_3(void *, void*, int32);
	int32 be_BString_IFindFirst_4(void *, char*, int32);
	int32 be_BString_IFindLast_1(void *, void*);
	int32 be_BString_IFindLast_2(void *, char*);
	int32 be_BString_IFindLast_3(void *, void*, int32);
	int32 be_BString_IFindLast_4(void *, char*, int32);

	// Replacing
	void * be_BString_ReplaceFirst_1(void *, char, char );
	void * be_BString_ReplaceLast_1(void *, char, char );
	void * be_BString_ReplaceAll_1(void *, char, char , int32);
	void * be_BString_Replace_1(void *, char, char , int32, int32);
	void * be_BString_ReplaceFirst_2(void *, char*, char* );
	void * be_BString_ReplaceLast_2(void *, char*, char* );
	void * be_BString_ReplaceAll_2(void *, char*, char* , int32);
	void * be_BString_Replace_2(void *, char*, char* , int32, int32);
	void * be_BString_ReplaceAllChars(void *, char*, char* , int32);
	void * be_BString_ReplaceChars(void *, char*, char* , int32, int32);
	void * be_BString_IReplaceFirst_1(void *, char, char );
	void * be_BString_IReplaceLast_1(void *, char, char );
	void * be_BString_IReplaceAll_1(void *, char, char , int32);
	void * be_BString_IReplace_1(void *, char, char , int32, int32);
	void * be_BString_IReplaceFirst_2(void *, char*, char* );
	void * be_BString_IReplaceLast_2(void *, char*, char* );
	void * be_BString_IReplaceAll_2(void *, char*, char* , int32);
	void * be_BString_IReplace_2(void *, char*, char* , int32, int32 );
	void * be_BString_ReplaceSet_1(void *, char*, char );
	void * be_BString_ReplaceSet_2(void *, char*, char* );
	void * be_BString_ReplaceCharsSet(void *, char*, char* );
/*	
			// Unchecked char access
			char			operator[](int32 index) const;

#if __GNUC__ > 3
			BStringRef		operator[](int32 index);
#else
			char&			operator[](int32 index);
#endif

*/


	char be_BString_ByteAt(void *, int32);
	char * be_BString_CharAt_1(void *, int32, int32*);
	bool be_BString_CharAt_2(void *, int32, char*, int32*);

	// Fast low-level manipulation
	char * be_BString_LockBuffer(void *, int32);
	void * be_BString_UnlockBuffer(void *, int32);

	// Upercase <-> Lowercase
	void * be_BString_ToLower(void *);
	void * be_BString_ToUpper(void *);
	void * be_BString_Capitalize(void *);
	void * be_BString_CapitalizeEachWord(void *);

	// Escaping and De-escaping
	void * be_BString_CharacterEscape_1(void *, char*, char*, char);
	void * be_BString_CharacterEscape_2(void *, char*, char);
	void * be_BString_CharacterDeescape_1(void *, char*, char);
	void * be_BString_CharacterDeescape_2(void *, char);

	// Trimming
	void * be_BString_Trim(void *);
}


final class BString
{
public:
	mixin BObject;
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_1(cast(void *)this);
	}
	
	this(char [] string) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_2(cast(void *)this, toStringz(string));
	}
	
	this(BString string) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_3(cast(void *)this, string.fInstancePointer);
	}
	
	this(char [] string, int32 maxLength) {
		if(fInstancePointer is null)
			fInstancePointer = be_BString_ctor_4(cast(void *)this, toStringz(string), maxLength);
	}

	~this() {
		if(fInstancePointer !is null)
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
			BString&		operator=(char* string);
			BString&		operator=(char c);
*/

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
		
/*	

*/
}
