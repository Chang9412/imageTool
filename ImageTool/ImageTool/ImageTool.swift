//
//  ImageTool.swift
//  ImageTool
//
//  Created by zzq on 2018/7/6.
//  Copyright © 2018年 zzq. All rights reserved.
//

import UIKit

extension UIImage {
    // 颜色生成图片
    class func color(_ color: UIColor) -> UIImage{
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, UIScreen.main.scale)
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(color.cgColor)
        ctx?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    // 按照图片比例，
    func zq_resizeImage(size: CGSize) -> UIImage {
        
        let w = size.width*UIScreen.main.scale
        let h = size.height*UIScreen.main.scale
        
        let scale = min(w/self.size.width, h/self.size.height)
        let newW = self.size.width*scale
        let newH = self.size.width*scale
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: w, height: h), false, 0) // true 不透明
        self.draw(in: CGRect(x: (w-newW)/2, y: (h-newH)/2, width: newW, height: newH))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    // 指定裁剪尺寸
    func clip(rect: CGRect) -> UIImage {
        let sources = self.cgImage
        let newSources = sources!.cropping(to: rect)
        let image = UIImage(cgImage: newSources!)
        return image
    }
    
    // 圆角
    func cornerRadius(_ radius: CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
        
        ctx?.addPath(path.cgPath)
        ctx?.clip()
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func clip(path: UIBezierPath) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        ctx?.addPath(path.cgPath)
        ctx?.clip()
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func clip(path: UIBezierPath, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
        
//        UIGraphicsBeginImageContext(CGSize(width: self.size.width+borderWidth*2, height: self.size.height+borderWidth*2))
        UIGraphicsBeginImageContext(self.size)
        let ctx: CGContext? = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        
        ctx?.addPath(path.cgPath)
        ctx?.clip()
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()

        
        UIGraphicsEndImageContext()
        
        
        UIGraphicsBeginImageContext(self.size)
        let ctx2: CGContext? = UIGraphicsGetCurrentContext()

        image!.draw(in: CGRect(x: (rect.size.width-image!.size.width)/2, y: (rect.size.height-image!.size.height)/2, width: image!.size.width, height: image!.size.height))
        ctx2?.addPath(path.cgPath)
        ctx2?.setLineWidth(borderWidth)
        ctx2?.setStrokeColor(borderColor.cgColor)
        ctx2?.strokePath()
        let image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image2!
    }
}
