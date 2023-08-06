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
        print("ddd")
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        } else {
            sender.backgroundColor = UIColor.white
        }
        
        let alertVC = storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        let nav = UINavigationController(rootViewController: alertVC)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
        
        let detailStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = (detailStoryboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController) {
            detailVC.modalPresentationStyle = .fullScreen
            detailVC.modalPresentationStyle = .overCurrentContext
            detailVC.selectedTamaName = contentLabel
            detailVC.selectedTamaImage = alertDetailImage
            present(detailVC, animated: true, completion: nil)
        }
    }
}
        
      //  let nav = UINavigationController(rootViewController: alertVC)
      //  nav.modalPresentationStyle = .fullScreen
        //nav.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: nil, action: nil)
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: nil, action: nil)
       // present(nav, animated: true, completion: nil)
        
//        let detailStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        if let detailVC = (detailStoryboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController) {
//            detailVC.selectedTamaName = contentLabel
//            present(detailVC, animated: true, completion: nil)
//        }
        
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    

    




