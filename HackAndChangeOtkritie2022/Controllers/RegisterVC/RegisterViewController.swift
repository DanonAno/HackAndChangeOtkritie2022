//
//  ViewController.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 11.11.2022.
//

import UIKit
import Messages
import MessageUI
import RxSwift
import RxCocoa

import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: - UI Components
    let authButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1).cgColor
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(UIColor.constant_whie, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "", size: 14)
        return button
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = "Введите ваш номер телефона, он будет использоваться для для входа в аккаунт"
        label.textColor = UIColor(red: 129/255, green: 137/255, blue: 144/255, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    let textFieldNumber: UITextField = {
        var textField = UITextField()
        textField.layer.backgroundColor = UIColor.system100.cgColor
        textField.placeholder = "Введите номер телефона"
        textField.textColor = UIColor(red: 40/255, green: 40/255, blue: 45/255, alpha: 1)
        textField.font = UIFont(name: "Inter", size: 14)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.layer.cornerRadius = 8
        textField.leftViewMode = .always
        textField.sizeToFit()
        return textField
    }()
    let haveAccountButton: UIButton = {
        var button = UIButton()
        button.setTitle("Уже являюсь клиентом", for: .normal)
        button.setTitleColor(UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor.primary700, for: .highlighted)
        button.setTitleColor(UIColor.system400, for: .disabled)
        return button
    }()
    static var phoneNumber: String = ""
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeSubviewsLayout()
        setupBindings()
        view.backgroundColor = .morning
    }
    
    //MARK: - Dependencies`
    var viewModel: RegisterViewModel!
    private let disposeBag = DisposeBag()
    //MARK: - Functions
    
    private func makeSubviewsLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(34)
        }
        authButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(86)
            make.right.left.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        textFieldNumber.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        haveAccountButton.snp.makeConstraints { make in
            make.top.equalTo(authButton.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
        }
    }
    private func setupUI() {
        view.addSubview(label)
        view.addSubview(authButton)
        view.addSubview(textFieldNumber)
        view.addSubview(haveAccountButton)
    }
    func setText() {
        ViewController.phoneNumber = textFieldNumber.text!
    }
    private func setupBindings() {
        let input = RegisterViewModel.Input(
            registerTrigger: authButton.rx.tap.asDriver(),
            phoneString: textFieldNumber.rx.text.orEmpty.asDriver(),
            loginTrigger: haveAccountButton.rx.tap.asDriver())
            
        let output = viewModel.transform(input: input)
        [
            output.registerSuccesfully.drive(),
            output.subminEnabled.drive(authButton.rx.isEnabled),
            output.toLogin.drive(),
        ]
            .forEach({$0.disposed(by: disposeBag)})
        setText()
        
    }
}

