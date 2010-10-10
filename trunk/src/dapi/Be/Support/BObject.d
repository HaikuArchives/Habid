/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Be.Support.BObject;

template BObject()
{
	const char [] BObject =
	"
/*	private:
	void *fInstancePointer = null;
	bool fOwnsPointer; */
	public:
		this(void *instancePointer, bool ownsPointer)
		{
			_InstPtr = instancePointer;
			_OwnsPtr = ownsPointer;
		}
	";	
}

template BObjectInherited()
{
	const char [] BObjectInherited =
	"
/*	private:
	void *fInstancePointer = null;
	bool fOwnsPointer; */
	public:
		this(void *instancePointer, bool ownsPointer)
		{
			_InstPtr = instancePointer;
			_OwnsPtr = ownsPointer;
			
			super(instancePointer, ownsPointer);
		}
	";	
}
