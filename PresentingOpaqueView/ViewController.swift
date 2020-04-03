//
//  ViewController.swift
//  PresentingOpaqueView
//
//  Created by Haroldo on 03/04/20.
//  Copyright © 2020 Haroldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tapHereButton: UIButton! {
        didSet {
            self.tapHereButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @objc func buttonDidTap() {
        // Main View
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        mainView.backgroundColor = UIColor.gray
        mainView.alpha = 0.0
        
        // Card View
        let cardView = UIView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.2))
        cardView.backgroundColor = .white
        
        // Add views to view mother
        self.view.addSubview(mainView)
        self.view.addSubview(cardView)
        
        // Animate all
        UIView.animate(withDuration: 1.3, animations: {
            mainView.alpha = 0.7
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
                    cardView.frame = CGRect(x: 0, y: self.view.frame.height - cardView.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.2)
                }, completion: nil)
            }
        })
    }
}

