//
//  nicknameViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/05.
//

import UIKit

class nicknameViewController: UIViewController {
    
    
    
    @IBOutlet weak var nicknameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)


        
        
    }
    

    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
