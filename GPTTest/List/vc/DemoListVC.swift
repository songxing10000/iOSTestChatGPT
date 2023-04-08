//
//  DemoListVC.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit

class DemoListVC: SXTableViewImpl<MyTableViewCell, MyModel>  {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        data = [
            MyModel(title: "Title 1", subtitle: "Subtitle 1"),
            MyModel(title: "Title 2", subtitle: "Subtitle 2"),
            MyModel(title: "Title 3", subtitle: "Subtitle 3")
        ]
        
    }
}
