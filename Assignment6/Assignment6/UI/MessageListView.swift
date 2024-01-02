//
//  MessageListView.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

struct MessageListView: View {
  let channel:Channel
  @EnvironmentObject var model: ViewModel
  var body: some View {
      VStack() {
        if model.messages.isEmpty {
          ProgressView()
        }
        else {
          List {
            ForEach(model.messages) {message in
              if model.workspace.owner == model.UserId || model.UserId == message.member {
                MessageListCard(message: message).environmentObject(model)
                  .swipeActions(allowsFullSwipe: false) {
                    Button(role: .destructive) {
                      model.deleteMessage(id: message.id)
//                      model.getMessage(id: channel.id)
                    } label: {
                      Label("Delete", systemImage: "trash.fill")
                    }
                  }
              } else {
                MessageListCard(message: message).environmentObject(model)
              }
            }
          }
        }
      }
      .navigationTitle(channel.name)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar{
        NavigationLink(destination: NewMessageView().environmentObject(model)) {
          Image(systemName: "plus.app")
        }.accessibilityLabel("New Message")
      }
      .onAppear {
        model.getMessage(id: channel.id)
        model.channel = channel
      }
  }
}

//struct MessageListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageListView()
//    }
//}
