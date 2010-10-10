/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Font;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Point;
import Be.Interface.Rect;

const int32 B_FONT_FAMILY_LENGTH = 63;
const int32 B_FONT_STYLE_LENGTH = 63;
typedef char font_family[B_FONT_FAMILY_LENGTH + 1];
typedef char font_style[B_FONT_STYLE_LENGTH + 1];


// font spacing
enum {
	B_CHAR_SPACING			= 0,
	B_STRING_SPACING		= 1,
	B_BITMAP_SPACING		= 2,
	B_FIXED_SPACING			= 3
}


enum font_direction {
	B_FONT_LEFT_TO_RIGHT	= 0,
	B_FONT_RIGHT_TO_LEFT	= 1
}

alias font_direction.B_FONT_LEFT_TO_RIGHT B_FONT_LEFT_TO_RIGHT;
alias font_direction.B_FONT_RIGHT_TO_LEFT B_FONT_RIGHT_TO_LEFT;

// font flags
enum {
	B_DISABLE_ANTIALIASING	= 0x00000001,
	B_FORCE_ANTIALIASING	= 0x00000002
}


// truncation modes
enum {
	B_TRUNCATE_END			= 0,
	B_TRUNCATE_BEGINNING	= 1,
	B_TRUNCATE_MIDDLE		= 2,
	B_TRUNCATE_SMART		= 3
}


// font encodings
enum {
	B_UNICODE_UTF8			= 0,
	B_ISO_8859_1			= 1,
	B_ISO_8859_2			= 2,
	B_ISO_8859_3			= 3,
	B_ISO_8859_4			= 4,
	B_ISO_8859_5			= 5,
	B_ISO_8859_6			= 6,
	B_ISO_8859_7			= 7,
	B_ISO_8859_8			= 8,
	B_ISO_8859_9			= 9,
	B_ISO_8859_10			= 10,
	B_MACINTOSH_ROMAN		= 11
}


// flags for get_font_family() and get_font_style()
enum {
	B_HAS_TUNED_FONT		= 0x0001,
	B_IS_FIXED				= 0x0002
}


// font face flags
enum {
	B_ITALIC_FACE			= 0x0001,
	B_UNDERSCORE_FACE		= 0x0002,
	B_NEGATIVE_FACE			= 0x0004,
	B_OUTLINED_FACE			= 0x0008,
	B_STRIKEOUT_FACE		= 0x0010,
	B_BOLD_FACE				= 0x0020,
	B_REGULAR_FACE			= 0x0040,
	// new in Haiku:
	B_CONDENSED_FACE		= 0x0080,
	B_LIGHT_FACE			= 0x0100,
	B_HEAVY_FACE			= 0x0200,
}


enum font_metric_mode {
	B_SCREEN_METRIC			= 0,
	B_PRINTING_METRIC		= 1
}

alias font_metric_mode.B_SCREEN_METRIC B_SCREEN_METRIC;
alias font_metric_mode.B_PRINTING_METRIC B_PRINTING_METRIC;


enum font_file_format {
	B_TRUETYPE_WINDOWS		= 0,
	B_POSTSCRIPT_TYPE1_WINDOWS = 1
}

alias font_file_format.B_TRUETYPE_WINDOWS B_TRUETYPE_WINDOWS;
alias font_file_format.B_POSTSCRIPT_TYPE1_WINDOWS B_POSTSCRIPT_TYPE1_WINDOWS;


struct edge_info {
	float	left;
	float	right;
}


struct font_height {
	float	ascent;
	float	descent;
	float	leading;
}


struct escapement_delta {
	float	nonspace;
	float	space;
}


struct font_cache_info {
    int32    sheared_font_penalty;
    int32    rotated_font_penalty;
	float    oversize_threshold;
	int32    oversize_penalty;
	int32    cache_size;
	float    spacing_size_threshold;
}


struct tuned_font_info {
	float    size;
	float    shear; 
	float    rotation;
	uint32   flags;
	uint16   face;
}

