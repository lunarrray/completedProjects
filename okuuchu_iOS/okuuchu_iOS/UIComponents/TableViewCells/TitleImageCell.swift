

import UIKit

class TitleImageCell: TitleCell {
    //MARK: - Properties
    
    private let imageIcon: UIImageView = .init()
    private let separatorView: UIView = .init()
    
    //MARK: - Override methods
    
    override func onConfigureView() {
        super.onConfigureView()
        backgroundColor = Asset.white.color
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.maskedCorners = []
        
        separatorView.backgroundColor = Asset.lightGray.color
        separatorView.isHidden = true
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        
        addSubviews(imageIcon, separatorView)
    }
    
    override func onSetupConstraints() {
        imageIcon.snp.makeConstraints{ maker in
            maker.left.equalToSuperview().offset(10)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(contentView.snp.height).inset(15)
        }
        
        titleLabel.snp.makeConstraints{ maker in
            maker.centerY.equalToSuperview()
            maker.left.equalTo(imageIcon.snp.right).offset(15)
        }
        
        separatorView.snp.makeConstraints{ maker in
            maker.left.equalTo(titleLabel.snp.left)
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.height.equalTo(1)
        }
    }
    
    override func configureCell(with cellData: TitleSubtitleViewModel) {
        super.configureCell(with: cellData)
        imageIcon.image = cellData.image
    }
}

//MARK: - Extension

extension TitleImageCell {
    func roundedTop(){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func roundedBottom(){
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func roundedCell(){
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func addSeparator(){
        separatorView.isHidden = false
    }
}
