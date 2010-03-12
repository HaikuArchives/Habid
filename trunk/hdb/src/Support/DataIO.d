module Support.DataIO;

import Support.BObject;
import Support.SupportDefs;
import tango.stdc.posix.sys.types;
import tango.stdc.stringz;
import tango.io.Stdout;
import tango.stdc.stdlib;
import tango.stdc.string;

extern (C) extern {
	void *		be_BDataIOProxy_ctor(void *);
	void *		be_BDataIO_ctor(void *);
	void		be_BDataIO_dtor(void *);
	ssize_t		be_BDataIO_Read(void *, void *, size_t);
	ssize_t		be_BDataIO_Read_super(void *, void *, size_t);
	ssize_t		be_BDataIO_Write(void *, void *, size_t);
	ssize_t		be_BDataIO_Write_super(void *, void *, size_t);
}

extern (C) {
	ssize_t bind_BDataIO_Read_pure(void *bindInstPointer, void *buffer, ssize_t size) {
		return (cast(BDataIO)bindInstPointer).Read(buffer[0..size]);
	}
	
	ssize_t bind_BDataIO_Write_pure(void *bindInstPointer, void *buffer, ssize_t size) {
		return (cast(BDataIO)bindInstPointer).Write(buffer[0..size]);
	}
}


class BDataIO
{
public:
	mixin BObject;

	this() {
		Stdout.formatln("BDataIO ctor");
		if(c_obj is null) {
			c_obj = be_BDataIO_ctor(cast(void *)this);
//			proxy_obj = be_BDataIOProxy_ctor(cast(void *)this);
			Stdout.formatln("BDataIO::Init c_obj");
		}
	}
	
	~this() {
		if(c_obj !is null)
			be_BDataIO_dtor(c_obj);
		c_obj = null;
	}
	
	ssize_t Read(void [] buffer) {
		return be_BDataIO_Read_super(c_obj, buffer.ptr, buffer.length);
	}
		
	
	ssize_t Write(void [] buffer) {
		return be_BDataIO_Write_super(c_obj, buffer.ptr, buffer.length);
	}
}


extern (C) extern {
	void *		be_BPositionIO_ctor(void *);
	void		be_BPositionIO_dtor(void *);
	ssize_t		be_BPositionIO_Read(void *, void *, size_t);
	ssize_t		be_BPositionIO_Read_super(void *, void *, size_t);
	ssize_t		be_BPositionIO_Write(void *, void *, size_t);
	ssize_t		be_BPositionIO_Write_super(void *, void *, size_t);
	ssize_t		be_BPositionIO_ReadAt(void *, off_t, void *, size_t);
	ssize_t		be_BPositionIO_ReadAt_super(void *, off_t, void *, size_t);
	ssize_t		be_BPositionIO_WriteAt(void *, off_t, void *, size_t);
	ssize_t		be_BPositionIO_WriteAt_super(void *, off_t, void *, size_t);
	off_t		be_BPositionIO_Seek(void *, off_t pos, uint32 seekMode);
	off_t		be_BPositionIO_Seek_super(void *, off_t pos, uint32 seekMode);
	off_t		be_BPositionIO_Position(void *);
	off_t		be_BPositionIO_Position_super(void *);
	status_t	be_BPositionIO_SetSize(void *, off_t size);
	status_t	be_BPositionIO_SetSize_super(void *, off_t size);
	status_t	be_BPositionIO_GetSize(void *, off_t *size);
	status_t	be_BPositionIO_GetSize_super(void *, off_t *size);
}

