

import UIKit

class InformationCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var parentCoordinator: TeacherProfileCoordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController

    }
    
    func start() {
        let controller: InformationController = .init()
        controller.viewModel.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func startAboutApp(){
        let aboutAppCoordinator = AboutAppCoordinator(navigationController: navigationController)
        aboutAppCoordinator.parentCoordinator = self
        childCoordinators.append(aboutAppCoordinator)
        aboutAppCoordinator.start()
    }
    
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool
            in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
    
}
