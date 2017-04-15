//
//  BitmapManager.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import Foundation

class BitmapManager {
    
    let pixelCount: Int

    fileprivate(set) var bitmaps: [Bitmap] = []
    
    init(pixelCount: Int) {
        self.pixelCount = pixelCount
    }
    
    func searchBitmap(_ bitmap: Bitmap) -> String? {
        
        return nil
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
        return bitmap.pixelCount == pixelCount
    }
}
