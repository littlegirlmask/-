//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110311. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate {

    @IBOutlet weak var scroll1: UIScrollView!
    
    @IBOutlet weak var scroll2: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //放大缩小
        let imageView = UIImageView(image: UIImage(named:"1"))
        scroll1.addSubview(imageView)
        scroll1.contentSize = imageView.bounds.size
        scroll1.minimumZoomScale = 0.2
        scroll1.maximumZoomScale = 5
        scroll1.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        func viewForZooming(in scroll1: UIScrollView) -> UIView? {
            return scroll1.subviews.first
        }
        
        //滚屏浏览
        for i in 1...6{
            let imageView1 = UIImageView(image: UIImage(named:"\(i)"))
            imageView1.contentMode = .scaleAspectFit
            imageView1.frame = CGRect(x: CGFloat(i-1)*scroll2.bounds.width, y: 0, width: scroll2.bounds.width, height: scroll2.bounds.height)
            scroll2.addSubview(imageView1)
            scroll2.isPagingEnabled = true
        }
        scroll2.contentSize = CGSize(width: 6 * scroll2.bounds.width, height: scroll2.bounds.height)
        scroll2.delegate = self
        pageControl.numberOfPages = 6
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scroll2.showsHorizontalScrollIndicator = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scroll2.contentOffset.x / scroll2.bounds.width)
    }

    @IBAction func pageClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scroll2.bounds.width, y: 0, width: scroll2.bounds.width, height: scroll2.bounds.height)
        scroll2.scrollRectToVisible(rect, animated: true)
    }
    
}

