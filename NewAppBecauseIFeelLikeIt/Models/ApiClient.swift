import Foundation
import UIKit



public enum AppError: Error {
    case badURL(String)
    case networkError(Error)
    case noResponse
    case decodingError(Error)
    
    
    public func errorMessage() -> String {
        switch self {
        case .badURL(let message):
            return "badURL: \(message)"
        case .networkError(let error):
            return "networkError: \(error)"
        case .noResponse:
            return "no network response"
        case .decodingError(let error):
            return "decoding error: \(error)"
        }
    }
}



final class NasaAPIClient {
    static func getPhoto(completionHandler:@escaping ((Result< NasaPhotos, AppError> ) -> Void)) {
        
        let urlString = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=100&cam=navcam0&api_key=2NgfwKviUaK4gcPzk2uhFn1SRRLS4ZVX7B06kKTf"
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL("error")))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completionHandler(.failure(.badURL("bad url")))
            } else if let data = data {
                do {
                    let searchData = try JSONDecoder().decode(NasaPhotos.self , from: data)
                    completionHandler(.success(searchData))
                    
                } catch let jsonError {
                    completionHandler(.failure(.networkError(jsonError)))
                }
                
            }
            }.resume()
    }
}

