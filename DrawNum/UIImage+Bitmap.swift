//
//  UIImage+Bitmap.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import UIKit

// MARK: Helper methods

extension UIImage {
    
    func bitmap(name: String) -> Bitmap? {
        // 1. Get pixels of image
        guard let inputCGImage = self.cgImage else { return nil }
        let width = inputCGImage.width
        let height = inputCGImage.height
        
        let bytesPerPixel: Int = 4
        let bytesPerRow: Int = bytesPerPixel * width
        let bitsPerComponent = 8
        
        var pixels = [UInt32](repeating: 0, count: width * height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue
        let context = CGContext(data: &pixels, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
        
        context?.draw(inputCGImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // 2. Iterate and log
        var grid = [[Double]]()
        var currentPixel = 0
        
        for row in 0..<height {
            grid.append([]) // new row
            
            for _ in 0..<width {
                
                let color = pixels[currentPixel]
                let r = red(color)
                let g = green(color)
                let b = blue(color)
                let brightness = Double(r+g+b) / 3.0
                
                grid[row].append(brightness)
                
                currentPixel += 1
            }
        }
        
        return Bitmap(name: name, map: grid)
    }
    
    // MARK: Bitmask helper methods
    
    private func mask8(_ x: UInt32) -> UInt32 {
        return (x) & 0xFF
    }
    
    private func red(_ r: UInt32) -> UInt32 {
        return mask8(r)
    }
    
    private func green(_ g: UInt32) -> UInt32 {
        return mask8(g >> 8)
    }
    
    private func blue(_ b: UInt32) -> UInt32 {
        return mask8(b >> 16)
    }
    
}

