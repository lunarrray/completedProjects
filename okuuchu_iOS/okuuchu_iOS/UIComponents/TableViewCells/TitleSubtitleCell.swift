
import UIKit

class TitleSubtitleCell: BaseCell<TitleSubtitleViewModel>{
    
    //MARK: - Properties
    
    let titleLabel: UILabel = .init()
    let subtitlelabel: UILabel = .init()
    
    //MARK: - Override methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layoutIfNeeded()
    }

    override func onConfigureView() {
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        subtitlelabel.font = .systemFont(ofSize: 13)
        subtitlelabel.textColor = Asset.normalTextColor.color
        subtitlelabel.numberOfLines = 0
        subtitlelabel.lineBreakMode = .byWordWrapping
    }
    
    override func onAddSubviews() {
        contentView.addSubviews(
            titleLabel,
            subtitlelabel
        )
    }
    
    override func onSetupConstraints() {
        titleLabel.snp.remakeConstraints{ maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            maker.horizontalEdges.equalToSuperview().inset(20)
        }
        
        subtitlelabel.snp.remakeConstraints{ maker in
            maker.horizontalEdges.equalToSuperview().inset(20)
            maker.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
    
    override func configureCell(with model: TitleSubtitleViewModel) {
        titleLabel.text = model.title
        subtitlelabel.text = model.subtitle
        
        onSetupConstraints()
    }
}
