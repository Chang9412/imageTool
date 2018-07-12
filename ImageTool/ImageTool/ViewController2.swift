//
//  ViewController2.swift
//  ImageTool
//
//  Created by zzq on 2018/7/6.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var imv2: UIImageView!
    @IBOutlet weak var imv3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imv.image = UIImage.color(UIColor.cyan)
        
        let locations: [CGFloat] = [0.1, 0.4, 0.5, 0.8, 1.0];
        let colors = [UIColor.random, UIColor.random, UIColor.random, UIColor.random, UIColor.random]
        
        imv2.image = UIImage.gradientColor(colors, locations: locations, start: CGPoint(x: 0, y: 0), end: CGPoint(x: imv2.bounds.size.width, y: imv2.bounds.size.height))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
class ViewController3: UIViewController {
    
    @IBOutlet weak var imv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let img = UIImage(named: "对号2")
        imv.image = img?.zq_resizeImage(size: imv.bounds.size)
        
        let path = NSHomeDirectory()+"/tmp/对号.png"
        do {
            try UIImagePNGRepresentation(imv.image!)!.write(to: URL(fileURLWithPath: path))
        } catch  {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
class ViewController4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let image = UIImage(named: "bg")
        
        self.clipImage(hCount: 10, vCount: 15, image: image!, imvWidth: UIScreen.main.bounds.width/12)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func clipImage(hCount: Int, vCount: Int, image: UIImage, imvWidth: CGFloat) {
        print("imageScale: \(image.scale)")
        let w = image.size.width*image.scale
        let h = image.size.height*image.scale
        
        let itemW = w/CGFloat(hCount)
        let itemH = h/CGFloat(vCount)
        let space: CGFloat = 2
        
        var offsetX: CGFloat = 0
        var offsetY: CGFloat = 0
        
        
        let imageViewWidth: CGFloat = imvWidth
        let scale = imageViewWidth/itemW
        let imageViewHeight: CGFloat = scale*itemH
        
        var imageViewOffsetX: CGFloat = space
        var imageViewOffsetY: CGFloat = space+64
        
        for i in 0..<hCount*vCount {
            
            
            let img = image.clip(rect: CGRect(x: offsetX, y: offsetY, width: itemW, height: itemH))
            let imv = UIImageView(frame: CGRect(x: imageViewOffsetX, y: imageViewOffsetY, width: imageViewWidth, height: imageViewHeight))
            imv.image = img
            self.view.addSubview(imv)
            
            if i%hCount == hCount-1 {
                offsetX = 0
                offsetY += itemH
                
                imageViewOffsetX = space
                imageViewOffsetY = space + imageViewHeight + imageViewOffsetY
            }else {
                offsetX += itemW
                imageViewOffsetX = imageViewOffsetX+imageViewWidth+space
            }
            
        }
        
    }
    
    
    
}
class ViewController5: UIViewController {
    
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var imv2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let img = UIImage(named: "veer")!
        imv.contentMode = .scaleAspectFit
        imv.image = img.cornerRadius(100)
        
        
        let path = UIBezierPath(arcCenter: CGPoint(x: img.size.width/2, y: img.size.height/2), radius: min(img.size.width/2, img.size.height/2)-10, startAngle: 0, endAngle: .pi*2, clockwise: true)
        imv2.contentMode = .scaleAspectFit
        imv2.image = img.clip(path: path, borderWidth: 10, borderColor: UIColor.purple)
        let path2 = NSHomeDirectory()+"/tmp/圆角.jpg"
        do {
            try UIImageJPEGRepresentation(imv2.image!, 1)!.write(to: URL(fileURLWithPath: path2))
        } catch  {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
class ViewController6: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let img = UIImage(named: "bb")!
      
        let imv = UIImageView(frame: CGRect(x: 100, y: 100, width: img.size.width/2, height: img.size.height/2))
        self.view.addSubview(imv)
        imv.image = img
        
        let imv2 = UIImageView(frame: CGRect(x: 50, y: 300, width: 200, height: 280))
        self.view.addSubview(imv2)
        imv2.image = UIImage.zq_resizeImage(named: "bb")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of
    }
}
class ViewController7: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let path2 = NSHomeDirectory()+"/tmp/圆角.jpg"
        let img = UIImage(named: path2)!
        
        let imv = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height:  150))
        self.view.addSubview(imv)
        imv.image = img.tined(color: UIColor.cyan, fraction: 0.3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of
    }
}
class ViewController8: UIViewController {
    
    @IBOutlet weak var imv1: UIImageView!
    @IBOutlet weak var imv2: UIImageView!
    @IBOutlet weak var imv3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let m1 = UIImage(named: "1")
        let m2 = UIImage(named: "2")
        let m3 = UIImage(named: "3")
        let m4 = UIImage(named: "4")
        let m5 = UIImage(named: "5")
        let m6 = UIImage(named: "6")
        let m7 = UIImage(named: "7")
        let m8 = UIImage(named: "8")
        let m9 = UIImage(named: "9")
        
        let imgs1 = [m1!,m2!]
        let rm1 = UIImage.creat(images: imgs1)
        imv1.image = rm1
        
//        let imgs2 = [m1!,m2!, m3, m4]
//        let rm2 = UIImage.creat(images: imgs2)
//        imv2.image = rm2
//
//
//        let imgs3 = [m1!,m2!, m3, m4, m5, m6]
//        let rm3 = UIImage.creat(images: imgs3)
//        imv3.image = rm3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of
    }
}
