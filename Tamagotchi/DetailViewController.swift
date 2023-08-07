//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var riceBallTextField: UITextField!
    @IBOutlet weak var waterDropTextField: UITextField!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var eatButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var tamaNameLabel: UILabel!
    @IBOutlet weak var bubbleImage: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    
    let foodStrings = ["오늘은 왠지 기분이 좋아용", "대장님 오늘 과제 하셨어용?", "대장님 오늘 깃허브 푸시 하셨어영?", "배고파요 ㅠㅠ 밥 먹고 싶어요", "목말라요~~~", "복습 아직 안하셨다구요? 지금 잠이 오세요? 고래밥님??", "토할거가타요 ㅠㅁㅠ"]
    let waterStrings = ["오늘은 왠지 기분이 좋아용", "대장님 오늘 과제 하셨어용?", "대장님 오늘 깃허브 푸시 하셨어영?", "배고파요 ㅠㅠ 밥 먹고 싶어요", "목말라요~~~", "복습 아직 안하셨다구요? 지금 잠이 오세요? 고래밥님??", "토할거가타요 ㅠㅁㅠ"]
    
    var selectedTamaName: String?
    var selectedTamaImage: UIImage?
    
    var riceBallCount = 0
    var waterDropCount = 0
    
    var index = 0
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("======")
        tamaNameLabel.text = UserDefaults.standard.string(forKey: "name\(index)")
        
        configureTextFieldStyle(riceBallTextField)
        configureTextFieldStyle(waterDropTextField)
        configureButtonStyle(eatButton)
        configureButtonStyle(drinkButton)
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        tamagotchiImageView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        bubbleImage.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        //tamagotchiImageView.image = selectedTamaImage
        tamaNameLabel.text = selectedTamaName
        print(selectedTamaName)
        tamagotchiImageView.image = UIImage(named: "1-1")
        //tamaNameLabel.text = "따끔따끔 다마고치"
        levelLabel.text = "LV1 밥알 0개 물방울 0개"
        bubbleLabel.text = "오늘은 왠지 기분이 좋아용"
        tamaNameLabel.layer.borderWidth = 1.0
        tamaNameLabel.layer.borderColor = UIColor.lightGray.cgColor
        tamaNameLabel.layer.cornerRadius = 5.0
        //selectedCall()
        
        
    }
//    func selectedCall() {
//        let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//        let alertVC = storyboard?.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//        tamaNameLabel.text = alertVC.contentLabel
//    }
    
    func configureTextFieldStyle(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    func configureButtonStyle(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
        button.layer.cornerRadius = button.frame.height / 3
        button.clipsToBounds = true
    }
    
    @IBAction func eatRiceBallButtonPressed(_ sender: UIButton) {
        if let inputText = riceBallTextField.text, let amount = Int(inputText) {
            if amount >= 1 && amount <= 99 {
                riceBallCount += amount
                updateLevelAndImages()
            } else {
                showAlert(message: "1개 이상 99개 이하로 입력해주세요.")
            }
        } else {
            riceBallCount += 1
            updateLevelAndImages()
        }
        let randomFoodIndex = Int.random(in: 0..<foodStrings.count)
        let randomFoodString = foodStrings[randomFoodIndex]
        bubbleLabel.text = randomFoodString
    }
    
    @IBAction func drinkWaterButtonPressed(_ sender: UIButton) {
        if let inputText = waterDropTextField.text, let amount = Int(inputText) {
            if amount >= 1 && amount <= 49 {
                waterDropCount += amount
                updateLevelAndImages()
            } else {
                showAlert(message: "1개 이상 49개 이하로 입력해주세요.")
            }
        } else {
            waterDropCount += 1
            updateLevelAndImages()
        }
        let randomWaterIndex = Int.random(in: 0..<waterStrings.count)
        let randomWaterString = waterStrings[randomWaterIndex]
        bubbleLabel.text = randomWaterString
        
    }
    
    func updateLevelAndImages() {
        let riceBallValue = riceBallCount / 5
        let waterDropValue = waterDropCount / 2
        let totalValue = Double(riceBallValue) + Double(waterDropValue)
        let level = min(Int(totalValue)/10, 10)
        levelLabel.text = "LV\(level) 밥알 \(riceBallCount)개 물방울 \(waterDropCount)개"
        
        
        var imageName = ""
        switch level {
        case 1: imageName = "1-1"
        case 2: imageName = "1-2"
        case 3: imageName = "1-3"
        case 4: imageName = "1-4"
        case 5: imageName = "1-5"
        case 6: imageName = "1-6"
        case 7: imageName = "1-7"
        case 8: imageName = "1-8"
        case 9: imageName = "1-9"
        case 10: imageName = "1-9"
        default: break
        }
        
        if !imageName.isEmpty {
            tamagotchiImageView.image = UIImage(named: imageName)
        }
        

    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
