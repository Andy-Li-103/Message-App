import SwiftUI

struct LoginView: View {
  @State var username = ""
  @State var password = ""
  @EnvironmentObject var model: ViewModel
  private func login() {
    Task {
      model.Login(email: username, password: password)
    }
  }
  var body: some View {
    NavigationStack {
        Text("CSE118 Assignment 6")
        Image("SlugLogo")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 150, height: 150)
          .clipped()
        TextField("EMail", text: $username)
          .disableAutocorrection(true)
          .frame(width: 300)
          .autocapitalization(.none)
          .textFieldStyle(.roundedBorder)
        SecureField("Password", text: $password)
          .frame(width: 300)
          .textFieldStyle(.roundedBorder)
        Button("Login", action: login)
        Spacer()
//        NavigationLink("", destination: WorkspaceListView().environmentObject(model), isActive: $model.Login)
    }
    .toolbar(.hidden)
  }
}

#if !TESTING
struct Assignment6View_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack{
      LoginView()
        .environmentObject(ViewModel())
    }
  }
}
#endif
