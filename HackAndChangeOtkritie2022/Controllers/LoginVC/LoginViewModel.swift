//
//  LoginViewModel.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation
import RxSwift
import RxCocoa
import CryptoSHA

class LoginViewModel: ViewModelType {
   
    private let navigator: AuthNavigatorProtocol

    init(navigator: AuthNavigatorProtocol) {
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let phoneStatus = input.phoneString.map { phone  -> Bool in
            phone.isEmpty
        }
        let passwordStatus = input.passwordString.map({password -> Bool in
            password.isEmpty
        })
        let boolActiveState = Driver.combineLatest(phoneStatus, passwordStatus) {
            if $0 == true && $1 == true {
                return false
            } else {
                return true
            }
        }
        let loginText = input.loginText
        let passwordText = input.passwordText
        let loginAndPassword = Driver.combineLatest(input.loginText, input.passwordText)
        let toChat = input.toChatTrigger
        .do(onNext: {[unowned self] value in
            self.navigator.toChat()
        })
        
       
            
            return Output(loginActiveState: boolActiveState, toChat: toChat)
    }
}
extension LoginViewModel {
    struct Input {
        let phoneString: Driver<String>
        let passwordString: Driver<String>
        let loginText: Driver<String>
        let passwordText: Driver<String>
        let toChatTrigger: Driver<Void>
    }
    
    struct Output {
        let loginActiveState: Driver<Bool>
        let toChat: Driver<Void>
        
    }
}
