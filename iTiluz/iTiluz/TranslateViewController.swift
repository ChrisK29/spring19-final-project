//
//  FirstViewController.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/12/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var userText: UITextView!
    
    @IBOutlet weak var translatedText: UITextView!
    
    @IBAction func translateButton(_ sender: Any) {
        var textToTranslate = userText.text
        
        textToTranslate = textToTranslate?.uppercased()
        
        translatedText.text = textToTranslate
    }
    
    @IBOutlet weak var copyButton: UIButton!
    
    @IBAction func touchCopyButton(_ sender: Any) {
        let textToCopy = translatedText.text
        let pasteboard = UIPasteboard.general
        pasteboard.string = textToCopy
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeButton(buttonName: copyButton)
    }
    
    func customizeButton(buttonName: UIButton) {
        let origImage = UIImage(named: "copyButton");
        let tintedImage = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        buttonName.setImage(tintedImage, for: .normal)
        buttonName.tintColor = UIColor.white
    }
}

// MARK: - Color Helper
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

