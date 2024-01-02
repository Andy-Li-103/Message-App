//
//  MessageRepo.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import Foundation

struct MessageRepo {
  static func load(id: UUID, token: String) async throws -> [Message] {
    print("Getting Messages")
    let url = URL(string: "https://cse118.com/api/v1/channel/\(id)/message")

    var request = URLRequest(url: url!)
    request.httpMethod = "GET"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
//    let jsonData = try? JSONEncoder().encode(credentials)

//    request.httpBody = jsonData
    
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder.javaScriptISO8601().decode([Message].self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  
  static func addNewMessage(id: UUID, token: String, content: String) async throws -> Message {
    print("Adding new message")
    let url = URL(string: "https://cse118.com/api/v1/channel/\(id)/message")

    var request = URLRequest(url: url!)
    request.httpMethod = "POST"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
    let payload = NewMessage(content: content)
    let jsonData = try? JSONEncoder().encode(payload)

    request.httpBody = jsonData
    
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder.javaScriptISO8601().decode(Message.self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  
  static func deleteMessage(id: UUID, token: String) async throws -> Void {
    print("Deleting message")
    let url = URL(string: "https://cse118.com/api/v1/message/\(id)")

    var request = URLRequest(url: url!)
    request.httpMethod = "DELETE"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
//    let payload = NewMessage(content: content)
//    let jsonData = try? JSONEncoder().encode(payload)
//
//    request.httpBody = jsonData
    
    let (_, _) = try await URLSession.shared.data(for: request)
//    return try JSONDecoder().decode(Message.self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
}
