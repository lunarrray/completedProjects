
import Foundation

//MARK: - Protocols

protocol PersonalAdsViewModelInput {
    var coordinator: PersonalAdsCoordinator? { get set }
    var output: PersonalAdsViewModelOutput? { get set }
    
    func viewDidDisappear()
    func toggleCollectionView(segmentedControlIndex: Int)
    func getActiveAdsDataFromModel()
}

protocol PersonalAdsViewModelOutput: AnyObject {
    func customizeOutput(with data: [SubsubtitleViewModel])
}

//MARK: - Class

final class PersonalAdsViewModel {
    var coordinator: PersonalAdsCoordinator?
    weak var output: PersonalAdsViewModelOutput?{
        didSet{
            output?.customizeOutput(with: subsubtitleViewModel)
        }
    }
    
    private var adsData: [AdvertisementData] = [] {
        didSet{
            sendConvertedData()
        }
    }
    private var subsubtitleViewModel: [SubsubtitleViewModel] = []
    private var currentCollectionViewStatus: ActiveStatus = .active
}

//MARK: - Extension

extension PersonalAdsViewModel: PersonalAdsViewModelInput {
    
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
    func getActiveAdsDataFromModel() {
        
        adsData = [
            AdvertisementData(id: 11, lessons: [.math], teachingTypes: [.online], image: Asset.lessonImage1.image, price: 300, status: .active),
            AdvertisementData(id: 12, lessons: [.programming], teachingTypes: [.online], image: Asset.menAvatar.image, price: 400, status: .active),
            AdvertisementData(id: 13, lessons: [.german], teachingTypes: [.online, .offline, .group], image: Asset.womenAvatar.image, price: 370, status: .inactive),
            AdvertisementData(id: 14, lessons: [.programming, .math], teachingTypes: [.online], image: Asset.lessonImage2.image, price: 300, status: .active),
            AdvertisementData(id: 15, lessons: [.math, .programming], teachingTypes: [.online], image: Asset.lessonImage2.image, price: 340, status: .active),
            AdvertisementData(id: 16, lessons: [.programming], teachingTypes: [.online], image: Asset.lessonImage2.image, price: 400, status: .inactive),
            AdvertisementData(id: 17, lessons: [.history], teachingTypes: [.offline, .group], image: Asset.lessonImage1.image, price: 900, status: .active),
            AdvertisementData(id: 18, lessons: [.german], teachingTypes: [.offline, .individual], image: Asset.lessonImage1.image, price: 500, status: .active),
            AdvertisementData(id: 19, lessons: [.geometry, .math], teachingTypes: [.online, .individual], image: Asset.lessonImage2.image, price: 300, status: .active),
            AdvertisementData(id: 110, lessons: [.programming, .biology, .chemistry], teachingTypes: [.online], image: Asset.lessonImage2.image, price: 800, status: .inactive)
        ]
        
//        sendConvertedData()
    }
    
    func toggleCollectionView(segmentedControlIndex: Int) {
        
        if segmentedControlIndex == 0 {
            currentCollectionViewStatus = .active
        } else if segmentedControlIndex == 1 {
            currentCollectionViewStatus = .inactive
        }
        
       sendConvertedData()
    }
}

extension PersonalAdsViewModel {
    private func makeSubsubtitleViewModel(from advertisements: [AdvertisementData], withStatus: ActiveStatus) -> [SubsubtitleViewModel]?{
        var subsubtitleViewModels: [SubsubtitleViewModel] = []
        for advertisement in advertisements {
        
            if advertisement.status == withStatus{
                
                guard let advertisementID = advertisement.id, let price = advertisement.price.self, let lessonsData = advertisement.lessons, let teachingTypesData = advertisement.teachingTypes, let image = advertisement.image, let status = advertisement.status else { return nil }
                var lessons = ""
                let spacing = ", "
                for (i, item) in lessonsData.enumerated() {
                    lessons += item.title
                    if i != lessonsData.count - 1 {
                        lessons += spacing
                    }
                }
                var teachingTypes = ""
                for (i, item) in teachingTypesData.enumerated() {
                    teachingTypes += item.title
                    if i != teachingTypesData.count - 1 {
                        teachingTypes += spacing
                    }
                }
                
                let toggleStatus: (() -> Void) = { [weak self] in
                    self?.toggleStatus(for: advertisementID)
                }
                let delete: (() -> Void)  = { [weak self] in
                    self?.deleteAdvertisement(for: advertisementID)
                }
                
                let subsubtitle = SubsubtitleViewModel(title: String(describing: price) + " сом", subtitle:  lessons, subsubtitle: teachingTypes, image: image, status: status, handleActivatingStatusTapAction: toggleStatus, handleDeleteButtonTapAction: delete)
                subsubtitleViewModels.append(subsubtitle)
            }
        }
        return subsubtitleViewModels
    }
    
    private func sendConvertedData(){
        subsubtitleViewModel = makeSubsubtitleViewModel(from: adsData, withStatus: currentCollectionViewStatus) ?? []
        output?.customizeOutput(with: subsubtitleViewModel)
    }
    
    private func toggleStatus(for id: Int){
        for advertisement in adsData {
            if advertisement.id == id {
                if advertisement.status == .active {
                    advertisement.status = .inactive
                } else {
                    advertisement.status = .active
                }
                break
            }
        }
        sendConvertedData()
    }
    
    private func deleteAdvertisement(for id: Int){
        for (i, advertisement) in adsData.enumerated() {
            if advertisement.id == id {
                adsData.remove(at: i)
                break
            }
        }
        sendConvertedData()
    }
}
