/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Font.h>
#include <Rect.h>

extern "C" {
	unicode_block *be_unicode_block_ctor(void *bindInstPtr)
	{
		return (unicode_block* )new unicode_block();
	}

	unicode_block *be_unicode_block_ctor_1(void *bindInstPtr, uint64 block2, uint64 block1)
	{
		return (unicode_block* )new unicode_block(block2, block1);
	}

	void be_unicode_block_dtor(unicode_block *self)
	{
		delete self;
	}

	bool be_unicode_block_Includes(unicode_block *self, const unicode_block* block)
	{
		return self->Includes(*block);
	}

	unicode_block * be_unicode_block_opAnd(unicode_block *self, const unicode_block* block)
	{
		 return new unicode_block(self->operator&(*block));
	}

	unicode_block * be_unicode_block_opOr(unicode_block *self, const unicode_block* block)
	{
		 return new unicode_block(self->operator|(*block));
	}

	unicode_block* be_unicode_block_opAssign(unicode_block *self, const unicode_block* block)
	{
		return &self->operator=(*block);
	}

	bool be_unicode_block_opEquals(unicode_block *self, const unicode_block* block)
	{
		return self->operator==(*block);
	}

	bool be_unicode_block_opNotEquals(unicode_block *self, const unicode_block* block)
	{
		return self->operator!=(*block);
	}

}

