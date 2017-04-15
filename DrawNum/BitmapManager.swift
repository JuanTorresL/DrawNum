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
        let sortedBitmaps = bitmaps.sorted { (lhs, rhs) -> Bool in
            guard let lhsDist = lhs.distance(other: bitmap) else { return false }
            guard let rhsDist = rhs.distance(other: bitmap) else { return true }
            return lhsDist < rhsDist
        }
        
        // TODO: check if best match's distance is lower than minimum required
        return sortedBitmaps.first?.name
    }
    
    func saveBitmap(_ bitmap: Bitmap) {
        guard isValidBitmap(bitmap) else { return }
        
        bitmaps.append(bitmap)
        
        // TODO: save in core date
    }
    
    func resetData() {
        bitmaps.removeAll()
    }
    
    private func isValidBitmap(_ bitmap: Bitmap) -> Bool {
        guard bitmap.name != nil else { return false }
        return bitmap.pixelCount == pixelCount
    }
}
