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

    private var items: [(title: String, controller: UIViewController.Type)] = []

    //MARK: Initialization

    init() {
        super.init(style: .Plain)
        title = "Dynamics"

        items.append((title: "Image Flick", controller: ImageFlickController.self))
        items.append((title: "Gyroscope", controller: GyroscopeController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(ListCell.self, forCellReuseIdentifier: String(ListCell))
    }

    //MARK: UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(ListCell)) as! ListCell

        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = String(item.controller)
        cell.accessoryType = .DisclosureIndicator

        return cell
    }

    //MARK: UITableViewDelegate

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = items[indexPath.row].controller.init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
