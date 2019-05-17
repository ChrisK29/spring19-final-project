//
//  Saved.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/16/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import Foundation

class Saved: Codable {
    let original: String
    let translated: String
    
    init(original: String, translated: String) {
        self.original = original
        self.translated = translated
    }
    
    var displayText: String {
        return "\(original) - \(translated)"
    }
}

extension Saved: CustomStringConvertible {
    var description: String {
        return displayText
    }
}
