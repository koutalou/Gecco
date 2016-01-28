//
//  ViewController.swift
//  GeccoExample
//
//  Created by yukiasai on 2016/01/15.
//  Copyright (c) 2016 yukiasai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ovalLabel: UILabel!
    @IBOutlet weak var rectLabel: UILabel!
    @IBOutlet weak var roundedLabel: UILabel!
    
    var annotationViewController: AnnotationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        presentAnnotation()
    }
    
    func presentAnnotation() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Annotation") as! AnnotationViewController
        viewController.alpha = 0.5
        viewController.targetOval = ovalLabel
        viewController.targetRect = rectLabel
        viewController.targetRounded = roundedLabel
        presentViewController(viewController, animated: true, completion: nil)
        annotationViewController = viewController
    }
}


