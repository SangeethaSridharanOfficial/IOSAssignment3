//
//  AddNewImageViewController.swift
//  Assignment3
//
//  Created by user202299 on 11/13/21.
//

import UIKit

protocol AddImageProtocol {
    func controllerDidAddImage(img: ImagesInfo)
    func controllerDidCancel()
}

class AddNewImageViewController: UIViewController {
    var delegate: AddImageProtocol?

    @IBOutlet weak var imageUrl: UITextField!
    @IBOutlet weak var imageName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
   
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addBtnClicked(_ sender: UIButton) {
        if let title = imageName.text {
            if let url = imageUrl.text {
                if !title.isEmpty && !url.isEmpty {
                    let newImage = ImagesInfo(t: title, u: url)
                  		  print(newImage.url)
                    delegate?.controllerDidAddImage(img: newImage)
                    dismiss(animated: true, completion: nil)
                }else{
                    showAlert(title: "Error!!", message: "Please enter both the values")
                }
            }else{
                showAlert(title: "Error!!", message: "Please enter the URL to proceed")
            }
        }else{
            showAlert(title: "Error!!", message: "Please enter the title to proceed")
        }
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
