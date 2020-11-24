import UIKit

class TriathleteVC: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var triathletes = [Triathlete]()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        createBackgroundImage()
        parseJSON()
            
    }
    
    func createBackgroundImage() {
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect:blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        collectionView.backgroundColor = UIColor.clear
                   
    }
        
}

   


