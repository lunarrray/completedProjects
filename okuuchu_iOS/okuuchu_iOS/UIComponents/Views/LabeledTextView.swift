
import UIKit

class LabeledTextView: UIView {
    
    //MARK: - Properties
    
    var titleLabel: UILabel = .init()
    var textView: UITextView = .init()
    
    //MARK: - Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onConfigureView()
        onAddSubviews()
        onSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func onConfigureView(){
        
        titleLabel.text = "Title"
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textAlignment = .left
        titleLabel.textColor = Asset.normalTextColor.color
        
        textView.layer.cornerRadius = 10
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: 15)
        textView.textContainerInset = .zero
        textView.textAlignment = .center
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }
    
    private func onAddSubviews(){
        addSubviews(titleLabel, textView)
    }
    
    private func onSetupConstraints(){
        titleLabel.snp.makeConstraints{ maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
        }
        
        textView.snp.makeConstraints{ maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(10)
            maker.left.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
    }
    
    func configureWith(_ data: TitleSubtitleViewModel, textBackgroundColor: UIColor = Asset.white.color){
        
        titleLabel.text = data.title
        textView.text = data.subtitle
        
        textView.backgroundColor = textBackgroundColor

    }
}

extension LabeledTextView {
    func nonEditableTextView(){
        textView.isEditable = false
    }
    
    func configureTextView(insets: UIEdgeInsets, cornerRadius: CGFloat){
        textView.textContainerInset = insets
        textView.layer.cornerRadius = cornerRadius
    }
}

//extension LabeledTextView: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        let fixedWidth = textView.frame.width
//        let newSize =  textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//    }
//}
