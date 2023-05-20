
import UIKit

class RegistrationCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let controller: RegistrationOneController = .init()
        controller.viewModel.coordinator = self
        navigationController.setViewControllers([controller], animated: true)
    }
    
    func continueRegistration () {
        let controller:  RegistrationTwoController = .init()
        controller.viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func startLogin() {
        let coordinator: LoginCoordinator = .init(navigationController: navigationController)
        coordinator.start()
    }
}
