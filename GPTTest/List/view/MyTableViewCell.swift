//
//  MyTableViewCell.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit

class MyTableViewCell: UITableViewCell, SXTableCellProtocol {
    
    @IBOutlet weak var m_lab1: UILabel!
    @IBOutlet weak var m_lab2: UILabel!

    func configCell(data: MyModel) {
        m_lab1.text = data.title
        m_lab2.text = data.subtitle
        }
}
