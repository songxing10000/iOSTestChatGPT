//
//  TableViewImpl.swift
//  GPTTest
//
//  Created by mac on 2023/4/8.
//

import UIKit
class SXTableViewImpl<Cell: UITableViewCell & SXTableCellProtocol, ViewModel>: UIViewController, UITableViewDataSource, UITableViewDelegate, SXTableViewProtocol where Cell.Model == ViewModel {
    
    var tableView: UITableView!
    var data: [ViewModel] = []
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(style: UITableView.Style = .plain) {
        super.init(nibName: nil, bundle: nil)
        tableView = UITableView(frame: view.frame, style: .plain)
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
