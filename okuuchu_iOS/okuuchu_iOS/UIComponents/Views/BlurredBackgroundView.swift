
import UIKit

class BlurredBackgroundView: UIVisualEffectView {
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView(){
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
