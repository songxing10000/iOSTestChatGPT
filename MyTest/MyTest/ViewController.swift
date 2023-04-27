import UIKit
class MyCustomView:UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}
class ViewController: UIViewController {
     
     
    
     override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func clickCustomSheetViewBtn(_ sender: Any) {
        
        
        let contentView = MyCustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        contentView.backgroundColor = .white
        let customSheetView = CustomSheetView(contentView: contentView, contentWidth: 300, contentHeight: 200)
        customSheetView.show()

     }
    @IBAction func clickCustomAlertViewBtn(_ sender: Any) {
        
        
        let contentView = MyCustomView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        contentView.backgroundColor = .white
        let customSheetView = CustomAlertView(contentView: contentView, contentWidth: 300, contentHeight: 200)
        customSheetView.show()

     }
    @IBAction func clickCustomSheetViewControllerBtn(_ sender: Any) {

        let customView = MyCustomView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
        customView.backgroundColor = .blue
        
        let customAlertViewController = CustomSheetViewController(contentView: customView, contentWidth: 200, contentHeight: 300)
        present(customAlertViewController, animated: true, completion: nil)
    }
    
    @IBAction func clickCustomAlertViewControllerBtn(_ sender: Any) {
        
        let customView = MyCustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        customView.backgroundColor = .blue
        
        let customAlertViewController = CustomAlertViewController(contentView: customView)//, contentWidth: 200, contentHeight: 100)
        present(customAlertViewController, animated: true, completion: nil)
        
        
    }
     
}
 
