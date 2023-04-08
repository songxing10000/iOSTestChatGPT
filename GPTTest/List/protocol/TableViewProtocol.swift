//
//  TableViewProtocol.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

protocol TableViewProtocol {
    associatedtype Cell: TableCellProtocol
    var data: [Cell.Model] { get set }
    func reloadData()
}
