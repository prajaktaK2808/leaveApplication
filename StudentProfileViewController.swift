

import UIKit

class StudentProfileViewController: UIViewController
{

    
    @IBOutlet weak var StudIdP: UITextField!
    @IBOutlet weak var FirstNameP: UITextField!
    @IBOutlet weak var LastNameP: UITextField!
    @IBOutlet weak var MobileP: UITextField!
    @IBOutlet weak var EmailP: UITextField!
    @IBOutlet weak var UserNameP: UITextField!
    @IBOutlet weak var PasswordP: UITextField!
    @IBOutlet weak var DepartmentP: UITextField!
    
    
    var Stude_Add_Id_Array_P = [String]()
    var Stude_Add_fname_Array_P = [String]()
    var Stude_Add_lname_Array_P = [String]()
    var Stude_Add_mobile_Array_P = [String]()
    var Stude_Add_email_Array_P = [String]()
    var Stude_Add_username_Array_P = [String]()
    var Stude_Add_password_Array_P = [String]()
    var Stude_Add_departmetn_Array_P = [String]()

    var DepartmentAddP = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        let SFN = UserDefaults.standard.value(forKey: "SFN") as! String
        let SLN = UserDefaults.standard.value(forKey: "SLN") as! String
        print(SID)
        print(SFN)
        print(SLN)
        
        let selectStud = "select StudId,FirstName,LastName,Mobile,EmailId,UserName,Password,Department from StudRegistration where StudId='\(SID)'"
        DBWrapper.sharedObj.StudentAllData(query: selectStud)
        if DBWrapper.sharedObj.Stude_Add_Id_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_mobile_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_email_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_username_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_password_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_departmetn_Array.count > 0
        {
            Stude_Add_Id_Array_P = DBWrapper.sharedObj.Stude_Add_Id_Array
            Stude_Add_fname_Array_P = DBWrapper.sharedObj.Stude_Add_fname_Array
            Stude_Add_lname_Array_P = DBWrapper.sharedObj.Stude_Add_lname_Array
            Stude_Add_mobile_Array_P = DBWrapper.sharedObj.Stude_Add_mobile_Array
            Stude_Add_email_Array_P = DBWrapper.sharedObj.Stude_Add_email_Array
            Stude_Add_username_Array_P = DBWrapper.sharedObj.Stude_Add_username_Array
            Stude_Add_password_Array_P = DBWrapper.sharedObj.Stude_Add_password_Array
            Stude_Add_departmetn_Array_P = DBWrapper.sharedObj.Stude_Add_departmetn_Array
            
            //FETCH DATA FOR TEXT
            StudIdP.text = Stude_Add_Id_Array_P[0]
            FirstNameP.text = Stude_Add_fname_Array_P[0]
            LastNameP.text = Stude_Add_lname_Array_P[0]
            MobileP.text = Stude_Add_mobile_Array_P[0]
            EmailP.text = Stude_Add_email_Array_P[0]
            UserNameP.text = Stude_Add_username_Array_P[0]
            PasswordP.text = Stude_Add_password_Array_P[0]
            DepartmentP.text = Stude_Add_departmetn_Array_P[0]
        }
        else
        {
            print("Failed")
        }

        let selectDept = "select * from StudDepartment"
        DBWrapper.sharedObj.DepartmentAllData(query: selectDept)
        if DBWrapper.sharedObj.DepartmentSNArrayData.count > 0
        {
            DepartmentAddP = DBWrapper.sharedObj.DepartmentSNArrayData
        }

    }
    
    func ShowAgin()
    {
        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        let selectStud = "select StudId,FirstName,LastName,Mobile,EmailId,UserName,Password,Department from StudRegistration where StudId='\(SID)'"
        DBWrapper.sharedObj.StudentAllData(query: selectStud)
        if DBWrapper.sharedObj.Stude_Add_Id_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_mobile_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_email_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_username_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_password_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_departmetn_Array.count > 0
        {
            Stude_Add_Id_Array_P = DBWrapper.sharedObj.Stude_Add_Id_Array
            Stude_Add_fname_Array_P = DBWrapper.sharedObj.Stude_Add_fname_Array
            Stude_Add_lname_Array_P = DBWrapper.sharedObj.Stude_Add_lname_Array
            Stude_Add_mobile_Array_P = DBWrapper.sharedObj.Stude_Add_mobile_Array
            Stude_Add_email_Array_P = DBWrapper.sharedObj.Stude_Add_email_Array
            Stude_Add_username_Array_P = DBWrapper.sharedObj.Stude_Add_username_Array
            Stude_Add_password_Array_P = DBWrapper.sharedObj.Stude_Add_password_Array
            Stude_Add_departmetn_Array_P = DBWrapper.sharedObj.Stude_Add_departmetn_Array
            
            //FETCH DATA FOR TEXT
            StudIdP.text = Stude_Add_Id_Array_P[0]
            FirstNameP.text = Stude_Add_fname_Array_P[0]
            LastNameP.text = Stude_Add_lname_Array_P[0]
            MobileP.text = Stude_Add_mobile_Array_P[0]
            EmailP.text = Stude_Add_email_Array_P[0]
            UserNameP.text = Stude_Add_username_Array_P[0]
            PasswordP.text = Stude_Add_password_Array_P[0]
            DepartmentP.text = Stude_Add_departmetn_Array_P[0]
        }
        else
        {
            print("Failed")
        }

    }
    
    @IBOutlet weak var UpdateOutlet: UIButton!
    @IBOutlet weak var CancelOutlte: UIButton!
    
    @IBAction func UpdateAction(_ sender: UIButton)
    {
        let updatePs = "update StudRegistration set FirstName ='\(FirstNameP.text!)', LastName='\(LastNameP.text!)', Mobile='\(MobileP.text!)', EmailId='\(EmailP.text!)', UserName='\(UserNameP.text!)', Password='\(PasswordP.text!)', Department='\(DepartmentP.text!)' where StudId = '\(StudIdP.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)
        if isSuccess
        {
            print("success")
            ShowAgin()
            
        }
        else
        {
            print("Failed")
        }
    }
    
    @IBAction func CancelAction(_ sender: UIButton)
    {
        ClearData()
    }
    
    
    func ClearData()
    {
        StudIdP.text = ""
        FirstNameP.text = ""
        LastNameP.text = ""
        MobileP.text = ""
        EmailP.text = ""
        UserNameP.text = ""
        PasswordP.text = ""
        DepartmentP.text = ""
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
