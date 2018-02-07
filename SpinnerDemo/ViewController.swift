//
//  ViewController.swift
//  SpinnerDemo
//
//  Created by Morshed Alam on 28/1/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   let slices = Array(repeating: 0, count: 8)
   static var i = 0
   
    @IBOutlet weak var SpinnerImageView: SpinnerImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SpinnerImageView.equalSlices = true
        SpinnerImageView.slices = slices
        
        let displaylink = CADisplayLink(target: self,selector: #selector(step))
        displaylink.add(to: .current, forMode: .defaultRunLoopMode)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }

    @objc func step(displaylink: CADisplayLink) {
//        print(SpinnerImageView.layerToAnimate.zPosition)
        
    }

    
    @IBAction func Rotate(_ sender: UIButton) {
       // SpinnerImageView.startAnimating()
       // DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.SpinnerImageView.startAnimating(fininshIndex: 7, offset: CGFloat(-(360/self.slices.count)/2), { (finished) in
                print(finished)
            })
               
            }
       // }
    
    
}

