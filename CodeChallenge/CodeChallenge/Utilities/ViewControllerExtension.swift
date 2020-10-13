//
//  ViewControllerExtension.swift
//  CodeChallenge
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
        if #available(iOS 13.0, *) {
            loadingIndicator.style = .large
        } else {
            loadingIndicator.style = .gray
        }
       loadingIndicator.startAnimating()
       alert.view.addSubview(loadingIndicator)
       self.present(alert, animated: true, completion: nil)
    }
    func dismissAlert() {
        if let presentedVC = self.presentedViewController, presentedVC is UIAlertController {
            self.dismiss(animated: false, completion: nil)
        }
    }
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
