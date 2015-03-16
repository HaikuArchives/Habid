module Path.Name;

import Support.BObject;

extern (C) extern {
    /* Functions to import */
}

extern (C) {
    /* Functions to export */
}

class BHandler : public BArchivable
{
public:
    mixin BObject;

    /* Constructor for assigning pointer */
    this(void *instancePointer = null) {
        if(instancePointer !is null)
            fInstancePointer = instancePointer;
    }
}
