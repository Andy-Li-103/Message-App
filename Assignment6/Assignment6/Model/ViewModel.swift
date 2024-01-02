//
//  ViewModel.swift
//  Assignment6
//
//  Created by Andy Li on 11/1/22.
//

import Foundation
import SwiftUI

enum Route: Hashable {
  case WorkspaceListView
  case ChannelListView
}

class ViewModel: ObservableObject {
  @Published var LoggedIn = false
  @Published var UserId = UUID()
  @Published var Token = ""
  @Published var name = ""
  @Published var workspace = Workspace(id: UUID(), name: "Temp", owner: UUID(), channels: 0)
  @Published var channel = Channel(id: UUID(), name: "Temp", messages: 0)
  @Published var idtoname = [UUID:String]()
  @Published var workspaces = [Workspace]()
  @Published var channels = [Channel]()
  @Published var allMembers = [Member]()
  @Published var members = [Member]()
  @Published var messages = [Message]()
  
  @Published var addableMembers = [Member]()
  
  
  func Login(email:String, password:String) {
    let credentials = LoginCredentials(email: email, password: password)
    Task {
      let loaded = try await LoginRepo.login(credentials: credentials)
      DispatchQueue.main.async {
        self.UserId = loaded.id
        self.Token = loaded.accessToken
        self.name = loaded.name
        self.LoggedIn = true
      }
    }
  }
  
  func getWorkspace() {
    Task {
      let loaded = try! await WorkspaceRepo.load(token: Token)
      DispatchQueue.main.async {
        self.workspaces = loaded
      }
    }
  }
  
  func addNewWorkspace(name: String) {
    Task {
      let _ = try! await WorkspaceRepo.addNewWorkspace(token: Token, name: name)
      DispatchQueue.main.async {
      }
    }
  }
  
  func deleteWorkspace(id: UUID) {
    Task {
      let _ = try! await WorkspaceRepo.deleteWorkspace(id: id, token: Token)
      DispatchQueue.main.async {
      }
    }
  }
  
  func getAllMembers() {
    Task {
      let loaded = try! await MemberRepo.load(token: Token)
      DispatchQueue.main.async {
        self.allMembers = loaded
        for member in loaded {
          self.idtoname[member.id] = member.name
        }
      }
    }
  }
  
  func getMembers(id: UUID) {
    Task {
      let loaded = try! await WorkspaceRepo.members(id: id, token: Token)
      DispatchQueue.main.async {
        self.members = loaded
      }
    }
  }
  
  func getAddMembers() {
    let set1:Set<Member> = Set(self.allMembers)
    var set2:Set<Member> = Set(self.members)
    set2.insert(Member(id: self.UserId, name: self.name))
    self.addableMembers = Array(set1.subtracting(set2))
    self.addableMembers.sort{$0.name < $1.name}
  }
  
  func addWorkspaceMember(id: UUID) {
    Task {
      let _ = try! await WorkspaceRepo.addWorkspaceMember(workspace: workspace.id, member: id, token: Token)
      DispatchQueue.main.async {
      }
    }
  }
  
  func deleteWorkspaceMember(id: UUID) {
    Task {
      let _ = try! await WorkspaceRepo.deleteWorkspaceMember(workspace: workspace.id, member: id, token: Token)
      DispatchQueue.main.async {
      }
    }
  }
  
  func getChannel(id: UUID) {
    Task {
      let loaded = try! await ChannelRepo.load(id: id, token: Token)
      DispatchQueue.main.async {
        self.channels = loaded
      }
    }
  }
  
  func addNewChannel(name: String, id: UUID) {
    Task {
      let _ = try! await ChannelRepo.addNewChannel(token: Token, name: name, id: id)
      DispatchQueue.main.async {
      }
    }
  }
  
  func deleteChannel(id: UUID) {
    Task {
      let _ = try! await ChannelRepo.deleteChannel(id: id, token: Token)
      DispatchQueue.main.async {
      }
    }
  }
  
  func getMessage(id: UUID) {
    Task {
      let loaded = try! await MessageRepo.load(id: id, token: Token)
      DispatchQueue.main.async {
        self.messages = loaded
      }
    }
  }
  
  
  func addNewMessage(content:String) {
    Task {
      let _ = try! await MessageRepo.addNewMessage(id: channel.id, token: Token, content: content)
      DispatchQueue.main.async {
      }
    }
  }
  
  func deleteMessage(id: UUID) {
    Task {
      let _ = try! await MessageRepo.deleteMessage(id: id, token: Token)
      DispatchQueue.main.async {
      }
    }
  }
  
}
