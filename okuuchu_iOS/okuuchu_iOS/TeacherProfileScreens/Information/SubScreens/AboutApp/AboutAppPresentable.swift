
import UIKit

class AboutAppPresentable: PrimaryView {
    
    //MARK: - Properties
    
    private let logoImage: UIImageView = .init()
    private let textViewWithSeparators: TextViewWithSeparators = .init()
    
    //MARK: - Methods
    
    override func onConfigureView() {
        super.onConfigureView()
        super.setGrayWithLeftBottomBalls()
        
        logoImage.image = Asset.logoImage.image
      
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        addSubviews(
            logoImage,
            textViewWithSeparators
        )
    }
    
    override func onSetupConstraints() {
        super.onSetupConstraints()
        
        logoImage.snp.makeConstraints{ maker in
            maker.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            maker.centerX.equalToSuperview()
        }
        
        textViewWithSeparators.snp.makeConstraints{ maker in
            maker.top.equalTo(logoImage.safeAreaLayoutGuide.snp.bottom)
            maker.centerY.equalToSuperview().offset(-30)
            maker.left.right.equalToSuperview()
        }
        
    }
}
