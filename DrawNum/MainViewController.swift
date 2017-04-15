//
//  ViewController.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private struct ImageConfig {
        static let downscaleRelativeSize: CGFloat = 0.10
    }

    @IBOutlet weak var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func printMatrix(_ sender: Any) {
        guard let image = drawView.getResizedImage(relativeSize: ImageConfig.downscaleRelativeSize) else { return }
        
        drawView.mainImageView.image = image
    }
    

}

