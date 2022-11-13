//
//  StartViewController.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 12.11.2022.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
class LoginViewController: UIViewController {
    //MARK: - UI Components
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1).cgColor
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor.constant_whie, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "", size: 14)
        return button
    }()
    var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textContentType = .oneTimeCode
        textField.placeholder = "Введите пароль"
        textField.backgroundColor = UIColor.system100
        textField.textColor = UIColor.system400
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    var phoneNumberTextField: UITextField = {
        var textField = UITextField()
        textField.layer.backgroundColor = UIColor.system100.cgColor
        textField.placeholder = "Введите номер телефона"
        textField.textColor = UIColor.system400
        textField.font = UIFont(name: "Inter", size: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    var forgotPassword: UIButton = {
        var button = UIButton()
        button.setTitle("Забыли пароль", for: .normal)
        var attributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor.primary700,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        var attributeString = NSMutableAttributedString(
                string: "Забыли пароль ?",
                attributes: attributes
             )
        button.setAttributedTitle(attributeString, for: .normal)
        return button
    }()
    var contentView = UIView()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.morning
        setupUI()
        makeSubviewsLayout()
        setupBindings()
        loginButton.addTarget(self, action: #selector(postAuth), for: .touchUpInside)
        //Простите за отвратительный сетевой запрос пожалуйста :(
    }
    //MARK: - Dependensies
    var viewModel: LoginViewModel!
    private let disposeBag = DisposeBag()
    //MARK: - Functions
    
    func setupUI() {
        view.addSubview(contentView)
        contentView.addSubview(loginButton)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(phoneNumberTextField)
        contentView.addSubview(forgotPassword)
    }
    func makeSubviewsLayout() {
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(130)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        forgotPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.right.equalToSuperview().inset(15)
        }
        loginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(45)
            make.height.equalTo(40)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    @objc func postAuth() {
        AuthNetworkProvider.login(number: phoneNumberTextField.text!, password: (passwordTextField.text?.sha256())!)
    }
    
    func setupBindings() {
        let input = LoginViewModel.Input(phoneString: phoneNumberTextField.rx.text.orEmpty.asDriver(),
                                         passwordString: passwordTextField.rx.text.orEmpty.asDriver(),
                                         loginText: phoneNumberTextField.rx.text.orEmpty.asDriver(),
                                         passwordText: passwordTextField.rx.text.orEmpty.asDriver(),
                                         toChatTrigger: loginButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: input)
        [
            output.loginActiveState.drive(loginButton.rx.isEnabled),
            output.toChat.drive()
        ]
            .forEach({$0.disposed(by: disposeBag)})
    }
    
   
}
