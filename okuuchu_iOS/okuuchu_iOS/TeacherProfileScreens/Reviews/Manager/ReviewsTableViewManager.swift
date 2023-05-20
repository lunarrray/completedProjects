
import UIKit

//MARK: - Class

final class ReviewsTableViewManager: NSObject {
    
    private var reviews: [ReviewData] = []
    
    func setTableViewData(reviews: [ReviewData], tableView: UITableView){
        self.reviews = reviews
        tableView.reloadData()
    }
}

//MARK: - Extension

extension ReviewsTableViewManager: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReviewCell.self), for: indexPath) as? ReviewCell else {
            return ReviewCell()
        }
        
        let reviewerData = reviews[indexPath.row]
        let cellData = TitleSubtitleViewModel(title: reviewerData.reviewer?.name, subtitle: reviewerData.reviewText, image: reviewerData.reviewer?.image)
        
        cell.configureCell(with: cellData, rating: reviewerData.assessment ?? 0)
        return cell
    }
}
