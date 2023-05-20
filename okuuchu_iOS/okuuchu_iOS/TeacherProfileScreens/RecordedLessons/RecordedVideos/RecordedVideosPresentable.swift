
import UIKit

class RecordedVideoPresentable: BaseView {
    
    //MARK: - Properties
    
 
    var searchField: SearchTextField = .init()
    lazy var tableView: UITableView = .init()
    private var addButton: PrimaryButton = .init()
    
    var handleAddButtonTapAction: (() -> Void)?
    
    //MARK: - Override methods
    
    override func onConfigureView() {
        backgroundColor = Asset.primaryGrayBackground.color
        
        let font = UIFont.systemFont(ofSize: 17)
        let fontDescriptor = font.fontDescriptor.withSymbolicTraits(.traitBold)!

        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: String(describing: TitleSubtitleCell.self))
        
        searchField.returnKeyType = .search
        
        addButton.backgroundColor = Asset.primaryButtonsBlue.color
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
    }
    
    override func onAddSubviews() {
        addSubviews(
            searchField,
            tableView,
            addButton
        )
    }
    
    override func onSetupConstraints() {
        searchField.snp.makeConstraints{ maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            maker.horizontalEdges.equalToSuperview().inset(20)
            maker.height.equalTo(32)
        }
        
        tableView.snp.makeConstraints{ maker in
            maker.top.equalTo(searchField.snp.bottom).offset(20)
            maker.horizontalEdges.equalToSuperview().inset(15)
            maker.bottom.equalTo(addButton.snp.top).offset(-10)
        }
        
        addButton.snp.makeConstraints{ maker in
            maker.horizontalEdges.equalToSuperview().inset(20)
            maker.height.equalTo(60)
            maker.bottom.equalToSuperview().offset(-40)
        }
    }
    
    override func onSetupTargets() {
        addButton.addTarget(self, action: #selector(addButtonTapAction), for: .touchUpInside)
        
    }
    
}

//MARK: - Extension

extension RecordedVideoPresentable{
    @objc private func addButtonTapAction(){
        handleAddButtonTapAction?()
    }
}
