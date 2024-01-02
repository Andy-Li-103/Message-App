import SwiftUI

@main
struct Assignment6App: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack{
        LoginControllerView()
          .environmentObject(ViewModel())
      }
    }
  }
}
