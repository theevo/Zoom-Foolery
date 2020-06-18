//
//  ViewController.swift
//  Zoom Foolery
//
//  Created by Theo Vora on 6/17/20.
//  Copyright © 2020 Joy Bending. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var zoomed: Bool = false
    
    @IBOutlet weak var image1x: UIImageView!
    @IBOutlet weak var imageZoomed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageZoomed.alpha = 0.0
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(zoom))
        gestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func zoom() {
        
        switch zoomed {
        case false:
            // zoom in
            imageZoomed.alpha = 1.0
        default:
            // zoom out
            imageZoomed.alpha = 0.0
        }
        toggleZoom()
    }
    
    func toggleZoom() {
        switch zoomed {
        case true:
            zoomed = false
        default:
            zoomed = true
        }
    }
}
