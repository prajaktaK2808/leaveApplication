//
//  AddInfoViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 08/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class AddInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var Stude_Id: UITextField!
    @IBOutlet weak var F_Name: UITextField!
    @IBOutlet weak var L_Name: UITextField!
    @IBOutlet weak var Mobile: UITextField!
    @IBOutlet weak var Email_Id: UITextField!
    @IBOutlet weak var User_Name: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Departmetn: UITextField!
   
    
    
    @IBOutlet weak var TableViewData: UITableView!
    
    @IBOutlet weak var selectbtnOutlet: UIButton!
    @IBOutlet weak var addbtnOutlet: UIButton!
    @IBOutlet weak var cancelOutlet: UIButton!
    
    var DepartmentArrayData = [String]()
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        addbtnOutlet.layer.borderWidth = 1
        addbtnOutlet.layer.cornerRadius = 10
        addbtnOutlet.layer.borderColor = UIColor.red.cgColor
        
        cancelOutlet.layer.borderWidth = 1
        cancelOutlet.layer.cornerRadius = 10
        cancelOutlet.layer.borderColor = UIColor.red.cgColor
        
        selectbtnOutlet.layer.borderWidth = 1
        selectbtnOutlet.layer.cornerRadius = 10
        selectbtnOutlet.layer.borderColor = UIColor.red.cgColor
        
        TableViewData.delegate = self
        TableViewData.dataSource = self
        TableViewData.isHidden = true
        
        
        let selectDept = "select * from StudDepartment"
        DBWrapper.sharedObj.DepartmentAllData(query: selectDept)
        if DBWrapper.sharedObj.DepartmentSNArrayData.count > 0
        {
            DepartmentArrayData = DBWrapper.sharedObj.DepartmentSNArrayData
        }


    }
    
    //VALIDATION EMAIL START
    @IBAction func EmailId(_ sender: UITextField)
    {
        let validEmailAddressValidationResult = isValidEmailAddress(emailAddressString: Email_Id.text!)
        print(validEmailAddressValidationResult)
        
       if validEmailAddressValidationResult == true
       {
        
        }
        else
       {
            ShowAlertMessage()
            Email_Id.text = ""
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
   
    
    //ALERT MESSEGE
    func ShowAlertMessage()
    {
        let alertController = UIAlertController(title: "Invalid Email", message:
            "Plzzz enter valid email", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    //ALERT MESSEGE
    
    //VALIDATION EMAIL END

    //VALIDATION PHONE NUMBER END

    @IBAction func PhoneNumber(_ sender: UITextField)
    {
        let phone = isValidEmailAddress1(emailAddressString: Mobile.text!)
        print(phone)
        
        if phone == true
        {
            
        }
        else
        {
            ShowAlertMessage1()
            Mobile.text = ""
        }
    }
    
    func ShowAlertMessage1()
    {
        let alertController = UIAlertController(title: "Number Only", message:
            "Plzzz enter digits only", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmailAddress1(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[0-9]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }

    
    //VALIDATION PHONE NUMBER END

    //VALIDATION FIRST NAME START
    @IBAction func FisrtNameValid(_ sender: UITextField)
    {
        let fname = isValidString(emailAddressString: F_Name.text!)
        print(fname)
        
        if fname == true
        {
            
        }
        else
        {
            ShowAlertMessage2()
            F_Name.text = ""
        }
    }
    
    func ShowAlertMessage2()
    {
        let alertController = UIAlertController(title: "Number String", message:
            "Plzzz enter string only", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidString(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Za-z]"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }

    //VALIDATION FIRST NAME END
    
    
    
    @IBAction func selectActionbtn(_ sender: UIButton)
    {
        if TableViewData.isHidden == true
        {
            TableViewData.isHidden = false
        }
        else
        {
            TableViewData.isHidden = true
        }
    }
    
    @IBAction func AddDataAction(_ sender: UIButton)
    {
      // StudRegistration(StudId text,FirstName text,LastName text,Mobile text,EmailId text,UserName text,Password text,Department text)
       
        
        let insert = "insert into StudRegistration (StudId,FirstName,LastName,Mobile,EmailId,UserName,Password,Department) values('\(Stude_Id.text!)','\(F_Name.text!)','\(L_Name.text!)','\(Mobile.text!)','\(Email_Id.text!)','\(User_Name.text!)','\(Password.text!)','\(Departmetn.text!)')"
        
        let isSussecc = DBWrapper.sharedObj.executeQuery(query: insert)
        if isSussecc
        {
            print("Insertion:Success")
            ClearData()

            
        }
        else
        {
            print("Failed")
        }
        
    }
    
    @IBAction func CancleDataAction(_ sender: UIButton)
    {
        ClearData()
    }
    func ClearData()
    {
        Stude_Id.text = ""
        F_Name.text = ""
        L_Name.text = ""
        Mobile.text = ""
        Email_Id.text = ""
        User_Name.text = ""
        Password.text = ""
        Departmetn.text = ""
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DepartmentArrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = DepartmentArrayData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = TableViewData.cellForRow(at: indexPath)
        Departmetn.text = cell?.textLabel?.text
        TableViewData.isHidden = true
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
