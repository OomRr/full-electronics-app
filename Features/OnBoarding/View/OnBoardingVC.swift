//
//  OnBoardingVC.swift
//  Full elcetronics store
//
//  Created by Omar on 13/05/2026.
//

import UIKit

class OnBoardingVC: UIViewController {

    
    var viewModel: OnBoardingViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - inits
    init(viewModel: OnBoardingViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    //MARK: - methods
    
    func setupPageController(){
        pageController.currentPage = 0
        pageController.numberOfPages = viewModel.pages.count
    }
    
    
//MARK: - collectionView setup
    
    func setupCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "OnBoardingCVC", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCVC")
        myCollectionView.isPagingEnabled = true
        myCollectionView.showsHorizontalScrollIndicator = false
        
    }


    
    func updateUI(){
        pageController.currentPage = viewModel.currentPage
        
        if viewModel.isLastPage {
            var config = nextButton.configuration
            config?.image = nil
            config?.title = "go".localized
            nextButton.configuration = config
            
        }
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if viewModel.isLastPage{
//            self.navigationController?.pushViewController(HomeVC(viewModel: objs.viewMode), animated: true)
            self.navigationController?.setViewControllers([TabBarViewController()], animated: true)
            
        }else{
            viewModel.currentPage += 1
            myCollectionView.scrollToItem(at: IndexPath(item: viewModel.currentPage, section: 0), at: .centeredHorizontally, animated: true)
            updateUI()
        }
    }
    
    
}
//MARK: - CollectionView delegate and dataSource and DelegateFlowLayout
extension OnBoardingVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCVC", for: indexPath) as! OnBoardingCVC
        cell.configure(with: viewModel.page(at: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: myCollectionView.frame.width,
            height: myCollectionView.frame.height
        )
    }
}
extension OnBoardingVC: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        viewModel.currentPage = page
        updateUI()
    }
}
