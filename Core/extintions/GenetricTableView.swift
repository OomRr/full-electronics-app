import UIKit

// MARK: - Protocol

public protocol IdentifiableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension IdentifiableView {
    // Default: uses the class name as the identifier (e.g. "ProductCell")
    // So your XIB file name must match your class name exactly
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

// MARK: - UITableView

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: IdentifiableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: IdentifiableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

// MARK: - UICollectionView

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: IdentifiableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: IdentifiableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
