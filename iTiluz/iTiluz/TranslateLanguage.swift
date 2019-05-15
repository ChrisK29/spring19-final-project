//
//  Language.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/15/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import Foundation

class TranslateLanguage {
    let selectedLanguage: String
    let targetLanguage: String
    
    init(selectedLanguage: String, targetLanguage: String) {
        self.selectedLanguage = selectedLanguage
        self.targetLanguage = targetLanguage
    }
}
