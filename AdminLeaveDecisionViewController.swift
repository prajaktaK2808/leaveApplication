

import UIKit

class AdminLeaveDecisionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    
    @IBOutlet weak var IdDec: UITextField!
    @IBOutlet weak var NameDec: UITextField!
    @IBOutlet weak var LastNameDec: UITextField!
    @IBOutlet weak var ToDateDec: UITextField!
    @IBOutlet weak var FromDateDec: UITextField!
    @IBOutlet weak var LeaveTypeDec: UITextField!
    @IBOutlet weak var DescriptionDec: UITextView!
    @IBOutlet weak var LeaveActionDec: UITextField!
    
    var StudId:String?
    
    var LeaveStudIdArrayDec = [String]()
    var LeaveStudTypeArrayDec = [String]()
    var LeaveStudToDateArrayDec = [String]()
    var LeaveStudFromDateArrayDec = [String]()
    var LeaveStudDescriptionArrayDec = [String]()
    var LeaveStudActionArrayDec = [String]()
    var LeaveStudFirstNameArrayDec = [String]()
    var LeaveStudLastNameArrayDec = [String]()

    var DecisionArray = [String]()
    
    
    
    @IBOutlet weak var DecisionTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DecisionTableView.delegate = self
        DecisionTableView.dataSource = self
        DecisionTableView.isHidden = true
        
        DecisionArray = ["Accepted","Rejected"]
        
        IdDec.text = StudId
        
        let select = "select * from StudRegistration where StudId ='\(IdDec.text!)'"
        DBWrapper.sharedObj.StudentAllData(query: select)
        if DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0
        {
            LeaveStudFirstNameArrayDec = DBWrapper.sharedObj.Stude_Add_fname_Array
            LeaveStudLastNameArrayDec = DBWrapper.sharedObj.Stude_Add_lname_Array
            
            NameDec.text = LeaveStudFirstNameArrayDec[0]
            LastNameDec.text = LeaveStudLastNameArrayDec[0]
        }
        else
        {
            print("Not Found Records")
        }
        
        let showData = "select * from StudLeave where StudId ='\(IdDec.text!)' and LeaveAction ='Pending'"
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudTypeArray.count > 0 && DBWrapper.sharedObj.LeaveStudToDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudFromDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudDescriptionArray.count > 0
        {
            LeaveStudTypeArrayDec = DBWrapper.sharedObj.LeaveStudTypeArray
            LeaveStudToDateArrayDec = DBWrapper.sharedObj.LeaveStudToDateArray
            LeaveStudFromDateArrayDec = DBWrapper.sharedObj.LeaveStudFromDateArray
            LeaveStudDescriptionArrayDec = DBWrapper.sharedObj.LeaveStudDescriptionArray
            
            print(LeaveStudToDateArrayDec)
            ToDateDec.text = LeaveStudToDateArrayDec[0]
            FromDateDec.text = LeaveStudFromDateArrayDec[0]
            LeaveTypeDec.text = LeaveStudTypeArrayDec[0]
            DescriptionDec.text = LeaveStudDescriptionArrayDec[0]
        }
        else
        {
            print("Failed")
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DecisionArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = DecisionArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        LeaveActionDec.text = cell!.textLabel!.text!
        DecisionTableView.isHidden = true
    }
    @IBOutlet weak var SelectBtnDec: UIButton!
    @IBAction func SelectBtnAction(_ sender: UIButton)
    {
        if DecisionTableView.isHidden == true
        {
            DecisionTableView.isHidden = false
        }
        else
        {
            DecisionTableView.isHidden = true
        }
    }
    
    
    @IBOutlet weak var DecisionActonOutlet: UIButton!
    @IBOutlet weak var CancelActionOutlet: UIButton!
    
    @IBAction func DecisionActionData(_ sender: UIButton)
    {
        let update1 = "update StudLeave set LeaveAction = '\(LeaveActionDec.text!)' where StudId = '\(IdDec.text!)' and LeaveType = '\(LeaveTypeDec.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: update1)
        if isSuccess
        {
            print("Success")
        }
        else
        {
            print("Not")
        }
    }
    
    @IBAction func CalcelActionData(_ sender: UIButton)
    {
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

}
