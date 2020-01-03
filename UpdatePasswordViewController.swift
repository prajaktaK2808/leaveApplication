//
//  UpdatePasswordViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 14/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class UpdatePasswordViewController: UIViewController
{

    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var NewPassword: UITextField!
    @IBOutlet weak var ConformPassword: UITextField!
   
    
    @IBOutlet weak var Message: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // Message.isHidden = true
    }

    
    @IBOutlet weak var UpdateUOutlet: UIButton!
    @IBOutlet weak var CancelUOutlet: UIButton!
    
    @IBAction func UpdateActionData(_ sender: UIButton)
    {
        //AdminLogin(FirstName text,LastName text,UserName text,Password text)
            let updatePs = "update AdminLogin set Password ='\(ConformPassword.text!)' where UserName = '\(UserName.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)
        if isSuccess
        {
            print("Change Password success")
             ClearData()
            
        }
        else
        {
            Message.text = "Failed"
        }
    }
    
    
    @IBAction func CancelActionData(_ sender: UIButton)
    {
        ClearData()
    }
    func ClearData()
    {
        UserName.text = ""
        NewPassword.text = ""
        ConformPassword.text = ""
    }
    
    
    @IBAction func ConChangePs(_ sender: UITextField)
    {
        if NewPassword.text == ConformPassword.text
        {
            Message.isHidden = true

        }
        else
        {
            Message.isHidden = false
            Message.text = "New Pswd & Con Pswd not match..."
            Message.textColor = UIColor.red
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
