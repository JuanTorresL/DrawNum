//
//  BitmapManager.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import Foundation

class BitmapManager {
    
    let mapWidth: Int
    let mapHeight: Int
    
    fileprivate(set) var bitmaps: [Bitmap] = []
    
    init(mapWidth: Int, mapHeight: Int) {
        self.mapWidth = mapWidth
        self.mapHeight = mapHeight
    }
    
    func saveBitmap(_ bitmap: Bitmap) {
        guard isValidBitmap(bitmap) else { return }
        
        bitmaps.append(bitmap)
        
        // TODO: save in core date
    }
    
    func reset() {
        bitmaps.removeAll()
    }
    
    private func isValidBitmap(_ bitmap: Bitmap) -> Bool {
        return bitmap.width == self.mapWidth && bitmap.height == self.mapHeight
    }
}
