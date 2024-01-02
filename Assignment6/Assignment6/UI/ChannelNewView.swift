//
//  ChannelNewView.swift
//  Assignment6
//
//  Created by Andy Li on 11/6/22.
//

import SwiftUI

struct ChannelNewView: View {
  @State var input:String = ""
  @EnvironmentObject var model: ViewModel
  @Environment(\.presentationMode) var presentation
  private func add() {
    Task {
      model.addNewChannel(name: input, id: model.workspace.id)
    }
    abort()
  }
  private func abort() {
    presentation.wrappedValue.dismiss()
  }
  var body: some View {
    VStack{
      Text("Create New Channel")
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
    .navigationTitle("New Channel")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//struct ChannelNewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelNewView()
//    }
//}
