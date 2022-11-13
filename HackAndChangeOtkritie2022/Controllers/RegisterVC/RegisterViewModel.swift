//
//  RegisterViewModel.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class RegisterViewModel: ViewModelType {
    private let navigator: BaseNavigatorProtocol
    
    init(navigator:BaseNavigatorProtocol) {
        self.navigator = navigator
    }
    func transform(input: Input) -> Output {
        let register = input.registerTrigger
        .do(onNext: { [unowned self] value in
            self.navigator.toPhoneVerification()
        })
            let phoneStatus = input.phoneString.map { phone  -> Bool in
                var valid = OTKRValidation.validate(value: phone)
                if phone.count >= 11 && valid == true {
                   return true
                } else {
                   return false
                }
            }
            let toLoginPage = input.loginTrigger
            .do(onNext: {[unowned self] value in
                self.navigator.toLoginVc()
            })
                
                
                    return Output(registerSuccesfully: register, subminEnabled: phoneStatus, toLogin: toLoginPage)
    }
}
extension RegisterViewModel {
    struct Input {
        let registerTrigger: Driver<Void>
        let phoneString: Driver<String>
        let loginTrigger: Driver<Void>
        
        
    }
    
    struct Output {
        let registerSuccesfully: Driver<Void>
        let subminEnabled: Driver<Bool>
        let toLogin: Driver<Void>
        
    }
}

