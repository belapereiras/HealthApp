//
//  TutorialViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 2/21/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var button: UIButton!
    @IBOutlet var tutorial2View: Tutorial2View!
    @IBOutlet var tutorial1View: TutorialProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize_timer(with_interval: 5, handler: { timer in
            self.tutorial1View.addProgressAnimation()
        })
        
        self.initialize_timer(with_interval: 5, handler: { timer in
            self.tutorial2View.addStickersAnimation()
        })
        
        //1
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        
        //2
        textView.textAlignment = .center
        
        
        //4
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 4, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
            tutorial1View.isHidden = false
            tutorial2View.isHidden = true
            textView.text = "Acompanhe os progressos na sua saúde a cada cigarro que você deixa de fumar."
        }else{
            textView.text = "Com o dinheiro economizado conquiste stickers e mostre aos amigos sua evolução"
            // Show the "Let's Start" button in the last slide (with a fade in animation)                     UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.button.alpha = 1.0
            tutorial2View.isHidden = false
            tutorial1View.isHidden = true
        }
    }
}
    


