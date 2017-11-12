//: ## Protocols and Extensions
// this protocol is like an abstract class in Java, or a class with pure virtual methods in C++
//:
//: Use `protocol` to declare a protocol.
//:
protocol ExampleProtocol {
     var simpleDescription: String { get } // this means there is a get only operator?
     mutating func adjust()  // it does not use "void" if the function does not return anything
}

//: Classes, enumerations, and structs can all adopt protocols.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() { // does not use "void" if the func does not return
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)
struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)
//: - Experiment:
//: Write an enumeration that conforms to this protocol.
//:
//: Notice the use of the `mutating` keyword in the declaration of `SimpleStructure` to mark a method that modifies the structure. The declaration of `SimpleClass` doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
//:
//: Use `extension` to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
//:
extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
print(9.simpleDescription)

//: - Experiment:
//: Write an extension for the `Double` type that adds an `absoluteValue` property.
//:
//: You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)  // Uncomment to see the error

//: Even though the variable `protocolValue` has a runtime type of `SimpleClass`, the compiler treats it as the given type of `ExampleProtocol`. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
//:


//: [Previous](@previous) | [Next](@next)
