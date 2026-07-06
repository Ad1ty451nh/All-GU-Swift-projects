import Foundation

final class APIManager {
    public static let shared = APIManager()
    func callAPI(){
        
        let urlstr = "https://jsonplaceholder.typicode.com/posts"
        
        if let url = URL(string: urlstr){
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url) {data , res , err in
                
                if let error = err {
                    print("error \(error)")
                    return
                }
                
                guard let jsonData = data else {return}
                
                do{
                    let decodedData = try
                    JSONDecoder().decode([Model].self, from: jsonData)
                    
                    print(decodedData)
                } catch (let err) {
                    print(err.localizedDescription)
                }
            }
            dataTask.resume()
        }
        else {
            print("URL is invalid")
        }

    }
}

