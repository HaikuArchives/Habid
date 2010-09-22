/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Support.BufferIO;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import Support.DataIO;

extern (C) extern {
	// BBufferIOProxy * be_BBufferIO_ctor(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream);
	void * be_BBufferIO_ctor(void *bindInstPtr, void * stream, size_t bufferSize, bool ownsStream);

	// void be_BBufferIO_dtor(BBufferIO* self);
	void be_BBufferIO_dtor(void* self);

	// ssize_t be_BBufferIO_ReadAt(BBufferIOProxy *self, off_t pos, void * buffer, size_t size);
	ssize_t be_BBufferIO_ReadAt(void *self, off_t pos, void * buffer, size_t size);

	// ssize_t be_BBufferIO_WriteAt(BBufferIOProxy *self, off_t pos, const void * buffer, size_t size);
	ssize_t be_BBufferIO_WriteAt(void *self, off_t pos,  void * buffer, size_t size);

	// off_t be_BBufferIO_Seek(BBufferIOProxy *self, off_t position, uint32 seekMode);
	off_t be_BBufferIO_Seek(void *self, off_t position, uint32 seekMode);

	// off_t be_BBufferIO_Position(BBufferIOProxy *self);
	off_t be_BBufferIO_Position(void *self);

	// status_t be_BBufferIO_SetSize(BBufferIOProxy *self, off_t size);
	status_t be_BBufferIO_SetSize(void *self, off_t size);

	// status_t be_BBufferIO_Flush(BBufferIOProxy *self);
	status_t be_BBufferIO_Flush(void *self);

	// BPositionIO * be_BBufferIO_Stream(BBufferIOProxy *self);
	void * be_BBufferIO_Stream(void *self);

	// size_t be_BBufferIO_BufferSize(BBufferIOProxy *self);
	size_t be_BBufferIO_BufferSize(void *self);

	// bool be_BBufferIO_OwnsStream(BBufferIOProxy *self);
	bool be_BBufferIO_OwnsStream(void *self);

	// void be_BBufferIO_SetOwnsStream(BBufferIOProxy *self, bool ownsStream);
	void be_BBufferIO_SetOwnsStream(void *self, bool ownsStream);

	// void be_BBufferIO_PrintToStream(BBufferIOProxy *self);
	void be_BBufferIO_PrintToStream(void *self);

}


extern (C) {
	ssize_t bind_BBufferIO_ReadAt(void *bindInstPtr, off_t pos, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BBufferIO)bindInstPtr).ReadAt(pos, x, size);
	}

	ssize_t bind_BBufferIO_WriteAt(void *bindInstPtr, off_t pos,  void * buffer, size_t size) {
		return (cast(BBufferIO)bindInstPtr).WriteAt(pos, buffer[0..size], size);
	}

	off_t bind_BBufferIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode) {
		return (cast(BBufferIO)bindInstPtr).Seek(position, seekMode);
	}

	off_t bind_BBufferIO_Position(void *bindInstPtr) {
		return (cast(BBufferIO)bindInstPtr).Position();
	}

	status_t bind_BBufferIO_SetSize(void *bindInstPtr, off_t size) {
		return (cast(BBufferIO)bindInstPtr).SetSize(size);
	}

	status_t bind_BBufferIO_Flush(void *bindInstPtr) {
		return (cast(BBufferIO)bindInstPtr).Flush();
	}

}


interface IBBufferIO
{
	// ssize_t be_BBufferIO_ReadAt(BBufferIO *self, off_t pos, void * buffer, size_t size);
	ssize_t ReadAt(off_t, inout void [], size_t);

	// ssize_t be_BBufferIO_WriteAt(BBufferIO *self, off_t pos, const void * buffer, size_t size);
	ssize_t WriteAt(off_t, void [], size_t);

	// off_t be_BBufferIO_Seek(BBufferIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t, uint32);

	// off_t be_BBufferIO_Position(BBufferIO *self);
	off_t Position();

	// status_t be_BBufferIO_SetSize(BBufferIO *self, off_t size);
	status_t SetSize(off_t);

	// status_t be_BBufferIO_Flush(BBufferIO *self);
	status_t Flush();

	// BPositionIO * be_BBufferIO_Stream(BBufferIO *self);
	IBPositionIO Stream();

	// size_t be_BBufferIO_BufferSize(BBufferIO *self);
	size_t BufferSize();

	// bool be_BBufferIO_OwnsStream(BBufferIO *self);
	bool OwnsStream();

	// void be_BBufferIO_SetOwnsStream(BBufferIO *self, bool ownsStream);
	void SetOwnsStream(bool);

	// void be_BBufferIO_PrintToStream(BBufferIO *self);
	void PrintToStream();

	void * _InstPtr();
	bool _OwnsPtr();
}

class BBufferIO : public BPositionIO, IBBufferIO
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BBufferIOProxy * be_BBufferIO_ctor(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream);
	this(IBPositionIO stream, size_t bufferSize = 65536L, bool ownsStream = true) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BBufferIO_ctor(cast(void *)this, stream._InstPtr(), bufferSize, ownsStream);
			fOwnsPointer = true;
		}
		super();
	}

	// void be_BBufferIO_dtor(BBufferIO* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BBufferIO_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// ssize_t be_BBufferIO_ReadAt(BBufferIO *self, off_t pos, void * buffer, size_t size);
	ssize_t ReadAt(off_t pos, inout void [] buffer, size_t size) {
		return be_BBufferIO_ReadAt(_InstPtr(), pos, buffer.ptr, size);
	}

	// ssize_t be_BBufferIO_WriteAt(BBufferIO *self, off_t pos, const void * buffer, size_t size);
	ssize_t WriteAt(off_t pos, void [] buffer, size_t size) {
		return be_BBufferIO_WriteAt(_InstPtr(), pos, buffer.ptr, size);
	}

	// off_t be_BBufferIO_Seek(BBufferIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BBufferIO_Seek(_InstPtr(), position, seekMode);
	}

	// off_t be_BBufferIO_Position(BBufferIO *self);
	off_t Position() {
		return be_BBufferIO_Position(_InstPtr());
	}

	// status_t be_BBufferIO_SetSize(BBufferIO *self, off_t size);
	status_t SetSize(off_t size) {
		return be_BBufferIO_SetSize(_InstPtr(), size);
	}

	// status_t be_BBufferIO_Flush(BBufferIO *self);
	status_t Flush() {
		return be_BBufferIO_Flush(_InstPtr());
	}

	// BPositionIO * be_BBufferIO_Stream(BBufferIO *self);
	IBPositionIO Stream() {
		return new BPositionIO(be_BBufferIO_Stream(_InstPtr()), false);
	}

	// size_t be_BBufferIO_BufferSize(BBufferIO *self);
	size_t BufferSize() {
		return be_BBufferIO_BufferSize(_InstPtr());
	}

	// bool be_BBufferIO_OwnsStream(BBufferIO *self);
	bool OwnsStream() {
		return be_BBufferIO_OwnsStream(_InstPtr());
	}

	// void be_BBufferIO_SetOwnsStream(BBufferIO *self, bool ownsStream);
	void SetOwnsStream(bool ownsStream) {
		be_BBufferIO_SetOwnsStream(_InstPtr(), ownsStream);
	}

	// void be_BBufferIO_PrintToStream(BBufferIO *self);
	void PrintToStream() {
		be_BBufferIO_PrintToStream(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


