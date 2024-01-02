//
//  ChannelListCard.swift
//  Assignment6
//
//  Created by Andy Li on 11/2/22.
//

import SwiftUI

struct ChannelListCard: View {
  @State var channelName:String
  @State var channelMessageCount:String
  let channel:Channel
  
  init(channel: Channel) {
    self.channel = channel
    _channelName = State(initialValue: channel.name)
    _channelMessageCount = State(initialValue: channel.messages.description)
  }
  
  var body: some View {
    VStack(alignment: .leading){
      HStack{
        Text(channel.name)
        Spacer()
        if channel.messages > 0 {
          Text(channel.messages.description)
        }
      }
    }
  }
}

//struct ChannelListCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelListCard()
//    }
//}
