
import UIKit

class ReviewsPresentable: BaseView {
    
    //MARK: - Properties
    
    var ratingView: RatingView = .init()
    var ratingLabel: UILabel = .init()
    lazy var tableView: RoundedTableView = .init()
    
    //MARK: - Override methods
    
    override func onConfigureView() {
        backgroundColor = Asset.secondaryBlueBackground.color
        
        ratingView.configureWith(rating: 3.2, spacing: 25, starColor: .black)
        
        ratingLabel.font = .systemFont(ofSize: 32)
        ratingLabel.text = "3.2"
        
        tableView.register(ReviewCell.self, forCellReuseIdentifier: String(describing: ReviewCell.self))
        
    }
    
    override func onAddSubviews() {
        addSubviews(
            ratingView,
            ratingLabel,
            tableView
        )
    }
    
    override func onSetupConstraints() {
        ratingView.snp.makeConstraints{ maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(25)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(210)
        }
        
        ratingLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(ratingView.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ maker in
            maker.top.equalTo(ratingLabel.snp.bottom).offset(30)
            maker.width.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
}

//MARK: - Extension
