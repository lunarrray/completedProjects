

import UIKit
import Foundation

class PersonalAdsController: VMController<PersonalAdsPresentable, PersonalAdsViewModelInput> {
    
    //MARK: - Properties
    
    var collectionViewManager: PersonalAdsCollectionViewManager?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewManager = PersonalAdsCollectionViewManager()
        content.collectionView.delegate = collectionViewManager
        content.collectionView.dataSource = collectionViewManager
        
        collectionViewManager?.delegate = self
        
        viewModel.getActiveAdsDataFromModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent{
            viewModel.viewDidDisappear()
        }
    }

    //MARK: - Override Methods
    
    override func onConfigureController() {
        navigationItem.title = "Обьявления"
    }

    override func onConfigureViewModel() {
        viewModel.output = self
    }
    
    override func onConfiugureActions() {
        content.handleSegmentedControlValueChanged = viewModel.toggleCollectionView(segmentedControlIndex:)
    }
}

//MARK: - Extension

extension PersonalAdsController: PersonalAdsViewModelOutput {
    func customizeOutput(with data: [SubsubtitleViewModel]) {
        collectionViewManager?.setCollectionViewData(data, collectionView: content.collectionView)
    }
}

extension PersonalAdsController: PersonalAdsCollectionViewDelegate {
    
}
