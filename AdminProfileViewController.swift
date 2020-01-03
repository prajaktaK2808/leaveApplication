
import UIKit

class AdminProfileViewController: UIViewController
{

    var AdminFNameArray = [String]()
    var AdminLNameArray = [String]()
    var AdminUNameArray = [String]()
    var AdminPsArray = [String]()
    
    
    
    @IBOutlet weak var FirstNameA: UITextField!
    @IBOutlet weak var LastNameA: UITextField!
    @IBOutlet weak var PasswordA: UITextField!
    @IBOutlet weak var UserNameA: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let selectAdmin = "select * from AdminLogin"
        DBWrapper.sharedObj.AdminData(query: selectAdmin)
        if DBWrapper.sharedObj.AdminLoginFNArray.count > 0 && DBWrapper.sharedObj.AdminLoginLNArray.count > 0 && DBWrapper.sharedObj.AdminLoginUNArray.count > 0 && DBWrapper.sharedObj.AdminLoginPSArray.count > 0
        {
            AdminFNameArray = DBWrapper.sharedObj.AdminLoginFNArray
            AdminLNameArray = DBWrapper.sharedObj.AdminLoginLNArray
            AdminUNameArray = DBWrapper.sharedObj.AdminLoginUNArray
            AdminPsArray = DBWrapper.sharedObj.AdminLoginPSArray
            
        }
        else
        {
            print("Failed")
        }

        FirstNameA.text = AdminFNameArray[0]
        LastNameA.text = AdminLNameArray[0]
        UserNameA.text = AdminUNameArray[0]
        PasswordA.text = AdminPsArray[0]

    }

    
    
    @IBOutlet weak var UpdateAOutlet: UIButton!
    @IBOutlet weak var CancelAOutlet: UIButton!
    
    @IBAction func UpdateActionData(_ sender: UIButton)
    {
        //AdminLogin(FirstName text,LastName text,UserName text,Password text)
        let updatePs = "update AdminLogin set FirstName ='\(FirstNameA.text!)', LastName = '\(LastNameA.text!)' ,UserName = '\(UserNameA.text!)' ,Password = '\(PasswordA.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)
        if isSuccess
        {
            print("success")
            Clear()
        }
        else
        {
            print("Failed")
        }
    }
    
    @IBAction func CancelActionData(_ sender: UIButton)
    {
        Clear()
    }
    func Clear()
    {
        FirstNameA.text = ""
        LastNameA.text = ""
        UserNameA.text = ""
        PasswordA.text = ""
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
