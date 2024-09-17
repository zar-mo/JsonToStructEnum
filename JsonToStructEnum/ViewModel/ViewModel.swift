//
//  ViewModel.swift
//  JsonToStructEnum
//
//  Created by Abouzar Moradian on 9/17/24.
//

import Foundation

class CookieViewModel{
    
    var cookie: Cookie?
    
  
    
    func decodeJsonString<T: Codable>(modelType: T.Type, _ jsonString: String, completion: @escaping (Result<T, Error>) -> ()) {
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            
            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON string"])
            completion(.failure(error))
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601

        
        do{
            let cookieObject = try decoder.decode(T.self, from: jsonData)
            
            completion(.success(cookieObject))
          
        }catch{
            print("Failed to decode json data: \(error.localizedDescription)")
            completion(.failure(error))
            return
        }
        
    }
}
