
import UIKit

class UpdateTeacherInfoCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var parentCoordinator: TeacherProfileCoordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let updateTeacherInfoController: UpdateTeacherInfoController = .init()
        updateTeacherInfoController.viewModel.coordinator = self
        navigationController.pushViewController(updateTeacherInfoController, animated: true)
    }
    
    func didFinish(){
        parentCoordinator?.childDidFinish(self)
    }
}

