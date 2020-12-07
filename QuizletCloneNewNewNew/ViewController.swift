//
//  ViewController.swift
//  QuizletCloneNewNewNew
//
//  Created by Ana Sofia Caballero on 13/12/2019.
//  Copyright © 2019 Ana Caballero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIPageViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var singleTap: UITapGestureRecognizer!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
//    SCROLL VIEW
//    ================================
    
    var cardsItalian: [String] = ["il trasloco", "traslocare", "trasferirsi", "noioso", "su", "giù", "sopra", "sotto"]
    var cardsGerman: [String] = ["Umzug", "umziehen", "umziehen (in andere Stadt)", "langweilig", "(nach) oben", "(nach) unten", "über, auf", "unter"]
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
    var vocabularyLabel : [UILabel] = []
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        if vocabularyLabel[pageControl.currentPage].text == cardsItalian[pageControl.currentPage] {
            vocabularyLabel[pageControl.currentPage].text = cardsGerman[pageControl.currentPage]
        } else {
            vocabularyLabel[pageControl.currentPage].text = cardsItalian[pageControl.currentPage]
        }
       }
    
    
//    PAGE CONTROL
//    ==================================
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
    }
    
//    COLLECTION VIEW
//    ================================
    
    var exerciseLabels = ["LERNEN", "KARTEIKARTEN", "ANTWORTEN", "TESTEN"]
    let exerciseImage = [UIImage(named: "lernen"), UIImage(named: "karteikarten"), UIImage(named: "antworten"), UIImage(named: "testen")]
   
    
//    VIEW DID LOAD
//    ================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = cardsItalian.count
        
        for index in 0..<cardsItalian.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            vocabularyLabel.append(UILabel(frame: frame))
            
            vocabularyLabel[index].text = cardsItalian[index]
            vocabularyLabel[index].textAlignment = .center
            vocabularyLabel[index].font = .systemFont(ofSize: 25)
            vocabularyLabel[index].layer.borderColor = UIColor.lightGray.cgColor
            vocabularyLabel[index].layer.borderWidth = 0.75
            vocabularyLabel[index].layer.backgroundColor = UIColor.white.cgColor
            
            self.scrollView.addSubview(vocabularyLabel[index])
            
            scrollView.addGestureRecognizer(singleTap)
        
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(cardsItalian.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCardUI()
    }

    func setupCardUI() {
        scrollView.layer.shadowRadius = 5
        scrollView.layer.shadowOpacity = 0.5
        scrollView.layer.masksToBounds = false
        scrollView.layer.shadowColor = UIColor.gray.cgColor
    }
    
//    Scrollview Method
//    ================================
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
 
    
//    Collection View Methods
//    ================================
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exerciseLabels.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        let cellIndex = indexPath.item
        cell.contentView.layer.masksToBounds = true
        cell.iconImageView.image = exerciseImage[cellIndex]
        cell.exerciseTypeLabel.text = exerciseLabels[cellIndex]
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.75
        cell.layer.masksToBounds = false
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.2
        cell.layer.backgroundColor = UIColor.white.cgColor
        
        return cell
    }
        
}
