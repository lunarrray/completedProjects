
import Foundation

protocol RegistrationTwoViewModelInput {
    var coordinator: RegistrationCoordinator? { get set }
    var output: RegistrationTwoViewModelOutput? { get set }
    func openLoginScreen()
}

protocol RegistrationTwoViewModelOutput {
    
}

class RegistrationTwoViewModel {
    var coordinator: RegistrationCoordinator?
    var output: RegistrationTwoViewModelOutput?
}

extension RegistrationTwoViewModel: RegistrationTwoViewModelInput {
    func openLoginScreen() {
        coordinator?.startLogin()
    }
}
