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
    let images: [UIImage] = [UIImage(named: "1-6")!, UIImage(named: "2-6")!, UIImage(named: "3-6")!]
    var selctContentLabel: String? = "다마고치 선택하기"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupCollectionView()
        selectLabel.text = "다마고치 선택하기"
        selectLabel.textAlignment = .center
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        
        selectLabel.text = selctContentLabel

        
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

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ddd")
        
       // var selectedImage = images[indexPath.row]
        var selectedImage: UIImage?
        var selectedLabel = ""
        var selectedText = ""
        
            if indexPath.row == 0 {
                selectedImage = UIImage(named: "1-6")
                selectedLabel = "따끔따끔 다마고치"
                selectedText = "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:) "
            } else if indexPath.row == 1 {
                selectedImage = UIImage(named: "2-6")
                selectedLabel = "방실방실 다마고치"
                selectedText = "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!"
            } else if indexPath.row == 2 {
                selectedImage = UIImage(named: "3-6")
                selectedLabel = "반짝반짝 다마고치"
                selectedText = "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~"
            } else {
                selectedLabel = "준비중"
                selectedText = "준비중"
                
            }
    
        let alertStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let alertVC = (alertStoryboard.instantiateViewController(identifier: "AlertViewController") as? AlertViewController) {
            alertVC.alertDetailImage = selectedImage
            alertVC.contentLabel = selectedLabel
            alertVC.contentText = selectedText
            present(alertVC, animated: true, completion: nil)
        }
        
        let detailStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = (detailStoryboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController) {
            detailVC.selectedTamaName = selectedLabel
            present(detailVC, animated: true, completion: nil)
        }
    }
        
    
        
    
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
