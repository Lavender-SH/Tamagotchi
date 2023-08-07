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
        loadNickname()
        configureTextFieldStyle(nicknameTextField)
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
            return
        }
        
        UserDefaults.standard.set(nickname, forKey: "nickname")
        
        UserDefaults.standard.synchronize()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func loadNickname() {
        if let savedNickname = UserDefaults.standard.string(forKey: "userNickname") {
            nicknameTextField.text = savedNickname
        }
    }
    
    func configureTextFieldStyle(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    

}

