import Foundation


// A Simple Function to get user input
func getUserInput(promptText: String) -> String {
    print(promptText, terminator: "")
    return readLine() ?? ""
}

var usrInput = getUserInput(promptText: "What's your favourite Game: ")

print(usrInput)

