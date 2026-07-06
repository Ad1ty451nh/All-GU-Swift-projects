import Foundation

class User {
    var profile : Profile?
}

class Profile {
    var user: User
    init(user: User) {
        self.user = user
    }
}

class CorrectProfile {
    weak var user: User?
    init(user: User? = nil) {
        self.user = user
    }
}

class CreditCard {
    unowned let owner : Customer
    init(owner: Customer) {
        self.owner = owner
    }
}

class Customer {
    var card: CreditCard?
}


class Person {
    let name : String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

var reference1 : Person?
var reference2 : Person?
var reference3 : Person?

reference1 = Person(name: "John Appleaseed")

reference2 = reference1

reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil


