//
//  AnnotationViewController.swift
//  Gecco
//
//  Created by yukiasai on 2016/01/19.
//  Copyright (c) 2016 yukiasai. All rights reserved.
//

import UIKit

class AnnotationViewController: SpotlightViewController {
    
    @IBOutlet var annotationViews: [UIView]!
    
    var targetOval: UILabel! = nil
    var targetRect: UILabel! = nil
    var targetRounded: UILabel! = nil
    
    var stepIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        next(false)
    }
    
    func next(animated: Bool) {
        let screenSize = UIScreen.mainScreen().bounds.size
        switch stepIndex {
        case 0:
            spotlight = Spotlight(shape: .Oval(center: CGPointMake(screenSize.width - 26, 42), width: 50))
        case 1:
            spotlightView.move(Spotlight(shape: .Oval(center: CGPointMake(screenSize.width - 75, 42), width: 50)))
        case 2:
            spotlightView.move(Spotlight(shape: .RoundedRect(center: CGPointMake(screenSize.width / 2, 42), size: CGSizeMake(120, 40), radius: 6)), moveType: .Disappear)
        case 3:
            spotlightView.move(Spotlight(shape: .Oval(center: CGPointMake(screenSize.width / 2, 200), width: 220)), moveType: .Disappear)
        case 4:
            spotlightView.move(Spotlight(shape: .OvalWV(center: targetOval, margin: 5)), moveType: .Disappear)
        case 5:
            spotlightView.move(Spotlight(shape: .RectWV(center: targetRect, margin: 10)), moveType: .Disappear)
        case 6:
            spotlightView.move(Spotlight(shape: .RoundedRectWV(center: targetRounded, radius: 10, margin: 10)), moveType: .Disappear)
        case 7:
            dismissViewControllerAnimated(animated, completion: nil)
        default:
            break
        }
        updateAnnotationView(animated)
        
        stepIndex++
    }
    
    func updateAnnotationView(animated: Bool) {
        annotationViews.enumerate().forEach { index, view in
            UIView .animateWithDuration(animated ? 0.25 : 0) {
                view.alpha = index == self.stepIndex ? 1 : 0
            }
        }
    }
}

extension AnnotationViewController: SpotlightViewControllerDelegate {
    func spotlightViewControllerTapped(viewController: SpotlightViewController, isInsideSpotlight: Bool) {
        next(true)
    }
}