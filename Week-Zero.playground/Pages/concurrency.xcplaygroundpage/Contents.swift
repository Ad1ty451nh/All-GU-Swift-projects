import Foundation

func fetchMessage() async -> String {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return "Hello from async!"
}

Task{
    let message = await fetchMessage()
    print(message)
}

func fetchUser() async -> String {"Alice"}
func fetchScore() async -> Int {42}

Task {
    async let user = fetchUser()
    async let score = fetchScore()
}
