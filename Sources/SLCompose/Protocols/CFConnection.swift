//
//  CCConnection.swift
//  ScribbleCompose (AI Lab)
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

/// Represents errors that can occur during the connection process with OpenAI.
public enum CFConnectionError: Error {
    case invalidURL
    case invalidRequestBody
    case noDataReceived
    case jsonDecodingError
}

/// Protocol to define a generic API connection.
///
/// - Important: Conforming types must implement the `apiKey` property and the `getResponseFromGPT(prompt:completion:)` method.
@available(swift, introduced: 5.9, message: "Beta Version")
@available(iOS, introduced: 17.2)
public protocol CFConnection {
    
    /// API Key used for authenticating the API requests.
    var apiKey: String { get }
    
    /// Fetches a response from the GPT API using the provided prompt.
    ///
    /// - Parameters:
    ///   - prompt: The prompt for the GPT API request.
    ///   - completion: The completion handler called when the request finishes. The handler has a `Result` parameter, which represents either a successful API response or an error.
    ///   - maxToken: The
    func getResponseFromGPT(prompt: String, maxToken: Int, completion: @escaping (Result<Any, Error>) -> Void)
}

struct CFGPTConnection: CFConnection {
    private var _apiKey: String
    let maxToken: Int
        
    var apiKey: String {
        get { return _apiKey }
        set { _apiKey = newValue }
    }
        
    init(apiKey: String, maxToken: Int) {
        self._apiKey = apiKey
        self.maxToken = maxToken
    }
    
    func getResponseFromGPT(prompt: String, maxToken: Int, completion: @escaping (Result<Any, CFConnectionError>) -> Void) {
        var request = URLRequest(url: URL(string: apiKey)!)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = ["prompt": prompt, "max_tokens": maxToken]
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = requestData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(.invalidURL))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.noDataReceived))
                    return
                }
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(jsonResponse))
                } catch {
                    completion(.failure(.jsonDecodingError))
                }
            }
            
            task.resume()
        } catch {
            completion(.failure(.invalidRequestBody))
        }
    }
}
