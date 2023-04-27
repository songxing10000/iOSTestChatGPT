//
//  CustomSheetView.swift
//  MyTest
//
//  Created by mac on 2023/4/27.
//

import UIKit
/*
 class MyCustomView:UIView {
     override var intrinsicContentSize: CGSize {
         return CGSize(width: 200, height: 200)
     }
 }
 
 
 let contentView = MyCustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
 contentView.backgroundColor = .white
 let customSheetView = CustomAlertView(contentView: contentView, contentWidth: 300, contentHeight: 200)
 customSheetView.show()
 */
class CustomAlertView: UIView {
   
   private var contentView: UIView?
   private var contentWidth: CGFloat?
   private var contentHeight: CGFloat?
   private var firstResponder: UIResponder?
   
   init(contentView: UIView, contentWidth: CGFloat? = nil, contentHeight: CGFloat? = nil) {
       self.contentView = contentView
       self.contentWidth = contentWidth
       self.contentHeight = contentHeight
       super.init(frame: .zero)
       setupView()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   private func setupView() {
       guard let contentView = contentView else { return }
       
       let screenSize = UIScreen.main.bounds.size
       let width = contentWidth ?? screenSize.width
       let height = contentHeight ?? contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
       
       contentView.translatesAutoresizingMaskIntoConstraints = false
       addSubview(contentView)
       
       NSLayoutConstraint.activate([
        contentView.widthAnchor.constraint(equalToConstant: width),
        contentView.heightAnchor.constraint(equalToConstant: height),
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
        contentView.centerYAnchor.constraint(equalTo: centerYAnchor)
       ])
       
       backgroundColor = UIColor.black.withAlphaComponent(0.5)
   }
   
   func show() {
       guard let window = UIApplication.shared.windows.first else { return }
       
       firstResponder = UIResponder.currentFirstResponder()
       firstResponder?.resignFirstResponder()
       
       frame = window.bounds
       window.addSubview(self)
       
        
       contentView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       UIView.animate(withDuration: 0.3) {
           self.contentView?.transform = .identity
       }
   }
   
   func dismiss() {
       
       UIView.animate(withDuration: 0.3, animations: {
           self.contentView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
       }) { _ in
           self.removeFromSuperview()
       }
   }
   
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       if let touch = touches.first, touch.view == self {
           dismiss()
       }
   }
}


