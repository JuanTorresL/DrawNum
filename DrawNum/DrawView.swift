//
//  DrawView.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import UIKit
import SnapKit

class DrawView: UIView {
    
    private struct Geometry {
        static let brushWidth: CGFloat = 20
    }
    
    private struct Color {
        static let brush = UIColor.blue
    }
    
    private var mainImageView = UIImageView()
    private var tempImageView = UIImageView()
    
    private var lastPoint = CGPoint.zero
    private var swiped = false
    
    
    /* Initialization */

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialSetup()
    }
    
    private func initialSetup() {
        addSubview(mainImageView)
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(tempImageView)
        tempImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    
    /* Drawing */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            drawLine(from: lastPoint, to: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw single point
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        // Merge tempImageView into mainImageView
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        tempImageView.image = nil
    }
    
    private func drawLine(from: CGPoint, to: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        // 2
        context?.move(to: from)
        context?.addLine(to: to)

        // 3
        context?.setLineCap(.round)
        context?.setLineWidth(Geometry.brushWidth)
        context?.setStrokeColor(Color.brush.cgColor)
        context?.setBlendMode(.normal)

        // 4
        context?.strokePath()

        // 5
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
}



























