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
        //abreview
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        mainView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        
        let cardView = UIView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.2))
        cardView.backgroundColor = .white
        
        self.view.addSubview(mainView)
        self.view.addSubview(cardView)
        
        UIView.animate(withDuration: 1.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
                    cardView.frame = CGRect(x: 0, y: self.view.frame.height - cardView.frame.height, width: self.view.frame.width, height: self.view.frame.height * 0.2)
                }, completion: nil)
            }
        })

    }
}

