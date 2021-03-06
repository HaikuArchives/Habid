# Introduction #

Here is an example of how the C layer and D layer for a class
without virtual functions would look like.


# Details #

Original Class:

```
class MyClass
{
public:
    MyClass() { }
    ~MyClass() { }

    bool IsTrue(bool value) {
        return value;
    }
}
```

Flattened C File:
```

extern "C" {
    void * MyClass_ctor() {
        return new MyClass;
    }

    void MyClass_dtor(void *instancePointer) {
        delete (MyClass *)instancePointer;
    }

    bool MyClass_IsTrue(void *instancePointer, bool value) {
        return ((MyClass *)instancePointer)->IsTrue(value);
    }
}
```

D File:
```
module MyClassModule;

extern (C) extern {
    void * MyClass_ctor();

    void MyClass_dtor(void *instancePointer);

    bool MyClass_IsTrue(void *instancePointer, bool value);
}

/*
  We mark the class Final as the C++ class does not have
  virtual functions, it is not supposed to be inherited
*/
final class MyClass
{
public:
    void *fInstancePointer;

    this() {
        if(fInstancePointer is null)
            fInstancePointer = MyClass_ctor();
    }

    ~this() {
        if(fInstancePointer !is null)
            MyClass_dtor(fInstancePointer);
        fInstancePointer = null;
    }

    bool IsTrue(bool value) {
        return MyClass_IsTrue(fInstancePointer, value);
    }
}
```