
import UIKit
class ApplyLeaveViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    
    @IBOutlet weak var StudIdL: UITextField!
    @IBOutlet weak var SelectLeaveL: UITextField!
    @IBOutlet weak var SelectDataToL: UITextField!
    @IBOutlet weak var SelectDateFromL: UITextField!
    @IBOutlet weak var OtherLeaveL: UITextField!
    @IBOutlet weak var LeaveDescriptionL: UITextView!
    
    var LeaveTypeArray = [String]()
    
    var LeaveIdArrayL = [String]()
    var leaveNameArrayL = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        StudIdL.text = SID
        
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.isHidden = true
        
        OtherLeaveL.isHidden = true
        SelectLeaveL.isEnabled = false
        SelectDateFromL.isEnabled = false
        SelectDataToL.isEnabled = false
        
        DatePickerView1.isHidden = true
       DatePickerView2Outlet.isHidden = true
        
        // Leave(LeaveId text,LeaveName text)
        let selectLeave = "select LeaveId,LeaveName from Leave"
        DBWrapper.sharedObj.LeaveAllData(query: selectLeave)
        if DBWrapper.sharedObj.LeaveIdArray.count > 0 && DBWrapper.sharedObj.LeaveNameArray.count > 0
        {
            LeaveIdArrayL = DBWrapper.sharedObj.LeaveIdArray
            leaveNameArrayL = DBWrapper.sharedObj.LeaveNameArray
            print(LeaveIdArrayL)
            print(leaveNameArrayL)
        }
        

    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return leaveNameArrayL.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = leaveNameArrayL[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        SelectLeaveL.text = cell?.textLabel?.text
        tableView.isHidden = true
        if cell?.textLabel?.text == "Other Leave"
        {
            OtherLeaveL.isHidden = false
        }
        else
        {
            OtherLeaveL.isHidden = true
        }
    }
    
    
    @IBOutlet weak var SelectLeavebtnOutlet: UIButton!
    @IBAction func SelectLeavebtnAction(_ sender: UIButton)
    {
        if TableView.isHidden == true
        {
            TableView.isHidden = false
        }
        else
        {
            TableView.isHidden = true
        }
        
        if SelectLeaveL.text == ""
        {
            OtherLeaveL.isHidden = true
        }
        else if SelectLeaveL.text == "Other Leave"
        {
            OtherLeaveL.isHidden = false
        }
        else
        {
            OtherLeaveL.isHidden = true
        }
    }
    
    
    
    @IBOutlet weak var DatePickerView1: UIDatePicker!
    @IBAction func DatePickerView1Action(_ sender: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        //dateFormatter.timeStyle = DateFormatter.Style.short
        
        let toDate = dateFormatter.string(from: DatePickerView1.date)
        SelectDataToL.text = toDate
        DatePickerView1.isHidden = true
    }
    
    @IBOutlet weak var SelectLeaveDateTobtnOutlet: UIButton!
    @IBAction func SelectLeaveDateTotbnAction(_ sender: UIButton)
    {
        if DatePickerView1.isHidden == true
        {
            DatePickerView1.isHidden = false
        }
        else
        {
            DatePickerView1.isHidden = true
        }
    }
    
    @IBOutlet weak var DatePickerView2Outlet: UIDatePicker!
    @IBAction func DatePickerView2Action(_ sender: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        //dateFormatter.timeStyle = DateFormatter.Style.short
        
        let toDate = dateFormatter.string(from: DatePickerView2Outlet.date)
        SelectDateFromL.text = toDate
        DatePickerView2Outlet.isHidden = true
    }

    @IBOutlet weak var SelectLeaveFrombtnOutlet: UIButton!
    @IBAction func SelectLeaveFrombtnAction(_ sender: UIButton)
    {
        if DatePickerView2Outlet.isHidden == true
        {
            DatePickerView2Outlet.isHidden = false
        }
        else
        {
            DatePickerView2Outlet.isHidden = true
        }
    }
    
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var ApplybtnOutlet: UIButton!
    @IBAction func ApplybtnAction(_ sender: UIButton)
    {
       /* let del = "delete from Leave where LeaveId = '\(SelectDataToL.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: del)
        if isSuccess
        {
            print("dno")
        }*/
        var selectLeaveType:String?
        if SelectLeaveL.text == "Other Leave"
        {
            selectLeaveType = OtherLeaveL.text
        }
        else
        {
            selectLeaveType = SelectLeaveL.text
        }
        
        print(selectLeaveType!)
        
       let TakeAction = "Pending"
        
        //StudLeave(StudId text,LeaveType text,LeaveToDate text,LeaveFromDate text,LeaveDescription text,LeaveAction text)
        let insertleave = "insert into StudLeave values('\(StudIdL.text!)','\(selectLeaveType!)','\(SelectDataToL.text!)','\(SelectDateFromL.text!)','\(LeaveDescriptionL.text!)','\(TakeAction)')"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insertleave)
        if isSuccess
        {
            print("Success")
        }
        else
        {
            print("Not")
        }
        
        
    }
    
    @IBOutlet weak var CancelbtnOutlet: UIButton!
    @IBAction func CancelbtnAction(_ sender: UIButton)
    {
        
    }
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
