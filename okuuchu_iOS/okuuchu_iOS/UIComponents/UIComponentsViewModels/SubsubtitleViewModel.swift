
import UIKit

class SubsubtitleViewModel: TitleSubtitleViewModel {
    private(set) var subsubtitle: String?
    private(set) var status: ActiveStatus?
    private(set) var handleActivatingStatusTapAction: (() -> Void)?
    private(set) var handleDeleteButtonTapAction: (() -> Void)?

    init(title: String? = nil, subtitle: String? = nil, subsubtitle: String? = nil, image: UIImage? = nil, subTextType: SubTextType? = nil, status: ActiveStatus? = nil, onCellUpdate: (() -> Void)? = nil, handleActivatingStatusTapAction: (() -> Void)? = nil, handleDeleteButtonTapAction: (() -> Void)? = nil) {
        super.init(title: title, subtitle: subtitle, image: image, subTextType: subTextType, onCellUpdate: onCellUpdate)
        
        self.subsubtitle = subsubtitle
        self.status = status
        self.handleActivatingStatusTapAction = handleActivatingStatusTapAction
        self.handleDeleteButtonTapAction = handleDeleteButtonTapAction
    }
    
    func activateStatusButtonTap(){
        if let handleActivatingStatusTapAction = handleActivatingStatusTapAction {
            handleActivatingStatusTapAction()
        }
    }
    
    func deleteButtonTap() {
        if let handleDeleteButtonTapAction = handleDeleteButtonTapAction {
            handleDeleteButtonTapAction()
        }
    }
}
