import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var nestedObj = [NestedModal]()
    // var objectiveArr = ["Objective 1", "Objective 2"]
    var keyResultsArr = ["Key Result1", "Key Result 2", "Key Result 3"]
    var roleArr = ["Role 1","Role 2","Role 3","Role 4"]
    var cellHeight = CGFloat()
    
    
    var commonTag = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataAppent()
        tableView.separatorStyle = .none
    }
    
    fileprivate func dataAppent() {
        // Do any additional setup after loading the view.
        var objectiveArr = [objectiveModal]()
        var resultArray = [resultModal]()
        nestedObj = [NestedModal]()
        
        resultArray.append(resultModal(roleName: "Key Result 1", isRoleExpanded: false, resultTag: 2))
        resultArray.append(resultModal(roleName: "Key Result 2", isRoleExpanded: false, resultTag: 2))
        resultArray.append(resultModal(roleName: "Key Result 3", isRoleExpanded: false, resultTag: 2))
        resultArray.append(resultModal(roleName: "Key Result 4", isRoleExpanded: false, resultTag: 2))
        
        objectiveArr.append(objectiveModal(isObjectExpanded: false, objectName: "Objective 1", resultArr: resultArray, objectiveTag: 1))
        objectiveArr.append(objectiveModal(isObjectExpanded: false, objectName: "Objective 2", resultArr: resultArray, objectiveTag: 1))
        objectiveArr.append(objectiveModal(isObjectExpanded: false, objectName: "Objective 3", resultArr: resultArray, objectiveTag: 1))
        objectiveArr.append(objectiveModal(isObjectExpanded: false, objectName: "Objective 4", resultArr: resultArray, objectiveTag: 1))
        
        for i in 0..<4 {
            nestedObj.append(NestedModal(role: roleArr[i], objective: objectiveArr, isExpanded: false, roleTag: 0))
        }
    }
    
    
    @objc func btnTapAction (sender:UIButton) {
        if nestedObj[sender.tag].isExpanded == false {
            dataAppent()
            nestedObj[sender.tag].isExpanded = true
            tableView.reloadData()
        }
        else {
            nestedObj[sender.tag].isExpanded = false
            tableView.reloadData()
        }
    }
    
    @objc func btnTapActionObjective (sender: UIButton) {
        let row = sender.tag % 100
        let sec = sender.tag / 100
        if nestedObj[sec].objective?[row].isObjectExpanded == false {
            for i in 0..<nestedObj[sec].objective!.count {
                if nestedObj[sec].objective?[i].isObjectExpanded == true {
                    nestedObj[sec].objective?[i].isObjectExpanded = false
                }
            }
            nestedObj[sec].objective?[row].isObjectExpanded = true
            tableView.reloadData()
        }
        else {
            nestedObj[sec].objective?[row].isObjectExpanded = false
            tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nestedObj.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nestedObj[section].roleTag == 0 && nestedObj[section].isExpanded == true {
//            for i in 0..<nestedObj[section].objective!.count {
//                if nestedObj[section].objective?[i].isObjectExpanded == true {
//                    return (nestedObj[section].objective?.count ?? 0) + (nestedObj[section].objective?[i].resultArr?.count ?? 0)
//                }
//            }
            return nestedObj[section].objective?.count ?? 0
        }
            
//        else if nestedObj[section].objective?[section].objectiveTag == 1 && nestedObj[section].objective?[section].isObjectExpanded == true {
//            return nestedObj[section].objective?[section].resultArr?.count ?? 0
//        }
        
        else {
            return 0
        }
      //  return nestedObj.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if nestedObj[indexPath.section].isExpanded == true {
            
            let cell1 = self.tableView.dequeueReusableCell(withIdentifier: "ObjectiveCellTableViewCell") as! ObjectiveCellTableViewCell
            cell1.btnObjectiveOutlet.tag = (indexPath.section * 100) + indexPath.row
            cell1.btnObjectiveOutlet.addTarget(self, action: #selector(btnTapActionObjective), for: .touchUpInside)
            cell1.lblObjective.text = nestedObj[indexPath.section].objective?[indexPath.row].objectName
            cell1.tableHeightConstraint.constant = 0
            if nestedObj[indexPath.section].objective?[indexPath.row].isObjectExpanded == true {

                if let array = nestedObj[indexPath.section].objective?[indexPath.row].resultArr {
                    cell1.tableHeightConstraint.constant = CGFloat(30 * array.count)
                    cell1.cellDataArray = array
                }
            }
            return cell1
        }
//        else if nestedObj[indexPath.section].objective?[indexPath.row].isObjectExpanded == true {
//            let cell2 = self.tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as! ResultTableViewCell
//            cell2.lblResult.text = nestedObj[indexPath.section].objective?[indexPath.section].resultArr?[indexPath.row].roleName
//            return cell2
//        }
            
            
        else {
//            let cell = self.tableView.dequeueReusableCell(withIdentifier: "RoleTableViewCell") as! RoleTableViewCell
//            cell.lblRole.text = nestedObj[indexPath.row].role
//             return cell
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if nestedObj[indexPath.row].isExpanded == true {
//            return 70
//        }
        return UITableView.automaticDimension
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RoleTableViewCell") as! RoleTableViewCell
        cell.lblRole.text = nestedObj[section].role
        cell.btnRole.tag = section
        cell.btnRole.addTarget(self, action: #selector(btnTapAction), for: .touchUpInside)
         return cell
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if nestedObj[indexPath.section].objective?[indexPath.row].isObjectExpanded == false {
            nestedObj[indexPath.section].objective?[indexPath.row].isObjectExpanded = true
        }
        else {
            nestedObj[indexPath.section].objective?[indexPath.row].isObjectExpanded = false
        }
        
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        
    }
    
}




