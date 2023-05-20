
import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    override init(items: [Any]?) {
        super.init(items: items)
        
        layer.backgroundColor = Asset.white.color.cgColor
        clipsToBounds = false
        addShadow()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
