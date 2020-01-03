//
//  AddDepartmentViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 13/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class AddDepartmentViewController: UIViewController
{

    
    @IBOutlet weak var Dept_Id: UITextField!
    @IBOutlet weak var Dept_Short_Name: UITextField!
    @IBOutlet weak var Dept_Full_Name: UITextView!
   
    
    @IBOutlet weak var AddDeptOutlet: UIButton!
    @IBOutlet weak var CancelDeptOutlet: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Dept_Full_Name.layer.borderWidth = 1
        Dept_Full_Name.layer.cornerRadius = 10
        Dept_Full_Name.layer.borderColor = UIColor.red.cgColor
        
        Dept_Short_Name.layer.borderWidth = 1
        Dept_Short_Name.layer.cornerRadius = 10
        Dept_Short_Name.layer.borderColor = UIColor.red.cgColor

        Dept_Id.layer.borderWidth = 1
        Dept_Id.layer.cornerRadius = 10
        Dept_Id.layer.borderColor = UIColor.red.cgColor

        AddDeptOutlet.layer.borderWidth = 1
        AddDeptOutlet.layer.cornerRadius = 10
        AddDeptOutlet.layer.borderColor = UIColor.red.cgColor

        CancelDeptOutlet.layer.borderWidth = 1
        CancelDeptOutlet.layer.cornerRadius = 10
        CancelDeptOutlet.layer.borderColor = UIColor.red.cgColor

        


    }

    
    
    @IBAction func AddDeptActionData(_ sender: UIButton)
    {
        //StudDepartment(Dept_Id text,Dept_Name text,Dept_Short_Name text)
        let insertDept = "insert into StudDepartment(Dept_Id,Dept_Name,Dept_Short_Name)values('\(Dept_Id.text!)','\(Dept_Full_Name.text!)','\(Dept_Short_Name.text!)')"
        
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insertDept)
        if isSuccess
        {
            print("Data insert successs")
            ClearData()
        }
        else
        {
            print("Failed")
        }
    }
    
    func ClearData()
    {
        Dept_Id.text = ""
        Dept_Short_Name.text = ""
        Dept_Full_Name.text = ""
    }
    
    @IBAction func CancelActionData(_ sender: UIButton)
    {
        ClearData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    


}
