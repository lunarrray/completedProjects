
import Foundation

//MARK: - Protocols

protocol ReviewsViewModelInput {
    var coordinator: ReviewsCoordinator? { get set }
    var output: ReviewsViewModelOutput? { get set }
    
    func viewDidDisappear()
    func getReviewsDataFromModel()
}

protocol ReviewsViewModelOutput: AnyObject {
    func customizeOutput(with data: [ReviewData])
}

//MARK: - Class

final class ReviewsViewModel: NSObject {
    var coordinator: ReviewsCoordinator?
    weak var output: ReviewsViewModelOutput? {
        didSet {
            output?.customizeOutput(with: allReviews)
        }
    }
    
    private var allReviews: [ReviewData] = []
}

//MARK: - Extension

extension ReviewsViewModel: ReviewsViewModelInput {
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func getReviewsDataFromModel() {
        allReviews = [
            ReviewData(reviewer: User(name: "Анна Ахматова", image: Asset.womenAvatar.image), assessment: 3.2, reviewText: "Я училась у этого учителя много лет и могу сказать, что он настоящий профессионал своего дела. Он знает свой предмет вдоль и поперёк и умеет объяснять так, что даже сложные вещи кажутся простыми."),
            ReviewData(reviewer: User(name: "Асанова Айнагуль", image: Asset.womenAvatar.image), assessment: 4, reviewText: "Очень интересные и познавательные уроки. Учитель всегда держит внимание на высоком уровне, старается найти подход к каждому ученику."),
            ReviewData(reviewer: User(name: "Мамбетова Аида", image: Asset.womenAvatar.image), assessment: 5, reviewText: "Прошла годы, а я всё ещё благодарен этому прекрасному учителю. Он сумел внушить мне любовь к предмету, который я до этого не мог ни понять, ни полюбить."),
            ReviewData(reviewer: User(name: "Елена Морозова", image: Asset.womenAvatar.image), assessment: 3.8, reviewText: "Учитель очень терпеливый и добрый человек. Я была не самым усидчивым учеником, но он всегда находил время и терпение, чтобы помочь мне понять материал"),
            ReviewData(reviewer: User(name: "Дмитрий Лебеде", image: Asset.menAvatar.image), assessment: 4, reviewText: "Учитель всегда готов ответить на любой вопрос и помочь с любой задачей. Его уроки всегда очень понятны и интересны."),
            ReviewData(reviewer: User(name: "Жумабаева Гулназ", image: Asset.womenAvatar.image), assessment: 5, reviewText: "Я учился у этого преподавателя на протяжении многих лет и могу сказать, что он настоящий мастер своего дела. Его уроки всегда были полезными и интересными."),
            ReviewData(reviewer: User(name: "Мамбеталиев Тилек", image: Asset.menAvatar.image), assessment: 3.2, reviewText: "Благодаря этому учителю я начал понимать, что учиться может быть интересно и увлекательно. Его подход к обучению очень индивидуален и всегда ориентирован на потребности каждого ученика."),
            ReviewData(reviewer: User(name: "Байсалова Кадыркул", image: Asset.womenAvatar.image), assessment: 3, reviewText: "Я очень благодарен этому учителю за то, что он помог мне разобраться в том, что я считал раньше совершенно непонятным и сложным."),
            ReviewData(reviewer: User(name: "Наталья Соловьева", image: Asset.womenAvatar.image), assessment: 4.5, reviewText: "Учитель замечательный и очень талантливый преподаватель. Его уроки всегда интересны и познавательны."),
            ReviewData(reviewer: User(name: "Иван Сидоров", image: Asset.menAvatar.image), assessment: 5, reviewText: "Я учился у этого учителя на протяжении нескольких лет и могу сказать, что это было одно из самых полезных и приятных образовательных опытов в моей жизни. Его подход к обучению настолько эффективен, что даже самые сложные темы кажутся легкими."),

        ]
        
        output?.customizeOutput(with: allReviews)
    }
}

