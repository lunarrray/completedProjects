
import UIKit

class TutorData {
    var name: String?
    var image: UIImage?
    var description: String?
    var education: String?
    var dateOfBirth: Date?
    var whatsappNumber: String?
    var telegramNumber: String?
    var workExperience: String?
    var location: Location?
    var teachingLanguages: [TeachingLanguage]?
    var lessons: [Lesson]?
    var recordedVideos: [RecordedVideo]?
    
    init(name: String? = nil, image: UIImage? = nil, description: String? = nil, education: String? = nil, dateOfBirth: Date? = nil, whatsappNumber: String? = nil, telegramNumber: String? = nil, workExperience: String? = nil, location: Location? = nil, teachingLanguages: [TeachingLanguage]? = nil, lessons: [Lesson]? = nil, recordedVideo: [RecordedVideo]? = nil) {
        self.name = name
        self.image = image
        self.description = description
        self.education = education
        self.dateOfBirth = dateOfBirth
        self.whatsappNumber = whatsappNumber
        self.telegramNumber = telegramNumber
        self.workExperience = workExperience
        self.location = location
        self.teachingLanguages = teachingLanguages
        self.lessons = lessons
    }
}

class RecordedVideo{
    var id: Int?
    var title: String?
    var description: String?
    var link: String?
    var subject: Lesson?
    
    init(id: Int? = nil, title: String? = nil, description: String? = nil, link: String? = nil, subject: Lesson? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.link = link
        self.subject = subject
    }
}
