#ifndef __HEADERNAME_H__
#define __HEADERNAME_H__

/* begin class BClassBridge */

class BClassBridge : public BSomeClass
{
public:
};

/* end class BClassBridge */

/* begin class BClassProxy */

class BClassProxy : public BClassBridge
{
private:
    void *fBindInstPointer;
public:
    BClassProxy(void *bindInstPointer);
};

/* end class BClassProxy */

#endif
