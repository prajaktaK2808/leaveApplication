
import UIKit

class ShowAdminHistoryViewController: UIViewController
{

    
    
    @IBOutlet weak var StudIdHistory: UITextField!
    @IBOutlet weak var StudFirstHistory: UITextField!
    @IBOutlet weak var StudLastHistory: UITextField!
    @IBOutlet weak var ToDateHistory: UITextField!
    @IBOutlet weak var FromDateHistory: UITextField!
    @IBOutlet weak var TypeHistory: UITextField!
    @IBOutlet weak var DecisionHistory: UITextField!
    @IBOutlet weak var DescriptionHistory: UITextView!
    
    var LeaveStudIdArrayHis = [String]()
    var LeaveStudFirstNameArrayHis = [String]()
    var LeaveStudLastNameArrayHis = [String]()
    var LeaveStudToDateArrayHis = [String]()
    var LeaveStudFromDateArrayHis = [String]()
    var LeaveStudTypeArrayHis = [String]()
    var LeaveStudDecisionArrayHis = [String]()
    var LeaveStudDescriptionArrayHis = [String]()
    var LeaveStudActionArrayHis = [String]()


    var ShowIdHistory:String?
    var ShowType:String?
    var ShowDemo:String?
    var LeaveDemo:String?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        StudIdHistory.text = ShowIdHistory
        ShowDemo = ShowType
       // print(ShowDemo!)
        print(LeaveDemo!)
        let select = "select * from StudRegistration where StudId ='\(StudIdHistory.text!)'"
        DBWrapper.sharedObj.StudentAllData(query: select)
        if DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0
        {
            LeaveStudFirstNameArrayHis = DBWrapper.sharedObj.Stude_Add_fname_Array
            LeaveStudLastNameArrayHis = DBWrapper.sharedObj.Stude_Add_lname_Array
            
            StudFirstHistory.text = LeaveStudFirstNameArrayHis[0]
            StudLastHistory.text = LeaveStudLastNameArrayHis[0]
        }
        else
        {
            print("Not Found Records")
        }
        
        let showData = "select * from StudLeave where StudId ='\(StudIdHistory.text!)' and LeaveAction ='\(ShowDemo!)' and LeaveType ='\(LeaveDemo!)'"
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudTypeArray.count > 0 && DBWrapper.sharedObj.LeaveStudToDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudFromDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudDescriptionArray.count > 0 && DBWrapper.sharedObj.LeaveStudActionArray.count > 0
        {
            LeaveStudTypeArrayHis = DBWrapper.sharedObj.LeaveStudTypeArray
            LeaveStudToDateArrayHis = DBWrapper.sharedObj.LeaveStudToDateArray
            LeaveStudFromDateArrayHis = DBWrapper.sharedObj.LeaveStudFromDateArray
            LeaveStudDescriptionArrayHis = DBWrapper.sharedObj.LeaveStudDescriptionArray
            LeaveStudActionArrayHis = DBWrapper.sharedObj.LeaveStudActionArray
            
            //print(LeaveStudTypeArrayHis)
            ToDateHistory.text = LeaveStudToDateArrayHis[0]
            FromDateHistory.text = LeaveStudFromDateArrayHis[0]
            TypeHistory.text = LeaveStudTypeArrayHis[0]
            DescriptionHistory.text = LeaveStudDescriptionArrayHis[0]
            DecisionHistory.text = LeaveStudActionArrayHis[0]
            
        }
        else
        {
            print("Failed")
        }

    }

    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
