
import UIKit
import SnapKit

class PrimaryView: BaseView {
    
    private let topLeftBlueBall: UIImageView = .init()
    private let topRightBlueBall: UIImageView = .init()
    private let bottomLeftBlueBall: UIImageView = .init()
    private let bottomRightBlueBall: UIImageView = .init()
    private let topLeftWhiteBall: UIImageView = .init()
    
    private let informationScreenImage: UIImageView = .init()
    private let walkingGirlImage: UIImageView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func onConfigureView() {
        topLeftBlueBall.image = Asset.leftBlueBalls.image
        topRightBlueBall.image = Asset.rightBlueBalls.image
        bottomLeftBlueBall.image = Asset.leftBottomBalls.image
        bottomRightBlueBall.image = Asset.rightBottomBalls.image
        topLeftWhiteBall.image = Asset.leftWhiteBalls.image
        
        informationScreenImage.image = Asset.informationScreenImage.image
        walkingGirlImage.image = Asset.walkingGirlImage.image
    
        topLeftBlueBall.isHidden = true
        topRightBlueBall.isHidden = true
        bottomLeftBlueBall.isHidden = true
        bottomRightBlueBall.isHidden = true
        topLeftWhiteBall.isHidden = true
        
        informationScreenImage.isHidden = true
        walkingGirlImage.isHidden = true
    }
    
    override func onAddSubviews() {
        addSubviews(
        topLeftBlueBall,
        topRightBlueBall,
        bottomLeftBlueBall,
        bottomRightBlueBall,
        topLeftWhiteBall,
        informationScreenImage,
        walkingGirlImage)
    }
    
    override func onSetupConstraints() {
        topLeftBlueBall.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.top.equalToSuperview()
        }
        
        topRightBlueBall.snp.makeConstraints { maker in
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
        }
        
        topLeftWhiteBall.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.top.equalToSuperview()
        }
        
        bottomLeftBlueBall.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        bottomRightBlueBall.snp.makeConstraints { maker in
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        informationScreenImage.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview().offset(10)
        }
        
        walkingGirlImage.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-30)
        }
        

    }
}

extension PrimaryView {
    func setGrayWithLeftTopBalls(){
        backgroundColor = Asset.primaryGrayBackground.color
        topLeftBlueBall.isHidden = false

    }
    
    func setGrayWithRightTopBalls(){
        backgroundColor = Asset.primaryGrayBackground.color
        topRightBlueBall.isHidden = false

    }
    
    func setGrayWithRightBottomBalls(){
        backgroundColor = Asset.primaryGrayBackground.color
        bottomRightBlueBall.isHidden = false

    }
    
    func setGrayWithLeftBottomBalls(){
        backgroundColor = Asset.primaryGrayBackground.color
        bottomLeftBlueBall.isHidden = false

    }
    
    func setBlueWithLeftTopBalls(){
        backgroundColor = Asset.secondaryBlueBackground.color
        topLeftWhiteBall.isHidden = false

    }
    
    func addInformationScreenImage(){
        informationScreenImage.isHidden = false
    }
    
    func addWalkingGirlImage(){
        walkingGirlImage.isHidden = false
    }
    
}
