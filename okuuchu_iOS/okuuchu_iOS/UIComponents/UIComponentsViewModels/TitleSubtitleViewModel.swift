
import UIKit

class TitleSubtitleViewModel{
    let title: String?
    private(set) var subtitle: String?
    private(set) var image: UIImage?
    var subTextType: SubTextType?
    private(set) var onCellUpdate: (() -> Void)?
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = dateFormatter
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    init(title: String? = nil, subtitle: String? = nil, image: UIImage? = nil, subTextType: SubTextType? = nil, onCellUpdate: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.subTextType = subTextType
        self.onCellUpdate = onCellUpdate
    }
    
    func update(_ subtitle: String){
        self.subtitle = subtitle
        
        if let onCellUpdate = onCellUpdate {
            onCellUpdate()
        }
    }
    
    func update(_ date: Date) {
        let dateString = dateFormatter.string(from: date)
        subtitle = dateString
        
        if let onCellUpdate = onCellUpdate {
            onCellUpdate()
        }
    }
    
    func update(_ image: UIImage){
        self.image = image
        
        if let onCellUpdate = onCellUpdate {
            onCellUpdate()
        }
    }
    
}

enum SubTextType {
    case typingText
    case selectingOne
    case selectingSeveral
    case phoneNumber
    case date
    case image
}
