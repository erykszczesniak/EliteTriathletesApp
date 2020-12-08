import UIKit

class TriathleteCell: UICollectionViewCell {

     @IBOutlet var imageView: UIImageView!
     @IBOutlet var nameLabel: UILabel!
    
    private var model: Triathlete?

    func configure(with model: Triathlete) {
        self.model = model
        nameLabel.text = model.name
        imageView.image = UIImage(named: model.imageName)
         

    }
}
