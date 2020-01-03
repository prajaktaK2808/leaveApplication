//
//  LoginViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 09/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var PasswordReOutlet: UIButton!
    @IBOutlet weak var AdminOutlet: UIButton!
    
    @IBOutlet weak var LoginOutlet: UIButton!
    @IBOutlet weak var CancleOutlet: UIButton!
    
    //var AdminLoginShowDataArray = [String]()
    
    var Stude_Add_Id_Array_L = [String]()
    var Stude_Add_fname_Array_L = [String]()
    var Stude_Add_lname_Array_L = [String]()
    var Stude_Add_mobile_Array_L = [String]()
    var Stude_Add_email_Array_L = [String]()
    var Stude_Add_username_Array_L = [String]()
    var Stude_Add_password_Array_L = [String]()
    var Stude_Add_departmetn_Array_L = [String]()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PasswordReOutlet.layer.borderWidth = 1
        PasswordReOutlet.layer.cornerRadius = 10
        PasswordReOutlet.layer.borderColor = UIColor.red.cgColor
        
        AdminOutlet.layer.borderWidth = 1
        AdminOutlet.layer.cornerRadius = 10
        AdminOutlet.layer.borderColor = UIColor.red.cgColor
        
        LoginOutlet.layer.borderWidth = 1
        LoginOutlet.layer.cornerRadius = 10
        LoginOutlet.layer.borderColor = UIColor.red.cgColor
        
        CancleOutlet.layer.borderWidth = 1
        CancleOutlet.layer.cornerRadius = 10
        CancleOutlet.layer.borderColor = UIColor.red.cgColor
        
       //START INSERT FOR ADMIN
       /* let fnameA = "Admin"
        let lnameA = "Admin"
        let usernameA = "Admin"
        let passwordA = "Admin"
        
        let insert = "insert into AdminLogin(FirstName,LastName,UserName ,Password) values('\(fnameA)','\(lnameA)','\(usernameA)','\(passwordA)')"
        let isSussecc = DBWrapper.sharedObj.executeQuery(query: insert)
        if isSussecc
        {
            print("Insertion:Success")
    
        }
        else
        {
            print("Failed")
        }*/

        //END INSERT
        
       /* let selectAdmin = "select * from AdminLogin"
        DBWrapper.sharedObj.AdminData(query: selectAdmin)
        if DBWrapper.sharedObj.AdminLoginArray.count > 0
        {
            AdminLoginShowDataArray = DBWrapper.sharedObj.AdminLoginArray
        }
        print(AdminLoginShowDataArray)*/

    }

    @IBAction func UserName(_ sender: UITextField)
    {
        if userName.text == ""
        {
            ShowAlertMessage()
        }
    }
    

    @IBAction func Password(_ sender: UITextField)
    {
        if password.text == ""
        {
            ShowAlertMessage()
        }
    }
    
    
    
    
    //ALERT MESSEGE
    func ShowAlertMessage()
    {
        let alertController = UIAlertController(title: "Empty Text Field", message:
            "Plzzz enter in text field", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    //ALERT MESSEGE
    
    
    
    
    @IBAction func PasswordReAction(_ sender: UIButton)
    {
        
    }
    
    @IBAction func AdminAction(_ sender: UIButton)
    {
        let AdminLogin = self.storyboard?.instantiateViewController(withIdentifier: "AdminLoginViewController") as! AdminLoginViewController
        navigationController?.pushViewController(AdminLogin, animated: true)
    }
    
    
    @IBAction func LoginAction(_ sender: UIButton)
    {
        let selectStud = "select * from StudRegistration where UserName = '\(userName.text!)' and Password='\(password.text!)'"
        DBWrapper.sharedObj.StudentAllData(query: selectStud)
        if DBWrapper.sharedObj.Stude_Add_Id_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_mobile_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_email_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_username_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_password_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_departmetn_Array.count > 0
        {
            Stude_Add_Id_Array_L = DBWrapper.sharedObj.Stude_Add_Id_Array
            Stude_Add_fname_Array_L = DBWrapper.sharedObj.Stude_Add_fname_Array
            Stude_Add_lname_Array_L = DBWrapper.sharedObj.Stude_Add_lname_Array
            Stude_Add_mobile_Array_L = DBWrapper.sharedObj.Stude_Add_mobile_Array
            Stude_Add_email_Array_L = DBWrapper.sharedObj.Stude_Add_email_Array
            Stude_Add_username_Array_L = DBWrapper.sharedObj.Stude_Add_username_Array
            Stude_Add_password_Array_L = DBWrapper.sharedObj.Stude_Add_password_Array
            Stude_Add_departmetn_Array_L = DBWrapper.sharedObj.Stude_Add_departmetn_Array
            
            //SET LOGIN STUDENT DETAILS IN UserDefaults
            let SID = Stude_Add_Id_Array_L[0]
            let SFN = Stude_Add_fname_Array_L[0]
            let SLN = Stude_Add_lname_Array_L[0]

            let defaults = UserDefaults.standard
            defaults.setValue(SID, forKey: "SID")
            defaults.setValue(SFN, forKey: "SFN")
            defaults.setValue(SLN, forKey: "SLN")
            //SET LOGIN STUDENT DETAILS IN UserDefaults

            
            let studDash = self.storyboard?.instantiateViewController(withIdentifier: "StudentDashboardViewController") as! StudentDashboardViewController
            navigationController?.pushViewController(studDash, animated: true)
        }
        else
        {
            print("Failed")
            ShowAlertMessage12()

        }
    
    }
    
    @IBAction func CancleAction(_ sender: UIButton)
    {
        userName.text = ""
        password.text = ""
    }
    func ShowAlertMessage11()
    {
        let alertController = UIAlertController(title: "Login", message:
            "Login successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func ShowAlertMessage12()
    {
        let alertController = UIAlertController(title: "Failed", message:
            "Something wrong", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
