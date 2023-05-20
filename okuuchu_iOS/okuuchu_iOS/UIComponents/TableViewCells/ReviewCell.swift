
import UIKit

class ReviewCell: TitleCell{
    
    //MARK: - Properties
    
    let avatarImageView: RoundedImageView = .init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    let ratingView: RatingView = .init()
    let subtitleLabel: UILabel = .init()
    
    //MARK: - Override Methods
    
    override func onConfigureView() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.text = "Name"
        
        avatarImageView.imageView.clipsToBounds = true
        
//        ratingView.configureWith(rating: 3.4, spacing: 10, starColor: Asset.secondaryBlueBackground.color)
        
        subtitleLabel.font = .systemFont(ofSize: 16)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textColor = Asset.normalTextColor.color
        
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        
        contentView.addSubviews(
            avatarImageView,
            ratingView,
            subtitleLabel
        )
    }
    
    override func onSetupConstraints() {
        
        avatarImageView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(15)
            maker.left.equalToSuperview().offset(15)
            maker.width.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(15)
            maker.left.equalTo(avatarImageView.snp.right).offset(10)
        }
        
        ratingView.snp.makeConstraints{ maker in
            maker.left.equalTo(titleLabel.snp.left)
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.width.equalTo(150)
            maker.height.equalTo(20)
        }
        
        subtitleLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(avatarImageView.snp.bottom).offset(10)
            maker.horizontalEdges.equalTo(contentView.snp.horizontalEdges).inset(20)
            maker.bottom.equalToSuperview().offset(-10)
        }
        
 
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        
        for case let imageView as UIImageView in ratingView.subviews {
            imageView.image = nil
            imageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        }
        avatarImageView.backgroundColor = nil
    }
    
    func configureCell(with data: TitleSubtitleViewModel, rating: Double){
        super.configureCell(with: data)
        
        avatarImageView.imageView.image = data.image
        subtitleLabel.text = data.subtitle
        
        ratingView.configureWith(rating: rating, spacing: 10, starColor: Asset.secondaryBlueBackground.color)
        
        ratingView.distribution = .fillEqually
        ratingView.alignment = .fill
    }

}

//MARK: - Extension

