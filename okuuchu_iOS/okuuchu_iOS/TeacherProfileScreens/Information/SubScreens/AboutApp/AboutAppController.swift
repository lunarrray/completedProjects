
import UIKit

class AboutAppController: VMController<AboutAppPresentable, AboutAppViewModelInput> {
    //MARK: - Properties
    
    //MARK: - Lyfecycle
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }
    
    //MARK: - Methods
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
}

// MARK: - Extension


extension AboutAppController: AboutAppViewModelOutput {
    
}
