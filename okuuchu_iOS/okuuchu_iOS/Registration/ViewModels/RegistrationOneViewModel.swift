
import Foundation

protocol RegistrationOneViewModelInput {
    var coordinator: RegistrationCoordinator? { get set }
    var output: RegistrationOneViewModelOutput? { get set }
    func continueRegistration()
    func openLoginScreen()
}

protocol RegistrationOneViewModelOutput {
}

class RegistrationOneViewModel {
    var coordinator: RegistrationCoordinator?
    var output: RegistrationOneViewModelOutput?
}

extension RegistrationOneViewModel: RegistrationOneViewModelInput {
    func continueRegistration(){
        coordinator?.continueRegistration()
    }
    
    func openLoginScreen() {
        coordinator?.startLogin()
    }
}
