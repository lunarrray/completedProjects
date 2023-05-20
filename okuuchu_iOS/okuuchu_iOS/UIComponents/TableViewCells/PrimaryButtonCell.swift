
import UIKit

class PrimaryButtonCell: UITableViewCell {
    private var button: PrimaryButton = .init(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        onConfigureView()
        onAddSubviews()
        onSetupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func onConfigureView(){
        button.backgroundColor = Asset.primaryButtonsBlue.color
    }
    
    private func onAddSubviews(){
        contentView.addSubview(button)
    }
    
    private func onSetupConstraints(){
        button.snp.makeConstraints{ maker in
            maker.top.equalToSuperview().offset(20)
            maker.left.right.equalToSuperview().inset(25)
            maker.height.equalTo(60)
            maker.bottom.equalToSuperview()
        }
    }
    
}

extension PrimaryButtonCell {
    func setButtonTitle(_ title: String){
        button.setTitle(title, for: .normal)
    }
}
