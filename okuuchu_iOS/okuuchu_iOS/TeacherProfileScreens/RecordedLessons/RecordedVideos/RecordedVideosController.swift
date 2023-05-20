
import UIKit

class RecordedVideosController: VMController<RecordedVideoPresentable, RecordedVideosViewModelInput>{
    
    //MARK: - Properties
    
    private var tableViewManager: RecordedVideoTableViewManager?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager = RecordedVideoTableViewManager()
        content.tableView.dataSource = tableViewManager
        content.tableView.delegate = tableViewManager
        
        tableViewManager?.delegate = self
        viewModel.getRecordedVideosFromModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent{
            viewModel.viewDidDisappear()
        }
    }
    
    //MARK: - Override methods
    
    override func onConfigureController() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func onConfigureViewModel() {
        viewModel.output = self
    }

    override func onConfiugureActions() {
        content.handleAddButtonTapAction = viewModel.addButtonTapped
        content.searchField.delegate = self
    }

}

//MARK: - Extension

extension RecordedVideosController: RecordedVideosViewModelOutput{
    func customizeOutput(with videos: [TitleSubtitleViewModel]) {
        tableViewManager?.setTableViewData(videos, tableView: content.tableView)
    }
}

extension RecordedVideosController: RecordedVideoTableViewDelegate{
    func selectedCell(at indexPath: IndexPath) {
        let index = indexPath.row
        viewModel.subjectItemTapped(at: index)
    }
    
    func setTranslucentBackround() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurredBackground = BlurredBackgroundView(effect: blurEffect)
        blurredBackground.frame = content.bounds
        content.addSubview(blurredBackground)
    }
    
    
}

extension RecordedVideosController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text {
            if text != ""{
                viewModel.performSearch(with: text)
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == ""{
            viewModel.getRecordedVideosFromModel()
        }
    }
}

extension RecordedVideosController {

}
