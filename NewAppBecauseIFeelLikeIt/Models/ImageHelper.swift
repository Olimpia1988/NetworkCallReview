import UIKit

struct ImageHelper {
    static func getAnImage(stringUrl: String, completionHandler: @escaping (AppError?, UIImage? ) -> Void) {
        guard let url = URL.init(string: stringUrl) else {
            completionHandler(AppError.badURL(stringUrl), nil)
            return
        }
        
        let request = URLRequest.init(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            } else if let data = data {
                let foto = UIImage.init(data: data)
                completionHandler(nil, foto)
            }
            }.resume()
        
    }
}

