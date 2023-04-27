import UIKit
extension UIResponder {
   static weak var _currentFirstResponder: UIResponder?
   
   static func currentFirstResponder() -> UIResponder? {
       _currentFirstResponder = nil
       UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
       return _currentFirstResponder
   }
   
   @objc func findFirstResponder(sender: AnyObject) {
       UIResponder._currentFirstResponder = self
   }
}
