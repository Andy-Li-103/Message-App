//
//  NewMessageView.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

struct NewMessageView: View {
  @State var input:String = ""
  @EnvironmentObject var model: ViewModel
  @Environment(\.presentationMode) var presentation
  private func add() {
    Task {
      model.addNewMessage(content: input)
    }
    abort()
  }
  private func abort() {
    presentation.wrappedValue.dismiss()
  }
  var body: some View {
    VStack{
      Text("Create New Message")
      TextEditor(text: $input)
        .disableAutocorrection(true)
        .frame(width: 300, height: 150)
        .autocapitalization(.none)
        .textFieldStyle(.roundedBorder)
        .accessibilityLabel("Message")
      HStack{
        Button("Cancel", action: abort)
        Button("OK", action: add)
          .disabled(input.count < 4 || input.count > 280)
      }
      Spacer()
    }
    .navigationTitle("New Message")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView()
//    }
//}
