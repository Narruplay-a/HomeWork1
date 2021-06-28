//
//  ResizableImageView.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import UIKit
import SwiftUI

struct ResizableImage: UIViewRepresentable {
    @Binding var image: UIImage?
    
    func makeUIView(context: Context) -> ResizableImageView {
        return ResizableImageView(with: image)
    }
 
    func updateUIView(_ uiView: ResizableImageView, context: Context) {
        if image != nil {
            uiView.activityIndicator.stopAnimating()
            uiView.activityIndicator.removeFromSuperview()
        }
        
        uiView.image = image?.resizeImage(targetSize: CGSize(width: 200, height: 200))
    }
}

final class ResizableImageView: UIImageView {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    init(with image: UIImage?) {
        super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 200)))
        contentMode = .center
        
        if image == nil {
            self.addSubview(activityIndicator)
            activityIndicator.frame = CGRect(x: -(activityIndicator.bounds.width / 2),
                                             y: 100 - (activityIndicator.bounds.height / 2),
                                             width: activityIndicator.bounds.width,
                                             height: activityIndicator.bounds.height)
            activityIndicator.startAnimating()
        } else {
            self.image = image?.resizeImage(targetSize: CGSize(width: 200, height: 200))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
