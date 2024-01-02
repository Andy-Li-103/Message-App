//
//  WorkspaceRepo.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import Foundation

struct WorkspaceRepo {
  static func load(token:String) async throws -> [Workspace] {
    print("Getting workspaces")
    let url = URL(string: "https://cse118.com/api/v1/workspace")

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
    return try JSONDecoder().decode([Workspace].self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  static func addNewWorkspace(token: String, name: String) async throws -> Workspace {
    print("Adding new Workspace")
    let url = URL(string: "https://cse118.com/api/v1/workspace")

    var request = URLRequest(url: url!)
    request.httpMethod = "POST"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
    let payload = NewWorkspace(name: name)
    let jsonData = try? JSONEncoder().encode(payload)

    request.httpBody = jsonData
    
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder.javaScriptISO8601().decode(Workspace.self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  static func deleteWorkspace(id: UUID, token: String) async throws -> Void {
    print("Deleting Workspace")
    let url = URL(string: "https://cse118.com/api/v1/workspace/\(id)")

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
  
  static func members(id:UUID, token:String) async throws -> [Member] {
    print("Getting workspace members")
    let url = URL(string: "https://cse118.com/api/v1/workspace/\(id)/member")

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
    return try JSONDecoder().decode([Member].self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  static func addWorkspaceMember(workspace: UUID, member: UUID, token:String) async throws -> Void {
    print("Adding workspace member")
    let url = URL(string: "https://cse118.com/api/v1/workspace/\(workspace)/member?mid=\(member)")

    var request = URLRequest(url: url!)
    request.httpMethod = "POST"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
//    let jsonData = try? JSONEncoder().encode(credentials)

//    request.httpBody = jsonData

    let (_, _) = try await URLSession.shared.data(for: request)
//    return try JSONDecoder().decode([Member].self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
  
  static func deleteWorkspaceMember(workspace: UUID, member: UUID, token:String) async throws -> Void {
    print("Adding workspace member")
    let url = URL(string: "https://cse118.com/api/v1/workspace/\(workspace)/member?mid=\(member)")

    var request = URLRequest(url: url!)
    request.httpMethod = "DELETE"

    // Set HTTP Request Header
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")

//    let credentials = LoginCredentials(email: "ali103@ucsc.edu", password: "1755575")
//    let jsonData = try? JSONEncoder().encode(credentials)

//    request.httpBody = jsonData

    let (_, _) = try await URLSession.shared.data(for: request)
//    return try JSONDecoder().decode([Member].self, from: data)
//    return [Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3)]
  }
}
