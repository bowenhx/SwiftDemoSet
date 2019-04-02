//
//  HomeTableViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/4.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    public var dataSource = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.append("SwiftJsonViewController")
        dataSource.append("ViewController")
    }

    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.showNextController(className: dataSource[indexPath.row], isPush: true)
//        let viewController = ViewController.init(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
//        self.navigationController?.pushViewController(viewController, animated: true)

    }

}
