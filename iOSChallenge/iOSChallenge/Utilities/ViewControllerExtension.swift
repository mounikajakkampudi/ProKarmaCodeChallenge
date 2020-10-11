//
//  ViewControllerExtension.swift
//  iOSChallenge
//
//  Created by Mounika Jakkampudi on 10/11/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showLodingViewAlert() {
       let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
       let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
       loadingIndicator.hidesWhenStopped = true
       loadingIndicator.style = .large
       loadingIndicator.startAnimating();
       alert.view.addSubview(loadingIndicator)
       self.present(alert, animated: true, completion: nil)
    }
    
    func dismissAlert() {
        if let vc = self.presentedViewController, vc is UIAlertController {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
