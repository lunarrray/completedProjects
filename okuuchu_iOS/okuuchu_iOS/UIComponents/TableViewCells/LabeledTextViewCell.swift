
import UIKit
import Foundation
import SnapKit

class LabeledTextViewCell: BaseCell<TitleSubtitleViewModel> {
    
    //MARK: - Properties
    
    private let labeledView: LabeledTextView = .init()
    private var textViewHeightConstraint: Constraint?
    private let addButton: UIButton = .init()
    private var withAddButton: Bool = false {
        didSet {
            if withAddButton {
                addButton.isHidden = false
            } else {
                addButton.isHidden = true
            }
        }
    }
    
    private let datePickerView: UIDatePicker = .init()
    private let toolBar: UIToolbar = .init(frame: .init(x: 0, y: 0, width: 100, height: 35))
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(image: Asset.doneIcon.image.withTintColor(Asset.normalTextColor.color, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(doneButtonTapped))
    }()
    private var viewModel: TitleSubtitleViewModel?
    
    //MARK: - Methods
    override func onConfigureView() {
        
        labeledView.textView.delegate = self
        labeledView.configureTextView(insets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), cornerRadius: 2)
        
        addButton.setImage(Asset.addIcon.image.withTintColor(Asset.lightBlue.color, renderingMode: .alwaysOriginal), for: .normal)
        addButton.isHidden = true
        
        toolBar.setItems([doneButton], animated: false)
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        datePickerView.backgroundColor = .white
        
    }
    
    override func onAddSubviews() {
        contentView.addSubviews(labeledView, addButton)
    }
    
    override func onSetupConstraints() {
        //        if withAddButton {
        //
        //            labeledView.snp.remakeConstraints{ maker in
        //                maker.top.equalToSuperview().offset(20)
        //                maker.left.equalToSuperview().offset(25)
        //                maker.right.equalTo(addButton.snp.left).offset(-10)
        //                maker.bottom.equalToSuperview()
        //            }
        //
        //        } else {
        //
        labeledView.snp.remakeConstraints{ maker in
            maker.top.equalToSuperview().offset(20)
            maker.left.right.equalToSuperview().inset(25)
            maker.bottom.equalToSuperview()
        }
        //        }
        
        addButton.snp.makeConstraints{ maker in
            maker.right.equalToSuperview().offset(-25)
            maker.bottom.equalTo(labeledView.snp.bottom)
            maker.width.height.equalTo(30)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        withAddButton = false
        contentView.backgroundColor = .clear
    }
    
    override func configureCell(with cellData: TitleSubtitleViewModel) {
        self.viewModel = cellData
        
        switch cellData.subTextType {
        case .selectingSeveral:
            activateAddButton()
        case .phoneNumber:
            labeledView.textView.keyboardType = .phonePad
        case .date:
            labeledView.textView.inputView = datePickerView
            labeledView.textView.inputAccessoryView = toolBar
        default: break
        }
        
        labeledView.configureWith(cellData)
        
    }
}

//MARK: - Extension

extension LabeledTextViewCell {
    func activateAddButton(){
        addButton.isHidden = false
        
        labeledView.snp.remakeConstraints{ maker in
            maker.top.equalToSuperview().offset(20)
            maker.left.equalToSuperview().offset(25)
            maker.right.equalTo(addButton.snp.left).offset(-10)
            maker.bottom.equalToSuperview()
        }
    }
    
    @objc func doneButtonTapped(){
        
    }
}

extension LabeledTextViewCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
        let size = textView.sizeThatFits(CGSize(width: textView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        let newHeight = size.height
        
        textViewHeightConstraint?.update(offset: newHeight)
        
        if let tableView = superview as? UITableView, let indexPath = tableView.indexPath(for: self) {
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
}
