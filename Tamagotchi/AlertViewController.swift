//
//  alertViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/04.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var alertTextView: UITextView!
    
    var alertDetailImage: UIImage?
    var contentLabel: String? = "빈 공간"
    var contentText: String? = "빈 공간"
   
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        alertImage?.image = alertDetailImage
        alertLabel.text = contentLabel
        alertTextView.text = contentText
    }
    
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        } else {
            sender.backgroundColor = UIColor.white
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        } else {
            sender.backgroundColor = UIColor.white
        }
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
    }
    



}
