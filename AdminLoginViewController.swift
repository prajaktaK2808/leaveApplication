//
//  AdminLoginViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 10/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController
{

    
    @IBOutlet weak var UserNameA: UITextField!
    @IBOutlet weak var PasswordA: UITextField!
    
    @IBOutlet weak var LoginOutletA: UIButton!
    @IBOutlet weak var CancelOutletA: UIButton!

    var AdminLoginShowDataArray = [String]()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        LoginOutletA.layer.borderWidth = 1
        LoginOutletA.layer.cornerRadius = 10
        LoginOutletA.layer.borderColor = UIColor.red.cgColor
        
        CancelOutletA.layer.borderWidth = 1
        CancelOutletA.layer.cornerRadius = 10
        CancelOutletA.layer.borderColor = UIColor.red.cgColor

    }

    
    
    @IBAction func UserNameA(_ sender: UITextField)
    {
        if UserNameA.text == ""
        {
            ShowAlertMessage()
        }
    }

    @IBAction func PasswordA(_ sender: UITextField)
    {
        if PasswordA.text == ""
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
    
    @IBAction func LoginActionA(_ sender: UIButton)
    {
        let selectAdmin = "select * from AdminLogin where UserName = '\(UserNameA.text!)' and Password = '\(PasswordA.text!)' "
         DBWrapper.sharedObj.AdminData(query: selectAdmin)
         if DBWrapper.sharedObj.AdminLoginFNArray.count > 0
         {
            AdminLoginShowDataArray = DBWrapper.sharedObj.AdminLoginFNArray
            ClearData()
            let admenu = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            navigationController?.pushViewController(admenu, animated: true)

         }
        else
         {
            print("Failed")
        }
            print(AdminLoginShowDataArray)
    }
    
    @IBAction func CancelActionA(_ sender: UIButton)
    {
        ClearData()
    }
    
    func ClearData()
    {
        UserNameA.text = ""
        PasswordA.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
