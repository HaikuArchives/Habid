/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Volume.h>

extern "C" {
	BVolume* be_BVolume_ctor(void *bindInstPtr)
	{
		return new BVolume();
	}

	BVolume* be_BVolume_ctor_1(void *bindInstPtr, dev_t device)
	{
		return new BVolume(device);
	}

	BVolume* be_BVolume_ctor_2(void *bindInstPtr, const BVolume* volume)
	{
		return new BVolume(*volume);
	}

	void be_BVolume_dtor(BVolume* self)
	{
		delete self;
	}

	status_t be_BVolume_InitCheck(BVolume *self)
	{
		return self->InitCheck();
	}

	status_t be_BVolume_SetTo(BVolume *self, dev_t device)
	{
		return self->SetTo(device);
	}

	void be_BVolume_Unset(BVolume *self)
	{
		self->Unset();
	}

	dev_t be_BVolume_Device(BVolume *self)
	{
		return self->Device();
	}

	status_t be_BVolume_GetRootDirectory(BVolume *self, BDirectory* directory)
	{
		return self->GetRootDirectory(directory);
	}

	off_t be_BVolume_Capacity(BVolume *self)
	{
		return self->Capacity();
	}

	off_t be_BVolume_FreeBytes(BVolume *self)
	{
		return self->FreeBytes();
	}

	off_t be_BVolume_BlockSize(BVolume *self)
	{
		return self->BlockSize();
	}

	status_t be_BVolume_GetName(BVolume *self, char* name)
	{
		return self->GetName(name);
	}

	status_t be_BVolume_SetName(BVolume *self, const char* name)
	{
		return self->SetName(name);
	}

	status_t be_BVolume_GetIcon(BVolume *self, BBitmap* icon, icon_size which)
	{
		return self->GetIcon(icon, which);
	}

	status_t be_BVolume_GetIcon_1(BVolume *self, uint8** _data, size_t* _size, type_code* _type)
	{
		return self->GetIcon(_data, _size, _type);
	}

	bool be_BVolume_IsRemovable(BVolume *self)
	{
		return self->IsRemovable();
	}

	bool be_BVolume_IsReadOnly(BVolume *self)
	{
		return self->IsReadOnly();
	}

	bool be_BVolume_IsPersistent(BVolume *self)
	{
		return self->IsPersistent();
	}

	bool be_BVolume_IsShared(BVolume *self)
	{
		return self->IsShared();
	}

	bool be_BVolume_KnowsMime(BVolume *self)
	{
		return self->KnowsMime();
	}

	bool be_BVolume_KnowsAttr(BVolume *self)
	{
		return self->KnowsAttr();
	}

	bool be_BVolume_KnowsQuery(BVolume *self)
	{
		return self->KnowsQuery();
	}

	bool be_BVolume_opEquals(BVolume *self, const BVolume* volume)
	{
		return self->operator==(*volume);
	}

	bool be_BVolume_opNotEquals(BVolume *self, const BVolume* volume)
	{
		return self->operator!=(*volume);
	}

	BVolume * be_BVolume_opAssign(BVolume *self, const BVolume* volume)
	{
		return &self->operator=(*volume);
	}

}


