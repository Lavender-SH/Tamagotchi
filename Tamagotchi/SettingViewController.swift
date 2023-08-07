//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/05.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case setting, change, reset
    
    var showOption: String {
        switch self {
        case .setting: return "내 이름 설정하기"
        case .change: return "다마고치 변경하기"
        case .reset: return "데이터 초기화"
        }
    }
}

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableViewCell") as! settingTableViewCell
        let settingOption = SettingOptions.allCases[indexPath.row]

        
        
        switch settingOption {
        case .setting:
            cell.imageView?.image = UIImage(systemName: "pencil")!
            cell.imageView?.tintColor = .lightGray
            cell.textLabel?.text = SettingOptions.setting.showOption
            cell.detailTextLabel?.text = UserDefaults.standard.string(forKey: "nickname")
        case .change:
            cell.imageView?.image = UIImage(systemName: "moon.fill")!
            cell.imageView?.tintColor = .lightGray
            cell.textLabel?.text = SettingOptions.change.showOption
            cell.detailTextLabel?.text = ""
            
        case .reset:
            cell.imageView?.image = UIImage(systemName: "arrow.clockwise")!
            cell.imageView?.tintColor = .lightGray
            cell.textLabel?.text = SettingOptions.reset.showOption
            cell.detailTextLabel?.text = ""
        }
        
        
        //cell.detailSettingLabel = settingOption.showOption
        cell.textLabel?.textColor = .black
        //cell.textLabel?.text = SettingOptions.setting.showOption
        //cell.textLabel?.frame.origin.x = 100
        //cell.settingLabel.frame.origin.x = 100
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        settingTableView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "nicknameViewController") as! nicknameViewController
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        let nickVC = storyboard?.instantiateViewController(withIdentifier: "nicknameViewController") as! nicknameViewController
        
        switch indexPath.row {
        case 0:
            let apperance = UINavigationBarAppearance()
            apperance.configureWithOpaqueBackground()
            
            navigationController?.navigationBar.tintColor = .lightGray
            navigationController?.navigationBar.barTintColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
            navigationController?.navigationBar.standardAppearance = apperance
            navigationController?.navigationBar.compactAppearance = apperance
            navigationController?.navigationBar.scrollEdgeAppearance = apperance
            nickVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(nickVC, animated: true)
            //navigationController?.popViewController(animated: true)
            title = "대장님 이름 정하기"
            //present(nickVC, animated: true, completion: nil)
            
        case 1: mainVC.modalPresentationStyle = .fullScreen
            mainVC.selctContentLabel = "다마고치 변경하기"
            present(mainVC, animated: true, completion: nil)
        case 2:
            let alertController = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "웅", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "아냐!", style: .cancel, handler: nil)

            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
            
        default: break
        }
        
        
        
    }
}
