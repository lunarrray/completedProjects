
import UIKit

class RegistrationOneController: VMController<RegistrationOnePresentable, RegistrationOneViewModelInput> {
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        content.continueRegistrationTapAction = handleContiniueRegistrationTapAction
        content.loginTapAction = handleLoginTapAction
    }
}

extension RegistrationOneController: RegistrationOneViewModelOutput {
    private func handleContiniueRegistrationTapAction(){
        viewModel.continueRegistration()
    }
    
    private func handleLoginTapAction(){
        viewModel.openLoginScreen()
    }
}


