//
//  ViewController.swift
//  ImageTool
//
//  Created by zzq on 2018/7/6.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let img = UIImage.gradientColor([UIColor.random, UIColor.random, UIColor.random], locations: [0,0.5,1], start: CGPoint(x: 0, y: 0), end: CGPoint(x: 100, y: 0))
        
        let img1 = img.clip(path: UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 10))
        
        let path = NSHomeDirectory()+"/tmp/bb.png"
        do {
            try UIImagePNGRepresentation(img1)!.write(to: URL(fileURLWithPath: path))
        } catch  {
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

