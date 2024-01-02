//
//  MessageListCard.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

struct MessageListCard: View {
  @State var messageContent:String
  let message:Message
  @EnvironmentObject var model: ViewModel
  init(message: Message) {
    self.message = message
    _messageContent = State(initialValue: message.content)
  }
  
  var body: some View {
    VStack(alignment: .leading){
      Text(model.idtoname[message.member]!)
        .bold()
      Text(messageContent)
      HStack{
        Spacer()
        Text(message.posted.format())
      }
    }
  }
}

//struct MessageListCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageListCard()
//    }
//}
