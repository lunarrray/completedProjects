
import UIKit

class User{
    var name: String?
    var age: Int?
    var image: UIImage?
    var role: UserRole?
    
    init(name: String? = nil, age: Int? = nil, image: UIImage? = nil, role: UserRole? = nil) {
        self.name = name
        self.age = age
        self.image = image
        self.role = role
    }
}

enum UserRole {
    case tutor
    case user
}
