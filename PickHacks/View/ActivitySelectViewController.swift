//
//  ActivitySelectViewController.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import UIKit
import Mapbox


class ActivitySelectViewController: UIViewController {
    @IBOutlet weak var choiceTable: UITableView!
    var activities: [String] = ["Soccer", "Basketball", "Swimming", "Hockey"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.choiceTable.reloadData()
    }
    
}

extension ActivitySelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = (indexPath as NSIndexPath).row
        let activity = self.activities[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableCell")!
        cell.textLabel?.text = activity
        
        return cell
    }
    
    
}
