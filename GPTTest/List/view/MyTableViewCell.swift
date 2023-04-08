//
//  MyTableViewCell.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit

class MyTableViewCell: UITableViewCell, SXTableCellProtocol {
    
        func configCell(data: MyModel) {
            textLabel?.text = data.title
            detailTextLabel?.text = data.subtitle
        }
        static var cellId: String {
            return "MyTableViewCell"
        }
}
