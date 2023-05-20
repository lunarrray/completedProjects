
import UIKit

class SubtitleCell: BaseCell<TitleSubtitleViewModel> {
    
    //MARK: - Properties
    
    var subtitleLabel: UILabel = .init()
    
    //MARK: - Methods
    
    override func onConfigureView(){
        subtitleLabel.font = .systemFont(ofSize: 20)
    }
    
    override func onAddSubviews(){
        contentView.addSubview(subtitleLabel)
    }
    
    override func onSetupConstraints(){
        subtitleLabel.snp.makeConstraints{ maker in
            maker.centerY.equalToSuperview()
            maker.left.equalToSuperview().offset(40)
        }
    }
    
    override func configureCell(with cellData: TitleSubtitleViewModel){
        subtitleLabel.text = cellData.subtitle
    }
    
    override func prepareForReuse() {
        subtitleLabel.text = ""
    }
}
