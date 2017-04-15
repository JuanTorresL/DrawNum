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
    let map: [[Double]]
    
    init?(name: String, map: [[Double]]) {
        guard map.count > 0 else { return nil }
        guard map.first!.count == map.count else { return nil }
        
        self.name = name
        self.map = map
    }
    
    var width: Int {
        guard map.count > 0 else { return 0 }
        
        return map.first!.count
    }
    
    var height: Int {
        return map.count
    }
}
