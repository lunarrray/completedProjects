
import UIKit

class InformationController: VMController<InformationPresentable, InformationViewModelInput> {
    
    //MARK: - Properties
    
    private var tableViewManager: InformationTableViewManager?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = InformationTableViewManager()
        
        content.tableView.delegate = tableViewManager
        content.tableView.dataSource = tableViewManager
        
        tableViewManager?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent{
            viewModel.viewDidDisappear()
        }
    }
    
    //MARK: - Methods
    
    override func onConfigureController() {
        navigationItem.title = "Информация"
    }
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }
}

//MARK: - Extension

extension InformationController: InformationTableViewDelegate {
    func selectedCell(type: InformationCellType) {
        viewModel.selectedCell(type: type)
    }
}

extension InformationController: InformationViewModelOutput{
    func customizeOutput() {
        
    }
}
