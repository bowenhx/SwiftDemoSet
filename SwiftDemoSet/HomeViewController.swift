//
//  HomeTableViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/4.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    public var dataSource = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.append("SwiftJsonViewController")
        dataSource.append("ViewController")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showNextController(className: dataSource[indexPath.row], isPush: true)
//        let viewController = ViewController.init(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
//        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}
