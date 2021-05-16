//
//  ViewController.swift
//  Project1
//
//  Created by Azat Kaiumov on 16.05.2021.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()
    
    func loadPictures() {
        let fileManager = FileManager.default
        let resourcePath = Bundle.main.resourcePath!
        
        let files = try! fileManager.contentsOfDirectory(atPath: resourcePath)
        
        for file in files {
            if file.hasPrefix("nssl") {
                pictures.append(file)
            }
        }
        
        print("Pictures: \(pictures)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPictures()
    }
}

