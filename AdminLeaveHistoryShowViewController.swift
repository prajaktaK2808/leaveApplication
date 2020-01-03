

import UIKit

class AdminLeaveHistoryShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    var StudLeaveHistoryArrayData = [String]()
    var StudLeaveHistoryActionArrayData = [String]()
    var StudLeaveHistoryTypeArrayData = [String]()

    
    @IBOutlet weak var TableViewHistory: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        TableViewHistory.delegate = self
        TableViewHistory.dataSource = self
        
       // where LeaveAction !='Pending'
        
        let showData = "select * from StudLeave where LeaveAction ='Accepted' or LeaveAction = 'Rejected'"
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudIdArray.count > 0 && DBWrapper.sharedObj.LeaveStudActionArray.count > 0 && DBWrapper.sharedObj.LeaveStudTypeArray.count > 0
        {
            StudLeaveHistoryArrayData = DBWrapper.sharedObj.LeaveStudIdArray
            StudLeaveHistoryActionArrayData = DBWrapper.sharedObj.LeaveStudActionArray
            StudLeaveHistoryTypeArrayData = DBWrapper.sharedObj.LeaveStudTypeArray

           // print(StudLeaveHistoryTypeArrayData)
        }
        else
        {
            ShowAlertMessage11()

        }

    }

    func ShowAlertMessage11()
    {
        let alertController = UIAlertController(title: "Data Not Found", message:
            "No Data Found", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return StudLeaveHistoryArrayData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = StudLeaveHistoryArrayData[indexPath.row]
        cell.detailTextLabel?.text = StudLeaveHistoryActionArrayData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       let cell = tableView.cellForRow(at: indexPath)
        let decision = self.storyboard?.instantiateViewController(withIdentifier: "ShowAdminHistoryViewController") as! ShowAdminHistoryViewController
       decision.ShowIdHistory = cell?.textLabel!.text!
        decision.ShowType = cell?.detailTextLabel!.text!
        decision.LeaveDemo = StudLeaveHistoryTypeArrayData[indexPath.row]
        navigationController?.pushViewController(decision, animated: true)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

}
