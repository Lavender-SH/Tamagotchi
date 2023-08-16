//
//  nicknameViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/05.
//

import UIKit

enum NicknameError: Error {
    case emptyNickname
    
    var localizedDescription: String {
        switch self {
        case .emptyNickname:
            return "닉네임을 입력하세요."
        }
    }
}

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
    //==================================================================================
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        do {
            try saveNickname()
            navigationController?.popViewController(animated: true)
        } catch let error {
            showAlert(message: error.localizedDescription)
        }
//        guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
//            return
//        }
//
//        UserDefaults.standard.set(nickname, forKey: "nickname")
//
//        UserDefaults.standard.synchronize()
//
//        navigationController?.popViewController(animated: true)
    }
    func saveNickname() throws {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
            throw NicknameError.emptyNickname
        }
        
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.synchronize()
    }


    func showAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    //====================================================================================

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

