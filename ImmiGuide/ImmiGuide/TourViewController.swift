//
//  TourViewController.swift
//  ImmiGuide
//
//  Created by Annie Tung on 2/18/17.
//  Copyright © 2017 Madushani Lekam Wasam Liyanage. All rights reserved.
//

import UIKit

class TourViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var tourData: [Tour] = []
    var animator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 3.0, curve: UIViewAnimationCurve.linear, animations: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTourData()
        setupCollectionView()
        setupPageController()
        setupButton()
    }

    // MARK: - Methods
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(TourCell.self, forCellWithReuseIdentifier: TourCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let _ = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ].map{$0.isActive = true}
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func showHomeScreen() {
        self.performSegue(withIdentifier: "TabBar", sender: self)
    }
    
    func setupTourData() {
        if let tourPage1 = UIImage(named: "Tourpage1"), let tourPage2 = UIImage(named: "Tourpage2"), let tourPage3 = UIImage(named: "Flag") {
            let pageOne = Tour(image: tourPage1, title: "ImmiGuide", description: "Find resources for...")
            let pageTwo = Tour(image: tourPage2, title: "", description: "Fact here")
            let pageThree = Tour(image: tourPage3, title: "Our Mission", description: "Ready to explore?")
            tourData = [pageOne, pageTwo, pageThree]
        }
    }
    
    func setupPageController() {
        collectionView.addSubview(pageController)
        let _ = [
            pageController.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageController.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageController.rightAnchor.constraint(equalTo: view.rightAnchor),
            ].map{$0.isActive = true}
    }
    
    func setupButton() {
        collectionView.addSubview(getStartedButton)
        let _ = [
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            getStartedButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            getStartedButton.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
    }
    
    // MARK: - Views
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        collection.bounces = false
        collection.showsHorizontalScrollIndicator = true
        return collection
    }()
    
    lazy var pageController: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.numberOfPages = self.tourData.count
        return pageControl
    }()
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(showHomeScreen), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Collection View
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentPage = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = currentPage
        if currentPage == tourData.count {
            getStartedButton.isHidden = false 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(tourData.count)
        return tourData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TourCell.identifier, for: indexPath) as! TourCell
        cell.tour = tourData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
