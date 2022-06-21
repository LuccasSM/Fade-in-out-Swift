//
//  ViewController.swift
//  Fade-in-out-Swift
//
//  Created by Luccas Santana Marinho on 20/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var imagesArray: [UIImage?] = [
        UIImage(named: "pato"),
        UIImage(named: "tigre"),
        UIImage(named: "gaviao"),
        UIImage(named: "borboleta"),
        UIImage(named: "joaninha"),
    ]
    var sequencesNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        
        self.view.addSubview(image)
        
        fadeInOut()
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    func fadeInOut() {
        UIView.animate(withDuration: 0.6, animations: {
            self.image.alpha = 1
            
            if self.sequencesNumber == self.imagesArray.count {
                self.sequencesNumber = 0
            }
            self.image.image = self.imagesArray[self.sequencesNumber]
            self.sequencesNumber += 1
            
        }, completion: {
            (completed: Bool) -> Void in
            UIView.animate(withDuration: 0.6, delay: 0.6, options: UIView.AnimationOptions.curveLinear,
                           animations: {
                self.image.alpha = 0
            }, completion: {
                (completed: Bool) -> Void in
                self.fadeInOut()
            })
        })
    }
}
