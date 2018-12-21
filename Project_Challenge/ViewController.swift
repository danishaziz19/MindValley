//
//  ViewController.swift
//  Project_Challenge
//
//  Created by Danish on 21/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refreshList(_:)),
                                 for: UIControl.Event.valueChanged)

        return refreshControl
    }()

    var isLoadingMore = false // flag
    var isAllItemLoaded = false // flag
    var maxItemsLoad: Int = 10
    var itemLoad: Int = 0
    let threshold = 0
    var boardModels: [BoardModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.setUp()
    }

    func setUp() {
        self.tableview.addSubview(self.refreshControl)
        self.loadData()
    }

    func loadData() {
        Model().getBoards(url: "https://pastebin.com/raw/wgkJgazE") { (boardModels, error) in
            if let boardModels = boardModels {
                let boardModel = boardModels[self.itemLoad..<self.maxItemsLoad]
                if boardModel.count > 0 {
                    for model in boardModels[self.itemLoad..<self.maxItemsLoad] {
                        self.boardModels.append(model)
                        self.itemLoad += 1
                    }
                } else {
                    self.isAllItemLoaded = true
                }
                //self.boardModels = boardModels
            }
            DispatchQueue.main.async {
                 self.refreshControl.endRefreshing()
                 self.tableview.reloadData()
                 self.isLoadingMore = false
            }
        }
    }

    // MARK: - UIRefreshControl

    @objc
    func refreshList(_ refreshControl: UIRefreshControl) {
       self.boardModels.removeAll()
       self.itemLoad = 0
       self.loadData()
    }

    // MARK: - TableView Delegate

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let node = tableview.dequeueReusableCell(withIdentifier: "boardCell", for: indexPath) as? BoardTableViewCell {
            node.setCell(boardModel: boardModels[indexPath.row])
            return node
        } else {
            return UITableViewCell()
        }
    }

    // load More data
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;

        if !isLoadingMore && !isAllItemLoaded && (Int(maximumOffset - contentOffset)) <= threshold {
            // Get more data - API call
            self.isLoadingMore = true

            print("load more")
            // load more data
            self.loadData()
        }
    }
}
