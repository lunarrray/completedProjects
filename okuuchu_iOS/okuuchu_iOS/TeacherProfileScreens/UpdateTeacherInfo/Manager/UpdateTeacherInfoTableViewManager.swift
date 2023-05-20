

import UIKit

protocol UpdateTeacherInfoTableViewDelegate: AnyObject {
    
}

final class UpdateTeacherInfoTableViewManager: NSObject {
    weak var delegate: UpdateTeacherInfoTableViewDelegate?
    private var dataSource: [Section] = []
    
    func setTeacherData(_ dataSource: [Section], tableView: UITableView){
        self.dataSource.removeAll(keepingCapacity: true)
        self.dataSource = dataSource
        tableView.reloadData()
    }
}

extension UpdateTeacherInfoTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .imageSection(let imageData):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageCell.self), for: indexPath) as? ImageCell else { return ImageCell() }
            cell.configureCell(with: imageData)
            cell.activateCameraButton()
            
            cell.selectionStyle = .none
            return cell
            
        case .titleTextViewSection(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LabeledTextViewCell.self), for: indexPath) as? LabeledTextViewCell else { return LabeledTextViewCell() }
            let cellData = data[indexPath.row]
            cell.configureCell(with: cellData)
            
            cell.selectionStyle = .none
            return cell
            
        case .buttonsSection:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PrimaryButtonCell.self), for: indexPath) as? PrimaryButtonCell else { return PrimaryButtonCell() }
            cell.selectionStyle = .none
            cell.setButtonTitle("Сохранить")
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}


