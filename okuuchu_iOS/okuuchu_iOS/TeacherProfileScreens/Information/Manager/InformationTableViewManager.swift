
import UIKit

//MARK: - Protocol

protocol InformationTableViewDelegate: AnyObject{
    func selectedCell(type: InformationCellType)
}

//MARK: - Class


class InformationTableViewManager: NSObject{
    
    weak var delegate: InformationTableViewDelegate?
    private var dataSource: [SectionForInfoCellType] = [
        SectionForInfoCellType.type([.contacts, .aboutApp]),
        SectionForInfoCellType.type([.logout])
    ]
}

//MARK: - Extension

extension InformationTableViewManager: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = dataSource[indexPath.section]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleImageCell.self), for: indexPath) as? TitleImageCell else { return TitleImageCell() }
        
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.row < tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.addSeparator()
        }
        
        if tableView.numberOfRows(inSection: indexPath.section) == 1{
            cell.roundedCell()
        } else if indexPath.row == 0 {
            cell.roundedTop()
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.roundedBottom()
        }
        
        switch section{
        case .type(let data):
            let currentData = data[indexPath.row]
            let cellData = TitleSubtitleViewModel(title: currentData.title, image: currentData.imageIcon)
            cell.configureCell(with: cellData)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 10))
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = dataSource[indexPath.section]
        switch section{
        case .type(let data):
            let cellType = data[indexPath.row]
            delegate?.selectedCell(type: cellType)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
