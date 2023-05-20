
import UIKit

class RegistrationTwoController: VMController<RegistrationTwoPresentable, RegistrationTwoViewModelInput> {
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        content.loginTapAction = handleLoginTapAction
    }
}

extension RegistrationTwoController: RegistrationTwoViewModelOutput {
    private func handleLoginTapAction(){
        viewModel.openLoginScreen()
    }
}


