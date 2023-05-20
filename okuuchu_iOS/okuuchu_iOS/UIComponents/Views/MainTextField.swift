
import UIKit

class MainTextField: UITextField {
    
    // MARK: - Properties

    private let eyeIcon: UIImageView = .init()
    private var eyeOpened = true
    
    private let datePickerView: UIDatePicker = .init()
    private let toolBar: UIToolbar = .init(frame: .init(x: 0, y: 0, width: 100, height: 35))
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(image: Asset.doneIcon.image.withTintColor(Asset.normalTextColor.color, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(doneTapped))
    }()
    // MARK: - Methods
    
    private func configure() {
        backgroundColor = Asset.white.color
        tintColor = Asset.normalTextColor.color
        layer.cornerRadius = 30
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        toolBar.setItems([doneButton], animated: false)
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        datePickerView.backgroundColor = Asset.white.color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extension

extension MainTextField {
    @objc func eyeIconTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if eyeOpened{
            eyeOpened = false
            tappedImage.image = Asset.invisibleIcon.image
            isSecureTextEntry = false
        } else {
            eyeOpened = true
            tappedImage.image = Asset.visibleIcon.image
            isSecureTextEntry = true
        }
    }
    
    func passwordModeActivate(){
        eyeIcon.image = Asset.visibleIcon.image
        let contentView = UIView()
        contentView.addSubview(eyeIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: eyeIcon.image!.size.width * 2, height: eyeIcon.image?.size.height ?? .zero)
        eyeIcon.frame = CGRect(x: 0, y: 0, width: eyeIcon.image?.size.width ?? .zero, height: eyeIcon.image?.size.height ?? .zero)
        
        rightView = contentView
        rightViewMode = .always
        isSecureTextEntry = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(eyeIconTapped(tapGestureRecognizer:)))
        eyeIcon.isUserInteractionEnabled = true
        eyeIcon.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func datePickingModeActivate(){
        self.inputView = datePickerView
        self.inputAccessoryView = toolBar
//        datePickerView.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 216))

    }
    
    @objc func doneTapped(){
        
    }
}