extern (C) {
	ssize_t		bind_BPositionIO_ReadAt_pure(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).ReadAt(position, buffer[0..size]);
	}

	ssize_t		bind_BPositionIO_WriteAt_pure(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t		bind_BPositionIO_Seek_pure(void *bindInstPointer, off_t pos, uint32 seekMode) {
		return (cast(BPositionIO)bindInstPointer).Seek(pos, seekMode);
	}

	off_t		bind_BPositionIO_Position_pure(void *bindInstPointer) {
		return (cast(BPositionIO)bindInstPointer).Position();
	}


	ssize_t bind_BPositionIO_Read_virtual(void *bindInstPointer, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).Read(buffer[0..size]);
	}
	
	ssize_t bind_BPositionIO_Write_virtual (void *bindInstPointer, void *buffer, size_t size) {
		return (cast(BPositionIO)bindInstPointer).Write(buffer[0..size]);
	}
		
	status_t bind_BPositionIO_SetSize_virtual(void *bindInstPointer, off_t size) {
		return (cast(BPositionIO)bindInstPointer).SetSize(size);
	}
	
	status_t bind_BPositionIO_GetSize_virtual(void *bindInstPointer, off_t *size) {
		return (cast(BPositionIO)bindInstPointer).GetSize(size);
	}
}

class BPositionIO : BDataIO
{
public:
	this() {
		Stdout.formatln("BPositionIO ctor");
		if(c_obj is null) {
			c_obj = be_BPositionIO_ctor(cast(void *)this);
			Stdout.formatln("BPositionIO::Init c_obj");
		}
		super();
	}
	
	~this() {
		if(c_obj !is null)
			be_BPositionIO_dtor(c_obj);
		c_obj = null;
	}
	
	ssize_t Read(void [] buffer) {
		return be_BPositionIO_Read_super(c_obj, buffer.ptr, buffer.length);
	}
	
	ssize_t Write(void [] buffer) {
		return be_BPositionIO_Write_super(c_obj, buffer.ptr, buffer.length);
	}
	
	abstract ssize_t ReadAt(off_t position, void [] buffer);
	
	abstract ssize_t WriteAt(off_t position, void [] buffer);
	
	abstract off_t Seek(off_t position, uint32 seekMode);
	
	abstract off_t Position();
	
	status_t SetSize(off_t size) {
		return be_BPositionIO_SetSize_super(c_obj, size);
	}
	
	status_t GetSize(off_t *size) {
		return be_BPositionIO_GetSize_super(c_obj, size);
	}
}

extern (C) extern {
	void * 		be_BMemoryIO_ctor_1(void *, void *data, size_t length);
	void * 		be_BMemoryIO_ctor_2(void *, void *data, size_t length);
	
	void 		be_BMemoryIO_dtor(void *);
	
	ssize_t 	be_BMemoryIO_ReadAt(void *, off_t, void *, size_t);
	ssize_t 	be_BMemoryIO_ReadAt_super(void *, off_t, void *, size_t);

	ssize_t 	be_BMemoryIO_WriteAt(void *, off_t, void *, size_t);
	ssize_t 	be_BMemoryIO_WriteAt_super(void *, off_t, void *, size_t);

	off_t		be_BMemoryIO_Seek(void *, off_t, uint32);
	off_t		be_BMemoryIO_Seek_super(void *, off_t, uint32);

	off_t		be_BMemoryIO_Position(void *);
	off_t		be_BMemoryIO_Position_super(void *);

	status_t	be_BMemoryIO_SetSize(void *, off_t);
	status_t	be_BMemoryIO_SetSize_super(void *, off_t);
}

extern (C) {
	ssize_t bind_BMemoryIO_ReadAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMemoryIO)bindInstPointer).ReadAt(position, buffer[0..size]);
	}
	ssize_t bind_BMemoryIO_WriteAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMemoryIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t bind_BMemoryIO_Seek_virtual(void *bindInstPointer, off_t position, uint32 seekMode) {
		return (cast(BMemoryIO)bindInstPointer).Seek(position, seekMode);
	}
	off_t bind_BMemoryIO_Position_virtual(void *bindInstPointer) {
		return (cast(BMemoryIO)bindInstPointer).Position();
	}

	status_t bind_BMemoryIO_SetSize_virtual(void *bindInstPointer, off_t size) {
		return (cast(BMemoryIO)bindInstPointer).SetSize(size);
	}
}

class BMemoryIO : BPositionIO
{
public:
	this(void [] data) {
		Stdout.formatln("BMemoryIO ctor");
		if(c_obj is null) {
			c_obj = be_BMemoryIO_ctor_1(cast(void *)this, data.ptr, data.length);
			Stdout.formatln("BMemoryIO::Init c_obj");
		}
		super();
	}
	
