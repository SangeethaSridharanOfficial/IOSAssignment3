//
//  ViewController.swift
//  Assignment3
//
//  Created by user202299 on 11/13/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddImageProtocol {
    
    @IBOutlet weak var imageViewArea: UIImageView!
    @IBOutlet weak var imagesPicker: UIPickerView!
    var manager: ImagesManager = ImagesManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImagesInfo().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllImagesInfo()[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadImage(urlStr: self.manager.getAllImagesInfo()[row].url)
    }
    
    func loadImage(urlStr: String){
        let url: URL = URL(string: urlStr)!
        if let data = try? Data(contentsOf: url){
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageViewArea.image = image
                }
            }else{
                showAlert(title: "Error!!", message: "Something wrong with the url")
            }
        }else{
            showAlert(title: "Error!!", message: "Something wrong with the url")
        }
    }
    
    func controllerDidAddImage(img: ImagesInfo) {
        manager.addNewImageInfo(imageInfo: img)
        imagesPicker.reloadAllComponents()
        if manager.getAllImagesInfo().count == 1 {
            loadImage(urlStr: img.url)
        }
    }
    
    func controllerDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addVC = segue.destination as! AddNewImageViewController
        addVC.delegate = self
    }
}

