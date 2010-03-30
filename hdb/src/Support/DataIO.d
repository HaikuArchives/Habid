module Support.DataIO;

import Support.BObject;
import Support.SupportDefs;
import tango.stdc.posix.sys.types;
import tango.stdc.stringz;
import tango.io.Stdout;
import tango.stdc.stdlib;
import tango.stdc.string;

import Support.types;

extern (C) extern {
	be_BDataIO *	be_BDataIO_ctor(be_BDataIO *);
	void			be_BDataIO_dtor(be_BDataIO *);
	ssize_t			be_BDataIO_Read_super(be_BDataIO *, void *, size_t);
	ssize_t			be_BDataIO_Write_super(be_BDataIO *, void *, size_t);
}

extern (C) {
	ssize_t bind_BDataIO_Read_pure(be_BDataIO *bindInstPointer, void *buffer, ssize_t size) {
		auto x = buffer[0..size];
		return (cast(BDataIO)bindInstPointer).Read(x);
	}
	
	ssize_t bind_BDataIO_Write_pure(be_BDataIO *bindInstPointer, void *buffer, ssize_t size) {
		return (cast(BDataIO)bindInstPointer).Write(buffer[0..size]);
	}
}


class BDataIO
{
public:
	mixin(BObject!("be_BDataIO", true, null));
	
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDataIO_ctor(cast(be_BDataIO *)this);
		}
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BDataIO_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	ssize_t Read(inout void [] buffer) {
		assert(false, "BDataIO::Read needs to be implemented");
	}
	
	ssize_t Write(void [] buffer) {
		assert(false, "BDataIO::Write needs to be implemented");
	}
}


extern (C) extern {
	be_BPositionIO * 	be_BPositionIO_ctor(be_BPositionIO * );
	void				be_BPositionIO_dtor(be_BPositionIO * );
	ssize_t				be_BPositionIO_Read_super(be_BPositionIO *, void *, size_t);
	ssize_t				be_BPositionIO_Write_super(be_BPositionIO *, void *, size_t);
	ssize_t				be_BPositionIO_ReadAt_super(be_BPositionIO *, off_t, void * , size_t);
	ssize_t				be_BPositionIO_WriteAt_super(be_BPositionIO *, off_t, void *, size_t);
	off_t				be_BPositionIO_Seek_super(be_BPositionIO *, off_t, uint32);
	off_t				be_BPositionIO_Position_super(be_BPositionIO *);
	status_t			be_BPositionIO_SetSize_super(be_BPositionIO *, off_t);
	status_t			be_BPositionIO_GetSize_super(be_BPositionIO *, off_t *);
}

extern (C) {
	ssize_t		bind_BPositionIO_ReadAt_pure(be_BPositionIO *bindInstPointer, off_t position, void *buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPointer).ReadAt(position, x);
	}

	ssize_t		bind_BPositionIO_WriteAt_pure(be_BPositionIO * bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t		bind_BPositionIO_Seek_pure(be_BPositionIO * bindInstPointer, off_t pos, uint32 seekMode) {
		return (cast(BPositionIO)bindInstPointer).Seek(pos, seekMode);
	}

	off_t		bind_BPositionIO_Position_pure(be_BPositionIO * bindInstPointer) {
		return (cast(BPositionIO)bindInstPointer).Position();
	}


	ssize_t bind_BPositionIO_Read_virtual(be_BPositionIO * bindInstPointer, void *buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPointer).Read(x);
	}
	
	ssize_t bind_BPositionIO_Write_virtual (be_BPositionIO * bindInstPointer, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).Write(buffer[0..size]);
	}
		
	status_t bind_BPositionIO_SetSize_virtual(be_BPositionIO * bindInstPointer, off_t size) {
		return (cast(BPositionIO)bindInstPointer).SetSize(size);
	}
	
	status_t bind_BPositionIO_GetSize_virtual(be_BPositionIO * bindInstPointer, off_t *size) {
		return (cast(BPositionIO)bindInstPointer).GetSize(size);
	}
}

class BPositionIO : public BDataIO
{
public:
	mixin(BObject!("be_BPositionIO", false, "be_BDataIO"));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BPositionIO_ctor(cast(be_BPositionIO *)this);
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BPositionIO_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	ssize_t Read(inout void [] buffer) {
		return be_BPositionIO_Read_super(fInstancePointer, buffer.ptr, buffer.length);
	}
	
	ssize_t Write(void [] buffer) {
		return be_BPositionIO_Write_super(fInstancePointer, buffer.ptr, buffer.length);
	}
	
	ssize_t ReadAt(off_t position, inout void [] buffer) {
		assert(false, "BPositionIO::ReadAt needs to be implemented");
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		assert(false, "BPositionIO::WriteAt needs to be implemented");
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		assert(false, "BPositionIO::Seek needs to be implemented");
	}
	
	off_t Position() {
		assert(false, "BPositionIO::Position needs to be implemented");
	}
	
	status_t SetSize(off_t size) {
		return be_BPositionIO_SetSize_super(fInstancePointer, size);
	}
	
	status_t GetSize(off_t *size) {
		return be_BPositionIO_GetSize_super(fInstancePointer, size);
	}
}

