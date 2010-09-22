/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Support.BlockCache;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

enum {
	B_OBJECT_CACHE = 0,
	B_MALLOC_CACHE = 1
}

extern (C) extern {
	// BBlockCache* be_BBlockCache_ctor(void *bindInstPtr, uint32 blockCount, size_t blockSize, uint32 allocationType);
	void * be_BBlockCache_ctor(void *bindInstPtr, uint32 blockCount, size_t blockSize, uint32 allocationType);

	// void be_BBlockCache_dtor(BBlockCache* self);
	void be_BBlockCache_dtor(void* self);

	// void * be_BBlockCache_Get(BBlockCache *self, size_t blockSize);
	void * be_BBlockCache_Get(void *self, size_t blockSize);

	// void be_BBlockCache_Save(BBlockCache *self, void * pointer, size_t blockSize);
	void be_BBlockCache_Save(void *self, void * pointer, size_t blockSize);

}


extern (C) {
}


interface IBBlockCache
{
	// void * be_BBlockCache_Get(BBlockCache *self, size_t blockSize);
	void [] Get(size_t);

	// void be_BBlockCache_Save(BBlockCache *self, void * pointer, size_t blockSize);
	void Save(void *, size_t);

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BBlockCache : IBBlockCache
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BBlockCache* be_BBlockCache_ctor(void *bindInstPtr, uint32 blockCount, size_t blockSize, uint32 allocationType);
	this(uint32 blockCount, size_t blockSize, uint32 allocationType) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BBlockCache_ctor(cast(void *)this, blockCount, blockSize, allocationType);
			fOwnsPointer = true;
		}
	}

	// void be_BBlockCache_dtor(BBlockCache* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BBlockCache_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// void * be_BBlockCache_Get(BBlockCache *self, size_t blockSize);
	void [] Get(size_t blockSize) {
		return be_BBlockCache_Get(_InstPtr(), blockSize)[0..blockSize];
	}

	// void be_BBlockCache_Save(BBlockCache *self, void * pointer, size_t blockSize);
	void Save(void * buffer, size_t blockSize) {
		be_BBlockCache_Save(_InstPtr(), buffer, blockSize);
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


