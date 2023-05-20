
import UIKit

class AdvertisementData {
    var id: Int?
    var tutor: TutorData?
    var lessons: [Lesson]?
    var teachingLanguages: [TeachingLanguage]?
    var teachingTypes: [TeachingType]?
    var location: Location?
    var description: String?
    var image: UIImage?
    var whatsappNumber: String?
    var telegramNumber: String?
    var price: Int?
    var status: ActiveStatus?
    
    init(id: Int? = nil, tutor: TutorData? = nil, lessons: [Lesson]? = nil, teachingLanguages: [TeachingLanguage]? = nil, teachingTypes: [TeachingType]? = nil, location: Location? = nil, description: String? = nil, image: UIImage? = nil, whatsappNumber: String? = nil, telegramNumber: String? = nil, price: Int? = nil, status: ActiveStatus? = nil) {
        self.id = id
        self.tutor = tutor
        self.lessons = lessons
        self.teachingLanguages = teachingLanguages
        self.teachingTypes = teachingTypes
        self.location = location
        self.description = description
        self.image = image
        self.whatsappNumber = whatsappNumber
        self.telegramNumber = telegramNumber
        self.price = price
        self.status = status
    }
}
