
import UIKit

class AdminShowNotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var ShowStudIdAdminArray = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TableViewLeave.delegate = self
        TableViewLeave.dataSource = self
       // StudLeave(StudId text,LeaveType text,LeaveToDate text,LeaveFromDate text,LeaveDescription text,LeaveAction text)
        
        let showData = "select * from StudLeave where LeaveAction ='Pending'"
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudIdArray.count > 0
        {
            ShowStudIdAdminArray = DBWrapper.sharedObj.LeaveStudIdArray
            print(ShowStudIdAdminArray)
        }
        else
        {
            ShowAlertMessage11()
        }

    }
    func ShowAlertMessage11()
    {
        let alertController = UIAlertController(title: "Data Not Found", message:
            "There is no data...", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var TableViewLeave: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ShowStudIdAdminArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = ShowStudIdAdminArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        let decision = self.storyboard?.instantiateViewController(withIdentifier: "AdminLeaveDecisionViewController") as! AdminLeaveDecisionViewController
        decision.StudId = cell?.textLabel!.text!
        navigationController?.pushViewController(decision, animated: true)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
