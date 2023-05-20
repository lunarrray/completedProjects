

import UIKit

class RatingView: UIStackView {
    private var starRating = 0.0
    private var stars: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        onConfigureView()
        onAddSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onConfigureView(){
        axis = .horizontal
        distribution = .fillEqually
        alignment = .fill
    }
    
    func onAddSubviews(){
        for star in stars {
            addArrangedSubview(star)
            star.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
    }
    
    func configureWith(rating: Double, spacing: CGFloat, starColor: UIColor){
  
        self.spacing = spacing
        starRating = rating
        var countRating = rating
        for star in stars {
              star.removeFromSuperview()
        }
          
        stars.removeAll()
        
        
        for _ in 1...5{
            let imageView = UIImageView()
            countRating -= 1
            if countRating >= 0 {
                imageView.image = Asset.fullStarIcon.image.withTintColor(starColor, renderingMode: .alwaysOriginal)
            } else {
                let remainder = (abs(countRating)) - abs(Double(Int(countRating)))
                if remainder == 0.0{
                    imageView.image = Asset.emtyStarIcon.image.withTintColor(starColor, renderingMode: .alwaysOriginal)
                } else {
                    imageView.image = Asset.halfStarIcon.image.withTintColor(starColor, renderingMode: .alwaysOriginal)
                    countRating += remainder
                }
            }
          
            stars.append(imageView)
            addArrangedSubview(imageView)

        }
    }
}
