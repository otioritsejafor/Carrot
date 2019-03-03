//
//  CategoriesViewController.swift
//  PickHacks
//
//  Created by Cao Trong Duy Nhan on 3/3/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class CategoriesViewController: UIViewController {
    
    let activities = [("Soccer", "⚽️"), ("Basketball", "🏀"), ("Swimming", "🏊‍♀️"), ("Volleyball", "🏐"), ("Golf", "🏌️‍♂️"), ("Hiking", "⛰")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in activityCards.indices {
            let oneActivity = activities[index] as (name: String, icon: String)
            activityCards[index].layer.cornerRadius = 10
            activityCards[index].setTitle(oneActivity.icon + "\n" + oneActivity.name, for: UIControl.State.normal)
            
            //activityCards[index].setImage(UIImage(imageLiteralResourceName: activities[index]), for: UIControl.State.normal)
            activityCards[index].backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            //activityCards[index].setImage(UIImage(imageLiteralResourceName: "Soccer"), for: UIControl.State.normal)
            activityCards[index].titleLabel?.textAlignment = NSTextAlignment.center
//            activityCards[index].
            activityCards[index].setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
            
        }
    }
    
    // @IBOutlet weak var choiceTable: UITableView!
    
    
    @IBAction func activityCategory(_ sender: UIButton) {
        //        if let cardNumber = activityCards.index(of: sender) {
        //            print(activities[cardNumber])
        //            //            game.chooseCard(at: cardNumber)
        //            //            updateViewFromModel()
        //        }
    }
    
    
    @IBOutlet var activityCards: [UIButton]!
    
}
