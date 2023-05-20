
import Foundation

//MARK: - Protocols
protocol LessonsListViewModelInput{
    var coordinator: LessonsListCoordinator? { get set }
    var output: LessonsLisViewModelOutput? { get set }
    
    func getDataFromModel()
    func subjectItemTapped(at index: Int)
    func viewDidDisappear()
}

protocol LessonsLisViewModelOutput: AnyObject {
    func customizeOutput(with lessons: [Lesson])
}


//MARK: - Class

final class LessonsListViewModel{
    var coordinator: LessonsListCoordinator?
    weak var output: LessonsLisViewModelOutput? {
        didSet{
            output?.customizeOutput(with: lessons)
        }
    }
    
    var lessons: [Lesson] = []
}


//MARK: - Extension

extension LessonsListViewModel: LessonsListViewModelInput{
    func getDataFromModel() {
        lessons = [
            .math,
            .programming,
            .physics
        ]
    
        output?.customizeOutput(with: lessons)
    }
    
    func subjectItemTapped(at index: Int) {
        let subject = lessons[index]
        coordinator?.startRecordedVideos(for: subject, id: 1)
        
    }
    
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
}