extern (C) extern {
	// unicode_block* be_unicode_block_ctor(void *bindInstPtr);
	void * be_unicode_block_ctor(void *bindInstPtr);

	// unicode_block* be_unicode_block_ctor_1(void *bindInstPtr, uint64 block2, uint64 block1);
	void * be_unicode_block_ctor_1(void *bindInstPtr, uint64 block2, uint64 block1);

	// void be_unicode_block_dtor(unicode_block* self);
	void be_unicode_block_dtor(void* self);

	// bool be_unicode_block_Includes(unicode_block *self, const unicode_block* block);
	bool be_unicode_block_Includes(void *self, void * block);

	// unicode_block * be_unicode_block_opAnd(unicode_block *self, const unicode_block* block);
	void * be_unicode_block_opAnd(void *self, void * block);

	// unicode_block * be_unicode_block_opOr(unicode_block *self, const unicode_block* block);
	void * be_unicode_block_opOr(void *self, void * block);

	// unicode_block* be_unicode_block_opAssign(unicode_block *self, const unicode_block* block);
	void * be_unicode_block_opAssign(void *self, void * block);

	// bool be_unicode_block_opEquals(unicode_block *self, const unicode_block* block);
	bool be_unicode_block_opEquals(void *self, void * block);

	// bool be_unicode_block_opNotEquals(unicode_block *self, const unicode_block* block);
	bool be_unicode_block_opNotEquals(void *self, void * block);

}

