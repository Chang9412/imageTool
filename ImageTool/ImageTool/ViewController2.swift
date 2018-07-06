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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imv.image = UIImage.color(UIColor.cyan)
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
