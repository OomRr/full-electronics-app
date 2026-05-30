//
//  Tost.swift
//  Full elcetronics store
//
//  Created by Omar on 22/05/2026.
//
import UIKit

public class Toast {
    static func showToast(message: String, in viewController: UIViewController) {
        let toast = UILabel()
        toast.text = "\(message) ✅"
        toast.textAlignment = .center
        toast.font = .systemFont(ofSize: 16)
        toast.textColor = .white
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        toast.layer.cornerRadius = 12
        toast.clipsToBounds = true
        toast.numberOfLines = 0
        
        let view = viewController.view!  
        
        toast.frame = CGRect(x: 20,
                             y: view.frame.height - 200,
                             width: view.frame.width - 40,
                             height: 45)
        
        view.addSubview(toast)
        
        UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut) {
            toast.alpha = 0
        } completion: { _ in
            toast.removeFromSuperview()
        }
    }
}
