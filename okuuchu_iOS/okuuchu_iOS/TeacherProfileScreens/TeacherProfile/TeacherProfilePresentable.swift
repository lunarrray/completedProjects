
import UIKit

final class TeacherProfilePresentable: PrimaryView{
    
    // MARK: - Properties
    
    private var nameLabel: UILabel = .init()
    private var avatarImageView: RoundedImageView = .init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private var ratingView: RatingView = .init()
    private var aboutTeacherView: LabeledTextView = .init()
    private var lessonsView: LabeledTextView = .init()
    
    var tableView: RoundedTableView = .init()
    private let whiteView: UIView = .init()
    
    //MARK: - Methods
    
    override func onConfigureView() {
        super.onConfigureView()
        super.setBlueWithLeftTopBalls()
        
        nameLabel.text = "Алиса Иванова"
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.textAlignment = .left
        nameLabel.textColor = Asset.normalTextColor.color
        
        avatarImageView.imageView.clipsToBounds = true
        
        ratingView.configureWith(rating: 3.4, spacing: 25, starColor: Asset.normalTextColor.color)
        let aboutTeacherData = TitleSubtitleViewModel(title: "Немного о себе", subtitle: "Дорогие друзья, выбранный нами инновационный путь способствует повышению актуальности модели развития. Соображения высшего порядка!")
        
        aboutTeacherView.configureWith(aboutTeacherData, textBackgroundColor: Asset.textViewBackground.color)
        aboutTeacherView.nonEditableTextView()
        
        let lessonsData = TitleSubtitleViewModel(title: "Предметы", subtitle: "Математика, Программирование")
        lessonsView.configureWith(lessonsData, textBackgroundColor: Asset.textViewBackground.color)
        lessonsView.nonEditableTextView()
        
        tableView.register(TitleCell.self, forCellReuseIdentifier: String(describing: TitleCell.self))

        whiteView.backgroundColor = Asset.white.color
    }
    
    override func onAddSubviews() {
        super.onAddSubviews()
        
        addSubviews(
            nameLabel,
            avatarImageView,
            ratingView,
            aboutTeacherView,
            lessonsView,
            whiteView,
            tableView
        )
    }
    
    override func onSetupConstraints() {
        super.onSetupConstraints()
        
        nameLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(70)
            maker.left.equalToSuperview().offset(30)
        }
        
        avatarImageView.snp.makeConstraints{ maker in
            maker.width.equalTo(100)
            maker.height.equalTo(100)
            maker.top.equalTo(nameLabel.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        
        
        ratingView.snp.makeConstraints{ maker in
            maker.top.equalTo(avatarImageView.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(200)
        }
        
        aboutTeacherView.snp.makeConstraints{ maker in
            maker.top.equalTo(ratingView.snp.bottom).offset(20)
            maker.left.right.equalToSuperview().inset(20)
        }
        
        lessonsView.snp.makeConstraints{ maker in
            maker.top.equalTo(aboutTeacherView.snp.bottom).offset(10)
            maker.left.right.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(250)
            maker.top.equalTo(lessonsView.snp.bottom).offset(25)
        }
        
        whiteView.snp.makeConstraints{ maker in
            maker.top.equalTo(tableView.snp.bottom)
            maker.right.left.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
    override func onSetupTargets() {
        super.onSetupTargets()
    }
}
