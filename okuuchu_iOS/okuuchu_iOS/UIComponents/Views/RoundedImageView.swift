
import UIKit

class RoundedImageView: UIView {
    let imageView: UIImageView = .init()
    let button: UIButton = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onSetupSubviews()
        onSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onSetupSubviews(){
        imageView.image = Asset.neutralAvatarIcon.image.withTintColor(Asset.white.color, renderingMode: .alwaysOriginal)
        imageView.backgroundColor = Asset.primaryGrayBackground.color
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
        imageView.layer.masksToBounds = true
        addSubview(imageView)
        
        button.setImage(Asset.cameraIcon.image, for: .normal)
        button.isHidden = true
        button.addShadow()

        addSubview(button)
    }
    
    func onSetupConstraints(){
        imageView.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        let size = bounds.size.width / 3
        button.snp.makeConstraints{ maker in
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.width.equalTo(size)
            maker.height.equalTo(size)
        }
    }

    func activateCameraButton(){
        button.isHidden = false
    }
    
    func configureWith(_ image: UIImage) {
        imageView.image = image
        imageView.layer.borderWidth = 0
        imageView.backgroundColor = .clear
    }
}
