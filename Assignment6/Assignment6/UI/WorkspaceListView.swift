//
//  WorkspaceListView.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//
//
//if model.workspace.owner == model.UserId || model.UserId == message.member {
//  MessageListCard(message: message).environmentObject(model)
//    .swipeActions(allowsFullSwipe: false) {
//      Button(role: .destructive) {
//        model.deleteMessage(id: message.id)
////                      model.getMessage(id: channel.id)
//      } label: {
//        Label("Delete", systemImage: "trash.fill")
//      }
//    }
//} else {
//  MessageListCard(message: message).environmentObject(model)
//}

import SwiftUI

struct WorkspaceListView: View {
  @EnvironmentObject var model: ViewModel
  var body: some View {
    VStack() {
      if model.workspaces.isEmpty {
        ProgressView()
      }
      else {
        List {
          ForEach(model.workspaces) {workspace in
            if model.UserId == workspace.owner {
              NavigationLink(destination: ChannelListView(workspace: workspace).environmentObject(model)) {
                WorkspaceListCard(workspace: workspace)
              }
              .accessibilityLabel(workspace.name)
              .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                  model.deleteWorkspace(id: workspace.id)
                  //                      model.getMessage(id: channel.id)
                } label: {
                  Label("Delete", systemImage: "trash.fill")
                }
              }
            }
            else {
              NavigationLink(destination: ChannelListView(workspace: workspace).environmentObject(model)) {
                  WorkspaceListCard(workspace: workspace)
              }
              .accessibilityLabel(workspace.name)
            }
          }
        }
      }
    }
    .onAppear {
      model.getWorkspace()
      model.getAllMembers()
    }
    .navigationTitle("Workspaces")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          model.LoggedIn = false
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
        }.accessibilityLabel("Logout")
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink(destination: WorkspaceNewView().environmentObject(model)) {
          Image(systemName: "plus.app")
        }.accessibilityLabel("New Workspace")
      }
    }
  }
}

//struct WorkspaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//      NavigationStack{
//        WorkspaceListView()
//          .environmentObject(ViewModel())
//      }
//    }
//}
