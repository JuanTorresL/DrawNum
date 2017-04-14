//
//  DrawView.swift
//  DrawNum
//
//  Created by Carlos Rogelio Villanueva Ousset on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    private struct Geometry {
        static let brushWidth: CGFloat = 20
    }
    
    private struct Color {
        static let brush = UIColor.blue
    }
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    private var lastPoint = CGPoint.zero
    private var swiped = false


}
