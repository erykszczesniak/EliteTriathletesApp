import UIKit

class TriathleteVC: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        private var triathletes = [Triathlete]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
       // Apply blurring effect
       createBackgroundImage()
            
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

    extension TriathleteVC: UICollectionViewDelegate, UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return triathletes.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TriathleteCell
            let icon = triathletes[indexPath.row]
            cell.imageView.image = UIImage(named: icon.imageName)
            cell.nameLabel.text = "\(icon.name)"
            // Apply round corner
            cell.layer.cornerRadius = 4.0
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if segue.identifier == "showIconDetail" {
                  if let indexPaths = collectionView?.indexPathsForSelectedItems {
                      let destinationController = segue.destination as! DetailVC
                      destinationController.icon = triathletes[indexPaths[0].row]
                      collectionView?.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
}

