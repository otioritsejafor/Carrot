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
    
    
    @IBAction func shareOnSnap(_ sender: Any) {
        let snapImage = UIImage(imageLiteralResourceName: "Snap")
        //let snapImage = UIImage(contentsOfFile: )
        let sticker = SCSDKSnapSticker(stickerImage: snapImage)
        //let snap = SCSDKStickerSnapContent(snapPhoto: sticker)
        
        let snap = SCSDKNoSnapContent()
        snap.sticker = sticker /* Optional */
        snap.caption = "Snap on Snapchat!" /* Optional */
        //snap.attachmentUrl = "https://www.snapchat.com" /* Optional */
        
        print("Size ", snapImage.size)
        
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping(completionHandler: { (error: Error?) in
            /* Do something */
            
            self.imageIndicator.image = snapImage
            
            
        })
        
    }
    
    @IBOutlet weak var imageIndicator: UIImageView!
    
    
}
