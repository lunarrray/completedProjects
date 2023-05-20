
import UIKit

class TextViewWithSeparators: UIView {
    //MARK: - Properties
    
    private let topSeparatorView: UIView = .init()
    private let textLabel: UILabel = .init()
    private let bottomSeparatorView: UIView = .init()
    
    //MARK: - Methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
                
        onAddSubviews()
        onConfigureView()
        onSetupConstraints()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onConfigureView(){
        
        topSeparatorView.backgroundColor = Asset.transparentBlack.color
        textLabel.numberOfLines = 0
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.textColor = Asset.normalTextColor.color
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.text = """
        Приложение разработано для удобного и быстрого поиска подходящих репетиторов и учеников.
        
        В приложении настроена система поиска, где ученики могут настроить фильтр для нахождения подходящего репетитора.
        """
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5
        let attributes = [NSAttributedString.Key.font: textLabel.font!, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attributedText = NSAttributedString(string: textLabel.text!, attributes: attributes)
        textLabel.attributedText = attributedText
        
        bottomSeparatorView.backgroundColor = Asset.transparentBlack.color


    }
    
    func onAddSubviews(){
        addSubviews(
            topSeparatorView,
            textLabel,
            bottomSeparatorView
        )
    }
    
    func onSetupConstraints(){
        topSeparatorView.snp.makeConstraints{ maker in
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(1)
        }
        
        textLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(topSeparatorView.safeAreaLayoutGuide.snp.bottom).offset(15)
            maker.left.right.equalToSuperview().inset(45)
        }
        
        bottomSeparatorView.snp.makeConstraints{ maker in
            maker.top.equalTo(textLabel.safeAreaLayoutGuide.snp.bottom).offset(15)
            maker.width.equalToSuperview()
            maker.height.equalTo(1)
        }
    }
}
