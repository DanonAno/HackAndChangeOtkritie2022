//
//  SetPasswordViewController.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 13.11.2022.
//

import UIKit
import RxSwift
class setPasswordViewController: UIViewController {
    
    var viewModel: PasswordViewModel!
    var disposeBag = DisposeBag()
    var setPasswordTextField: UITextField = {
        var textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        textField.placeholder = "Придумайте пароль"
        textField.backgroundColor = UIColor.system100
        textField.textColor = UIColor.system400
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    var repeatPasswordTextField: UITextField = {
        var textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        textField.placeholder = "Повторите пароль"
        textField.backgroundColor = UIColor.system100
        textField.textColor = UIColor.system400
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    let label: UILabel = {
       let label = UILabel()
        label.text = "Придумайте пароль. Он будет использован для входа в приложение"
        label.textColor = UIColor(red: 129/255, green: 137/255, blue: 144/255, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1).cgColor
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor.constant_whie, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "", size: 14)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .morning
        setupUI()
        makeSubviewsLayout()
        setupBindings()
    }
    private func setupUI() {
        view.addSubview(repeatPasswordTextField)
        view.addSubview(setPasswordTextField)
        view.addSubview(label)
        view.addSubview(nextButton)
    }
    private func makeSubviewsLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(108)
            make.left.right.equalToSuperview().inset(34)
        }
        setPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(setPasswordTextField.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(40)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
    }
    private func setupBindings() {
        let input = PasswordViewModel.Input(firstextFieldText: setPasswordTextField.rx.text.orEmpty.asDriver(),
                                            secondTextFieldText:
                                                repeatPasswordTextField.rx.text.orEmpty.asDriver(),
                                            toChatTrigger: nextButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: input)
        [
            output.validPasswords.drive(nextButton.rx.isEnabled),
            output.toChat.drive()
        ]
            .forEach({$0.disposed(by: disposeBag)})
    }
}
