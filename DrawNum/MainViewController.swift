//
//  ViewController.swift
//  DrawNum
//
//  Created by Juan Torres & Carlos Villanueva on 4/14/17.
//  Copyright © 2017 SistemasInteligentes-ITESM-JCTorres-CVillanueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var nameTextField: UITextField!
    
    private var bitmapManager: BitmapManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bitmapManagerSetup()
    }
    
    // MARK: Setup
    
    private func bitmapManagerSetup() {
        let pixelCount = drawView.downsizedWidth * drawView.downsizedHeight
        bitmapManager = BitmapManager(pixelCount: pixelCount)
    }

    // MARK: User Interaction
    
    @IBAction func search() {
        
    }
    
    @IBAction func save() {
        guard let image = drawView.getImage() else { return }
        guard let name = nameTextField.text, name.characters.count == 1 else { return }
        guard let bitmap = image.bitmap(name: name) else { return }
        
        bitmapManager.saveBitmap(bitmap)
        nameTextField.text = ""
        drawView.reset()
    }
    
    @IBAction func reset() {
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
}
