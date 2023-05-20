
import UIKit

class RegistrationOnePresentable: PrimaryView {
    //MARK: - Properties
    
    private let mainLabel: UILabel = .init()
    private let smallLabel: UILabel = .init()
    private let presentingImage: UIImageView = .init()
    private let stackView: UIStackView = .init()
    private let emailTextField: MainTextField = .init()
    private let passwordTextfield: MainTextField = .init()
    private let repeatPasswordTextfield: MainTextField = .init()
    private let continueRegistrationButton: PrimaryButton = .init(frame: .zero)
    private let horizontalStackView: UIStackView = .init()
    private let questionLabel: UILabel = .init()
    private let loginTextButton: UIButton = .init()
    private let dismissKeyboard: UITapGestureRecognizer = .init()
    
    var continueRegistrationTapAction: (() -> Void)?
    var loginTapAction:(() -> Void)?
    
    
    //MARK: - Methods
    
    override func onConfigureView() {
        super.onConfigureView()
        super.setGrayWithLeftTopBalls()
        
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 22)
        mainLabel.textColor = Asset.normalTextColor.color
        mainLabel.text = "Welcome okuuchu!"
        
        smallLabel.textAlignment = .center
        smallLabel.font = .systemFont(ofSize: 16)
        smallLabel.textColor = Asset.normalTextColor.color
        smallLabel.text = "Пройдите регистрацию"
        
        presentingImage.image = Asset.girlAndPhoneImage.image
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.distribution = .fill
        
        emailTextField.placeholder = "Введите email"
        emailTextField.keyboardType = .emailAddress
        
        passwordTextfield.placeholder = "Введите пароль"
        passwordTextfield.passwordModeActivate()
        
        repeatPasswordTextfield.placeholder = "Повторите пароль"
        repeatPasswordTextfield.passwordModeActivate()
        
        continueRegistrationButton.backgroundColor = Asset.primaryButtonsBlue.color
        continueRegistrationButton.setTitle("Продолжить регистрацию", for: .normal)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 8
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .fillProportionally
        
        questionLabel.text = "Уже есть аккаунт??"
        questionLabel.textColor = Asset.normalTextColor.color
        questionLabel.textAlignment = .right
        questionLabel.font = .systemFont(ofSize: 14)
        
        loginTextButton.setTitle("Войти в аккаунт", for: .normal)
        loginTextButton.setTitleColor(Asset.textButton.color, for: .normal)
        loginTextButton.setTitleColor(Asset.darkBlue.color, for: .selected)
        loginTextButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        
        addSubviews(
            mainLabel,
            smallLabel,
            presentingImage,
            stackView,
            continueRegistrationButton,
            horizontalStackView
        )
        
        stackView.addArrangedSubviews(
            emailTextField,
            loginTextButton,
            passwordTextfield,
            repeatPasswordTextfield
        )
        
        horizontalStackView.addArrangedSubviews(
            questionLabel,
            loginTextButton
        )
        
    }
    
    override func onSetupConstraints() {
        super.onSetupConstraints()
        
        mainLabel.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().inset(180)
        }
        
        smallLabel.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(mainLabel.snp.bottom).offset(10)
        }
        
        presentingImage.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(smallLabel.snp.bottom).offset(30)
        }
        
        stackView.snp.makeConstraints{ maker in
            maker.top.equalTo(presentingImage.snp.bottom).offset(30)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().inset(30)
        }
        
        emailTextField.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        passwordTextfield.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        repeatPasswordTextfield.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        continueRegistrationButton.snp.makeConstraints { maker in
            maker.bottom.equalTo(horizontalStackView.snp.top).offset(-20)
            maker.height.equalTo(70)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(stackView.snp.width)
        }
        
        horizontalStackView.snp.makeConstraints{ maker in
            maker.width.equalTo(stackView.snp.width)
            maker.bottom.equalToSuperview().offset(-35)
        }
    }
    
    override func onSetupTargets() {
        continueRegistrationButton.addTarget(self, action: #selector(continueRegistrationTapped), for: .touchUpInside)
        loginTextButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
}


extension RegistrationOnePresentable {
    @objc private func continueRegistrationTapped(){
        continueRegistrationTapAction?()
    }
    
    @objc private func loginButtonTapped(){
        loginTapAction?()
    }
}
