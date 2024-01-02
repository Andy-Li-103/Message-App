//
//  AddMembersView.swift
//  Assignment6
//
//  Created by Andy Li on 11/7/22.
//

import SwiftUI

struct AddMembersView: View {
  @EnvironmentObject var model: ViewModel
  @Environment(\.presentationMode) var presentation
  var body: some View {
      VStack() {
        if model.addableMembers.isEmpty {
          ProgressView()
        }
        else {
          List {
            ForEach(model.addableMembers) {member in
//              if member.id == model.UserId {
//                continue
//              }
              Text(member.name)
                .accessibilityLabel(member.name)
                .swipeActions(allowsFullSwipe: false) {
                  Button(role: .destructive) {
                    model.addWorkspaceMember(id: member.id)
                    presentation.wrappedValue.dismiss()
//                      model.getMessage(id: channel.id)
                  } label: {
                    Label("Add", systemImage: "person.badge.plus")
                  }.tint(.green)
                    
                }
            }
          }
        }
      }
      .onAppear {
        model.getAddMembers()
      }
      .navigationTitle("Members")
      .navigationBarTitleDisplayMode(.inline)
//      .toolbar{
//        NavigationLink(destination: AddMembersView().environmentObject(model)) {
//          Image(systemName: "plus.app")
//        }.accessibilityLabel("Add Member")
//      }
  }
}

//struct AddMembersView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMembersView()
//    }
//}
