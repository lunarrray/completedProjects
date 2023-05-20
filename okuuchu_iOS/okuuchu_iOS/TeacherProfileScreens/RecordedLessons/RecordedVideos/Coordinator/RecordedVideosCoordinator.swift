
import UIKit

class RecordedVideosCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() { }
    
    func openRecordedVideos(for subject: Lesson, id: Int){
        let controller: RecordedVideosController = .init()
        controller.viewModel.coordinator = self
        controller.viewModel.subject = subject
        controller.navigationItem.title = subject.title
        navigationController.pushViewController(controller, animated: true)
    }
    
    func startSafari(with url: URL){
        let safariCoordinator: SafariCoordinator = .init(navigationController: navigationController)
        childCoordinators.append(safariCoordinator)
        safariCoordinator.parentCoordinator = self
        safariCoordinator.openSafari(with: url)
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
