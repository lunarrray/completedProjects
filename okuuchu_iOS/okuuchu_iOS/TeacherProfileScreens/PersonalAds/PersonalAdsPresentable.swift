
import UIKit

class PersonalAdsPresentable: BaseView {
    
    //MARK: - Properties
    
    private var segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl(items: ["Активные", "Неактивные"])
        segmentedControl.contentVerticalAlignment = .center
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var addButton: PrimaryButton = .init()
    
    var handleSegmentedControlValueChanged: ((Int) -> Void)?
    
    //MARK: - OverrideMethods
    
    override func onConfigureView() {
        backgroundColor = Asset.primaryGrayBackground.color
        
        segmentedControl.selectedSegmentTintColor = Asset.secondaryBlueBackground.color
        fixBackgroundSegmentControl(segmentedControl)
        
        let view = PrimaryView()
        view.backgroundColor = Asset.primaryGrayBackground.color
        view.addWalkingGirlImage()
        collectionView.backgroundView = view
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ImageCollectionViewCell.self))

        addButton.backgroundColor = Asset.primaryButtonsBlue.color
        addButton.setTitle("Добавить", for: .normal)
        
    }
    
    override func onAddSubviews() {
        addSubviews(
            segmentedControl,
            collectionView,
            addButton
        )
    }
    
    override func onSetupConstraints() {
        segmentedControl.snp.makeConstraints{ maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            maker.horizontalEdges.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints{ maker in
            maker.top.equalTo(segmentedControl.snp.bottom).offset(10)
            maker.horizontalEdges.equalToSuperview().inset(20)
            maker.bottom.equalTo(addButton.snp.top).offset(-10)
        }
        
        addButton.snp.makeConstraints{ maker in
            maker.horizontalEdges.equalToSuperview().inset(25)
            maker.height.equalTo(70)
            maker.bottom.equalToSuperview().offset(-35)
        }
    }
    
    override func onSetupTargets() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
}

//MARK: - Extension

extension PersonalAdsPresentable {
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl){
        handleSegmentedControlValueChanged?(sender.selectedSegmentIndex)
    }
}
