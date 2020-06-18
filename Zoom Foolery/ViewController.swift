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
    
//    let coffeeImage = UIImage(named: "coffee")
    
    lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        let coffeeImage = UIImage(named: "coffee")
        imageView.contentMode = .scaleAspectFill
        imageView.image = coffeeImage
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
        //        imageZoomed.alpha = 0.0
        
        //        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(zoom))
        //        gestureRecognizer.numberOfTapsRequired = 1
        //        view.addGestureRecognizer(gestureRecognizer)
    }
    
    func loadImage() {
        view.addSubview(coffeeImageView)
        
        
        
//        let w = coffeeImageView.image!.size.width
//        let h = coffeeImageView.image!.size.height
        
        
        
        NSLayoutConstraint.activate([
//            coffeeImageView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
//            coffeeImageView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
//            coffeeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coffeeImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            coffeeImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            coffeeImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        let w = view.frame.width
        let h = view.frame.height
        
        coffeeImageView.backgroundColor = .brown
        coffeeImageView.frame = CGRect(x: 0, y: 0, width: w, height: h)
        
        print("#loaded image")
        
    }
    
    @objc func zoom(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            
            switch zoomed {
            case false:
                // zoom in
                
                imageZoomed.transform = view.transform.scaledBy(x: 0.1, y: 0.1)
                
                UIView.animate(withDuration: 1.5) {
                    self.imageZoomed.alpha = 1.0
                    self.imageZoomed.transform = CGAffineTransform.identity
                }
                
            default:
                // zoom out
                
                UIView.animate(withDuration: 1.5) {
                    self.imageZoomed.alpha = 0.0
                    self.imageZoomed.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                }
            }
            
            toggleZoom()
        }
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

