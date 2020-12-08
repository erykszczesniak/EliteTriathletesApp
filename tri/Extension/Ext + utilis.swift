import UIKit


extension TriathleteVC {

    func parseJSON() {
        if let url = Bundle.main.url(forResource: "triathlete", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                viewModel.triathletes = try JSONDecoder().decode([Triathlete].self, from: data)
            } catch {
                print(error)
            }
        }
    }
}
extension TriathleteVC: UICollectionViewDelegate, UICollectionViewDataSource {
       
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfItems
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TriathleteCell
        let icon = viewModel.getTriathletes(at: indexPath)
        cell.configure(with: icon)
        
           cell.layer.cornerRadius = 4.0
           return cell
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "showIconDetail" {
                 if let indexPaths = collectionView?.indexPathsForSelectedItems {
                     let destinationController = segue.destination as! DetailVC
                    destinationController.icon = viewModel.triathletes[indexPaths[0].row]
                     collectionView?.deselectItem(at: indexPaths[0], animated: false)
           }
       }
   }
}
