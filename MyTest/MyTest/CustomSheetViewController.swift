//
//  CustomSheetViewController.swift
//  MyTest
//
//  Created by dfpo on 2023/4/24.
//

import UIKit
     

class CustomSheetViewController: UIViewController {
    
    private var contentView: UIView?
    private var contentWidth: CGFloat?
    private var contentHeight: CGFloat?
    
    init(contentView: UIView, contentWidth: CGFloat? = nil, contentHeight: CGFloat? = nil) {
        self.contentView = contentView
        self.contentWidth = contentWidth
        self.contentHeight = contentHeight
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        guard let contentView = contentView else { return }
        
        let width = contentWidth ?? contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
        let height = contentHeight ?? contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalToConstant: width),
            contentView.heightAnchor.constraint(equalToConstant: height),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        
        if let contentView = self.contentView {
            self.view.backgroundColor = UIColor.clear
            contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                contentView.transform = CGAffineTransform.identity
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

            }
        }
        
    }
    func dismissWithAnimation() {
        if let contentView = self.contentView {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
                self.view.backgroundColor = UIColor.clear
                contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
            } completion: { (_) in
                self.dismiss(animated: false, completion: nil)
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == view {
            dismissWithAnimation()
        }
    }
}
