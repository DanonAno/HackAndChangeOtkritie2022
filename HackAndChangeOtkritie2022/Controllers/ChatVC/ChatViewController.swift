//
//  ChatViewController.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import UIKit
import SnapKit
import MessageKit
import Messages
import MessageUI

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}
struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    
}
class ChatViewControoler: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    //MARK: UI Elements
    let currentUser = Sender(senderId: "self", displayName: "Daniil")
    let Other = Sender(senderId: "Other", displayName: "Alena")
    var messages: [MockMessage] = []
    var viewModel: ChatViewModel!
    //MARK: -  Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.backgroundColor = .morning
        var linkItem = MockLinkItem(text: "Oго это мой телеграмм", attributedText: NSAttributedString(string: "Да да вот тут"), url: URL(string: "http://t.me/doublebouble")!, title: "За форс анврапы извиняюсь времени думать не было", teaser: "еще однастринга, какой крутой фреймворк", thumbnailImage: UIImage(named: "avatar")!)
        messages.append(MockMessage(text: "Привет, это разработано специально для банка открытие",
                                    user: MockUser(senderId: "self", displayName: "Daniil Razrab"),
                                    messageId: "1",
                                    date: Date().addingTimeInterval(-70000)))
        messages.append(MockMessage(text: "Слегонца не получилось добавить виджеты, и с сетью норм поработать, мало времени",
                                    user: MockUser(senderId: "other", displayName: "Я тут один, но представим, что двое"),
                                    messageId: "2",
                                    date: Date().addingTimeInterval(-80000)))
        messages.append(MockMessage(text: "Но будет просто суперски если вы поймете и простите",
                                    user: MockUser(senderId: "other", displayName: "Я тут один, но представим, что двое"),
                                    messageId: "3",
                                    date: Date().addingTimeInterval(-90000)))
        messages.append(MockMessage(text: "И зацените кодстайл с архитектурой, а она реально крутая",
                                    user: MockUser(senderId: "Other", displayName: "Я тут один, но представим, что двое"),
                                    messageId: "4",
                                    date: Date().addingTimeInterval(-100000)))
        messages.append(MockMessage(text: "Спасибо за крутые задания ! tg: @DoubleBouble",
                                    user: MockUser(senderId: "self", displayName: "Daniil Razrab"),
                                    messageId: "5",
                                    date: Date().addingTimeInterval(-110000)))
        messages.append(MockMessage(linkItem: linkItem,
                                                user: MockUser(senderId: "self", displayName: "Daniil Razrab"),
                                                messageId: "",
                                                date: Date().addingTimeInterval(-120000)))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        setupUI()
    }
    //MARK: - Functions
    func setupUI() {
    }
    //MARK: - Messages Delegate Methods
    func currentSender() -> MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1) : UIColor.constant_whie
    }
}
