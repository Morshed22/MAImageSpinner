//
//  SpinnerImageView.swift
//  SpinnerDemo
//
//  Created by Morshed Alam on 28/1/18.
//  Copyright © 2018 Morshed Alam. All rights reserved.
//

import UIKit

class SpinnerImageView: UIImageView, SpinningAnimatorProtocol,CAAnimationDelegate {
    
    open var equalSlices:Bool = false
    
    open var slices:[Int] = []{
        didSet{
           setTheSliceDegree()
        }
    }
    
    
    lazy private var animator:SpinningImageAnimator = SpinningImageAnimator(withObjectToAnimate: self)
    private(set) var sliceDegree:CGFloat?

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    

    
    func setTheSliceDegree(){
        assert(sliceInfoIsValid(), "All slices must have a 360 degree combined. Set equalSlices true if you want to distribute them evenly.")
        if equalSlices {
            sliceDegree = 360.0 / CGFloat(slices.count)
        }
        
    }
    
    func sliceInfoIsValid() -> Bool {
        if equalSlices{ return true }
        return false
       
    }
    
    internal var layerToAnimate: CALayer {
        return self.layer
    }
    
    
    open func startAnimating(rotationCompletionOffset:CGFloat = 0.0, _ completion:((Bool) -> Void)?) {
        self.stopAnimating()
        self.animator.addRotationAnimation(completionBlock: completion,rotationOffset:rotationCompletionOffset)
    }
    
    open func startAnimating(fininshIndex:Int = 0, _ completion:((Bool) -> Void)?) {
        let rotation = 360.0 - computeRadian(from: fininshIndex)
        self.startAnimating(rotationCompletionOffset: rotation, completion)
    }
    
  open override func startAnimating() {
        self.animator.addIndefiniteRotationAnimation()
    }
    
  open override func stopAnimating() {
        self.animator.removeAllAnimations()
    }
    
    open func startAnimating(fininshIndex:Int = 0, offset:CGFloat, _ completion:((Bool) -> Void)?) {
        let rotation = 360.0 - computeRadian(from: fininshIndex) + offset
        self.startAnimating(rotationCompletionOffset: rotation, completion)
    }
    
    private func computeRadian(from finishIndex:Int) -> CGFloat {
        if equalSlices {
            return CGFloat(finishIndex) * sliceDegree!
        }
        return 0.0
        //return slices.enumerated().filter({ $0.offset < finishIndex}).reduce(0.0, { $0 + $1.element.degree })
    }
    
    
    

}

