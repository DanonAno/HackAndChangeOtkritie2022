//
//  AuthNavigator.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 13.11.2022.
//

import Foundation
import UIKit
protocol AuthNavigatorProtocol {
    func toChat()
}

final class AuthNavigator: AuthNavigatorProtocol {
    private let navigationController: UINavigationController
    private let network: AuthNetworkProvider
    
    init(network: AuthNetworkProvider,
         navigationController: UINavigationController) {
        self.network = network
        self.navigationController = navigationController
    }
    func toChat() {
        let viewModel = ChatViewModel()
        let vc = ChatViewControoler()
        vc.title = "Мой брокер"
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
   
}
    

