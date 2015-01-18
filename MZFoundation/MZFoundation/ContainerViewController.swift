//
//  ContainerViewController.swift
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/15/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

import Foundation


public class ContainerViewController : UIViewController {
    @IBOutlet weak var childView : UIView?
    @IBOutlet weak var menuViewController : UIViewController?
    @IBOutlet weak var contentViewController : UIViewController!
    @IBOutlet weak var screenViewController : UIViewController?
    
    public init(contentViewController viewController:UIViewController!) {
        super.init()
        self.contentViewController = viewController
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    public override func viewDidLoad() {
        self.view.backgroundColor = UIColor.redColor()
        
        var menuVC = UIViewController()
        menuVC.view.backgroundColor = UIColor.blueColor()
        self.menuViewController = menuVC
        
        var contentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController") as UIViewController
        self.contentViewController = contentVC
        self.view.addSubview(self.contentViewController.view)
        
        var screenVC = UIViewController()
        menuVC.view.backgroundColor = UIColor.greenColor()
        self.screenViewController = screenVC
        
        self.addChildViewController(self.menuViewController!)
        self.addChildViewController(self.contentViewController!)
        self.addChildViewController(self.screenViewController!)

        
        var tap = UITapGestureRecognizer(target: self, action: "tap:")
        self.contentViewController.view.addGestureRecognizer(tap)

        
        var drag = UIPanGestureRecognizer(target: self, action: "drag:")
        self.contentViewController.view.addGestureRecognizer(drag)
        
    }
    func tap() {
        NSLog("タップ");
    }
    func tap(sender: UITapGestureRecognizer) {
        var location = sender.locationInView(self.view)
        NSLog("タップ x:\(location.x), y:\(location.y)");
    }
    func drag(sender: UIPanGestureRecognizer) {
        var location = sender.translationInView(self.view)
        NSLog("ドラッグ x:\(location.x), y:\(location.y)");
        
        var frame = self.contentViewController.view.frame
//        frame.origin.x = location.x
        frame.origin.y = location.y
        self.contentViewController.view.frame = frame
        var scale = max((frame.size.height - frame.origin.y*0.5)/frame.size.height, 0.2)
        
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        
        self.contentViewController.view.transform = scaleTransform
    }
}