//
//  File.swift
//  MyTest
//
//  Created by dfpo on 2023/4/24.
//

import UIKit
/*
 
 class MyCustomView:UIView {
 override var intrinsicContentSize: CGSize {
 return CGSize(width: 200, height: 200)
 }
 }
 
 let customView = MyCustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
 customView.backgroundColor = .blue
 
 let customAlertViewController = CustomAlertViewController(contentView: customView)//, contentWidth: 200, contentHeight: 100)
 present(customAlertViewController, animated: true, completion: nil)
 */

class CustomAlertViewController: UIViewController {
    
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
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentView?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
    
        let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.6) {
            self.contentView?.transform = .identity
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
        animator.startAnimation()
    }
    func dismissWithAnimation() {
        let animator = UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.6) {
            self.contentView?.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        }
        animator.addCompletion { _ in
            self.dismiss(animated: false, completion: nil)
        }
        animator.startAnimation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == view {
            dismissWithAnimation()
        }
    }
}
