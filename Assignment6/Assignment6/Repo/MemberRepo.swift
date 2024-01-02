//
//  MemberRepo.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import Foundation

struct MemberRepo {
  static func load(token: String) async throws -> [Member] {
    print("Getting all Members")
    let url = URL(string: "https://cse118.com/api/v1/member")

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
}
