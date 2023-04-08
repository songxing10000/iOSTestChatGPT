//
//  ViewController.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(DemoListVC(style: .plain), animated: true)
    }
}
