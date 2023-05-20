
import Foundation

//MARK: - Protocols

protocol ScheduleViewModelInput {
    var coordinator: ScheduleCoordinator? { get set }
    var output: ScheduleViewModelOutput? { get set }
    
    func viewDidDisappear()
    func getScheduleDataFromModel()
    func toggleTableView(segmentedControlIndex: Int)
    func addSelectedItemToSet(at indexPath: IndexPath)
    func removeSelectedItemFromSet(at indexPath: IndexPath)
    func deleteButtonTapped()
    func saveButtonTapped()
    func processInput(firstValue: String, secondValue: String)
}

protocol ScheduleViewModelOutput: AnyObject {
    func customizeOutput(with scheduleData: [String], selectedIndexes: Set<Int>)
}

//MARK: - Class

final class ScheduleViewModel: NSObject {
    var coordinator: ScheduleCoordinator?
    weak var output: ScheduleViewModelOutput?{
        didSet{
            if scheduleData.count > 0 {
                guard let indexes = selectedItemsIndexes[currentDay], let currentData = scheduleData[currentDay] else { return }
                self.output?.customizeOutput(with: currentData, selectedIndexes: indexes)
            }
        }
    }
    private var scheduleData: [Weekday: [String]] = [
        .monday: [],
        .tuesday: [],
        .wednesday: [],
        .thursday: [],
        .friday: [],
        .saturday: [],
        .sunday: []
    ]
    
    private var selectedItemsIndexes: [Weekday: Set<Int>] = [
        .monday: [],
        .tuesday: [],
        .wednesday: [],
        .thursday: [],
        .friday: [],
        .saturday: [],
        .sunday: []
    ]
    
    private var currentDay: Weekday = .monday
    
}

//MARK: - Extension

extension ScheduleViewModel: ScheduleViewModelInput {
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func getScheduleDataFromModel() {
        let scheduleDataFromModel = [
            LessonsScheduleData(weekday: .monday, time: ["9.00-11.00","12.00-14.00", "14.30-15.30", "16.00-17.00", "17.30-18.30", "16.00-17.00", "17.30-18.30", "16.00-17.00", "17.30-18.30", "16.00-17.00", "17.30-18.30"]),
            LessonsScheduleData(weekday: .tuesday, time: ["11.00-12.00", "13.30-17.30", "11.00-12.00", "13.30-17.30"]),
            LessonsScheduleData(weekday: .wednesday, time: ["15.00-16.00", "11.00-12.00", "13.30-17.30", "13.30-17.30", "13.30-17.30"]),
            LessonsScheduleData(weekday: .thursday, time: ["15.00-16.00", "11.00-12.00", "13.30-17.30", "13.30-17.30"]),
            LessonsScheduleData(weekday: .friday, time: ["15.00-16.00"]),
            LessonsScheduleData(weekday: .saturday, time: ["15.00-16.00", "11.00-12.00", "13.30-17.30"]),
            LessonsScheduleData(weekday: .sunday, time: [])
        ]
        
        for item in scheduleDataFromModel {
            guard let weekday = item.weekday else { return }
            scheduleData[weekday] = item.time
        }
        
        setOutput()
    }
    
    func toggleTableView(segmentedControlIndex: Int) {
        switch segmentedControlIndex{
        case 0:
            currentDay = .monday
        case 1:
            currentDay = .tuesday
        case 2:
            currentDay = .wednesday
        case 3:
            currentDay = .thursday
        case 4:
            currentDay = .friday
        case 5:
            currentDay = .saturday
        case 6:
            currentDay = .sunday
        default:
            return
        }
       setOutput(with: currentDay)
    }
    
    func addSelectedItemToSet(at indexPath: IndexPath) {
        selectedItemsIndexes[currentDay]?.insert(indexPath.row)
    }
    
    func removeSelectedItemFromSet(at indexPath: IndexPath) {
        selectedItemsIndexes[currentDay]?.remove(indexPath.row)
    }
    
    func deleteButtonTapped() {
        for keyElement in selectedItemsIndexes.keys {
            guard let indexes =  selectedItemsIndexes[keyElement], var times = scheduleData[keyElement] else { continue }
            for index in indexes {
                times[index] = ""
            }
            
            var i = 0
            while i < times.count {
                if times[i] == "" {
                    times.remove(at: i)
                    i -= 1
                }
                i += 1
            }
            scheduleData[keyElement] = times
        }
        
        emptySelectedIndexes()
        setOutput(with: currentDay)
    }

    
    func saveButtonTapped(){
        // add code for saveButton
    }
    
    func processInput(firstValue: String, secondValue: String) {
        let newTime = "\(firstValue)-\(secondValue)"
        guard var times = scheduleData[currentDay] else { return }
        if !times.contains(newTime){
            times.append(newTime)
        }
        
        scheduleData[currentDay] = times
        setOutput(with: currentDay)
    }
}

extension ScheduleViewModel {
    private func setOutput(with day: Weekday = .monday){
        guard let indexes = selectedItemsIndexes[day], let currentData = scheduleData[day] else { return }
        self.output?.customizeOutput(with: currentData, selectedIndexes: indexes)
    }
    
    private func emptySelectedIndexes(){
        selectedItemsIndexes = [
            .monday: [],
            .tuesday: [],
            .wednesday: [],
            .thursday: [],
            .friday: [],
            .saturday: [],
            .sunday: []
        ]
    }
}


