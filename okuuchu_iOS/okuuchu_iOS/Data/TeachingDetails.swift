
import UIKit

enum TeachingLanguage {
    case russian
    case turkish
    case kyrgyz
    case english
    
    var title: String {
        switch self {
        case .russian:
            return "Русский"
        case .turkish:
            return "Турецкий"
        case .kyrgyz:
            return "Кыргызский"
        case .english:
            return "Английский"
        }
    }
}

enum Lesson {
    case math
    case programming
    case chemistry
    case biology
    case english
    case russian
    case russianLiterature
    case german
    case physics
    case history
    case geography
    case geometry
    case kyrgyz
    case kyrgyzLiterature
    case turkish
    
    var title: String {
        switch self {
        case .math:
            return "Математика"
        case .programming:
            return "Программирование"
        case .chemistry:
            return "Химия"
        case .biology:
            return "Биология"
        case .english:
            return "Английиский язык"
        case .russian:
            return "Русский язык"
        case .russianLiterature:
            return "Русская литература"
        case .german:
            return "Немецкий"
        case .physics:
            return "Физика"
        case .history:
            return "История"
        case .geography:
            return "География"
        case .geometry:
            return "Геометрия"
        case .kyrgyz:
            return "Кыргызский"
        case .kyrgyzLiterature:
            return "Кыргызская литература"
        case .turkish:
            return "Турецкий"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .math:
            return Asset.math.image
        case .programming:
            return Asset.programming.image
        case .chemistry:
            return Asset.chemistry.image
        case .biology:
            return Asset.biology.image
        case .english:
            return Asset.english.image
        case .russian:
            return Asset.russian.image
        case .russianLiterature:
            return Asset.russianLiterature.image
        case .german:
            return Asset.german.image
        case .physics:
            return Asset.physics.image
        case .history:
            return Asset.history.image
        case .geography:
            return Asset.geography.image
        case .geometry:
            return Asset.geometry.image
        case .kyrgyz:
            return Asset.kyrgyz.image
        case .kyrgyzLiterature:
            return Asset.kyrgyzLiterature.image
        case .turkish:
            return Asset.turkish.image
        }
    }
}

enum TeachingType{
    case online
    case offline
    case group
    case individual
    
    var title: String {
        switch self {
        case .online:
            return "Онлайн"
        case .offline:
            return "Оффлайн"
        case .group:
            return "В группе"
        case .individual:
            return "Индивидуально"
        }
    }
}

enum Location {
    case chui
    case naryn
    case osh
    case jalalAbad
    case talas
    case batken
    case issykKul
    
    var title: String {
        switch self {
        case .chui:
            return "Чуй"
        case .naryn:
            return "Нарын"
        case .osh:
            return "Ош"
        case .jalalAbad:
            return "Жалал-Абад"
        case .talas:
            return "Талас"
        case .batken:
            return "Баткен"
        case .issykKul:
            return "Ысык-кол"
        }
    }
}

enum ActiveStatus {
    case active
    case inactive
}

