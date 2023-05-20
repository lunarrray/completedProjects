

import UIKit

open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
                
        onAddSubviews()
        onConfigureView()
        onSetupTargets()
        onSetupConstraints()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onConfigureView(){}
    
    func onAddSubviews(){ }
    
    func onSetupConstraints(){ }
    
    func onSetupTargets(){ }
    
    
    
}

