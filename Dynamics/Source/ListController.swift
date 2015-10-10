//
//  ListController.swift
//  Dynamics
//
//  Created by Julian Grosshauser on 09/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class ListController: UITableViewController {

    //MARK: Properties

    private var items: [UIViewController.Type] = []

    //MARK: Initialization

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        items.append(ImageFlickController.self)
    }

    //MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell")!

        let item = items[indexPath.row]
        cell.textLabel?.text = String(item)

        return cell
    }

    //MARK: UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = items[indexPath.row].init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
