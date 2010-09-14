/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <BlockCache.h>



extern "C" {
	BBlockCache* be_BBlockCache_ctor(void *bindInstPtr, uint32 blockCount, size_t blockSize, uint32 allocationType)
	{
		return new BBlockCache(blockCount, blockSize, allocationType);
	}

	void be_BBlockCache_dtor(BBlockCache* self)
	{
		delete self;
	}

	void * be_BBlockCache_Get(BBlockCache *self, size_t blockSize)
	{
		return self->Get(blockSize);
	}

	void be_BBlockCache_Save(BBlockCache *self, void * pointer, size_t blockSize)
	{
		self->Save(pointer, blockSize);
	}

}

