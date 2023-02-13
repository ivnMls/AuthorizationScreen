//
//  ViewController.swift
//  AuthorizationScreen
//
//  Created by User on 14.02.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //MARK: - Outlets

    private lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var textFieldLogin: UITextField = {
        let textField = UITextField() //(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        textField.placeholder = "Enter your name"
        textField.textAlignment = .center
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.textColor = UIColor.lightGray
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.setLeftIcon(image: (.init(named: "login") ?? .add))
        textField.setRightIcon(image: .checkmark)
        textField.layer.shadowColor = UIColor.black.cgColor //задаем цвет тени
        textField.layer.shadowOpacity = 0.2                 //задаем прозрачность тени
        textField.layer.shadowOffset = .zero                //отключаем смещение тени
        textField.layer.shadowRadius = 10                   //задаем радиус скруглени тени
        textField.layer.shouldRasterize = true              //отвечает за растрирование тение
        textField.layer.rasterizationScale = UIScreen.main.scale

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.textColor = UIColor.lightGray
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .white
        textField.setLeftIcon(image: .init(named: "lock") ?? .checkmark)
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 10
        textField.layer.shouldRasterize = true
        textField.layer.rasterizationScale = UIScreen.main.scale

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var buttonEntrance: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 90/255, green: 91/255, blue: 200/255, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonForgot: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var labelFeedback: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var leftSlash: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rightSlash: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.setTitle("Facebook", for: .normal)
        button.setImage(.init(named: "facebookSmall"), for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 0/255, green: 179/255, blue: 255/255, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(red: 42/255, green: 117/255, blue: 203/255, alpha: 1)
        button.setImage(.init(named: "twitterSmall"), for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var labelCreateAccount: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var buttonSignUp: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(red: 90/255, green: 91/255, blue: 200/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
                                                   textFieldLogin,
                                                   textFieldPassword,
                                                   ])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var secondStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [buttonEntrance,
                                                  buttonForgot])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()


//    lazy var thirdStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [viewLeftSlesh,
//                                                   labelFeedback,
//                                                   viewRightSlesh])
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.spacing = 10
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()

    lazy var fourthStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [facebookButton,
                                                   twitterButton,])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var fifthStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelCreateAccount,
                                                   buttonSignUp,])
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var slash: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftSlash,
                                                   rightSlash,])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 120
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()



    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()

    }



    //MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(labelLogin)
        view.addSubview(stackView)
        view.addSubview(secondStackView)
//        view.addSubview(thirdStackView)
        view.addSubview(labelFeedback)
        view.addSubview(fourthStackView)
        view.addSubview(fifthStackView)
        view.addSubview(slash)
    }

    private func setupLayout() {
        backgroundImage.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaInsets.left).offset(0)
            make.trailing.equalTo(view.safeAreaInsets.right).offset(0)
            make.top.equalTo(view.safeAreaInsets.top).offset(0)
            make.bottom.equalTo(view.safeAreaInsets.bottom).offset(0)
        }

        labelLogin.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.left.equalTo(view.snp.left).offset(22)
            make.right.equalTo(view.snp.right).offset(-22)
        }

        stackView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(110)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(labelLogin.snp.bottom).offset(50)
        }

        secondStackView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(stackView.snp.bottom).offset(40)
        }



        labelFeedback.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-200)
        }

        slash.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(0.5)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-206)
        }


        fourthStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-120)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }

        fifthStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }




    }


    //MARK: - Actions

    @objc private func buttonPressed() {

    }

}

extension UITextField {
    func setLeftIcon(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 20, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 5, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

}

//MARK: Удобные расширения чтобы добавлять картинки (если менять width и UIView, то можно двигать вводимый текст за счет увеличения самого эдемента, а с помощью Х координаты у UIImageView можно двигать внутри контейнера)

extension UITextField {
    func setRightIcon(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: -35, y: 2, width: 25, height: 23))
        iconView.tintColor = .systemGreen
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 0, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}



