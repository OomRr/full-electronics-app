////
////  OnBoardingVC.swift
////  Full elcetronics store
////
////  Created by Omar on 13/05/2026.
////
//
//import UIKit
//
//class OnBoardingVC: UIViewController {
//
//    
//    var viewModel: OnBoardingViewModel
//    
//    //MARK: - IBOutlets
//    @IBOutlet weak var pageController: UIPageControl!
//    @IBOutlet weak var myCollectionView: UICollectionView!
//    @IBOutlet weak var nextButton: UIButton!
//    
//    //MARK: - inits
//    init(viewModel: OnBoardingViewModel){
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//        
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    //MARK: - viewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCollectionView()
//        setupPageController()
//        
//    }
//    
//    //MARK: - methods
//    
//    func setupPageController(){
////        if !viewModel.isLastPage{
////            let l = LocalizationManager.shared.currentLanguage == "ar" ? UIImage(systemName: "arrow.left") : UIImage(systemName: "arrow.right")
////            nextButton.setImage(l, for: .normal)
////        }else{
////            nextButton.setImage(nil, for: .normal)
////        }
//        
//        pageController.currentPage = 0
//        pageController.numberOfPages = viewModel.pages.count
//    }
//    
//    
////MARK: - collectionView setup
//    
//    func setupCollectionView(){
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
//        myCollectionView.register(OnBoardingCVC.self)
//        myCollectionView.isPagingEnabled = true
//        myCollectionView.showsHorizontalScrollIndicator = false
//        
//    }
//    func updateUI(){
//        pageController.currentPage = viewModel.currentPage
//        
//        if viewModel.isLastPage {
//            var config = nextButton.configuration
//            config?.image = nil
//            config?.title = "go".localized
//            nextButton.configuration = config
//            
//        }
//    }
//    
//    
//    @IBAction func nextButtonTapped(_ sender: UIButton) {
//        if viewModel.isLastPage{
//
//            self.navigationController?.setViewControllers([TabBarViewController()], animated: true)
//            
//        }else{
//            viewModel.currentPage += 1
//            myCollectionView.scrollToItem(at: IndexPath(item: viewModel.currentPage, section: 0), at: .centeredHorizontally, animated: true)
//            updateUI()
//        }
//    }
//    
//    
//}
////MARK: - CollectionView delegate and dataSource and DelegateFlowLayout
//extension OnBoardingVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.pages.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: OnBoardingCVC = myCollectionView.dequeueReusableCell(for: indexPath) 
//        cell.configure(with: viewModel.page(at: indexPath.item))
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(
//            width: myCollectionView.frame.width,
//            height: myCollectionView.frame.height
//        )
//    }
//}
////extension OnBoardingVC: UIScrollViewDelegate{
////    
////    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
////        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
////        viewModel.currentPage = page
////        updateUI()
////    }
////}
//extension OnBoardingVC: UIScrollViewDelegate {
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let totalPages = viewModel.pages.count
//        guard totalPages > 0 else { return }
//        
//        // حساب الصفحة بناءً على مكان الـ Scroll الحالي مع استخدام round لتفادي كسور الـ بكسل
//        let rawPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
//        
//        // التحقق من اتجاه لوحة العرض (هل هو عربي/RTL؟)
////        if LocalizationManager.shared.currentLanguage == "ar"{
////            pageController.direction = .rightToLeft
////        }
//
//        if LocalizationManager.shared.currentLanguage == "ar" {
//            // في العربي بنعكس الحسبة: بنطرح الصفحة العكسية من إجمالي الصفحات ناقص واحد
//            viewModel.currentPage = (totalPages - 1) - rawPage
//        } else {
//            // في الإنجليزي الحسبة العادية سليمة
//            viewModel.currentPage = rawPage
//        }
//        
//        updateUI()
//    }
//}
import UIKit

class OnBoardingVC: UIViewController {
    
    var viewModel: OnBoardingViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - inits
    init(viewModel: OnBoardingViewModel) {
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
        setupPageController()
        updateUI()
    }
    
    //MARK: - methods
    func setupPageController() {
        pageController.currentPage = 0
        pageController.numberOfPages = viewModel.pages.count
    }
    
    //MARK: - collectionView setup
    func setupCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(OnBoardingCVC.self)
        myCollectionView.isPagingEnabled = true
        myCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func updateUI() {
        pageController.currentPage = viewModel.currentPage
        
        var config = nextButton.configuration ?? UIButton.Configuration.filled()
        
        if viewModel.isLastPage {
            config.image = nil
            config.title = "go".localized
        } else {
            let isArabic = LocalizationManager.shared.currentLanguage == "ar"
            let arrowName = isArabic ? "arrow.left" : "arrow.right"
            config.image = UIImage(systemName: arrowName)
            config.title = ""
        }
        
        nextButton.configuration = config
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if viewModel.isLastPage {
            self.navigationController?.setViewControllers([TabBarViewController()], animated: true)
        } else {
            viewModel.currentPage += 1
            
            let pageWidth = myCollectionView.frame.width
            let targetX: CGFloat
            
            if LocalizationManager.shared.currentLanguage == "ar" {
                let invertedPage = (viewModel.pages.count - 1) - viewModel.currentPage
                targetX = CGFloat(invertedPage) * pageWidth
            } else {
                targetX = CGFloat(viewModel.currentPage) * pageWidth
            }
            
            myCollectionView.setContentOffset(CGPoint(x: targetX, y: 0), animated: true)
            updateUI()
        }
    }
}

//MARK: - CollectionView delegate and dataSource
extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnBoardingCVC = myCollectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.page(at: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: myCollectionView.frame.height)
    }
}

//MARK: - UIScrollViewDelegate
extension OnBoardingVC: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      
        let centerPoint = CGPoint(x: scrollView.contentOffset.x + (scrollView.bounds.width / 2), y: scrollView.bounds.height / 2)
        
        if let indexPath = myCollectionView.indexPathForItem(at: centerPoint) {
            viewModel.currentPage = indexPath.item
            updateUI()
        }
    }
}
