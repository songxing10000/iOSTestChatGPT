//
//  TableViewImpl.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit
class TableViewImpl<Cell: UITableViewCell & TableCellProtocol, ViewModel>: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewProtocol where Cell.Model == ViewModel {
    
    var tableView: UITableView!
    var data: [ViewModel] = []
    
    convenience init(style: UITableView.Style = .plain) {
        self.init(nibName: nil, bundle: nil)
        tableView = UITableView(frame: view.frame, style: style)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellId)
        view.addSubview(tableView)
        tableView.frame = UIScreen.main.bounds
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellId, for: indexPath) as! Cell
        cell.configCell(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
