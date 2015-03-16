# Introduction #

Here is an example of how the C layer and D layer for a class
with virtual functions would look like.


# Details #

Original Class:

```
class MyClass
{
public:
    MyClass() { }
    virtual ~MyClass() { }

    virtual bool IsTrue(bool value) {
        return value;
    }
}
```

Flattened C File:
```
extern (C) {
    bool bind_MyClass_IsTrue(void *bindInstancePointer, bool value);
}

class MyClassProxy : public MyClass
{
public:
    void *fBindInstancePointer;

    MyClassProxy(void *bindInstancePointer)
    : fBindInstancePointer(bindInstancePointer), MyClass()
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

    virtual bool IsTrue_super(bool value) {
        return MyClass::IsTrue(value);
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
      We only need to export the super function as the target
      language never will have to call the bind_MyClass_IsTrue
      function.
    */
    bool MyClass_IsTrue_super(void *instancePointer, bool value) {
        return ((MyClassProxy *)instancePointer)->IsTrue(value);
    }
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
        return (cast(MyClass)bindInstancePointer).IsTrue(value);
    }
}

extern (C) extern {
    void * MyClass_ctor();

    void MyClass_dtor(void *instancePointer);

    bool MyClass_IsTrue_super(void *instancePointer, bool value);
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

    bool IsTrue(bool value) {
        /*
          We will always just have to call the _super function here
        */
        return MyClass_IsTrue_super(fInstancePointer, value);
    }
}

class MyOtherClass : public MyClass
{
    override bool IsTrue(bool value) {
        Stdout.formatln("IsTrue is overloaded!");
        return super.IsTrue(value);
    }
}
```