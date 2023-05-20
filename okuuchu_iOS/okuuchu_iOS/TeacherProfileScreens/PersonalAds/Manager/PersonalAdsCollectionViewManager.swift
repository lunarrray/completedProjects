
import UIKit

//MARK: - Protocol

protocol PersonalAdsCollectionViewDelegate: AnyObject {
    
}

//MARK: - Class
final class PersonalAdsCollectionViewManager: NSObject {
    
    weak var delegate: PersonalAdsCollectionViewDelegate?
    
    private var adsData: [SubsubtitleViewModel] = []
    func setCollectionViewData(_ adsData: [SubsubtitleViewModel], collectionView: UICollectionView) {
        self.adsData = adsData
        collectionView.reloadData()
    }
}


//MARK: - Extension

extension PersonalAdsCollectionViewManager: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCollectionViewCell.self), for: indexPath) as? ImageCollectionViewCell else {
            return ImageCollectionViewCell()
        }
        
        let advertisement = adsData[indexPath.row]
                
        cell.configureCell(with: advertisement)
        
        if let adStatus = advertisement.status {
            if adStatus == .active {
                cell.addButtons(activatingButtonTitle: "Деактивировать")
            } else if adStatus == .inactive{
                cell.addButtons(activatingButtonTitle: "Активировать")
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 178
        let spacing: CGFloat = 3
        let stackViewHeight: CGFloat = 64
        let buttonHeight: CGFloat = 24

        return CGSize(width: width, height: (width + spacing * 5 + stackViewHeight + buttonHeight * 2))
    }
}

//extension PersonalAdsCollectionViewManager {
//    private func getTitleSubtitleViewModelData(_ advertisement: AdvertisementData) -> TitleSubtitleViewModel {
//        
//        guard let price = advertisement.price.self, let lessonsData = advertisement.lessons, let teachingTypesData = advertisement.teachingTypes, let image = advertisement.image else { return TitleSubtitleViewModel() }
//        var lessons = ""
//        let spacing = ", "
//        for (i, item) in lessonsData.enumerated() {
//            lessons += item.title
//            if i != lessonsData.count - 1 {
//                lessons += spacing
//            }
//        }
//        var teachingTypes = ""
//        for (i, item) in teachingTypesData.enumerated() {
//            teachingTypes += item.title
//            if i != teachingTypesData.count - 1 {
//                teachingTypes += spacing
//            }
//        }
//        let titleSubtitleData = TitleSubtitleViewModel(title: String(describing: price) + " сом", subtitle:  lessons, subsubtitle: teachingTypes, image: image)
//        return titleSubtitleData
//    }
//}
