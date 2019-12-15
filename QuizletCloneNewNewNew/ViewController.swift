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
    var cardsGerman: [String] = ["Umzug", "umziehen (in eine andere Wohnung)", "umziehen (in andere Stadt)", "langweilig", "(nach) oben", "(nach) unten", "über, auf", "unter"]
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    var cardTapped = false
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
//        if cardTapped {
//            cardTapped = false
//        } else {
//            cardTapped = true
//        }
        print(cardTapped)
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
           
            let vocabularyLabel = UILabel(frame: frame)
            
//            if cardTapped == true {
//                label.text = cardsGerman[index]
//            } else {
//                label.text = cardsItalian[index]
//            }
            
            vocabularyLabel.text = cardsItalian[index]
            vocabularyLabel.textAlignment = .center
            vocabularyLabel.font = .systemFont(ofSize: 25)
//            if cardTapped == true {
//                label.text = cardsGerman[index]
//            }
            self.scrollView.addSubview(vocabularyLabel)
            
            scrollView.addGestureRecognizer(singleTap)
    
            func handleTap(sender: UITapGestureRecognizer) {
                singleTap.numberOfTouchesRequired = 1
                if singleTap.state == .ended {
                    vocabularyLabel.text = cardsGerman [index]
                }
            }
        
            handleTap(sender: singleTap)
        
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

