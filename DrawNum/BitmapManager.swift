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
    let maximumMatchDistance: Double?

    fileprivate(set) var bitmaps: [Bitmap] = []
    
    init(pixelCount: Int, maximumMatchDistance: Double? = nil) {
        self.pixelCount = pixelCount
        self.maximumMatchDistance = maximumMatchDistance
    }
    
    func searchBitmap(_ bitmap: Bitmap) -> String? {
        // sort bitmaps by distance (ascendant order)
        let sortedBitmaps = bitmaps.sorted { (lhs, rhs) -> Bool in
            guard let lhsDist = lhs.distance(other: bitmap) else { return false }
            guard let rhsDist = rhs.distance(other: bitmap) else { return true }
            return lhsDist < rhsDist
        }
        
        guard let closestBitmap = sortedBitmaps.first else { return nil } // no bitmaps

        // if max dist available, check if max distance requirement is met
        if let maxDist = maximumMatchDistance {
            guard let dist = closestBitmap.distance(other: bitmap), dist <= maxDist
                else { return nil }
            print("Closest Bitmap distance: \(dist)")
        }
        
        return closestBitmap.name
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