extern (C) extern {
	// BFont* be_BFont_ctor(void *bindInstPtr);
	void * be_BFont_ctor(void *bindInstPtr);

	// BFont* be_BFont_ctor_1(void *bindInstPtr, const BFont* font);
	void * be_BFont_ctor_1(void *bindInstPtr, void * font);

	// void be_BFont_dtor(BFont* self);
	void be_BFont_dtor(void* self);

	// status_t be_BFont_SetFamilyAndStyle(BFont *self, const font_family family, const font_style style);
	status_t be_BFont_SetFamilyAndStyle(void *self, font_family family,  font_style style);

	// void be_BFont_SetFamilyAndStyle_1(BFont *self, uint32 code);
	void be_BFont_SetFamilyAndStyle_1(void *self, uint32 code);

	// status_t be_BFont_SetFamilyAndFace(BFont *self, const font_family family, uint16 face);
	status_t be_BFont_SetFamilyAndFace(void *self, font_family family, uint16 face);

	// void be_BFont_SetSize(BFont *self, float size);
	void be_BFont_SetSize(void *self, float size);

	// void be_BFont_SetShear(BFont *self, float shear);
	void be_BFont_SetShear(void *self, float shear);

	// void be_BFont_SetRotation(BFont *self, float rotation);
	void be_BFont_SetRotation(void *self, float rotation);

	// void be_BFont_SetFalseBoldWidth(BFont *self, float width);
	void be_BFont_SetFalseBoldWidth(void *self, float width);

	// void be_BFont_SetSpacing(BFont *self, uint8 spacing);
	void be_BFont_SetSpacing(void *self, uint8 spacing);

	// void be_BFont_SetEncoding(BFont *self, uint8 encoding);
	void be_BFont_SetEncoding(void *self, uint8 encoding);

	// void be_BFont_SetFace(BFont *self, uint16 face);
	void be_BFont_SetFace(void *self, uint16 face);

	// void be_BFont_SetFlags(BFont *self, uint32 flags);
	void be_BFont_SetFlags(void *self, uint32 flags);

	// void be_BFont_GetFamilyAndStyle(BFont *self, font_family* family, font_style* style);
	void be_BFont_GetFamilyAndStyle(void *self, font_family* family, font_style* style);

	// uint32 be_BFont_FamilyAndStyle(BFont *self);
	uint32 be_BFont_FamilyAndStyle(void *self);

	// float be_BFont_Size(BFont *self);
	float be_BFont_Size(void *self);

	// float be_BFont_Shear(BFont *self);
	float be_BFont_Shear(void *self);

	// float be_BFont_Rotation(BFont *self);
	float be_BFont_Rotation(void *self);

	// float be_BFont_FalseBoldWidth(BFont *self);
	float be_BFont_FalseBoldWidth(void *self);

	// uint8 be_BFont_Spacing(BFont *self);
	uint8 be_BFont_Spacing(void *self);

	// uint8 be_BFont_Encoding(BFont *self);
	uint8 be_BFont_Encoding(void *self);

	// uint16 be_BFont_Face(BFont *self);
	uint16 be_BFont_Face(void *self);

	// uint32 be_BFont_Flags(BFont *self);
	uint32 be_BFont_Flags(void *self);

	// font_direction be_BFont_Direction(BFont *self);
	font_direction be_BFont_Direction(void *self);

	// bool be_BFont_IsFixed(BFont *self);
	bool be_BFont_IsFixed(void *self);

	// bool be_BFont_IsFullAndHalfFixed(BFont *self);
	bool be_BFont_IsFullAndHalfFixed(void *self);

	// BRect * be_BFont_BoundingBox(BFont *self);
	void * be_BFont_BoundingBox(void *self);

	// unicode_block * be_BFont_Blocks(BFont *self);
	void * be_BFont_Blocks(void *self);

	// font_file_format be_BFont_FileFormat(BFont *self);
	font_file_format be_BFont_FileFormat(void *self);

	// int32 be_BFont_CountTuned(BFont *self);
	int32 be_BFont_CountTuned(void *self);

	// void be_BFont_GetTunedInfo(BFont *self, int32 index, tuned_font_info* info);
	void be_BFont_GetTunedInfo(void *self, int32 index, tuned_font_info* info);

	// void be_BFont_TruncateString(BFont *self, BString* inOut, uint32 mode, float width);
	void be_BFont_TruncateString(void *self, void* inOut, uint32 mode, float width);

	// void be_BFont_GetTruncatedStrings(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, BString resultArray[]);
	void be_BFont_GetTruncatedStrings(void *self, char* stringArray[], int32 numStrings, uint32 mode, float width, void resultArray[]);

	// void be_BFont_GetTruncatedStrings_1(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, char* resultArray[]);
	void be_BFont_GetTruncatedStrings_1(void *self, char* stringArray[], int32 numStrings, uint32 mode, float width, char* resultArray[]);

	// float be_BFont_StringWidth(BFont *self, const char* string);
	float be_BFont_StringWidth(void *self, char* string);

	// float be_BFont_StringWidth_1(BFont *self, const char* string, int32 length);
	float be_BFont_StringWidth_1(void *self, char* string, int32 length);

	// void be_BFont_GetStringWidths(BFont *self, const char* stringArray[], const int32 lengthArray[], int32 numStrings, float widthArray[]);
	void be_BFont_GetStringWidths(void *self, char* stringArray[],  int32 lengthArray[], int32 numStrings, float widthArray[]);

	// void be_BFont_GetEscapements(BFont *self, const char charArray[], int32 numChars, float escapementArray[]);
	void be_BFont_GetEscapements(void *self, char charArray[], int32 numChars, float escapementArray[]);

	// void be_BFont_GetEscapements_1(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, float escapementArray[]);
	void be_BFont_GetEscapements_1(void *self, char charArray[], int32 numChars, escapement_delta* delta, float escapementArray[]);

	// void be_BFont_GetEscapements_2(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[]);
	void be_BFont_GetEscapements_2(void *self, char charArray[], int32 numChars, escapement_delta* delta, void *escapementArray[]);

	// void be_BFont_GetEscapements_3(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[], BPoint *offsetArray[]);
	void be_BFont_GetEscapements_3(void *self, char charArray[], int32 numChars, escapement_delta* delta, void *escapementArray[], void *offsetArray[]);

	// void be_BFont_GetEdges(BFont *self, const char charArray[], int32 numBytes, edge_info edgeArray[]);
	void be_BFont_GetEdges(void *self, char charArray[], int32 numBytes, edge_info edgeArray[]);

	// void be_BFont_GetHeight(BFont *self, font_height* height);
	void be_BFont_GetHeight(void *self, font_height* height);

	// void be_BFont_GetBoundingBoxesAsGlyphs(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, BRect *boundingBoxArray[]);
	void be_BFont_GetBoundingBoxesAsGlyphs(void *self, char charArray[], int32 numChars, font_metric_mode mode, void *boundingBoxArray[]);

	// void be_BFont_GetBoundingBoxesAsString(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, escapement_delta* delta, BRect *boundingBoxArray[]);
	void be_BFont_GetBoundingBoxesAsString(void *self, char charArray[], int32 numChars, font_metric_mode mode, escapement_delta* delta, void *boundingBoxArray[]);

	// void be_BFont_GetBoundingBoxesForStrings(BFont *self, const char* stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], BRect *boundingBoxArray[]);
	void be_BFont_GetBoundingBoxesForStrings(void *self, char* stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], void *boundingBoxArray[]);

	// void be_BFont_GetGlyphShapes(BFont *self, const char charArray[], int32 numChars, BShape* glyphShapeArray[]);
	void be_BFont_GetGlyphShapes(void *self, char charArray[], int32 numChars, void* glyphShapeArray[]);

	// void be_BFont_GetHasGlyphs(BFont *self, const char charArray[], int32 numChars, bool hasArray[]);
	void be_BFont_GetHasGlyphs(void *self, char charArray[], int32 numChars, bool hasArray[]);

	// BFont* be_BFont_opAssign(BFont *self, const BFont* font);
	void * be_BFont_opAssign(void *self, void * font);

	// bool be_BFont_opEquals(BFont *self, const BFont* font);
	bool be_BFont_opEquals(void *self, void * font);

	// bool be_BFont_opNotEquals(BFont *self, const BFont* font);
	bool be_BFont_opNotEquals(void *self, void * font);

	// void be_BFont_PrintToStream(BFont *self);
	void be_BFont_PrintToStream(void *self);

}

