//
//  ChannelListView.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

import SwiftUI

struct ChannelListView: View {
  let workspace:Workspace
  @EnvironmentObject var model: ViewModel
  var body: some View {
    VStack() {
      if model.channels.isEmpty {
        ProgressView()
      }
      else {
        List {
          ForEach(model.channels) {channel in
            if model.UserId == model.workspace.owner {
              NavigationLink(destination: MessageListView(channel: channel).environmentObject(model)) {
                ChannelListCard(channel: channel)
              }
              .accessibilityLabel(channel.name)
              .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                  model.deleteChannel(id: channel.id)
                  //                      model.getMessage(id: channel.id)
                } label: {
                  Label("Delete", systemImage: "trash.fill")
                }
              }
            }
            else {
              NavigationLink(destination: MessageListView(channel: channel).environmentObject(model)) {
                ChannelListCard(channel: channel)
              }
              .accessibilityLabel(channel.name)
            }
          }
        }
      }
    }
    .navigationTitle(workspace.name)
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      model.getChannel(id: workspace.id)
      model.workspace = workspace
    }
    .toolbar {
      ToolbarItemGroup(placement: .navigationBarTrailing) {
        if model.UserId == workspace.owner {
          NavigationLink(destination: MemberListView().environmentObject(model)) {
            Image(systemName: "person.badge.plus")
          }.accessibilityLabel("Add Members")
        }
        
        NavigationLink(destination: ChannelNewView().environmentObject(model)) {
          Image(systemName: "plus.app")
        }.accessibilityLabel("New Channel")
      }
    }
  }
}



//#if !TESTING
//struct ChannelListView_Previews: PreviewProvider {
//    static var previews: some View {
//      NavigationStack{
//        ChannelListView(workspace: Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3))
//      }.environmentObject(ViewModel())
//    }
//}
//#endif
