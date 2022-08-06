//
//  CarouselTableViewCell.swift
//  tableview
//
//  Created by Victor dos Santos Feitosa (P) on 05/08/22.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    public let identifier: String = "CarouselTableViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    private let totalItemsCarrousel = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCollectionViewCell")
        pageControl.numberOfPages = totalItemsCarrousel
        pageControl.currentPage = 0
        self.contentView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

extension CarouselTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalItemsCarrousel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameSize = collectionView.frame.size
        return CGSize(width: frameSize.width - 10, height: frameSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
//    func collectionView(_ collectionView: UICollectionView,
//                                layout collectionViewLayout: UICollectionViewLayout,
//                                sizeForItemAt indexPath: IndexPath) -> CGSize {
//                let kWhateverHeightYouWant = 170
//
//                return CGSize(width: collectionView.bounds.size.width, height: CGFloat(kWhateverHeightYouWant))
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.setup(text: "Texto \(indexPath.row)")
        return cell
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //pega dados durante o scroll
//        let indexPath = collectionView.indexPathsForVisibleItems
//        print(indexPath)
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = collectionView.indexPathsForVisibleItems.first {
            pageControl.currentPage = indexPath.item
        }
    }
    
    
}
