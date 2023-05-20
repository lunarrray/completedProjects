
import UIKit

class ReviewsController: VMController<ReviewsPresentable, ReviewsViewModelInput> {
    
    //MARK: - Ppoperties
    
    var tableViewManager: ReviewsTableViewManager?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewManager = ReviewsTableViewManager()
        
        content.tableView.dataSource = tableViewManager
        content.tableView.delegate = tableViewManager
        
        viewModel.getReviewsDataFromModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.viewDidDisappear()
    }
    
    //MARK: - Override methods
    
    override func onConfigureController() {
        navigationItem.title = "Отзывы"
    }
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }

}

//MARK: - Extension

extension ReviewsController: ReviewsViewModelOutput {
    func customizeOutput(with data: [ReviewData]) {
        tableViewManager?.setTableViewData(reviews: data, tableView: content.tableView)
    }
    
    
}
