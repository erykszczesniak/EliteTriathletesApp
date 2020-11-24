import UIKit


extension TriathleteVC {

    func parseJSON() {
        if let url = Bundle.main.url(forResource: "triathlete", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                triathletes = try JSONDecoder().decode([Triathlete].self, from: data)
            } catch {
                print(error)
            }
        }
    }
}
extension TriathleteVC: UICollectionViewDelegate, UICollectionViewDataSource {
       
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
