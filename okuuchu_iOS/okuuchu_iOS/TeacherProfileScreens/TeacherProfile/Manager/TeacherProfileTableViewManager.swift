
import UIKit

protocol TeacherProfileTableViewDelegate: AnyObject {
    func selectedMenuItem(_ menuItem: Menu)
}

class TeacherProfileTableViewManager: NSObject {
    weak var delegate: TeacherProfileTableViewDelegate?
    private var menuData: [Menu] = [.schedule, .recordedLessons, .updatePersonalInfo, .ads, .reviews, .information]
}

extension TeacherProfileTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self), for: indexPath) as? TitleCell else { return TitleCell() }
        let menuItem = menuData[indexPath.row]
        let cellData = TitleSubtitleViewModel(title: menuItem.title)
        cell.configureCell(with: cellData)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedMenuItem(menuData[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
