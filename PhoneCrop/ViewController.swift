//
//  ViewController.swift
//  PhoneCrop
//
//  Created by ggoes on 18/12/16.
//  Copyright © 2016 artwebhost. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var tvImageText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ocr = G8Tesseract(language: "eng") {
            ocr.delegate = self
            
            //TODO: Get image from a photo taken
            ocr.image = UIImage(named: "placa1")?.g8_blackAndWhite()
            ocr.recognize()
            
            //TODO: Change it to get just the phone number from text
            tvImageText.text = ocr.recognizedText
            
            //TODO: Create method to save number in agenda
        }
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition progress: \(tesseract.progress)%")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

