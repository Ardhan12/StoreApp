//
//  ApiService.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 04/01/23.
//

import Foundation

class APIService {
    
    static func loginUser(username: String, password: String, completion: @escaping (Result<User,Error>) -> Void) {
        // prepare json data
        let json: [String: Any] = ["username": username,
                                   "passsword": password]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        // create post request
        let url = URL(string: "http://dev.pitjarus.co/api/sariroti_md/index.php/login/loginTest")!
        let data : Data = "username=\(username)&password=\(password)&grant_type=password".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        request.httpBody = data
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
            }
            if let data {
                do {
                    let responseData = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(responseData))
                } catch {
                    completion(.failure(error))
                }
                
            }
        }.resume()
        
    }
    
}