	~this() {
		if(c_obj !is null)
			be_BMemoryIO_dtor(c_obj);
		c_obj = null;
	}
	
	ssize_t ReadAt(off_t position, void [] buffer) {
		return be_BMemoryIO_ReadAt_super(c_obj, position, buffer.ptr, buffer.length);
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		return be_BMemoryIO_WriteAt_super(c_obj, position, buffer.ptr, buffer.length);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMemoryIO_Seek_super(c_obj, position, seekMode);
	}
	
	off_t Position() {
		return be_BMemoryIO_Position_super(c_obj);
	}
	
	status_t SetSize(off_t size) {
		return be_BMemoryIO_SetSize_super(c_obj, size);
	}
}

extern (C) extern {
	void * 		be_BMallocIO_ctor(void *, void *);
	void		be_BMallocIO_dtor(void *);
	ssize_t		be_BMallocIO_ReadAt(void *, off_t, void *, size_t);
	ssize_t		be_BMallocIO_ReadAt_super(void *, off_t, void *, size_t);
	ssize_t		be_BMallocIO_WriteAt(void *, off_t, void *, size_t);
	ssize_t		be_BMallocIO_WriteAt_super(void *, off_t, void *, size_t);
	off_t		be_BMallocIO_Seek(void *, off_t, uint32);
	off_t		be_BMallocIO_Seek_super(void *, off_t, uint32);
	off_t		be_BMallocIO_Position(void *);
	off_t		be_BMallocIO_Position_super(void *);
	status_t	be_BMallocIO_SetSize(void *, size_t);
	status_t	be_BMallocIO_SetSize_super(void *, size_t);

	void		be_BMallocIO_SetBlockSize(void *, size_t);
	void *		be_BMallocIO_Buffer(void *);
	size_t		be_BMallocIO_BufferLength(void *);
}

extern (C) {
	ssize_t bind_BMallocIO_ReadAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMallocIO)bindInstPointer).ReadAt(position, buffer[0..size]);
	}
	
	ssize_t bind_BMallocIO_WriteAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size) {
		return (cast(BMallocIO)bindInstPointer).WriteAt(position, buffer[0..size]);
	}

	off_t bind_BMallocIO_Seek_virtual(void *bindInstPointer, off_t position, uint32 seekMode) {
		return (cast(BMallocIO)bindInstPointer).Seek(position, seekMode);
	}
	
	off_t bind_BMallocIO_Position_virtual(void *bindInstPointer) {
		return (cast(BMallocIO)bindInstPointer).Position();
	}

	status_t bind_BMallocIO_SetSize_virtual(void *bindInstPointer, off_t size) {
		return (cast(BMallocIO)bindInstPointer).SetSize(size);
	}
}

class BMallocIO : BPositionIO
{
public:
	this() {
		Stdout.formatln("BMallocIO ctor");
		if(c_obj is null) {
			auto sup = super;
			
			c_obj = be_BMallocIO_ctor(cast(void *)this, cast(void *)sup);
			Stdout.formatln("BMallocIO::Init c_obj");
		}
		super();
	}
	
	~this() {
		if(c_obj !is null)
			be_BMallocIO_dtor(c_obj);
		c_obj = null;
	}
	
	ssize_t ReadAt(off_t position, void [] buffer) {
		return be_BMallocIO_ReadAt_super(c_obj, position, buffer.ptr, buffer.length);
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		return be_BMallocIO_WriteAt_super(c_obj, position, buffer.ptr, buffer.length);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMallocIO_Seek_super(c_obj, position, seekMode);
	}
	
	off_t Position() {
		return be_BMallocIO_Position_super(c_obj);
	}
	
	status_t SetSize(size_t size) {
		return be_BMallocIO_SetSize_super(c_obj, size);
	}
	
	final void SetBlockSize(size_t size) {
		return be_BMallocIO_SetBlockSize(c_obj, size);
	}
	
	final void [] Buffer() {
		return be_BMallocIO_Buffer(c_obj)[0..BufferLength()];
	}
	
	final size_t BufferLength() {
		return be_BMallocIO_BufferLength(c_obj);
	}
}

