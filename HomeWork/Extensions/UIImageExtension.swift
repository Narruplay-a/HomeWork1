//
//  UIImageExtension.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import UIKit

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let maxHeight = targetSize.height
        let maxWidth = targetSize.width
        var actualHeight = size.height
        var actualWidth = size.width
        var imgRatio = actualWidth / actualHeight
        let maxRatio = maxWidth / maxHeight

        guard (actualHeight > maxHeight) || (actualWidth > maxWidth) else { return self }

        if imgRatio < maxRatio {
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        } else if imgRatio > maxRatio {
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        } else {
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
        
        let rect = CGRect(x: 0, y: 0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        draw(in: rect)

        guard let img = UIGraphicsGetImageFromCurrentImageContext(), let imageData = img.pngData() else { return self }
        UIGraphicsEndImageContext()

        return UIImage(data: imageData) ?? self
    }
}
