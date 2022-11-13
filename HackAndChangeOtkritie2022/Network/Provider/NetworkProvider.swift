//
//  NetworkProvider.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation

final class NetworkProvider {
    //MARK: - Api Endpoint
    static let apiProvider = "https://hack.invest-open.ru"
    //MARK: - Send(Post)
    static let message = "message"
    static let send = "send"
    //MARK: - Get Chat History(Get)
    static let chat = "chat"
    static let history = "history"
    static let dialogId = "dialogId"
    static let limit = "limit"
    //MARK: - Get Aveliable Dialog(Get)
    static let dialog = "dialog"
    //MARK: - Data widget change(Post)
    static let update = "update"
    //MARK: - Auth(Post)
    static let auth = "auth"
    //MARK: - Get user Info(Get)
    static let info = "info"
    
}
