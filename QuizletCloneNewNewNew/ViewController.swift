//
//  ViewController.swift
//  QuizletCloneNewNewNew
//
//  Created by Ana Sofia Caballero on 13/12/2019.
//  Copyright © 2019 Ana Caballero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var singleTap: UITapGestureRecognizer!

    
    var cardsItalian: [String] = ["il trasloco", "traslocare", "trasferirsi", "noioso", "su", "giù", "sopra", "sotto"]
    var cardsGerman: [String] = ["Umzug", "umziehen", "umziehen (in andere Stadt)", "langweilig", "(nach) oben", "(nach) unten", "über, auf", "unter"]
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var cardTapped = false
    
    var vocabularyLabel : [UILabel] = []
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        if vocabularyLabel[pageControl.currentPage].text == cardsItalian[pageControl.currentPage] {
            vocabularyLabel[pageControl.currentPage].text = cardsGerman[pageControl.currentPage]
        } else {
            vocabularyLabel[pageControl.currentPage].text = cardsItalian[pageControl.currentPage]
        }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = cardsItalian.count
        
        for index in 0..<cardsItalian.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
//            let imgView = UIImageView(frame: frame)
//            imgView.image = UIImage(named: images[index])
//            self.scrollView.addSubview(imgView)
            
            vocabularyLabel.append(UILabel(frame: frame))
            
            vocabularyLabel[index].text = cardsItalian[index]
            vocabularyLabel[index].textAlignment = .center
            vocabularyLabel[index].font = .systemFont(ofSize: 25)
            
            self.scrollView.addSubview(vocabularyLabel[index])
            
            scrollView.addGestureRecognizer(singleTap)
        
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(cardsItalian.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false

    }

    
//    Scrollview Method
//    ================================
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
}

