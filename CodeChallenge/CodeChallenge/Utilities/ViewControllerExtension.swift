//
//  ViewControllerExtension.swift
//  CodeChallenge
//
//  Created by Mounika Jakkampudi on 10/11/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showProgressHUD(progressLabel:String){
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.label.text = progressLabel
        }
    }

    func dismissHUD(isAnimated:Bool) {
        DispatchQueue.main.async{
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
    
    func showErrorAlert(title: String, message: String) {
        DispatchQueue.main.async{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    }
}
