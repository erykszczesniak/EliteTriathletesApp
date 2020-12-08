import Foundation

struct TriathleteViewModel {
  
    var triathletes: [Triathlete] = []
    
    var numberOfItems: Int {
        return triathletes.count
    }
   
    func getTriathletes( at indexPath: IndexPath) -> Triathlete {
        return triathletes[indexPath.row]
    }
    
   
}
