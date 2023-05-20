

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var services: [UIApplicationDelegate] = [
        SwinjectServices()
    ]
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        services.forEach{
            _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        let coordinator: AppCoordinator = AppCoordinator(navigationController: .init())
        coordinator.navigationController.navigationBar.titleTextAttributes = [
            .foregroundColor: Asset.normalTextColor.color
        ]
        
//        UINavigationItem.BackButtonDisplayMode = .minimal
//        coordinator.navigationController.navigationBar.backButtonDisplayMode = .minimal
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator.start()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let coordinator: AppCoordinator = AppCoordinator(navigationController: .init())
        coordinator.start()
    }


}

