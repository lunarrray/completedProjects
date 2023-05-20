
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = .init()
    private let stackView: UIStackView = .init()
    private let titleLabel: UILabel = .init()
    private let subtitleLabel: UILabel = .init()
    private let subsubtitleLabel: UILabel = .init()
    
    private let activatingStatusButton: UIButton = .init()
    private let deleteButton: UIButton = .init()
    
    private var viewModel: SubsubtitleViewModel?
    
//    var handleActivatingStatusTapAction: (() -> Void)?
//    var handleDeleteButtonTapAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        onConfigureView()
        onAddSubviews()
        onSetupConstraints()
        onSetupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func onConfigureView(){
        
        imageView.image = Asset.menAvatar.image
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.text = "400 сом"
        
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.text = "Подготовка к ОРТ"
        
        subsubtitleLabel.font = .systemFont(ofSize: 13)
        subsubtitleLabel.textColor = Asset.textGrayColor.color
        subsubtitleLabel.text = "С выездом на дом"
        
        activatingStatusButton.backgroundColor = Asset.darkBlue.color
        activatingStatusButton.layer.cornerRadius = 4
        activatingStatusButton.titleLabel?.font = .systemFont(ofSize: 13)
        activatingStatusButton.isHidden = true

        deleteButton.backgroundColor = Asset.redButton.color
        deleteButton.layer.cornerRadius = 4
        deleteButton.titleLabel?.font = .systemFont(ofSize: 13)
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.isHidden = true

    }
    
    func onAddSubviews(){
        contentView.addSubviews(
            imageView,
            stackView,
            activatingStatusButton,
            deleteButton
        )
        
        stackView.addArrangedSubviews(
            titleLabel,
            subtitleLabel,
            subsubtitleLabel
        )
    }
    
    func onSetupConstraints(){
    
        imageView.snp.makeConstraints{ maker in
            maker.centerX.equalToSuperview()
            maker.top.equalToSuperview().offset(5)
            maker.width.equalToSuperview().offset(5)
            maker.height.equalTo(contentView.snp.width)
        }
        
        stackView.snp.makeConstraints{ maker in
            maker.top.equalTo(imageView.snp.bottom).offset(5)
            maker.width.equalToSuperview().offset(5)
            maker.height.equalTo(64)
            maker.centerX.equalToSuperview()
//            maker.bottom.equalToSuperview().offset(5)
        }
        
        titleLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(6)
            maker.left.equalToSuperview().offset(6)
        }
        
        subtitleLabel.snp.makeConstraints{ maker in
            maker.left.equalTo(titleLabel.snp.left)
        }
        
        subsubtitleLabel.snp.makeConstraints{ maker in
            maker.left.equalTo(titleLabel.snp.left)
            maker.bottom.equalToSuperview().offset(-6)
        }
        
        activatingStatusButton.snp.makeConstraints{ maker in
            maker.top.equalTo(stackView.snp.bottom).offset(6)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(160)
            maker.height.equalTo(24)
        }
        
        deleteButton.snp.makeConstraints{ maker in
            maker.top.equalTo(activatingStatusButton.snp.bottom).offset(6)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(160)
            maker.height.equalTo(24)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        activatingStatusButton.isHidden = true
        deleteButton.isHidden = true
    }
    
    func configureCell(with viewModel: SubsubtitleViewModel){
        self.viewModel = viewModel
        
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        subsubtitleLabel.text = viewModel.subsubtitle
    }
    
    func onSetupTargets(){
        activatingStatusButton.addTarget(self, action: #selector(activatingStatusButtonTapAction), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapAction), for: .touchUpInside)
    }
}

//MARK: - Extension

extension ImageCollectionViewCell {
    func addButtons(activatingButtonTitle: String){
        activatingStatusButton.isHidden = false
        activatingStatusButton.setTitle(activatingButtonTitle, for: .normal)
        deleteButton.isHidden = false
        
    }
    
    @objc func activatingStatusButtonTapAction(){
        viewModel?.activateStatusButtonTap()
    }
    
    @objc func deleteButtonTapAction(){
        viewModel?.deleteButtonTap()
    }
}
