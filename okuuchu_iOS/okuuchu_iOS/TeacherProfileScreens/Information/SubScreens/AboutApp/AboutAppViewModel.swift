
import UIKit

protocol AboutAppViewModelInput {
    var coordinator: AboutAppCoordinator? { get set }
    var output: AboutAppViewModelOutput? { get set }
    
    func viewDidDisappear()
}

protocol AboutAppViewModelOutput: AnyObject{
    
}

final class AboutAppViewModel: NSObject {
    var coordinator: AboutAppCoordinator?
    weak var output: AboutAppViewModelOutput?
}

extension AboutAppViewModel: AboutAppViewModelInput {
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
}
