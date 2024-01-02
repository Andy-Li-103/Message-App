//
//  WorkspaceViewCard.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

struct WorkspaceListCard: View {
  @EnvironmentObject var model: ViewModel
  @State var workspaceName:String
  @State var workspaceChannelCount:String
  let workspace:Workspace
  
  init(workspace: Workspace) {
    self.workspace = workspace
    _workspaceName = State(initialValue: workspace.name)
    _workspaceChannelCount = State(initialValue: workspace.channels.description)
  }
  
  var body: some View {
    VStack(alignment: .leading){
      HStack{
        if model.UserId == workspace.owner {
          Image(systemName: "person.2.badge.gearshape")
        } else {
          Image(systemName: "person.2")
        }
        Text(workspace.name)
        Spacer()
        if workspace.channels > 0 {
          Text(workspace.channels.description)
        }
      }
    }
  }
}
//#if !TESTING
//struct WorkspaceListCard_Previews: PreviewProvider {
//    static var previews: some View {
//      WorkspaceListCard(workspace: Workspace(id: UUID(), name: "Andy", owner: UUID(), channels: 3))
//    }
//}
//#endif

