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
        
        


        
        
    }
    

    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
