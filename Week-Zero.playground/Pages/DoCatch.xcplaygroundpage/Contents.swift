import Foundation

enum NetworkError: Error{
    case badUrl
    case noConnection
    case timeout
    case serverError(code: Int)
}

enum ValidationError: Error {
    case emptyName
    case invalidEmail
    case ageTooYoung
}

func validateAge(_ age:Int) throws -> Bool {
    if age < 18 {
        throw ValidationError.ageTooYoung
    }
    return true
}

func fetchData(from urlString: String)throws -> String {
    guard !urlString.isEmpty else {
        throw NetworkError.badUrl
    }
    
    if Bool.random(){
        throw NetworkError.serverError(code: 500)
    }
    
    return "data from server"
}

func basicTryCatch(){
    do{
        let isValid = try validateAge(25)
        print("validation passed: \(isValid)")
    } catch {
        print("error occured: \(error)")
    }
}

func specificCatchBlocks() {
    do {
        let data = try fetchData(from: "")
        print("received: \(data)")
    } catch NetworkError.badUrl{
        print("fix your url")
    } catch NetworkError.serverError(let code){
        print("server returned error code: \(code)")
    } catch{
        print("Something else went wrong: \(error)")
    }
}

func optionalTry() {

    let result = try? validateAge(15)

    if let validAge = result {
        print("age is valid")
    } else {
        print("age check failed, but we don't know why")
    }

    if (try? validateAge(20)) != nil {
        print("proceed with registration")
    }
}


func forcedTry(){
    let result = try! validateAge(30)
    print("guaranteed valid: \(result)")
}

func performOperation<T>(_ operation: () throws -> T) rethrows -> T {
    return try operation()
}

func usingRethrow(){
    do {
        let result = try performOperation{
            try validateAge(15)
        }
        print(result)
    }catch {
        print("Caught rethrown error: \(error)")
    }
}

struct User {
    let name: String
    let email: String
    let age: Int
}

func registerUser(name: String,email: String, age: Int) throws -> User {
    guard !name.isEmpty else {
        throw ValidationError.emptyName
    }
    
    guard email.contains("@") else {
        throw ValidationError.invalidEmail
    }
    
    try validateAge(age)
    
    return User(name: name, email: email, age: age)
}

func registrationFlow() {
    do{
        let user = try registerUser(name: "Shubh", email: "shubh@gmail.com", age: 22)
        print("user registered: \(user.name)")
        
        let data = try fetchData(from: "api.example.com/users")
        print("saved to server: \(data)")
    }
    
    catch ValidationError.emptyName{
        print("please enter your name")
    }
    
    catch ValidationError.invalidEmail{
        print("Please enter your Email")
    }
    
    catch ValidationError.ageTooYoung{
        print("must be 18 or older")
    }
    
    catch NetworkError.serverError(let code){
        print("server error \(code),try again later")
    }
    
    catch {
        print("Unexpected Error")
    }
}

func readfile() throws {
    print("opening file")
    
    defer{
        print("closing file")
    }
    
    throw NetworkError.timeout
    
}

func testDefer(){
    do {
        try readfile()
    } catch {
        print("caught Error: \(error)")
    }
}

func processUserData() throws -> String {
    let user = try registerUser(name: "Aditya", email: "adi@gmail.com", age: 21)
    let userData = try fetchData(from: "api.com/profile")
    
    return "processed \(user.name): \(userData)"
}

print("=== Basic try-Catch ===")
basicTryCatch()

print("\n === Specific Catches ===")
specificCatchBlocks()

optionalTry()

registrationFlow()

testDefer()


