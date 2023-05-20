
import UIKit

class ImageCell: BaseCell<TitleSubtitleViewModel> {
    
    //MARK: - Properties
    var roundedImageView: RoundedImageView = .init(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    
    //MARK: - Methods
    
    override func onConfigureView() {
        roundedImageView.imageView.image = Asset.neutralAvatarIcon.image
        roundedImageView.clipsToBounds = true
    }
    
    override func onAddSubviews() {
        contentView.addSubview(roundedImageView)
    }
    
    override func onSetupConstraints() {
        roundedImageView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(10)
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(90)
            maker.bottom.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
//        roundedImageView.isHidden = true
    }
    
    override func configureCell(with model: TitleSubtitleViewModel) {
        if let image = model.image {
            roundedImageView.configureWith(image)
        }
    }
}

//MARK: - Extension

extension ImageCell {
    func activateCameraButton(){
        roundedImageView.activateCameraButton()
    }
}
