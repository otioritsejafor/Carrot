//
//  LoginViewController.swift
//  PickHacks
//
//  Created by Cao Trong Duy Nhan on 3/2/19.
//  Copyright © 2019 Magloboid. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appLogo.image = UIImage(imageLiteralResourceName: "cc")
        
    }
    
    @IBOutlet weak var appLogo: UIImageView!
    
    @IBAction func logInWithSnap(_ sender: UIButton) {
    }
    
}
