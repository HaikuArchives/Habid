# Introduction #

Here is an example of how the C layer and D layer for a class
with pure virtual functions would look like.


# Details #

Original Class:

```
class MyClass
{
public:
    MyClass() { }
    virtual ~MyClass() { }
    virtual bool IsTrue(bool value) = 0;
}
```

Flattened C File:
```
extern (C) {
    bool bind_MyClass_IsTrue(void *bindInstancePointer, bool value);
}

class MyClassBridge : public MyClass
{
    MyClassBridge()
    : MyClass()
    { }

    virtual ~MyClassBridge()
    { }

    /* To satisfy the compiler so we can instantiate the object */
    virtual bool IsTrue(bool value) {
    }
}

/* Note that we inherit from MyClassBridge insted of MyClass now */
class MyClassProxy : public MyClassBridge
{
public:
    void *fBindInstancePointer;

    MyClassProxy(void *bindInstancePointer)
    : fBindInstancePointer(bindInstancePointer), MyClassBridge()
    { }

    ~MyClassProxy()
    { }

    /*
      This will make any internal call from C++ to this class
      to call into the target language where bind_MyClass_IsTrue
      is defined and exported
    */
    virtual bool IsTrue(bool value) {
        return bind_MyClass_IsTrue(fBindInstancePointer, value);
    }
}

extern "C" {
    void * MyClass_ctor(void *bindInstancePointer) {
        return new MyClassProxy(bindInstancePointer);
    }

    void MyClass_dtor(void *instancePointer) {
        delete (MyClassProxy *)instancePointer;
    }

    /*
      No need to export IsTrue as it is a pure virtual function
      in the base class and never can be called from target language
    */
}
```

D File:
```
module MyClassModule;

extern (C) {
    /*
      This will only call the Base class MyClass IsTrue if the function
      is not overridden by a derived class and therefor the C++ class will
      still work just fine if we just use the base class MyClass inside of D
    */
    bool bind_MyClass_IsTrue(void *bindInstancePointer, bool value) {
        /*
          This function will always exist as it is abstract in MyClass
          we are forced to implement a Derived class of MyClass that
          implements IsTrue
        */
        return (cast(MyClass)bindInstancePointer).IsTrue(value);
    }
}

extern (C) extern {
    void * MyClass_ctor();

    void MyClass_dtor(void *instancePointer);
}

class MyClass
{
public:
    void *fInstancePointer;

    this() {
        /*
          The bind pointer is a pointer to the addess of this class
        */
        if(fInstancePointer is null)
            fInstancePointer = MyClass_ctor(cast(void *)this);
    }

    ~this() {
        if(fInstancePointer !is null)
            MyClass_dtor(fInstancePointer);
        fInstancePointer = null;
    }

    abstract bool IsTrue(bool value);
}

class MyOtherClass : public MyClass
{
    override bool IsTrue(bool value) {
        return value;
    }
}
```
