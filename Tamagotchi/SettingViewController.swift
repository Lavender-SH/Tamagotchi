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
            cell.iconImage.image = UIImage(systemName: "pencil")!
            cell.iconImage.tintColor = .lightGray
            //cell.detailSettingLabel = "내 이름 설정하기"
        case .change:
            cell.iconImage.image = UIImage(systemName: "moon.fill")!
            cell.iconImage.tintColor = .lightGray
            //cell.detailSettingLabel = "다마고치 변경하기"
        case .reset:
            cell.iconImage.image = UIImage(systemName: "arrow.clockwise")!
            cell.iconImage.tintColor = .lightGray
            //cell.detailSettingLabel = "데이터 초기화"
        }
        
        
        //cell.detailSettingLabel = settingOption.showOption
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = settingOption.showOption
        cell.textLabel?.frame.origin.x = 100
        //cell.settingLabel.frame.origin.x = 100
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self

        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    



}
