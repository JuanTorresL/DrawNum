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
    @IBOutlet weak var resultLabel: UILabel!
    
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
        guard let bitmap = drawView.getImage()?.bitmap(name: nil) else { return }

        if let match = bitmapManager.searchBitmap(bitmap) {
            resultLabel.text = match
        }
        // TODO: ask to save?
    }
    
    @IBAction func save() {
        guard let name = nameTextField.text, name.characters.count == 1 else { return }
        guard let image = drawView.getImage() else { return }
        guard let bitmap = image.bitmap(name: name) else { return }
        
        bitmapManager.saveBitmap(bitmap)
        clear()
    }
    
    @IBAction func clear() {
        nameTextField.text = ""
        resultLabel.text = ""
        drawView.reset()
    }
    
    @IBAction func resetData() {
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
}
