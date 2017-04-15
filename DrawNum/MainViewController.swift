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
    @IBOutlet weak var matchLabel: UILabel!
    
    fileprivate var bitmapManager: BitmapManager!
    fileprivate var lastBitmap: Bitmap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDrawView()
        setupBitmapManager()
    }
    
    // MARK: Setup
    
    private func setupDrawView() {
        drawView.delegate = self
    }
    
    private func setupBitmapManager() {
        let pixelCount = drawView.downsizedWidth * drawView.downsizedHeight
        bitmapManager = BitmapManager(pixelCount: pixelCount, maximumMatchDistance: 999999999999.0)
    }

    // MARK: User Interaction
    
    @IBAction func correct() {
        guard let bitmap = lastBitmap, bitmap.name != nil else { return }
        // bitmap should include the name match found
        save(bitmap: bitmap)
    }
    
    // save current image bitmap with input name
    @IBAction func save() {
        guard let bitmap = lastBitmap else { return }
        
        guard let name = nameTextField.text, name.characters.count == 1
            else { return } // one character at a time

        bitmap.name = name
        save(bitmap: bitmap)
    }
    
    @IBAction func clear() {
        clearUI()
    }
    
    @IBAction func write() {
        guard let text = nameTextField.text, text.characters.count == 1 else { return }
        
        drawView.drawText(text)
    }
    
    // MARK: Helper methods
    
    fileprivate func save(bitmap: Bitmap) {
        bitmapManager.saveBitmap(bitmap)
        clearUI()
    }

    fileprivate func processBitmap(_ bitmap: Bitmap) {
        let nameMatch = bitmapManager.searchBitmap(bitmap)
        matchLabel.text = nameMatch
        
        bitmap.name = nameMatch
        lastBitmap = bitmap
    }
    
    fileprivate func clearUI() {
        nameTextField.text = ""
        matchLabel.text = ""
        drawView.reset()
        lastBitmap = nil
        nameTextField.resignFirstResponder()
    }
}

extension ViewController: DrawViewDelegate {
    func didFinishDrawing(image: UIImage?) {
        guard let bitmap = image?.bitmap(name: nil) else {
            clear()
            return
        }
        processBitmap(bitmap)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
}
