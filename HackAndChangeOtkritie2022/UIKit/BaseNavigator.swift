//
//  BaseNavigat.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import UIKit
import RxSwift
protocol BaseNavigatorProtocol {
    func toChat()
    func toStartVc()
    func toLoginVc()
    func toPhoneVerification()
}

final class BaseNavigator: BaseNavigatorProtocol, AuthNavigatorProtocol {
    private let navigationController: UINavigationController
    private let services: NetworkProvider
    
    init(services: NetworkProvider,
         navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    func toChat() {
        let viewModel = ChatViewModel()
        let vc = ChatViewControoler()
        vc.title = "Мой брокер"
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    func toStartVc() {
        let viewModel = RegisterViewModel(navigator: self)
        let vc = ViewController()
        vc.title = "Регистрация"
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    func toLoginVc() {
        let viewModel = LoginViewModel(navigator: self)
        let vc = LoginViewController()
        vc.title = "Вход"
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    func toPhoneVerification() {
        let vc = PhoneVerificationsViewController(navigator: self)
        vc.title = "Подтверждение номера"
        navigationController.pushViewController(vc, animated: true)
    }
}
