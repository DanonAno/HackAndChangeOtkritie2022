//
//  ChatHistoryProvider.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation

struct ChatHistoryResponse {
    var dialogId: Int
    var limit: Int
    var timestamp: Int
    var older: String
}
struct ChatHistoryAnswer {
    var dialogId: Int
}
