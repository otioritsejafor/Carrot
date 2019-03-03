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

struct eventInfo {
    var name = "Event"
    var time = "6PM"
    var location = "2010 Lincoln Ave"
    var tag = Array<String>()
}

class SnapViewController: UIViewController {
    
    var data = eventInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.image = UIImage(imageLiteralResourceName: "Map1")
        
        infoContainer.layer.cornerRadius = 10
        
        data.name = "Pick Up Soccer"
        data.tag.append("soccer")
        
        eventTitle.text = data.name
        eventTime.text = data.time
        eventLocation.text = data.location
        
        tagList[0].text = "#" + data.tag[0]
        
    }
    
    @IBOutlet weak var mapView: UIImageView!
    
    @IBOutlet weak var infoContainer: UIView!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    @IBOutlet weak var eventLocation: UILabel!
    
    @IBOutlet var tagList: [UILabel]!
    
    
    @IBAction func shareOnSnap(_ sender: Any) {
        let snapImage = infoContainer.asImage() //UIImage(imageLiteralResourceName: "Snap")
      
        let sticker = SCSDKSnapSticker(stickerImage: snapImage)
        
        let snap = SCSDKNoSnapContent()
        snap.sticker = sticker
        snap.attachmentUrl = "https://www.snapchat.com"
        
        print("Size ", snapImage.size)
        
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping(completionHandler: { (error: Error?) in
            /* Do something */
            
            //self.imageIndicator.image = snapImage
            
            
        })
        
    }
    
    @IBOutlet weak var imageIndicator: UIImageView!
    
    
}

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
