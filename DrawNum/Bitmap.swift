//
//  Bitmap.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import Foundation
import Accelerate

class Bitmap {
    
    var name: String?
    let map: [Double]
    
    init?(map: [Double], name: String?) {
        guard map.count > 0 else { return nil }

        self.name = name
        self.map = map
    }
    
    var pixelCount: Int {
        return map.count
    }
}

extension Bitmap {
    func distance(other: Bitmap) -> Double? {
        guard map.count == other.map.count else { return nil }
        
        let x = map
        let y = other.map
        
        // Euclidean distance
        var xMinusY = [Double](repeating: 0, count: x.count)
        vDSP_vsubD(x, 1, y, 1, &xMinusY, 1, vDSP_Length(x.count))
        
        let xMinusY_Squared = xMinusY.map { return $0 * $0 }
        
        let sumOf_xMinusY_Squared = xMinusY_Squared.reduce(0, +)
        
        let distance = sqrt(sumOf_xMinusY_Squared)
        
        return distance
    }
}