final class unicode_block
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// unicode_block* be_unicode_block_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_unicode_block_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// unicode_block* be_unicode_block_ctor_1(void *bindInstPtr, uint64 block2, uint64 block1);
	this(uint64 block2, uint64 block1) {
		if(_InstPtr is null) {
			_InstPtr = be_unicode_block_ctor_1(cast(void *)this, block2, block1);
			_OwnsPtr = true;
		}
	}

	// void be_unicode_block_dtor(unicode_block* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_unicode_block_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// bool be_unicode_block_Includes(unicode_block *self, const unicode_block& block);
	final bool Includes(unicode_block block) {
		return be_unicode_block_Includes(_InstPtr(), block._InstPtr);
	}

	// unicode_block * be_unicode_block_opAnd(unicode_block *self, const unicode_block& block);
	//unicode_block opAnd();

	// unicode_block * be_unicode_block_opOr(unicode_block *self, const unicode_block& block);
	//unicode_block opOr();

	// unicode_block& be_unicode_block_opAssign(unicode_block *self, const unicode_block& block);
	//unicode_block& opAssign();

	// bool be_unicode_block_opEquals(unicode_block *self, const unicode_block& block);
	//bool opEquals();

	// bool be_unicode_block_opNotEquals(unicode_block *self, const unicode_block& block);
	//bool opNotEquals();

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


final class BFont
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BFont* be_BFont_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BFont_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BFont* be_BFont_ctor_1(void *bindInstPtr, const BFont* font);
	this(BFont font) {
		if(_InstPtr is null) {
			_InstPtr = be_BFont_ctor_1(cast(void *)this, font._InstPtr);
			_OwnsPtr = true;
		}
	}

	// void be_BFont_dtor(BFont* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BFont_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}
