//
//  ViewController.swift
//  googleSignIn
//
//  Created by Jeremias Serafim on 20/04/18.
//  Copyright © 2018 Jeremias Serafim. All rights reserved.
//

import UIKit
import GoogleSignIn
import SDWebImage


class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {


    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lbMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var error : NSError?
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        
        let signInButton = GIDSignInButton()
        signInButton.center = view.center
        view.addSubview(signInButton)
  
       // GIDSignIn.sharedInstance().uiDelegate = self
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("ERROR: ", error)
            return
        } else {
            print(user)
            print(user.profile.name)
            print(user.profile.email)
            
        
           self.lbMessage.text = user.profile.email
            let URL = user.profile.imageURL(withDimension: 150)!
            
            self.image.sd_setImage(with: URL, completed: nil)
            
        
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.image.layer.cornerRadius = 75
        self.image.layer.masksToBounds = true
    }
}

