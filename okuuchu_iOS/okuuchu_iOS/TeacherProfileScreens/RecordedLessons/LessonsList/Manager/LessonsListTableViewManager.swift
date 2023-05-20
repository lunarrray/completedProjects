
import UIKit

//MARK: - Protocol

protocol LessonsListTableViewDelegate: AnyObject{
    func selectedSubject(at indexPath: IndexPath)
}

//MARK: - Class

class LessonsListTableViewManager: NSObject {
    weak var delegate: LessonsListTableViewDelegate?
    private var lessons: [Lesson] = []
    
    func setTableViewData(data: [Lesson], tableView: UITableView){
        self.lessons = data
        tableView.reloadData()
    }
}

//MARK: - Extension

extension LessonsListTableViewManager: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject = lessons[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleImageCell.self), for: indexPath) as? TitleImageCell else {
            return TitleImageCell()
        }
        cell.accessoryType = .disclosureIndicator
        if indexPath.row < tableView.numberOfRows(inSection: indexPath.section) -  1 {
            cell.addSeparator()
        }
        
        if indexPath.row == 0{
            cell.roundedTop()
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.roundedBottom()
        }
        
        let titleImage = TitleSubtitleViewModel(title: subject.title, image: subject.icon)
        cell.configureCell(with: titleImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedSubject(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
