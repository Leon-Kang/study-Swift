//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class View: UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let rect = CGRectInset(rect, rect.size.width * 0.1, rect.size.height * 0.1)
        
        let rectPath = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        
        let shadow = UIColor.whiteColor().CGColor
        let shadowOffset = CGSize(width: 5, height: 5)
        
        let shadowBlurRadius: CGFloat = 5.0
        
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow)
        
        UIColor.greenColor().setFill()
        rectPath.fill()
    }
    
    
}

let view = View(frame: CGRectMake(0, 0, 500, 500))



class klView: UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let gradientStartColor = UIColor(red: 0.1, green: 0.1, blue: 0.8, alpha: 1)
        let gradientEndColor = UIColor(red: 1, green: 0.6, blue: 0.8, alpha: 1)
        
        let gradientColors: CFArray = [gradientStartColor.CGColor, gradientEndColor.CGColor]
        let gradientLocations:[CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(colorSpace, gradientColors, gradientLocations)
        
        let pathRect = CGRectInset(self.bounds, 20, 20)
        
        let topPoint = CGPointMake(self.bounds.size.width/2, 20)
        
        let bottomPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - 20)
        
        let roundedRectPath = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        
        CGContextSaveGState(context)
        
        roundedRectPath.addClip()
        
        CGContextDrawLinearGradient(context, gradient, topPoint, bottomPoint, .DrawsAfterEndLocation)
        
        CGContextRestoreGState(context)
    }
}

let viewJ = klView(frame: CGRectMake(0, 0, 300, 300))


class rotation: UIView {
    override func drawRect(rect: CGRect) {
        let pathRect = CGRectInset(self.bounds, 0, 0)
        
        let rotationTransform = CGAffineTransformMakeRotation(CGFloat(M_PI_4)*0.3)
        
        let rectPath = UIBezierPath(roundedRect: pathRect, cornerRadius: 15.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(context)
        
        CGContextConcatCTM(context, rotationTransform)
        
        UIColor.redColor().setFill()
        rectPath.fill()
        
        CGContextRestoreGState(context)
        
    }
}



let viewRp = rotation(frame: CGRectMake(0, 0, 300, 300))















