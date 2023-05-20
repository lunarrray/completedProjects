
import UIKit
import SafariServices

class SafariCoordinator: NSObject, Coordinator, SFSafariViewControllerDelegate {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func openSafari(with url: URL){
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        navigationController.present(safariViewController, animated: true)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}
