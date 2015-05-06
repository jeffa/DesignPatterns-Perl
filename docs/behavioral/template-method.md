Template Method
===============
The Template Method pattern allows subclasses to redefine certain steps of an
algorithm without changing the structure of that algorithm. This is useful for
implementing the invariant parts of an algorithm once and letting subclasses
implement variant behavior.

Structure
---------
```
     +------------------------+
     |     AbstractClass      |
     +------------------------+      +-------------------------+
     |                        |      |  primitive_operation1() |
     | template_method()  o----------+  ...                    |
     |                        |      |  primitive_operation2() |
     | primitive_operation1() |      |  ...                    |
     | primitive_operation2() |      +-------------------------+
     +------------------------+
                  ^                  
                  |
     +------------------------+
     |     ConcreteClass      |
     +------------------------+
     |                        |
     | primitive_operation1() | 
     | primitive_operation2() | 
     +------------------------+
```

Participants
------------
* [OODP::AbstractClass](/lib/OODP/AbstractClass.pm)
* Your::ConcreteClasses

Tests
-----
* [/t/022-template-method.t](/t/022-template-method.t)
* [/t/122-template-method.t](/t/122-template-method.t)
  * [Test::TemplateMethod::Application](/t/lib/Test/TemplateMethod/Application.pm)
  * [Test::TemplateMethod::Document](/t/lib/Test/TemplateMethod/Document.pm)
  * [Test::TemplateMethod::JSONDocument](/t/lib/Test/TemplateMethod/JSONDocument.pm)
  * [Test::TemplateMethod::TextDocument](/t/lib/Test/TemplateMethod/TextDocument.pm)
  * [Test::TemplateMethod::XMLDocument](/t/lib/Test/TemplateMethod/XMLDocument.pm)
