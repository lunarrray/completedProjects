
import UIKit

//MARK: - Protocols

protocol RecordedVideoTableViewDelegate: AnyObject{
    func selectedCell(at indexPath: IndexPath)
    func setTranslucentBackround()
}

//MARK: - Class

class RecordedVideoTableViewManager: NSObject {
    weak var delegate: RecordedVideoTableViewDelegate?
    var videos: [TitleSubtitleViewModel] = []
    
    func setTableViewData(_ videos: [TitleSubtitleViewModel], tableView: UITableView){
        self.videos = videos
        tableView.reloadData()
    }
}


//MARK: - Extension
extension RecordedVideoTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videos[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleSubtitleCell.self), for: indexPath) as? TitleSubtitleCell else {
            return TitleSubtitleCell()
        }
        
        cell.configureCell(with: video)
        cell.contentView.autoresizingMask = .flexibleHeight
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        
        cell.addGestureRecognizer(longPressRecognizer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedCell(at: indexPath)        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Extension

extension RecordedVideoTableViewManager{
    @objc private func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began{
            guard let cell = gestureRecognizer.view as? UITableViewCell else { return }
            
            let pullDownView = PullDownOverlayView(frame: CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height))
            
            cell.addSubview(pullDownView)
            delegate?.setTranslucentBackround()
        }
    }
}
