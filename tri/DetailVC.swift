
import UIKit


class DetailVC: UIViewController {
    
    

    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.text = icon?.name
        }
    }
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = icon?.description
            descriptionLabel.numberOfLines = 0
        }
    }
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = UIImage(named: icon?.imageName ?? "")
        }
    }
   
    
    var icon: Triathlete?
    
}
