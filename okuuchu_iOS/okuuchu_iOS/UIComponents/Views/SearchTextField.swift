
import UIKit

class SearchTextField: UITextField {
    
    //MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onConfigureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onConfigureView(){
//        addShadow()
        backgroundColor = .white
        placeholder = "Поиск"
        layer.borderColor = Asset.lightGray.color.cgColor
        layer.cornerRadius = 10
        
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        container.backgroundColor = .clear
        let padding: CGFloat = 10.0
        let searchIcon: UIImageView = .init(frame: CGRect(x: padding, y: 0, width: container.frame.height - padding, height: container.frame.height))

        searchIcon.contentMode = .scaleAspectFit
        searchIcon.clipsToBounds = true

        searchIcon.image =  Asset.searchIcon.image
        container.addSubview(searchIcon)
        leftView = container
        leftViewMode = .always
    }
}

//MARK: - Extension
