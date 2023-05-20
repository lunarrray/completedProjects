

import Foundation


protocol UpdateTeacherInfoViewModelInput {
    var coordinator: UpdateTeacherInfoCoordinator? { get set }
    var output: UpdateTeacherInfoViewModelOutput? { get set }
    
    func getTeacherDataFromModel()
    func viewDidDisappear()
}


protocol UpdateTeacherInfoViewModelOutput: AnyObject{
    func customizeOutput(with dataSource: [Section])
}

final class UpdateTeacherInfoViewModel {
    var coordinator: UpdateTeacherInfoCoordinator?
    weak var output: UpdateTeacherInfoViewModelOutput?{
        didSet {
            output?.customizeOutput(with: dataSource)
        }
    }
    
    private var teacherData: [TitleSubtitleViewModel] = []{
        didSet {
            self.dataSource.removeAll(keepingCapacity: true)
            self.dataSource = createDataSource()
        }
    }
    private var dataSource: [Section] = []
}

extension UpdateTeacherInfoViewModel: UpdateTeacherInfoViewModelInput {
    func getTeacherDataFromModel() {
        //asking data from model
        teacherData = [
            
            TitleSubtitleViewModel(title: "Имя и фамилия", subtitle: "Азима Асанова"),
            TitleSubtitleViewModel(title: "Немного о себе", subtitle: "Lörem ipsum klimatmat fibid tisos, supöning retopi. Geodögisk ont vifilig. Föder vitigt, gyförat. Egol seminas köns gepåktig timypp. "),
            TitleSubtitleViewModel(title: "Образование", subtitle: "Lörem ipsum klimatmat fibid tisos, supöning retopi. Geodögisk "),
            TitleSubtitleViewModel(title: "Дата рождения", subtitle: "12.02.2000"),
//            TitleSubtitleViewModel(title: "Номер для связи", subtitle: "+996 707 70 70 70"),
            TitleSubtitleViewModel(title: "Whatsapp", subtitle: "+996 990 506 014"),
            TitleSubtitleViewModel(title: "Telegram", subtitle: "+996 990 506 014"),
            TitleSubtitleViewModel(title: "Опыт репетиторства", subtitle: "4 года"),
            TitleSubtitleViewModel(title: "Местоположение", subtitle: "Бишкек"),
            TitleSubtitleViewModel(title: "Языки преподавания", subtitle: "Русский, Кыргызский", subTextType: .selectingSeveral),
            TitleSubtitleViewModel(title: "Предметы", subtitle: "Математика, Программирование", subTextType: .selectingSeveral),
        ]
        output?.customizeOutput(with: dataSource)
    }
    
    func viewDidDisappear(){
        coordinator?.didFinish()
    }
}

extension UpdateTeacherInfoViewModel {
    private func createDataSource() -> [Section] {
        var sections = [Section]()
        sections.append(.imageSection(imageData: TitleSubtitleViewModel(image: Asset.avatarImg.image, subTextType: .image)))
        let primaryTeacherData = [
        TitleSubtitleViewModel(title: "Имя и фамилия", subtitle: "Азима Асанова"),
            TitleSubtitleViewModel(title: "Немного о себе", subtitle: "Lörem ipsum klimatmat fibid tisos, supöning retopi. Geodögisk ont vifilig. Föder vitigt, gyförat. Egol seminas köns gepåktig timypp. "),
            TitleSubtitleViewModel(title: "Образование", subtitle: "Lörem ipsum klimatmat fibid tisos, supöning retopi. Geodögisk "),
        TitleSubtitleViewModel(title: "Дата рождения", subtitle: "12.02.2000", subTextType: .date),
//        TitleSubtitleViewModel(title: "Номер для связи", subtitle: "+996 707 70 70 70", subTextType: .phoneNumber),
        TitleSubtitleViewModel(title: "Whatsapp", subtitle: "+996 990 506 014", subTextType: .phoneNumber),
        TitleSubtitleViewModel(title: "Telegram", subtitle: "+996 990 506 014", subTextType: .phoneNumber),
            TitleSubtitleViewModel(title: "Опыт репетиторства", subtitle: "4 года"),
            TitleSubtitleViewModel(title: "Местоположение", subtitle: "Бишкек"),
            TitleSubtitleViewModel(title: "Языки преподавания", subtitle: "Русский, Кыргызский", subTextType: .selectingSeveral),
            TitleSubtitleViewModel(title: "Предметы", subtitle: "Математика, Программирование", subTextType: .selectingSeveral),
        ]
        sections.append(.titleTextViewSection(data: primaryTeacherData))
        sections.append(.buttonsSection)
        
        return sections
    }
}