extern (C) extern {
	be_BMemoryIO *	be_BMemoryIO_ctor_1(be_BMemoryIO *, void *data, size_t length);
	be_BMemoryIO *	be_BMemoryIO_ctor_2(be_BMemoryIO *, void *data, size_t length);
	
	void 			be_BMemoryIO_dtor(be_BMemoryIO *);
	
	ssize_t 		be_BMemoryIO_ReadAt_super(be_BMemoryIO *, off_t, void *, size_t);

	ssize_t 		be_BMemoryIO_WriteAt_super(be_BMemoryIO *, off_t, void *, size_t);

	off_t			be_BMemoryIO_Seek_super(be_BMemoryIO *, off_t, uint32);

	off_t			be_BMemoryIO_Position_super(be_BMemoryIO *);

	status_t		be_BMemoryIO_SetSize_super(be_BMemoryIO *, off_t);
}

extern (C) {
	ssize_t bind_BMemoryIO_ReadAt_virtual(be_BMemoryIO * bindInstPointer, off_t position, void *buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMemoryIO)bindInstPointer).ReadAt(position, x);
	}
	ssize_t bind_BMemoryIO_WriteAt_virtual(be_BMemoryIO * bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMemoryIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t bind_BMemoryIO_Seek_virtual(be_BMemoryIO * bindInstPointer, off_t position, uint32 seekMode) {
		return (cast(BMemoryIO)bindInstPointer).Seek(position, seekMode);
	}
	off_t bind_BMemoryIO_Position_virtual(be_BMemoryIO * bindInstPointer) {
		return (cast(BMemoryIO)bindInstPointer).Position();
	}

	status_t bind_BMemoryIO_SetSize_virtual(be_BMemoryIO * bindInstPointer, off_t size) {
		return (cast(BMemoryIO)bindInstPointer).SetSize(size);
	}
}

class BMemoryIO : BPositionIO
{
public:
	mixin(BObject!("be_BMemoryIO", false, "be_BPositionIO"));
	
	this(void [] data) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMemoryIO_ctor_1(cast(be_BMemoryIO *)this, data.ptr, data.length);
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BMemoryIO_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	ssize_t ReadAt(off_t position, inout void [] buffer) {
		return be_BMemoryIO_ReadAt_super(fInstancePointer, position, buffer.ptr, buffer.length);
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		return be_BMemoryIO_WriteAt_super(fInstancePointer, position, buffer.ptr, buffer.length);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMemoryIO_Seek_super(fInstancePointer, position, seekMode);
	}
	
	off_t Position() {
		return be_BMemoryIO_Position_super(fInstancePointer);
	}
	
	status_t SetSize(off_t size) {
		return be_BMemoryIO_SetSize_super(fInstancePointer, size);
	}
}

extern (C) extern {
	be_BMallocIO *	be_BMallocIO_ctor(be_BMallocIO *);
	void			be_BMallocIO_dtor(be_BMallocIO *);
	ssize_t			be_BMallocIO_ReadAt_super(be_BMallocIO *, off_t, void *, size_t);
	ssize_t			be_BMallocIO_WriteAt_super(be_BMallocIO * , off_t, void *, size_t);
	off_t			be_BMallocIO_Seek_super(be_BMallocIO *, off_t, uint32);
	off_t			be_BMallocIO_Position_super(be_BMallocIO *);
	status_t		be_BMallocIO_SetSize_super(be_BMallocIO *, size_t);

	void			be_BMallocIO_SetBlockSize(be_BMallocIO *, size_t);
	void * 			be_BMallocIO_Buffer(be_BMallocIO *);
	size_t			be_BMallocIO_BufferLength(be_BMallocIO *);
}

extern (C) {
	ssize_t bind_BMallocIO_ReadAt_virtual(be_BMallocIO * bindInstPointer, off_t position, void *buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMallocIO)bindInstPointer).ReadAt(position, x);
	}
	
	ssize_t bind_BMallocIO_WriteAt_virtual(be_BMallocIO * bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMallocIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t bind_BMallocIO_Seek_virtual(be_BMallocIO * bindInstPointer, off_t position, uint32 seekMode) {
		return (cast(BMallocIO)bindInstPointer).Seek(position, seekMode);
	}
	
	off_t bind_BMallocIO_Position_virtual(be_BMallocIO * bindInstPointer) {
		return (cast(BMallocIO)bindInstPointer).Position();
	}

	status_t bind_BMallocIO_SetSize_virtual(be_BMallocIO * bindInstPointer, off_t size) {
		return (cast(BMallocIO)bindInstPointer).SetSize(size);
	}
}

class BMallocIO : BPositionIO
{
public:
	mixin(BObject!("be_BMallocIO", false, "be_BPositionIO"));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BMallocIO_ctor(cast(be_BMallocIO *)this);
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BMallocIO_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	ssize_t ReadAt(off_t position, inout void [] buffer) {
		return be_BMallocIO_ReadAt_super(fInstancePointer, position, buffer.ptr, buffer.length);
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		return be_BMallocIO_WriteAt_super(fInstancePointer, position, buffer.ptr, buffer.length);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMallocIO_Seek_super(fInstancePointer, position, seekMode);
	}
	
	off_t Position() {
		return be_BMallocIO_Position_super(fInstancePointer);
	}
	
	status_t SetSize(size_t size) {
		return be_BMallocIO_SetSize_super(fInstancePointer, size);
	}
	
	final void SetBlockSize(size_t size) {
		return be_BMallocIO_SetBlockSize(fInstancePointer, size);
	}
	
	final void [] Buffer() {
		return be_BMallocIO_Buffer(fInstancePointer)[0..BufferLength()];
	}
	
	final size_t BufferLength() {
		return be_BMallocIO_BufferLength(fInstancePointer);
	}
}

