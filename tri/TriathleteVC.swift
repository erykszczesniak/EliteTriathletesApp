//
//  ViewController.swift
//  Triathletes
//
//  Created by Eryk Szcześniak on 16/08/2020.
//  Copyright © 2020 Eryk Szcześniak. All rights reserved.
//

import UIKit

class TriathleteVC: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        private var triathletes = [Triathlete(name: "Jan Frodeno", imageName: "froden", description: "Jan Frodeno (born 18 August 1981) is a German triathlete. He is the gold medal winner in men's triathlon at the 2008 Summer Olympics in Beijing, 3-time winner of the Ironman World Championship in 2015, 2016, and 2019, and 2-time winner of the Ironman 70.3 World Championship in 2015 and 2018. He is the world record holder for the long distance, set in Roth, Germany in 2016 with 7:35:39 hours." ),
                                   Triathlete(name: "Mario Mola", imageName:  "mario", description: "Mario Mola (born 23 February 1990 in Palma de Mallorca), is a Spanish professional triathlete. He is the 2016, 2017 and 2018 ITU World Triathlon Series World Champion. He has placed 19th at the London Olympic Games 2012 and 8th at the Rio Olympic Games 2016.[1] In addition to his World Triathlon Series wins, he has placed second and third in 2014 and 2015 ITU World Triathlon Series."),
                                   Triathlete(name: "Vincent Luis", imageName:  "vincent", description: "Vincent Luis (born 27 June 1989, Vesoul) is a French professional triathlete, the Junior European and World Champion of the year 2008, French U23 Champion of the year 2010, and part of the National Team called Collectif France Ambition 2012. He took part in the 2012 and 2016 Olympics. He became World Champion in 2019."
),
                                   Triathlete(name: "Richard Varga", imageName: "varga", description: "Richard Varga (born 28 January 1989) is a Slovak triathlete. He is the winner of the 2010, 2012, 2013, and 2015 ITU Aquathlon World Championship [3] and is considered as the fastest swimmer among triathletes."),
                                   
                                   Triathlete(name: "Fernando Alarza", imageName:  "falarza", description: "One of the more experienced athletes riding high in the World Triathlon Series, Spain’s Fernando Alarza’s first taste of success was beating GB’s Tom Bishop to be crowned Junior World Champion at the 2010 ITU Grand Final in Budapest. Just two years later Alarza scored a top 5 finish in the WTS Stockholm before claiming second in the 2012 U23 World Championships in London."),
                                   Triathlete(name: "Richard Murray", imageName:  "murray", description: "One of the more experienced athletes riding high in the World Triathlon Series, Spain’s Fernando Alarza’s first taste of success was beating GB’s Tom Bishop to be crowned Junior World Champion at the 2010 ITU Grand Final in Budapest. Just two years later Alarza scored a top 5 finish in the WTS Stockholm before claiming second in the 2012 U23 World Championships in London")
                             
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Apply blurring effect
            backgroundImageView.image = UIImage(named: "cloud")
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            backgroundImageView.addSubview(blurEffectView)
            
            collectionView.backgroundColor = UIColor.clear
            
            if UIScreen.main.bounds.size.height == 568.0 {
                let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
                flowLayout.itemSize = CGSize(width: 250.0, height: 330.0)
            }
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
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
            
            // Configure the cell
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

