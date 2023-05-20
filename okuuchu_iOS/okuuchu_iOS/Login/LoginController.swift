
import UIKit

class LoginController: VMController<LoginPresentable, LoginViewModelInput> {
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    override func onConfiugureActions() {
        content.registerTapAction = handleRegisterTapAction
        content.loginTapAction = handleLoginTapAction
    }
}

extension LoginController: LoginViewModelOutput {
    private func handleRegisterTapAction(){
        viewModel.openRegistration()
    }
    
    private func handleLoginTapAction(){
        viewModel.goToProfile()
    }
}
