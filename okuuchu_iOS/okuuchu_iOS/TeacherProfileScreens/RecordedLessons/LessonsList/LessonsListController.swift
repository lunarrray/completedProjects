
import UIKit

class LessonsListController: VMController<LessonsListPresentable, LessonsListViewModelInput> {
    
    //MARK: - Properties
    
    private var tableViewManager: LessonsListTableViewManager?
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager = LessonsListTableViewManager()
        content.tableView.dataSource = tableViewManager
        content.tableView.delegate = tableViewManager
        
        tableViewManager?.delegate = self
        
        viewModel.getDataFromModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent {
            viewModel.viewDidDisappear()
        }
    }
    
    //MARK: - Override Methods

    override func onConfigureController() {
        navigationItem.title = "Предметы"
    }
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        
    }
}

//MARK: - Extension

extension LessonsListController: LessonsListTableViewDelegate{
    func selectedSubject(at indexPath: IndexPath) {
        let index = indexPath.row
        viewModel.subjectItemTapped(at: index)
    }
}

extension LessonsListController: LessonsLisViewModelOutput{
    func customizeOutput(with lessons: [Lesson]) {
        tableViewManager?.setTableViewData(data: lessons, tableView: content.tableView)
    }
}
