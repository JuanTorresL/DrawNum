//
//  Bitmap.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import Foundation

class Bitmap {
    
    let name: String
    let map: [Double]
    
    init?(name: String, map: [Double]) {
        guard map.count > 0 else { return nil }

        self.name = name
        self.map = map
    }
    
    var pixelCount: Int {
        return map.count
    }

}
