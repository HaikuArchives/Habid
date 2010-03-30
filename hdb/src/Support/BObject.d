module Support.BObject;

// typedef void * c_ptr;
/*
const char [] baseConstructor = "
this(c_ptr instancePointer, bool ownsPointer) {
	if(fInstancePointer is null)
		fInstancePointer = instancePointer;
	fOwnsPointer = ownsPointer;
}";

const char [] derivedConstructor = "
this(c_ptr instancePointer, bool ownsPointer) {
	if(fInstancePointer is null)
		fInstancePointer = instancePointer;
	fOwnsPointer = ownsPointer;
	
	super(instancePointer, ownsPointer);
}";
*/

template BObject(char [] typeName, bool base, char [] baseType) {
	static if(base) {
		const char [] BObject =
		typeName ~ "* fInstancePointer = null;
		bool fOwnsPointer = true;

		bool GetOwnsPointer() {
			return fOwnsPointer;	
		}
		
		this(" ~ typeName ~ "* instancePointer, bool ownsPointer) {
			if(fInstancePointer is null)
				fInstancePointer = instancePointer;
			fOwnsPointer = ownsPointer;
		}
		";
	} else {
		const char [] BObject =
		typeName ~ "* fInstancePointer = null;
		bool fOwnsPointer = true;

		bool GetOwnsPointer() {
			return fOwnsPointer;	
		}

		this(" ~ typeName ~ "* instancePointer, bool ownsPointer) {
			if(fInstancePointer is null)
				fInstancePointer = instancePointer;
			fOwnsPointer = ownsPointer;

			super(cast(" ~ baseType ~ " *)instancePointer, ownsPointer);			
		}
		";
	}
}
/*
template BObject()
{
public:
	c_ptr fInstancePointer = null;
	bool fOwnsPointer = true;
	
	c_ptr GetInstancePointer() {
		return fInstancePointer;
	}
	
	void SetInstancePointer(c_ptr instancePointer) {
		assert(instancePointer !is null);
		
		fInstancePointer = instancePointer;
	}
	
	bool GetOwnsPointer() {
		return fOwnsPointer;
	}
	
	void SetOwnsPointer(bool owns) {
		fOwnsPointer = owns;
	}
}
*/
