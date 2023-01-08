//
//  PageControlVC.swift
//  DayEight
//
//  Created by Myo Thandar soe on 06/01/2023.
//

import UIKit

class PageControlVC: UIViewController {

    
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemMint,
        .systemPink,
        .systemPurple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.backgroundColor = .white
        view.addSubview(ScrollView)
        view.backgroundColor = .white
        ScrollView.delegate = self
        PageControl.addTarget(self, action: #selector(handlePageControlChage(_ :)), for: .valueChanged)
        view.addSubview(PageControl)
    }
    
    override func viewDidLayoutSubviews() {
        if ScrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    @objc private func handlePageControlChage(_ sender: UIPageControl) {
        let current = sender.currentPage
        ScrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    
    func configureScrollView() {
        ScrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height)
        ScrollView.isPagingEnabled = true
        for i in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            page.backgroundColor = colors[i]
            ScrollView.addSubview(page)
        }
    }


}

extension PageControlVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        PageControl.currentPage = Int(round(scrollView.contentOffset.x / view.frame.width))
    }
}
