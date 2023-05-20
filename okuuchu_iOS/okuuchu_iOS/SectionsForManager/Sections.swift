
import UIKit

enum Section {
    case imageSection(imageData: TitleSubtitleViewModel)
    case titleTextViewSection(data: [TitleSubtitleViewModel])
    case buttonsSection
    
    var numberOfItems: Int {
        switch self{
        case .imageSection:
            return 1
        case .titleTextViewSection(let data):
            return data.count
        case .buttonsSection:
            return 1
        }
    }
}

enum Menu {
    case schedule
    case recordedLessons
    case updatePersonalInfo
    case ads
    case reviews
    case information
    
    var title: String {
        switch self{
        case .schedule:
            return "График"
        case .recordedLessons:
            return "Записанные уроки"
        case .reviews:
            return "Отзывы"
        case .updatePersonalInfo:
            return "Обновить информацию о себе"
        case .ads:
            return "Обьявления"
        case .information:
            return "Информация"
        }
    }
}

enum InformationCellType {
    case contacts
    case aboutApp
    case logout
    
    var title: String {
        switch self{
        case .contacts:
            return "Контакты"
        case .aboutApp:
            return "О приложении"
        case .logout:
            return "Выйти"
        }
    }
    
    var imageIcon: UIImage {
        switch self {
        case .contacts:
            return Asset.contactsIcon.image
        case .aboutApp:
            return Asset.aboutAppIcon.image
        case .logout:
            return Asset.logoutIcon.image
        }
    }
}

enum SectionForInfoCellType{
    case type(_ data: [InformationCellType])
    
    var numberOfItems: Int {
        switch self {
        case .type(let data):
            return data.count
        }
    }
}
