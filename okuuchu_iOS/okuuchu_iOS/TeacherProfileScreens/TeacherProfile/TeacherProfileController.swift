
import Foundation

final class TeacherProfileController: VMController<TeacherProfilePresentable, TeacherProfileViewModelInput> {
    
    //MARK: - Properties
    
    private var tableviewManager: TeacherProfileTableViewManager?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewManager = TeacherProfileTableViewManager()
        
        content.tableView.delegate = tableviewManager
        content.tableView.dataSource = tableviewManager
        
//        viewModel.getDataFromModel()
        tableviewManager?.delegate = self
        
    }
    
    //MARK: - Override methods
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        
    }
}

//MARK: - Extension

extension TeacherProfileController: TeacherProfileTableViewDelegate {
    func selectedMenuItem(_ menuItem: Menu) {
        viewModel.menuItemTapped(menuItem)
    }
}

extension TeacherProfileController: TeacherProfileViewModelOutput{
    func customizeOutput(with data: [TitleSubtitleViewModel]) {
//        tableviewManager?.setData(data, tableView: content.tableView)
    }
}
