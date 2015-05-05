Chain Of Responsibility
=======================
Chain of Responsibility chains receiving objects and passes the request along
the chain until an object handles it.  This is useful for avoiding
coupling the sender of a request to its receiver by giving more than one
object a chance to handle the request.

Participants
------------
* OODP::Handler
* OODP::ConcreteHandler
