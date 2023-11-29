//
//  MessageView.swift
//  TeamDApp
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

public struct MessageView: UIViewControllerRepresentable {
    let replyMessages: [String]
    public init(replyMessages: [String]) {
        self.replyMessages = replyMessages
    }
    public func makeUIViewController(context: Context) -> ChatViewController {
        ChatViewController(replyMessages: replyMessages)
    }
    public func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {}
}


public class ChatViewController: MessagesViewController {
    
    let replyMessages: [String]
    var replyCount: Int = 0
    
    init(replyMessages: [String]) {
        self.replyMessages = replyMessages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sender = Sender(senderId: "any_unique_id", displayName: "Steven")
    var messages: [MessageEntity] = [] {
        didSet {
            messagesCollectionView.reloadData()
            messagesCollectionView.scrollToLastItem(at: .bottom, animated: true)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
    }
}

extension ChatViewController: MessagesDataSource {
    
    public var currentSender: SenderType {
        return Sender(senderId: "me", displayName: "名前")
    }
    
    public func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    public func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    public func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }
}

extension ChatViewController: InputBarAccessoryViewDelegate {
    public func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        messages.append(MessageEntity(sender: Sender(senderId: "me", displayName: "名前"), kind: .text(text)))
        messageInputBar.inputTextView.text = ""
        Task {
            try? await Task.sleep(for: .seconds(1))
            messages.append(
                MessageEntity(
                    sender: Sender(senderId: "other", displayName: "名前"),
                    kind: .text(
                        replyMessages[replyCount % replyMessages.count]
                    )
                )
            )
            replyCount += 1
        }
    }
}
