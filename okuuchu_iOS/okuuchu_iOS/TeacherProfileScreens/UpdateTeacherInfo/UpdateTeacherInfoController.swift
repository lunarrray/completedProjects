
import UIKit

class UpdateTeacherInfoController: VMController<UpdateTeacherInfoPresentable, UpdateTeacherInfoViewModelInput> {
    
    //MARK: - Properties
    
    private var tableViewManager: UpdateTeacherInfoTableViewManager = .init()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.tableView.dataSource = tableViewManager
        content.tableView.delegate = tableViewManager
        
        viewModel.getTeacherDataFromModel()
        tableViewManager.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }
    
    //MARK: - Override methods
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        
    }
}

//MARK: - Extension

extension UpdateTeacherInfoController: UpdateTeacherInfoTableViewDelegate {
    
}

extension UpdateTeacherInfoController: UpdateTeacherInfoViewModelOutput {
    func customizeOutput(with dataSource: [Section]) {
        tableViewManager.setTeacherData(dataSource, tableView: content.tableView)
    }
}
