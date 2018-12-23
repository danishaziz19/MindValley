//
//  BoardViewController.swift
//  Project_Challenge
//
//  Created by Danish on 21/12/2018.
//  Copyright © 2018 Danish. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!

    private var isLoadingMore = false
    private var isAllItemLoaded = false
    private var finishedLoadingInitialTableCells = false
    var maxItemsLoad: Int = 10
    var itemLoad: Int = 0
    let threshold = 0
    var boardModels: [BoardModel] = []

    let boardURL: String = "https://pastebin.com/raw/wgkJgazE"

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refreshList(_:)),
                                 for: UIControl.Event.valueChanged)

        return refreshControl
    }()

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
        Model().getBoards(url: self.boardURL) { boardModels, error in
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "userViewController", sender: self)
        self.tableview.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var lastInitialDisplayableCell = false
        //change flag as soon as last displayable cell is being loaded (which will mean table has initially loaded)
        if boardModels.count > 0 && !finishedLoadingInitialTableCells {
            if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
                let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
                lastInitialDisplayableCell = true
            }
        }

        if !finishedLoadingInitialTableCells {
            if lastInitialDisplayableCell {
                finishedLoadingInitialTableCells = true
            }
            //animates the cell as it is being displayed for the first time
            cell.transform = CGAffineTransform(translationX: 0, y: 75)
            cell.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
        }
    }

    // load More data
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;

        if !isLoadingMore && !isAllItemLoaded && (Int(maximumOffset - contentOffset)) <= threshold {
            // Get more data - API call
            self.isLoadingMore = true
            self.loadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userViewController = segue.destination as? UserViewController {
            if let indexPath = self.tableview.indexPathForSelectedRow {
                userViewController.boardModel = boardModels[indexPath.row]
            }
        }
    }
}