extern "C" {
	BFont *be_BFont_ctor(void *bindInstPtr)
	{
		return (BFont* )new BFont();
	}

	BFont *be_BFont_ctor_1(void *bindInstPtr, const BFont* font)
	{
		return (BFont* )new BFont(font);
	}

	void be_BFont_dtor(BFont *self)
	{
		delete self;
	}

	status_t be_BFont_SetFamilyAndStyle(BFont *self, const font_family family, const font_style style)
	{
		return self->SetFamilyAndStyle(family, style);
	}

	void be_BFont_SetFamilyAndStyle_1(BFont *self, uint32 code)
	{
		self->SetFamilyAndStyle(code);
	}

	status_t be_BFont_SetFamilyAndFace(BFont *self, const font_family family, uint16 face)
	{
		return self->SetFamilyAndFace(family, face);
	}

	void be_BFont_SetSize(BFont *self, float size)
	{
		self->SetSize(size);
	}

	void be_BFont_SetShear(BFont *self, float shear)
	{
		self->SetShear(shear);
	}

	void be_BFont_SetRotation(BFont *self, float rotation)
	{
		self->SetRotation(rotation);
	}

	void be_BFont_SetFalseBoldWidth(BFont *self, float width)
	{
		self->SetFalseBoldWidth(width);
	}

	void be_BFont_SetSpacing(BFont *self, uint8 spacing)
	{
		self->SetSpacing(spacing);
	}

	void be_BFont_SetEncoding(BFont *self, uint8 encoding)
	{
		self->SetEncoding(encoding);
	}

	void be_BFont_SetFace(BFont *self, uint16 face)
	{
		self->SetFace(face);
	}

	void be_BFont_SetFlags(BFont *self, uint32 flags)
	{
		self->SetFlags(flags);
	}

	void be_BFont_GetFamilyAndStyle(BFont *self, font_family* family, font_style* style)
	{
		self->GetFamilyAndStyle(family, style);
	}

	uint32 be_BFont_FamilyAndStyle(BFont *self)
	{
		return self->FamilyAndStyle();
	}

	float be_BFont_Size(BFont *self)
	{
		return self->Size();
	}

	float be_BFont_Shear(BFont *self)
	{
		return self->Shear();
	}

	float be_BFont_Rotation(BFont *self)
	{
		return self->Rotation();
	}

	float be_BFont_FalseBoldWidth(BFont *self)
	{
		return self->FalseBoldWidth();
	}

	uint8 be_BFont_Spacing(BFont *self)
	{
		return self->Spacing();
	}

	uint8 be_BFont_Encoding(BFont *self)
	{
		return self->Encoding();
	}

	uint16 be_BFont_Face(BFont *self)
	{
		return self->Face();
	}

	uint32 be_BFont_Flags(BFont *self)
	{
		return self->Flags();
	}

	font_direction be_BFont_Direction(BFont *self)
	{
		return self->Direction();
	}

	bool be_BFont_IsFixed(BFont *self)
	{
		return self->IsFixed();
	}

	bool be_BFont_IsFullAndHalfFixed(BFont *self)
	{
		return self->IsFullAndHalfFixed();
	}

	BRect * be_BFont_BoundingBox(BFont *self)
	{
		return new BRect(self->BoundingBox());
	}

	unicode_block * be_BFont_Blocks(BFont *self)
	{
		return new unicode_block(self->Blocks());
	}

	font_file_format be_BFont_FileFormat(BFont *self)
	{
		return self->FileFormat();
	}

	int32 be_BFont_CountTuned(BFont *self)
	{
		return self->CountTuned();
	}

	void be_BFont_GetTunedInfo(BFont *self, int32 index, tuned_font_info* info)
	{
		self->GetTunedInfo(index, info);
	}

	void be_BFont_TruncateString(BFont *self, BString* inOut, uint32 mode, float width)
	{
		self->TruncateString(inOut, mode, width);
	}

	void be_BFont_GetTruncatedStrings(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, BString resultArray[])
	{
		self->GetTruncatedStrings(stringArray, numStrings, mode, width, resultArray);
	}

	void be_BFont_GetTruncatedStrings_1(BFont *self, const char* stringArray[], int32 numStrings, uint32 mode, float width, char* resultArray[])
	{
		self->GetTruncatedStrings(stringArray, numStrings, mode, width, resultArray);
	}

	float be_BFont_StringWidth(BFont *self, const char* string)
	{
		return self->StringWidth(string);
	}

	float be_BFont_StringWidth_1(BFont *self, const char* string, int32 length)
	{
		return self->StringWidth(string, length);
	}

	void be_BFont_GetStringWidths(BFont *self, const char* stringArray[], const int32 lengthArray[], int32 numStrings, float widthArray[])
	{
		self->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
	}

	void be_BFont_GetEscapements(BFont *self, const char charArray[], int32 numChars, float escapementArray[])
	{
		self->GetEscapements(charArray, numChars, escapementArray);
	}

	void be_BFont_GetEscapements_1(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, float escapementArray[])
	{
		self->GetEscapements(charArray, numChars, delta, escapementArray);
	}

	void be_BFont_GetEscapements_2(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[])
	{
		self->GetEscapements(charArray, numChars, delta, *escapementArray);
	}

	void be_BFont_GetEscapements_3(BFont *self, const char charArray[], int32 numChars, escapement_delta* delta, BPoint *escapementArray[], BPoint *offsetArray[])
	{
		self->GetEscapements(charArray, numChars, delta, *escapementArray, *offsetArray);
	}

	void be_BFont_GetEdges(BFont *self, const char charArray[], int32 numBytes, edge_info edgeArray[])
	{
		self->GetEdges(charArray, numBytes, edgeArray);
	}

	void be_BFont_GetHeight(BFont *self, font_height* height)
	{
		self->GetHeight(height);
	}

	void be_BFont_GetBoundingBoxesAsGlyphs(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, BRect *boundingBoxArray[])
	{
		self->GetBoundingBoxesAsGlyphs(charArray, numChars, mode, *boundingBoxArray);
	}

	void be_BFont_GetBoundingBoxesAsString(BFont *self, const char charArray[], int32 numChars, font_metric_mode mode, escapement_delta* delta, BRect *boundingBoxArray[])
	{
		self->GetBoundingBoxesAsString(charArray, numChars, mode, delta, *boundingBoxArray);
	}

	void be_BFont_GetBoundingBoxesForStrings(BFont *self, const char* stringArray[], int32 numStrings, font_metric_mode mode, escapement_delta deltas[], BRect *boundingBoxArray[])
	{
		self->GetBoundingBoxesForStrings(stringArray, numStrings, mode, deltas, *boundingBoxArray);
	}

	void be_BFont_GetGlyphShapes(BFont *self, const char charArray[], int32 numChars, BShape* glyphShapeArray[])
	{
		self->GetGlyphShapes(charArray, numChars, glyphShapeArray);
	}

	void be_BFont_GetHasGlyphs(BFont *self, const char charArray[], int32 numChars, bool hasArray[])
	{
		self->GetHasGlyphs(charArray, numChars, hasArray);
	}

	BFont* be_BFont_opAssign(BFont *self, const BFont* font)
	{
		return &self->operator=(*font);
	}

	bool be_BFont_opEquals(BFont *self, const BFont* font)
	{
		return self->operator==(*font);
	}

	bool be_BFont_opNotEquals(BFont *self, const BFont* font)
	{
		return self->operator!=(*font);
	}

	void be_BFont_PrintToStream(BFont *self)
	{
		self->PrintToStream();
	}

}


