
import UIKit

class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(Asset.white.color, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        layer.cornerRadius = 10
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
