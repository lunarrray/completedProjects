
import UIKit

class RegistrationTwoPresentable: PrimaryView{
    //MARK: - Properties
    private let mainLabel: UILabel = .init()
    private let avatarImageView: RoundedImageView = .init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    private let stackView: UIStackView = .init()
    private let nameTextField: MainTextField = .init()
    private let roleTextfield: MainTextField = .init()
    private let dateTextfield: MainTextField = .init()
    private let registerButton: PrimaryButton = .init(frame: .zero)
    private let horizontalStackView: UIStackView = .init()
    private let questionLabel: UILabel = .init()
    private let loginTextButton: UIButton = .init()
    private let dismissKeyboard: UITapGestureRecognizer = .init()
    
    var loginTapAction:(() -> Void)?

    //MARK: - Methods
    
    override func onConfigureView() {
        super.onConfigureView()
        super.setGrayWithLeftTopBalls()
        
        mainLabel.textAlignment = .center
        mainLabel.font = .boldSystemFont(ofSize: 22)
        mainLabel.textColor = Asset.normalTextColor.color
        mainLabel.numberOfLines = 2
        mainLabel.text = "Нам необходимо немного узнать о вас!"
        
        avatarImageView.imageView.clipsToBounds = true
        avatarImageView.activateCameraButton()
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.distribution = .fill
        
        nameTextField.placeholder = "Введите свое имя и фамилию"
        
        roleTextfield.placeholder = "Выберите роль"
        
        dateTextfield.placeholder = "Укажите дату рождения"
        dateTextfield.datePickingModeActivate()
        
        registerButton.backgroundColor = Asset.primaryButtonsBlue.color
        registerButton.setTitle("Регистрация", for: .normal)
        
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
            avatarImageView,
            stackView,
            registerButton,
            horizontalStackView
        )
        
        stackView.addArrangedSubviews(
            nameTextField,
            dateTextfield,
            roleTextfield
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
            maker.width.equalTo(230)
        }
        
        avatarImageView.snp.makeConstraints{ maker in
            maker.width.equalTo(150)
            maker.height.equalTo(150)
            maker.centerX.equalToSuperview()
            maker.top.equalTo(mainLabel.snp.bottom).offset(30)
        }
        
        stackView.snp.makeConstraints{ maker in
            maker.top.equalTo(avatarImageView.snp.bottom).offset(30)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().inset(30)
        }
        
        nameTextField.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        roleTextfield.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        dateTextfield.snp.makeConstraints { maker in
            maker.height.equalTo(54)
            maker.width.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { maker in
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
        loginTextButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
}

extension RegistrationTwoPresentable {
    @objc private func loginButtonTapped(){
        loginTapAction?()
    }
}
