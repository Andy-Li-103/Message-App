//
//  LoginRepo.swift
//  Assignment6
//
//  Created by Andy Li on 11/1/22.
//

import Foundation


struct LoginRepo {
//  static func login(credentials:LoginCredentials, callback: @escaping (LoginResponse) -> Void?) async {
//    let url = URL(string: "https://cse118.com/api/v1/login")
//
//    var request = URLRequest(url: url!)
//    request.httpMethod = "POST"
//
//    // Set HTTP Request Header
//    request.setValue("application/json", forHTTPHeaderField: "Accept")
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
////    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
//    let jsonData = try? JSONEncoder().encode(credentials)
//
//    request.httpBody = jsonData
//    URLSession.shared.dataTask(with: request) { data, response, error in
//      if let ret = try? JSONDecoder().decode(LoginResponse.self, from: data!) {
//        callback(ret)
//      }
//    }.resume()
//  }
  static func login(credentials:LoginCredentials) async throws -> LoginResponse {
    let url = URL(string: "https://cse118.com/api/v1/login")

    var request = URLRequest(url: url!)
    request.httpMethod = "POST"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
    let jsonData = try? JSONEncoder().encode(credentials)

    request.httpBody = jsonData
    
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder().decode(LoginResponse.self, from: data)
//    }
//    throw "Failed to Login"
  }
}


