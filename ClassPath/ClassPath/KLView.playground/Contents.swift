//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class view: UIView {
    override func drawRect(rect: CGRect) {
        UIColor.clearColor().setFill()
        
        let path = UIBezierPath(rect: self.bounds)
        
        path.fill()
    }
}

let view1 = view(frame: CGRectMake(0, 0, 200, 200))


class klView: UIView {
    override func drawRect(rect: CGRect) {
        let pathRect = CGRectInset(self.bounds, 10, 10)
        
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 20)
        
        path.lineWidth = 10
        
        UIColor.blueColor().setFill()
        UIColor.redColor().setStroke()
        
        path.fill()
        path.stroke()
    }
}

let view2 = klView(frame: CGRectMake(0, 0, 300, 300))



class lineView: UIView {
    override func drawRect(rect: CGRect) {
        let bezierPath = UIBezierPath()
        
        let rect = CGRectInset(self.bounds, self.bounds.size.width * 0.05, self.bounds.size.height * 0.05)
        let topLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        let topRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))
        let bottomRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))
        let bottomLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
        let bottomCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        bezierPath.moveToPoint(topLeft)
        bezierPath.addLineToPoint(topRight)
        
        bezierPath.addLineToPoint(bottomRight)
        bezierPath.addCurveToPoint(bottomLeft, controlPoint1: bottomCenter, controlPoint2: bottomCenter)
        
        bezierPath.closePath()
        
        UIColor.orangeColor().setFill()
        bezierPath.fill()
        
        
    }
}



let lineView1 = lineView(frame: CGRectMake(0, 0, 300, 300))


class viewS: UIView {
    
    
    override func drawRect(rect: CGRect) {
        let bezierPath = UIBezierPath()
        let squareRect = CGRectInset(rect, rect.size.width * 0.45, rect.size.height * 0.05)
        let circleRect = CGRectInset(rect, rect.size.width * 0.1, rect.size.height * 0.1)
        
        let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: 10)
        bezierPath.appendPath(squarePath)
        UIColor.grayColor().setFill()
        bezierPath.fill()
        
        let circlePath = UIBezierPath(ovalInRect: circleRect)
        bezierPath.appendPath(circlePath)
        UIColor.redColor().setFill()
        bezierPath.fill()
    }
}


let viewTwo = viewS(frame: CGRectMake(0, 0, 300, 300))





