//
//  TableCellProtocol.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//
 
protocol SXTableCellProtocol {
    associatedtype Model
    func configCell(data: Model)
    static var cellId: String { get }
}

