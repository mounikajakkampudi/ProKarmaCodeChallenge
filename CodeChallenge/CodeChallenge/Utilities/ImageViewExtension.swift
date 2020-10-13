//
//  ImageViewExtension.swift
//  CodeChallenge
//
//  Created by Mounika Jakkampudi on 10/10/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func setImageFromServerURL(_ URLString: String, placeHolder: UIImage, completion: @escaping (UIImage) -> Void) {
        self.image = placeHolder
        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let cachedImage = imageCache.object(forKey: NSString(string: imageServerUrl)) {
            self.image = cachedImage
            completion(cachedImage)
            return
        }

            DispatchQueue.global().async {
                NetworkManager.shared.get(urlString: imageServerUrl) { (result) in
                    switch result {
                    case .failure(let error):
                        #if DEBUG
                        print("ERROR LOADING IMAGES FROM URL: \(String(describing: error.localizedDescription))")
                        #endif
                        DispatchQueue.main.async {
                            self.image = placeHolder
                            completion(placeHolder)
                        }
                    case .success(let data):
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: imageServerUrl))
                            DispatchQueue.main.async {
                            self.image = downloadedImage
                            }
                            completion(downloadedImage)
                        }
                    }

                }
            }
    }
}
