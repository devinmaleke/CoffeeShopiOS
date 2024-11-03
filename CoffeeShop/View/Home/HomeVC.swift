//
//  HomeVC.swift
//  CoffeeShop
//
//  Created by Samir iOS on 29/10/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var pickerCollectionView: UICollectionView!
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    @IBOutlet weak var bannerBgView: UIView!
    
    
    @IBOutlet weak var cardCollectionViewHeight: NSLayoutConstraint!
    
    let filterSelection = ["All Coffee", "Machiato", "Americano", "Non Coffee"]
    lazy var filterIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCV()
        setupUI()
    }
    
    private func setupUI(){
        bannerBgView.roundCorners(corners:  [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 12)
    }
    
    private func setupCV(){
        pickerCollectionView.delegate = self
        pickerCollectionView.dataSource = self
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        let nibCell = UINib(nibName: "PickerCVC", bundle: nil)
        pickerCollectionView.register(nibCell, forCellWithReuseIdentifier: "PickerCVC")
        
        let cardNibCell = UINib(nibName: "CardCVC", bundle: nil)
        cardCollectionView.register(cardNibCell, forCellWithReuseIdentifier: "CardCVC")
        
        adjustCardCollectionViewHeight()
    }
    
    private func adjustCardCollectionViewHeight() {
        let totalHeight = calculateCardCollectionViewHeight()
        cardCollectionViewHeight.constant = totalHeight
    }
    
    private func calculateCardCollectionViewHeight() -> CGFloat {
        let numberOfItems = 20 // Update this based on your data source
        let itemHeight: CGFloat = 240 // Your desired item height
        let numberOfRows = ceil(Double(numberOfItems) / 2.0) // 2 items per row
        let totalHeight = CGFloat(numberOfRows) * itemHeight + CGFloat(numberOfRows - 1) * 20 // Add spacing
        return totalHeight
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Apply corner radius
        setupUI()
    }

}



extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pickerCollectionView{
            return filterSelection.count
        }else{
            return 20
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pickerCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickerCVC", for: indexPath) as! PickerCVC
            cell.setup(title: filterSelection[indexPath.row])
            cell.setSelected(indexPath.row == filterIndex)
            return cell
        } else {
            let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCVC", for: indexPath) as! CardCVC
            return cardCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterIndex = indexPath.row
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Ambil lebar koleksi
        if collectionView == cardCollectionView{
            let totalWidth = collectionView.frame.width
            let padding: CGFloat = 16 // atau nilai padding yang Anda inginkan
            let availableWidth = totalWidth - padding * 3 // Kurangi padding untuk kolom dan ruang antar sel
            
            // Hitung lebar setiap sel (dibagi dua)
            let width = availableWidth / 2
            
            // Tentukan tinggi yang diinginkan
            let height: CGFloat = 240 // Ganti dengan tinggi yang Anda inginkan
            
            return CGSize(width: width, height: height)
        }else{
            return CGSize(width: 128, height: 29)
        }
            
        }
        
        // Mengatur jarak antar item
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 16 // Jarak antara baris
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 16 // Jarak antar kolom
        }
    
}
