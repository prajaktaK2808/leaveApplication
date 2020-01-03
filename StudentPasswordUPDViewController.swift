

import UIKit

class StudentPasswordUPDViewController: UIViewController
{

    
    @IBOutlet weak var StudId: UITextField!
    @IBOutlet weak var NewPassword: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        StudId.text = SID

    }
    
    @IBAction func ConfirmPasswordAction(_ sender: UITextField)
    {
        if NewPassword.text == "" && ConfirmPassword.text == ""
         {
         print("Plzz enter value in text fields")
         }
         else if NewPassword.text == ConfirmPassword.text
         {
         print("Success")
         }
         else
         {
         print("Not")
         }

    }
    
    
    @IBOutlet weak var UpdateOutlet: UIButton!
    @IBOutlet weak var CancelOutlet: UIButton!
    
    @IBAction func UpdateActionData(_ sender: UIButton)
    {
       /* let updatePs = "update StudRegistration set Password = '\(ConfirmPassword.text!)' where StudId = '\(StudId.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)*/
        
        let updatePs = "update StudRegistration set Password ='\(ConfirmPassword.text!)' where StudId = '\(StudId.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)
        if isSuccess
        {
            print("success")
        }
        else
        {
            print("not")
        }
    }
    
    @IBAction func CancelActionData(_ sender: UIButton)
    {
        StudId.text = ""
        NewPassword.text = ""
        ConfirmPassword.text = ""
    }
    
       override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
}
