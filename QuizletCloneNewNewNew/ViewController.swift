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
    
    var cards: [String] = ["il trasloco", "traslocare", "trasferirsi", "noioso", "su", "giù", "sopra", "sotto"]
//    var images: [String] = ["0", "1", "2"]
    
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = cards.count
        for index in 0..<cards.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
//            let imgView = UIImageView(frame: frame)
//            imgView.image = UIImage(named: images[index])
//            self.scrollView.addSubview(imgView)
           
            let label = UILabel(frame: frame)
            label.text = cards[index]
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 25)
            self.scrollView.addSubview(label)
            
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(cards.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addGestureRecognizer(singleTap)
        
//        scrollView.frameLayoutGuide =
        
    }

//    Scrollview Method
//    ================================
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    

//    TapAction Function
//    ===============================
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        print("Hello world!")
    }
}

