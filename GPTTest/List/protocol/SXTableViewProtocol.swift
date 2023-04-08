//
//  TableViewProtocol.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

protocol SXTableViewProtocol {
    associatedtype Cell: SXTableCellProtocol
    var data: [Cell.Model] { get set }
    func reloadData()
}
