//
//  FirstViewController.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/12/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class TranslateViewController: UIViewController, UITextViewDelegate {
    
    let setLanguage = TranslateLanguage(selectedLanguage: "en", targetLanguage: "uz")
    
    @IBOutlet weak var userText: UITextView!
    
    @IBOutlet weak var translatedText: UITextView!
    
    @IBOutlet weak var translateButton: UIButton!
    
    @IBOutlet weak var copyButton: UIButton!
    
    let feedbackGenerator = UINotificationFeedbackGenerator()

    
    @IBAction func touchTranslateButton(_ sender: UIButton) {
        translateText()
        feedbackGenerator.notificationOccurred(.success)
    }
    
    @IBAction func touchCopyButton(_ sender: Any) {
        let textToCopy = translatedText.text
        let pasteboard = UIPasteboard.general
        pasteboard.string = textToCopy
        feedbackGenerator.notificationOccurred(.success)
        
    }
    
    func translateText() {
        guard var textToTranslate = userText.text else { return }
        
        textToTranslate = textToTranslate.uppercased()
        
        translatedText.text = textToTranslate
        let GoogleUrl = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=" + setLanguage.selectedLanguage + "&tl=" + setLanguage.targetLanguage + "&dt=t&dt=t&q=" + textToTranslate
        
        print(GoogleUrl)
    }
    
    let placeholderForInput = "Enter text"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customizeButton(buttonName: copyButton, imageName: "copyButton", buttonColor: 0xffffff)
        customizeButton(buttonName: translateButton, imageName: "translateButton", buttonColor: 0x374FF5)
        userText.delegate = self
        userText.text = placeholderForInput
        userText.textColor = UIColor.lightGray
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    func textViewDidBeginEditing(_ userText: UITextView) {
        if userText.textColor == UIColor.lightGray {
            userText.text = nil
            userText.textColor = UIColor.init(rgb: 0x2948ff)
            userText.font=UIFont.systemFont(ofSize: 20)
            
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            translateText()
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ userText: UITextView) {
        if userText.text.isEmpty {
            userText.text = placeholderForInput
            userText.textColor = UIColor.lightGray
        }
    }
    
    func customizeButton(buttonName: UIButton, imageName icon: String, buttonColor: Int) {
        let origImage = UIImage(named: icon);
        let tintedImage = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        buttonName.setImage(tintedImage, for: .normal)
        buttonName.tintColor = UIColor(rgb: buttonColor )
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

