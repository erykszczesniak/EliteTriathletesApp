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
