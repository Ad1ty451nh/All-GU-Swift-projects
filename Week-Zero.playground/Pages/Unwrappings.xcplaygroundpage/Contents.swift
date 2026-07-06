import Foundation

var username: String? = "Alex"
var age:Int? = nil
var score: Int? = 100

if let safeUserName = username{
    print("Hello,\(safeUserName)!")
} else {
    print("No username found")
}


@MainActor func greetUser(){
    guard let safeUserName = username else {
        print("Print provide a username")
        return
    }
    print("Welcome back,\(safeUserName)!")
}




struct User{
    var name:String?
    
    func getGreeting() -> String {
        var safeName = name ?? "guest"
        return "Hello! \(safeName)"
    }
}

var currentUser: User? = User(name:"Bob")
let greeting = currentUser?.name?.uppercased()

let message = currentUser?.getGreeting()


print(message)
