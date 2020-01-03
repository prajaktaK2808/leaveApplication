//
//  UpdateNDeleteViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 07/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class UpdateNDeleteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{

    var studid1:String?
    var fname1:String?
    var lname1:String?
    var mob1:String?
    var email1:String?
    var username1:String?
    var password1:String?
    var department1:String?
    
    var studidArray = [String]()
    var fnameArray = [String]()
    var lnameArray = [String]()
    var mobArray = [String]()
    var emailArray = [String]()
    var usernameArray = [String]()
    var passwordArray = [String]()
    var departmentArray = [String]()
    
    
    @IBOutlet weak var StudIDUD: UITextField!
    @IBOutlet weak var fnameUD: UITextField!
    @IBOutlet weak var lnameUP: UITextField!
    @IBOutlet weak var mobileUD: UITextField!
    @IBOutlet weak var emailUD: UITextField!
    @IBOutlet weak var usernameUD: UITextField!
    @IBOutlet weak var passwordUD: UITextField!
    @IBOutlet weak var departmentUD: UITextField!
    
    
    @IBOutlet weak var TableViewUD: UITableView!
    @IBOutlet weak var selectbtnOutlet: UIButton!
    
    var DepartmentUpdateDataArray = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       StudIDUD.text = studid1
       TableViewUD.delegate = self
        TableViewUD.dataSource = self
        TableViewUD.isHidden = true
        
       StudIDUD.delegate = self
        //usernameUD.isHidden = false
        
        let selectDept = "select * from StudDepartment"
        DBWrapper.sharedObj.DepartmentAllData(query: selectDept)
        if DBWrapper.sharedObj.DepartmentSNArrayData.count > 0
        {
            DepartmentUpdateDataArray = DBWrapper.sharedObj.DepartmentSNArrayData
        }
    }
    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        StudIDUD.resignFirstResponder()
        return true
    }
    @IBAction func StudIdAction(_ sender: UITextField)
    {
        // FETCH DATA FOR TEXT
        /* var Stude_Add_Id_Array = [String]()
         var Stude_Add_fname_Array = [String]()
         var Stude_Add_lname_Array = [String]()
         var Stude_Add_mobile_Array = [String]()
         var Stude_Add_email_Array = [String]()
         var Stude_Add_username_Array = [String]()
         var Stude_Add_password_Array = [String]()
         var Stude_Add_departmetn_Array = [String]()*/
       
        // StudRegistration(StudId text,FirstName text,LastName text,Mobile text,EmailId text,UserName text,Password text,Department text)
        
        let selectStud = "select StudId,FirstName,LastName,Mobile,EmailId,UserName,Password,Department from StudRegistration where StudId='\(StudIDUD.text!)'"
        DBWrapper.sharedObj.StudentAllData(query: selectStud)
        if DBWrapper.sharedObj.Stude_Add_Id_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_mobile_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_email_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_username_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_password_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_departmetn_Array.count > 0
        {
            studidArray = DBWrapper.sharedObj.Stude_Add_Id_Array
            fnameArray = DBWrapper.sharedObj.Stude_Add_fname_Array
            lnameArray = DBWrapper.sharedObj.Stude_Add_lname_Array
           mobArray = DBWrapper.sharedObj.Stude_Add_mobile_Array
            emailArray = DBWrapper.sharedObj.Stude_Add_email_Array
            usernameArray = DBWrapper.sharedObj.Stude_Add_username_Array
            passwordArray = DBWrapper.sharedObj.Stude_Add_password_Array
            departmentArray = DBWrapper.sharedObj.Stude_Add_departmetn_Array
            
            //FETCH DATA FOR TEXT
            fnameUD.text = fnameArray[0]
            lnameUP.text = lnameArray[0]
            mobileUD.text = mobArray[0]
            emailUD.text = emailArray[0]
            usernameUD.text = usernameArray[0]
            passwordUD.text = passwordArray[0]
            departmentUD.text = departmentArray[0]
        }
        else
        {
            print("Failed")
        }
        print(emailArray)
    }
    
    
    @IBAction func ActionBTN(_ sender: UIButton)
    {
        if TableViewUD.isHidden == true
        {
            TableViewUD.isHidden = false
        }
        else
        {
            TableViewUD.isHidden = true
        }
    }
    
    @IBOutlet weak var UpdateUDOutlet: UIButton!
    @IBOutlet weak var CancelUDOutlet: UIButton!
    
    
    @IBAction func UpdateActionUD(_ sender: UIButton)
    {
        //StudRegistration(StudId text,FirstName text,LastName text,Mobile text,EmailId text,UserName text,Password text,Department text)
        
        let updatePs = "update StudRegistration set FirstName ='\(fnameUD.text!)', LastName='\(lnameUP.text!)', Mobile='\(mobileUD.text!)', EmailId='\(emailUD.text!)', UserName='\(usernameUD.text!)', Password='\(passwordUD.text!)', Department='\(departmentUD.text!)' where StudId = '\(StudIDUD.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: updatePs)
        if isSuccess
        {
            print("success")
            ClearData()
            
        }
        else
        {
            print("Failed")
        }
    }
    
    func ClearData()
    {
        StudIDUD.text = ""
        fnameUD.text = ""
        lnameUP.text = ""
        mobileUD.text = ""
        emailUD.text = ""
        usernameUD.text = ""
        passwordUD.text = ""
        departmentUD.text = ""
    }
    
    @IBAction func CancelActionUD(_ sender: UIButton)
    {
        /*let delete1 = "delete from StudRegistration where StudId = '\(StudIDUD.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: delete1)
        if isSuccess
        {
            print("delete")
        }
        else
        {
            print("Failed")
        }*/
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DepartmentUpdateDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = DepartmentUpdateDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        departmentUD.text = cell?.textLabel?.text
        tableView.isHidden = true
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
 


}
