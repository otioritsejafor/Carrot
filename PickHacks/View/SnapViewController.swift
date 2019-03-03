//
//  SnapViewController.swift
//  PickHacks
//
//  Created by Oti Oritsejafor on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import SCSDKCreativeKit
//import CoreLocation

class SnapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.image = UIImage(imageLiteralResourceName: "Map1")
        
        infoContainer.layer.cornerRadius = 10
        
//        eventTitle.fon
    }
    
    @IBOutlet weak var mapView: UIImageView!
    
    @IBOutlet weak var infoContainer: UIView!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    
    
    @IBAction func shareOnSnap(_ sender: Any) {
        let snapImage = UIImage(imageLiteralResourceName: "Snap")
      
        let sticker = SCSDKSnapSticker(stickerImage: snapImage)
        
        let snap = SCSDKNoSnapContent()
        snap.sticker = sticker /* Optional */
        snap.caption = "Snap on Snapchat!" /* Optional */
        //snap.attachmentUrl = "https://www.snapchat.com" /* Optional */
        
        print("Size ", snapImage.size)
        
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping(completionHandler: { (error: Error?) in
            /* Do something */
            
            //self.imageIndicator.image = snapImage
            
            
        })
        
    }
    
    @IBOutlet weak var imageIndicator: UIImageView!
    
    
}
