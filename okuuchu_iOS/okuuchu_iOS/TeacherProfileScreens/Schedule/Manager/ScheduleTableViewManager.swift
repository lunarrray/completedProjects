
import UIKit

//MARK: - Protocols

protocol ScheduleTableViewDelegate: AnyObject {
    func selectedCell(at indexPath: IndexPath)
    func deselectedCell(at indexPath: IndexPath)
}

//MARK: - Class

final class ScheduleTableViewManager: NSObject {
    weak var delegate: ScheduleTableViewDelegate?
    private var scheduleData: [TitleSubtitleViewModel] = []
    private var selectedIndexes: Set<Int> = []
    
    func setData(_ scheduleData: [TitleSubtitleViewModel], selectedIndexes: Set<Int>, tableView: UITableView){
        self.scheduleData = scheduleData
        self.selectedIndexes = selectedIndexes
        tableView.reloadData()
    }
}

//MARK: - Extension

extension ScheduleTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubtitleCell.self), for: indexPath) as? SubtitleCell else {
            return SubtitleCell()
        }
        
        let currentData = scheduleData[indexPath.row]
        
        cell.configureCell(with: currentData)
        
        let checkmarkImage = Asset.checkmark.image
        let checkmarkView = UIImageView(image: checkmarkImage)
        checkmarkView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        if selectedIndexes.contains(indexPath.row) {
            cell.accessoryView = checkmarkView
        } else {
            cell.accessoryView = nil
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCell(at: indexPath)
        let cell = tableView.cellForRow(at: indexPath)
        
        let checkmarkImage = Asset.checkmark.image
        let checkmarkView = UIImageView(image: checkmarkImage)
        checkmarkView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        if cell?.accessoryView == nil {
            delegate?.selectedCell(at: indexPath)
            cell?.accessoryView = checkmarkView
        } else {
            delegate?.deselectedCell(at: indexPath)
            cell?.accessoryView = nil
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
