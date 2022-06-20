//
//  ViewController.swift
//  Fade-in-out-Swift
//
//  Created by Luccas Santana Marinho on 20/06/22.
//

import UIKit

class ViewController: UIViewController {

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
        img.image = UIImage(named: "pato")
        return img
    }()
    
    func fadeInOut() {
        UIView.animate(withDuration: 0.6, animations: {
            self.image.alpha = 1
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
