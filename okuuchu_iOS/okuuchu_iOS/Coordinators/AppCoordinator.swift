
import UIKit

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
        
//        let registrationCoordinator = RegistrationCoordinator(navigationController: navigationController)
//        childCoordinators.append(registrationCoordinator)
//        registrationCoordinator.start()

    }
}
