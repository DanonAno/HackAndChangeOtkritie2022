//
//  SetPasswordViewModel.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 13.11.2022.
//

import UIKit
import RxCocoa
import RxSwift

class PasswordViewModel: ViewModelType {
    private let navigator: AuthNavigatorProtocol

    init(navigator: AuthNavigatorProtocol) {
        self.navigator = navigator
    }
    func transform(input: Input) -> Output {
        let first = input.firstextFieldText
        let second = input.secondTextFieldText
        let passwordConfirmationStatus = Driver.combineLatest(input.firstextFieldText, input.secondTextFieldText).map { password -> Bool in
            if password.0 == password.1 {
                return true
            } else {
                return false
            }
        }
        let toChat = input.toChatTrigger
            .do(onNext: {
                self.navigator.toChat()
            })
        return Output(validPasswords: passwordConfirmationStatus, toChat: toChat)
    }
}

extension PasswordViewModel {
    struct Input {
        let firstextFieldText: Driver<String>
        let secondTextFieldText: Driver<String>
        let toChatTrigger: Driver<Void>

    }
    struct Output {
        let validPasswords: Driver<Bool>
        let toChat: Driver<Void>
    }
}
