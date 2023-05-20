
import UIKit

class LessonsListPresentable: PrimaryView {
    
    //MARK: - Properties
    
    lazy var tableView: UITableView = .init()
    
    //MARK: - Override methods
    
    override func onConfigureView() {
        super.onConfigureView()
        super.setGrayWithLeftBottomBalls()
        super.addInformationScreenImage()
                
        tableView.register(TitleImageCell.self, forCellReuseIdentifier: String(describing: TitleImageCell.self))
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        addSubview(tableView)
    }
    
    override func onSetupConstraints() {
        super.onSetupConstraints()
        

        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            maker.width.equalToSuperview().inset(15)
            maker.centerX.equalToSuperview()
            maker.height.equalToSuperview()
        }
        
   
    }

}

//MARK: - Extension

