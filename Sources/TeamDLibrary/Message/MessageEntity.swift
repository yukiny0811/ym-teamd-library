//
//  MessageEntity.swift
//  TeamDApp
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

import MessageKit
import Foundation

struct MessageEntity: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String = UUID().uuidString
    var sentDate: Date = Date()
    var kind: MessageKit.MessageKind
}
