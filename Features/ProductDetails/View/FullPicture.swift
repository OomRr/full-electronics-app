import UIKit
import SDWebImage

class FullscreenImageVC: UIViewController {
    
    private let imageUrls: [String]
    private let startIndex: Int
    private var isFirstLayout = true
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 2
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .black
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(FullscreenImageCell.self, forCellWithReuseIdentifier: "FullscreenCell")
        return cv
    }()
    
    init(imageUrls: [String], startIndex: Int) {
        self.imageUrls = imageUrls
        self.startIndex = startIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
        if isFirstLayout {
            isFirstLayout = false
            let indexPath = IndexPath(item: startIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(collectionView)
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupActions() {
        // Bind the button tap to our dismiss selector
        backButton.addTarget(self, action: #selector(dismissFullscreen), for: .touchUpInside)
    }
    
    @objc fileprivate func dismissFullscreen() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionView Data Source & Delegate
extension FullscreenImageVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullscreenCell", for: indexPath) as! FullscreenImageCell
        cell.configure(with: imageUrls[indexPath.row])
        
        // Keeping the optional image-tap dismiss action active as well
        cell.onTap = { [weak self] in
            self?.dismissFullscreen()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
}

// MARK: - Custom Fullscreen Cell
class FullscreenImageCell: UICollectionViewCell {
    
    var onTap: (() -> Void)?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .black
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        imageView.sd_setImage(with: url, placeholderImage: nil, options: [.retryFailed, .progressiveLoad])
    }
    
    @objc private func imageTapped() {
        onTap?()
    }
}
