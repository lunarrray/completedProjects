
import Foundation

//MARK: - Protocols
protocol TeacherProfileViewModelInput {
    var coordinator: TeacherProfileCoordinator? { get set }
    var output: TeacherProfileViewModelOutput? { get set }
    
    func getDataFromModel()
    func menuItemTapped(_ item: Menu)
    
}

protocol TeacherProfileViewModelOutput: AnyObject {
    func customizeOutput(with data: [TitleSubtitleViewModel])
}

//MARK: - Class

final class TeacherProfileViewModel {
    var coordinator: TeacherProfileCoordinator?
    weak var output: TeacherProfileViewModelOutput? {
        didSet {
            output?.customizeOutput(with: teacherData)
        }
    }
    
    private var teacherData: [TitleSubtitleViewModel] = []

}

//MARK: - Extension

extension TeacherProfileViewModel: TeacherProfileViewModelInput {
    func getDataFromModel() {
        // getting data from model
        output?.customizeOutput(with: teacherData)
    }
    
    func menuItemTapped(_ item: Menu) {
        switch item {
        case .updatePersonalInfo:
            coordinator?.startUpdateTeacherInfo()
        case .information:
            coordinator?.startInformationScreen()
        case .schedule:
            coordinator?.startSchedule()
        case .reviews:
            coordinator?.startReviews()
        case .ads:
            coordinator?.startPersonalAds()
        case .recordedLessons:
            coordinator?.startRecordedLessons()
        }
    }
}

