//
//  ImageView.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 18/01/19.
//  Copyright © 2019 meditation-app. All rights reserved.
//

import UIKit

extension UIImage{
    
    func resizeImageWith(viewSize: CGSize, orientation : String) -> UIImage {
        
        var newSize : CGSize
        let horizontalRatio = viewSize.width / size.width
        let verticalRatio = viewSize.height / size.height

        let ratio = min(horizontalRatio, verticalRatio)
        
        newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
}
