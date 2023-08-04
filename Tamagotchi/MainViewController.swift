//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이승현 on 2023/08/04.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        setupCollectionView()
        selectLabel.text = "다마고치 선택하기"
        selectLabel.textAlignment = .center
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)

        
    }
    
    func setupCollectionView() {
        // 컬렉션뷰의 레이아웃을 담당하는 객체
        //let flowLayout = UICollectionViewFlowLayout()
        
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        // 컬렉션뷰의 스크롤 방향 설정
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - 1 * (3 - 1)) / 3
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = 1
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = 1
        flowLayout.sectionInset = UIEdgeInsets (top: 30, left: 0, bottom: 0, right: 0)

        
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
        
        
        


    }
    
    
    
    
    
    
    
    
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell

        
        switch indexPath.item {
        case 0:
            let imageName = "1-6"
            if let image = UIImage(named: imageName) {
                cell.mainTamaImage.image = image
                cell.mainTamaLabel.text = "따끔따끔 다마고치"
                cell.mainTamaLabel.textAlignment = .center
// 적용이안됨      cell.mainTamaLabel.layer.cornerRadius = 10
//              cell.mainTamaLabel.layer.borderColor = UIColor.black.cgColor
            }
        case 1:
            let imageName = "2-6"
            if let image = UIImage(named: imageName) {
                cell.mainTamaImage.image = image
                cell.mainTamaLabel.text = "방실방실 다마고치"
                cell.mainTamaLabel.textAlignment = .center
            }
        case 2:
            let imageName = "3-6"
            if let image = UIImage(named: imageName) {
                cell.mainTamaImage.image = image
                cell.mainTamaLabel.text = "반짝반짝 다마고치"
                cell.mainTamaLabel.textAlignment = .center
            }
        default:
            let imageName = "noImage"
            if let image = UIImage(named: imageName) {
                cell.mainTamaImage.image = image
                cell.mainTamaLabel.text = "준비중이에요"
                cell.mainTamaLabel.textAlignment = .center
            }
            
            return cell
        }
            return cell
    }
}
