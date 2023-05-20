
import Foundation

class LessonsScheduleData {
    var weekday: Weekday?
    var time: [String]?
    
    init(weekday: Weekday? = nil, time: [String]? = nil) {
        self.weekday = weekday
        self.time = time
    }
    
    func numberOfItems() -> Int {
        guard let items = time else { return 0}
        return items.count
    }
}

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var dayTitle: String {
        switch self {
        case .monday:
            return "Понедельник"
        case .tuesday:
            return "Вторник"
        case .wednesday:
            return "Среда"
        case .thursday:
            return "Четверг"
        case .friday:
            return "Пятница"
        case .saturday:
            return "Суббота"
        case .sunday:
            return "Воскресенье"
        }
    }
}