/*
	// status_t be_BFont_SetFamilyAndStyle(BFont *self, const font_family family, const font_style style);
	final status_t SetFamilyAndStyle() {
		return be_BFont_SetFamilyAndStyle(_InstPtr());
	}

	// void be_BFont_SetFamilyAndStyle_1(BFont *self, uint32 code);
	final void SetFamilyAndStyle() {
		be_BFont_SetFamilyAndStyle_1(_InstPtr());
	}

	// status_t be_BFont_SetFamilyAndFace(BFont *self, const font_family family, uint16 face);
	final status_t SetFamilyAndFace() {
		return be_BFont_SetFamilyAndFace(_InstPtr());
	}

	// void be_BFont_SetSize(BFont *self, float size);
	final void SetSize() {
		be_BFont_SetSize(_InstPtr());
	}

	// void be_BFont_SetShear(BFont *self, float shear);
	final void SetShear() {
		be_BFont_SetShear(_InstPtr());
	}

	// void be_BFont_SetRotation(BFont *self, float rotation);
	final void SetRotation() {
		be_BFont_SetRotation(_InstPtr());
	}

	// void be_BFont_SetFalseBoldWidth(BFont *self, float width);
	final void SetFalseBoldWidth() {
		be_BFont_SetFalseBoldWidth(_InstPtr());
	}

	// void be_BFont_SetSpacing(BFont *self, uint8 spacing);
	final void SetSpacing() {
		be_BFont_SetSpacing(_InstPtr());
	}

	// void be_BFont_SetEncoding(BFont *self, uint8 encoding);
	final void SetEncoding() {
		be_BFont_SetEncoding(_InstPtr());
	}

	// void be_BFont_SetFace(BFont *self, uint16 face);
	final void SetFace() {
		be_BFont_SetFace(_InstPtr());
	}

	// void be_BFont_SetFlags(BFont *self, uint32 flags);
	final void SetFlags() {
		be_BFont_SetFlags(_InstPtr());
	}

	// void be_BFont_GetFamilyAndStyle(BFont *self, font_family* family, font_style* style);
	final void GetFamilyAndStyle() {
		be_BFont_GetFamilyAndStyle(_InstPtr());
	}

	// uint32 be_BFont_FamilyAndStyle(BFont *self);
	final uint32 FamilyAndStyle() {
		return be_BFont_FamilyAndStyle(_InstPtr());
	}

	// float be_BFont_Size(BFont *self);
	final float Size() {
		return be_BFont_Size(_InstPtr());
	}

	// float be_BFont_Shear(BFont *self);
	final float Shear() {
		return be_BFont_Shear(_InstPtr());
	}

	// float be_BFont_Rotation(BFont *self);
	final float Rotation() {
		return be_BFont_Rotation(_InstPtr());
	}

	// float be_BFont_FalseBoldWidth(BFont *self);
	final float FalseBoldWidth() {
		return be_BFont_FalseBoldWidth(_InstPtr());
	}

	// uint8 be_BFont_Spacing(BFont *self);
	final uint8 Spacing() {
		return be_BFont_Spacing(_InstPtr());
	}

	// uint8 be_BFont_Encoding(BFont *self);
	final uint8 Encoding() {
		return be_BFont_Encoding(_InstPtr());
	}

	// uint16 be_BFont_Face(BFont *self);
	final uint16 Face() {
		return be_BFont_Face(_InstPtr());
	}

	// uint32 be_BFont_Flags(BFont *self);
	final uint32 Flags() {
		return be_BFont_Flags(_InstPtr());
	}

	// font_direction be_BFont_Direction(BFont *self);
	final font_direction Direction() {
		return be_BFont_Direction(_InstPtr());
	}

	// bool be_BFont_IsFixed(BFont *self);
	final bool IsFixed() {
		return be_BFont_IsFixed(_InstPtr());
	}

	// bool be_BFont_IsFullAndHalfFixed(BFont *self);
	final bool IsFullAndHalfFixed() {
		return be_BFont_IsFullAndHalfFixed(_InstPtr());
	}

	// BRect * be_BFont_BoundingBox(BFont *self);
	final BRect BoundingBox() {
		return be_BFont_BoundingBox(_InstPtr());
	}

	// unicode_block * be_BFont_Blocks(BFont *self);
	final unicode_block Blocks() {
		return be_BFont_Blocks(_InstPtr());
	}

	// font_file_format be_BFont_FileFormat(BFont *self);
	final font_file_format FileFormat() {
		return be_BFont_FileFormat(_InstPtr());
	}

	// int32 be_BFont_CountTuned(BFont *self);
	final int32 CountTuned() {
		return be_BFont_CountTuned(_InstPtr());
	}

	// void be_BFont_GetTunedInfo(BFont *self, int32 index, tuned_font_info* info);
	final void GetTunedInfo() {
		be_BFont_GetTunedInfo(_InstPtr());
	}

	// void be_BFont_TruncateString(BFont *self, BString* inOut, uint32 mode, float width);
	final void TruncateString() {
		be_BFont_TruncateString(_InstPtr());
	}

	// void be_BFont_GetTruncatedStrings(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, BString resultArray[]);
	final void GetTruncatedStrings() {
		be_BFont_GetTruncatedStrings(_InstPtr());
	}

	// void be_BFont_GetTruncatedStrings_1(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, char* resultArray[]);
	final void GetTruncatedStrings() {
		be_BFont_GetTruncatedStrings_1(_InstPtr());
	}

	// float be_BFont_StringWidth(BFont *self, const char* string);
	final float StringWidth() {
		return be_BFont_StringWidth(_InstPtr());
	}

	// float be_BFont_StringWidth_1(BFont *self, const char* string, int32 length);
	final float StringWidth() {
		return be_BFont_StringWidth_1(_InstPtr());
	}

	// void be_BFont_GetStringWidths(BFont *self, const char* stringArray[], const int32 lengthArray[], int32 numStrings, float widthArray[]);
	final void GetStringWidths() {
		be_BFont_GetStringWidths(_InstPtr());
	}

	// void be_BFont_GetEscapements(BFont *self, const char charArray[], int32 numChars, float escapementArray[]);
	final void GetEscapements() {
		be_BFont_GetEscapements(_InstPtr());
	}

	// void be_BFont_GetEscapements_1(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, float escapementArray[]);
	final void GetEscapements() {
		be_BFont_GetEscapements_1(_InstPtr());
	}

	// void be_BFont_GetEscapements_2(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[]);
	final void GetEscapements() {
		be_BFont_GetEscapements_2(_InstPtr());
	}

	// void be_BFont_GetEscapements_3(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[], BPoint *offsetArray[]);
	final void GetEscapements() {
		be_BFont_GetEscapements_3(_InstPtr());
	}

	// void be_BFont_GetEdges(BFont *self, const char charArray[], int32 numBytes, edge_info edgeArray[]);
	final void GetEdges() {
		be_BFont_GetEdges(_InstPtr());
	}

	// void be_BFont_GetHeight(BFont *self, font_height* height);
	final void GetHeight() {
		be_BFont_GetHeight(_InstPtr());
	}

	// void be_BFont_GetBoundingBoxesAsGlyphs(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, BRect *boundingBoxArray[]);
	final void GetBoundingBoxesAsGlyphs() {
		be_BFont_GetBoundingBoxesAsGlyphs(_InstPtr());
	}

	// void be_BFont_GetBoundingBoxesAsString(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, escapement_delta* delta, BRect *boundingBoxArray[]);
	final void GetBoundingBoxesAsString() {
		be_BFont_GetBoundingBoxesAsString(_InstPtr());
	}

	// void be_BFont_GetBoundingBoxesForStrings(BFont *self, const char* stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], BRect *boundingBoxArray[]);
	final void GetBoundingBoxesForStrings() {
		be_BFont_GetBoundingBoxesForStrings(_InstPtr());
	}

	// void be_BFont_GetGlyphShapes(BFont *self, const char charArray[], int32 numChars, BShape* glyphShapeArray[]);
	final void GetGlyphShapes() {
		be_BFont_GetGlyphShapes(_InstPtr());
	}

	// void be_BFont_GetHasGlyphs(BFont *self, const char charArray[], int32 numChars, bool hasArray[]);
	final void GetHasGlyphs() {
		be_BFont_GetHasGlyphs(_InstPtr());
	}

	// BFont& be_BFont_opAssign(BFont *self, const BFont& font);
	//BFont& opAssign();

	// bool be_BFont_opEquals(BFont *self, const BFont& font);
	//bool opEquals();

	// bool be_BFont_opNotEquals(BFont *self, const BFont& font);
	//bool opNotEquals();

	// void be_BFont_PrintToStream(BFont *self);
	final void PrintToStream() {
		be_BFont_PrintToStream(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


