//
//  MenuTableViewController.swift
//  TestMenuBar
//
//  Created by Timur Isaev on 20.01.2021.
//

import UIKit

protocol MenuViewControllerDelegate {
    func showHideMenu(withItem item: MenuStruct?)
}

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: MenuViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView() {
        //tableView.separatorStyle = .none
        tableView.separatorColor = .white
        tableView.backgroundColor = .darkGray
        tableView.rowHeight = 50
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: 1))
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.showHideMenu(withItem: nil)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        let currentItemArray = menuArray[indexPath.row]
        cell.configureCell(withItem: currentItemArray)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = menuArray[indexPath.row]
        delegate?.showHideMenu(withItem: item)
    }
}
