
import UIKit

class ReviewData {
    var reviewer: User?
    var assessment: Double?
    var reviewText: String?
    
    init(reviewer: User? = nil, assessment: Double? = nil, reviewText: String? = nil) {
        self.reviewer = reviewer
        self.assessment = assessment
        self.reviewText = reviewText
    }
}
