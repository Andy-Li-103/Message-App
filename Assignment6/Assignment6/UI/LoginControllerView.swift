//
//  LoginControllerView.swift
//  Assignment6
//
//  Created by Andy Li on 11/4/22.
//

import SwiftUI

struct LoginControllerView: View {
  @EnvironmentObject var model: ViewModel
  var body: some View {
    NavigationStack{
      if model.LoggedIn {
        WorkspaceListView()
      } else {
        LoginView()
      }
    }
  }
}
#if !TESTING
struct LoginControllerView_Previews: PreviewProvider {
  static var previews: some View {
      LoginControllerView()
      .environmentObject(ViewModel())
  }
}
#endif
