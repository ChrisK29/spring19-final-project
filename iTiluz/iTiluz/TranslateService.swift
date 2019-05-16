//
//  TranslateService.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/15/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import Foundation
import Alamofire

class TranslateService {
    func getTranslation(from selectedLanguage: String, to targetLanguage: String, for text: String, completionHandler: @escaping (String) -> Void) {
        let apiKey = "trnsl.1.1.20190410T062947Z.b1e06ca552a54bbf.058675d09396400125cb72d6c96d27d89e9b540b"
        let translateURL = "https://translate.yandex.net/api/v1.5/tr.json/translate?lang=\(selectedLanguage)-\(targetLanguage)&key=\(apiKey)&text=\(text)"
        Alamofire.request(translateURL).responseJSON(completionHandler: { response in
            guard let jsonDictionary = response.result.value as? NSDictionary,
                let textArray = jsonDictionary["text"] as? NSArray,
                let textResult = textArray[0] as? String
                else {
                    return
            }
            completionHandler(textResult)
        })
    }
}
