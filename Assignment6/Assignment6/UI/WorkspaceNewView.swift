//
//  NewWorkspaceView.swift
//  Assignment6
//
//  Created by Andy Li on 11/6/22.
//

import SwiftUI

struct WorkspaceNewView: View {
  @State var input:String = ""
  @EnvironmentObject var model: ViewModel
  @Environment(\.presentationMode) var presentation
  private func add() {
    Task {
      model.addNewWorkspace(name: input)
    }
    abort()
  }
  private func abort() {
    presentation.wrappedValue.dismiss()
  }
  var body: some View {
    VStack{
      Text("Create New Workspace")
      TextField("Name", text: $input)
        .disableAutocorrection(true)
        .frame(width: 300, height: 150)
        .autocapitalization(.none)
        .textFieldStyle(.roundedBorder)
      HStack{
        Button("Cancel", action: abort)
        Button("OK", action: add)
          .disabled(input.count < 4 || input.count > 32)
      }
      Spacer()
    }
    .navigationTitle("New Workspace")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//struct NewWorkspaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewWorkspaceView()
//    }
//}
