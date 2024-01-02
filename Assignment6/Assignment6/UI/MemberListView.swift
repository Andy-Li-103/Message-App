//
//  MembersView.swift
//  Assignment6
//
//  Created by Andy Li on 11/7/22.
//

import SwiftUI

struct MemberListView: View {
  @EnvironmentObject var model: ViewModel
  var body: some View {
      VStack() {
        if model.members.isEmpty {
          ProgressView()
        }
        else {
          List {
            ForEach(model.members) {member in
              Text(member.name)
                .swipeActions(allowsFullSwipe: false) {
                  Button(role: .destructive) {
                    model.deleteWorkspaceMember(id: member.id)
                  } label: {
                    Label("Delete", systemImage: "trash.fill")
                  }
                }
            }
          }
        }
      }
      .onAppear {
        model.getMembers(id: model.workspace.id)
      }
      .navigationTitle("Members")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar{
        NavigationLink(destination: AddMembersView().environmentObject(model)) {
          Image(systemName: "plus.app")
        }.accessibilityLabel("Add Member")
      }
  }
}

//struct MembersView_Previews: PreviewProvider {
//    static var previews: some View {
//        MembersView()
//    }
//}
