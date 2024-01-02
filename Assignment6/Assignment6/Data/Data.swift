//
//  Data.swift
//  Assignment6
//
//  Created by Andy Li on 11/1/22.
//

import Foundation


struct LoginCredentials: Encodable {
  let email: String
  let password: String
}

struct LoginResponse: Identifiable, Decodable {
  let id: UUID
  let name: String
  let accessToken: String
}

struct Workspace: Identifiable, Decodable {
  let id: UUID
  let name: String
  let owner: UUID
  let channels: Int
}

struct Channel: Identifiable, Decodable {
  let id: UUID
  let name: String
  let messages: Int
}

struct Message: Identifiable, Decodable {
  let id: UUID
  let member: UUID
  let posted: Date
  let content: String
}

struct NewMessage: Encodable {
  let content:String
}


struct Member: Identifiable, Decodable, Hashable {
  let id: UUID
  let name: String
}

struct NewWorkspace: Encodable {
  let name: String
}

struct NewChannel: Encodable {
  let name: String
}


extension String: Error {}

extension Date {
  func format() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd',' yyyy 'at' h:mm a"
    return formatter.string(from: self)
  }
}
