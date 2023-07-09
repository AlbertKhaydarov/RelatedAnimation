//
//  ViewController.swift
//  Task 3 v2
//
//  Created by Альберт Хайдаров on 09.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let boxView = UIView(frame: CGRect(x: 16, y: 0, width: 50, height: 50))
    let slider = UISlider()
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear, animations: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.backgroundColor = UIColor.red
        boxView.frame.origin.y = view.safeAreaInsets.top + 120
        boxView.layer.cornerRadius = 8
        
        view.addSubview(boxView)
        
        animator.addAnimations {
            self.view.backgroundColor = .darkGray
            self.boxView.center.x = self.view.frame.width - self.boxView.frame.width - 8
            
            self.boxView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2).scaledBy(x: 1.5, y: 1.5)
        }
        
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.layoutMargins = UIEdgeInsets(
            top: 0,
            left: 40,
            bottom: 0,
            right: 0)
        
        slider.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200).isActive = true
        
        
        slider.addAction(UIAction(handler: { [weak self] _ in
            
            self?.animator.fractionComplete = CGFloat((self?.slider.value)!)
        }), for: .valueChanged)
        
        slider.addAction(UIAction(handler: { [weak self] _ in
            self?.animator.startAnimation()
            self?.slider.setValue(1, animated: true)
            
        }), for: [.touchUpInside, .touchUpOutside])
        
        animator.pausesOnCompletion = true
    }
}


