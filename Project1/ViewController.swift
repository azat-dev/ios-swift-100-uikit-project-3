//
//  ViewController.swift
//  Project1
//
//  Created by Azat Kaiumov on 16.05.2021.
//

import UIKit

class ViewController: UITableViewController {
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        
        loadPictures()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    func openDetailView(pictureIndex: Int) {
        let picture = pictures[pictureIndex]
        
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController else {
            return
        }
        
        detailViewController.selectedImage = picture
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailView(pictureIndex: indexPath.row)
    }
}

