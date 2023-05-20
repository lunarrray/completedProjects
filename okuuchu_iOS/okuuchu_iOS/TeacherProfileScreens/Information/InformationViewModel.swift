
import UIKit

protocol InformationViewModelInput: AnyObject {
    var coordinator: InformationCoordinator? { get set }
    var output: InformationViewModelOutput? { get set }
    
    func selectedCell(type: InformationCellType)
    func viewDidDisappear()
}

protocol InformationViewModelOutput: AnyObject {
    func customizeOutput()
}


final class InformationViewModel: NSObject {
    var coordinator: InformationCoordinator?
    weak var output: InformationViewModelOutput? {
        didSet {
            output?.customizeOutput()
        }
    }
}

extension InformationViewModel: InformationViewModelInput {
    func selectedCell(type: InformationCellType){
        switch type{
        case .aboutApp:
            coordinator?.startAboutApp()
        default: break
        }
    }
    
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
}

extension InformationViewModel {
   
}
