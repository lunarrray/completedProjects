
import Foundation

protocol LoginViewModelInput {
    var coordinator: LoginCoordinator? { get set }
    var output: LoginViewModelOutput? { get set }
    func openRegistration()
    func goToProfile()
}

protocol LoginViewModelOutput {
    
}

class LoginViewModel {
    //MARK: - Properties
    
    var coordinator: LoginCoordinator?
    var output: LoginViewModelOutput?
    
    //MARK: - Methods
}

//MARK: - Extensions

extension LoginViewModel: LoginViewModelInput {
    func openRegistration() {
        coordinator?.startRegistration()
    }
    
    func goToProfile() {
        coordinator?.startTeacherProfile()
    }
}
