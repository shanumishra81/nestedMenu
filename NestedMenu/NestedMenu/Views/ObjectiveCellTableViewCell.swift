//
//  ObjectiveCellTableViewCell.swift
//  NestedMenu
//
//  Created by Shanu on 24/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import UIKit

class ObjectiveCellTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblObjective: UILabel!
    @IBOutlet weak var btnObjectiveOutlet: UIButton!
    @IBOutlet weak var tableViewInsideCell: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    var cellDataArray = [resultModal]() {
        didSet {
            DispatchQueue.main.async {
                self.tableViewInsideCell.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableViewInsideCell.delegate = self
        tableViewInsideCell.dataSource = self
        tableViewInsideCell.separatorStyle = . none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return cellDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = self.tableViewInsideCell.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as! ResultTableViewCell
        cell2.lblResult.text = cellDataArray[indexPath.row].roleName
        return cell2
    }
    
}
