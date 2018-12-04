//
//  UIImage+Fill.swift
//  MSFlightMapView
//
//  Created by Muhammad Abdul Subhan on 03/12/2018.
//  Copyright © 2018 Subhan. All rights reserved.
//

import UIKit

extension UIImage {
    func filledImage(withColor fillColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        let context = UIGraphicsGetCurrentContext()
        fillColor.setFill()
        
        context!.translateBy(x: 0, y: self.size.height)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.setBlendMode(CGBlendMode.colorBurn)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context!.draw(self.cgImage!, in: rect)
        
        context!.setBlendMode(CGBlendMode.sourceIn)
        context!.addRect(rect)
        context!.drawPath(using: CGPathDrawingMode.fill)
        
        let coloredImg : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return coloredImg
    }
}
