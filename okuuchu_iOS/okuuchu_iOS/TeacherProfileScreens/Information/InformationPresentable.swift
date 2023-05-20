

import UIKit

class InformationPresentable: PrimaryView {
    
    // MARK: - Properties
    
    lazy var tableView: UITableView = .init()
    
    //MARK: - Methods
        
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
        
        tableView.snp.makeConstraints{ maker in
            maker.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            maker.width.equalToSuperview().inset(15)
            maker.centerX.equalToSuperview()
            maker.height.equalToSuperview()

        }

    }
}

//MARK: - Extension

//extension InformationPresentable: UITableViewDataSource, UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return displayTypes.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch displayTypes[indexPath.row] {
//        case .contactsAndAboutApp
//            return .init(frame: .zero)
//        case .logout:
//            return .init(frame: .zero)
//        }
//    }
//}
