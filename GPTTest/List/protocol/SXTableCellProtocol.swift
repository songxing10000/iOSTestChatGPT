//
//  TableCellProtocol.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//
import Reusable
protocol SXTableCellProtocol:NibReusable {
    associatedtype Model
    func configCell(data: Model)
}

