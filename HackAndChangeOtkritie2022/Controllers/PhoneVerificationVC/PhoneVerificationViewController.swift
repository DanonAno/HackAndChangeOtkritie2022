//
//  PhoneVerificationViewController.swift
//  HackAndChangeOtkritie2022
//
//  Created by  Даниил on 13.11.2022.
//

import UIKit
import AEOTPTextField
class PhoneVerificationsViewController: UIViewController, AEOTPTextFieldDelegate {
    let otpTextField = AEOTPTextField()
    
    let navigator: AuthNavigatorProtocol
    init(navigator: AuthNavigatorProtocol) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let label: UILabel = {
       let label = UILabel()
        label.text = "На ваш номер телефона отправлено SMS с кодом подтверждения"
        label.textColor = UIColor(red: 129/255, green: 137/255, blue: 144/255, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    let sendAgainButton: UIButton = {
       let button = UIButton()
        button.setTitle("Отправить повторно", for: .normal)
        button.setTitleColor(UIColor(red: 58/255, green: 182/255, blue: 236/255, alpha: 1), for: .normal)
       return button
    }()
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
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField.otpDelegate = self
        otpTextField.configure(with: 6)
        view.backgroundColor = .morning
        setupUI()
        makeSubviewsLayout()
        buttonChange()
        authButton.addTarget(self, action: #selector(toNext), for: .touchUpInside)
        
    }
    func didUserFinishEnter(the code: String) {
        let vc = setPasswordViewController()
        vc.viewModel = PasswordViewModel(navigator: navigator)
        vc.title = "Пароль"
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func toNext() {
        let vc = setPasswordViewController()
        vc.viewModel = PasswordViewModel(navigator: navigator)
        vc.title = "Пароль"
        navigationController?.pushViewController(vc, animated: true)
    }
    func buttonChange() {
        if otpTextField.text?.count != 6 {
            authButton.isEnabled = false
        } else {
            authButton.isEnabled = true
        }
    }
    func setupUI() {
        view.addSubview(otpTextField)
        view.addSubview(label)
        view.addSubview(sendAgainButton)
        view.addSubview(authButton)
        view.backgroundColor = .morning
    }
    func makeSubviewsLayout() {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(108)
            make.left.right.equalToSuperview().inset(34)
        }
        otpTextField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(42)
        }
        sendAgainButton.snp.makeConstraints { make in
            make.top.equalTo(otpTextField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        authButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(40)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
    }
}
