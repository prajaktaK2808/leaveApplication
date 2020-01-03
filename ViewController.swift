//
//  ViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 31/08/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

   
    @IBOutlet weak var leadingContraint: NSLayoutConstraint!
    @IBOutlet var ViewBackground: UIView!
    var showMenu = false;
    
    
    @IBOutlet weak var HomeOutlet: UIButton!
    @IBOutlet weak var ProfileOutlet: UIButton!
    @IBOutlet weak var NotificationOutlet: UIButton!
    @IBOutlet weak var TeacherOutlet: UIButton!
    @IBOutlet weak var StudentOutlet: UIButton!
    @IBOutlet weak var SendOutlet: UIButton!
    @IBOutlet weak var AddOutlet: UIButton!
    @IBOutlet weak var UpdateOutlet: UIButton!
    
    
    @IBOutlet weak var DepartmentOutlet: UIButton!
    @IBOutlet weak var LogoutOutlet: UIButton!
    @IBOutlet weak var AddLeaveOulet: UIButton!
    
    
    @IBOutlet weak var Notification: UILabel!
    var NotificationArrayData = [String]()
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        let showData = "select COUNT(*) from StudLeave where LeaveAction='Pending'"
        DBWrapper.sharedObj.PendingLeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.PendingLeaveStudActionArray.count > 0
        {
            NotificationArrayData = DBWrapper.sharedObj.PendingLeaveStudActionArray
            self.Notification.text = "\(NotificationArrayData.count)"
            print(NotificationArrayData)
        }
        else
        {
            print("Failed")
        }
        
        
        
        
        
        HomeOutlet.layer.borderWidth = 1
        HomeOutlet.layer.cornerRadius = 10
        HomeOutlet.layer.borderColor = UIColor.red.cgColor
        
        
        ProfileOutlet.layer.borderWidth = 1
        ProfileOutlet.layer.cornerRadius = 10
        ProfileOutlet.layer.borderColor = UIColor.red.cgColor

        NotificationOutlet.layer.borderWidth = 1
        NotificationOutlet.layer.cornerRadius = 10
        NotificationOutlet.layer.borderColor = UIColor.red.cgColor

        TeacherOutlet.layer.borderWidth = 1
        TeacherOutlet.layer.cornerRadius = 10
        TeacherOutlet.layer.borderColor = UIColor.red.cgColor

        StudentOutlet.layer.borderWidth = 1
        StudentOutlet.layer.cornerRadius = 10
        StudentOutlet.layer.borderColor = UIColor.red.cgColor

        SendOutlet.layer.borderWidth = 1
        SendOutlet.layer.cornerRadius = 10
        SendOutlet.layer.borderColor = UIColor.red.cgColor

        AddOutlet.layer.borderWidth = 1
        AddOutlet.layer.cornerRadius = 10
        AddOutlet.layer.borderColor = UIColor.red.cgColor

        UpdateOutlet.layer.borderWidth = 1
        UpdateOutlet.layer.cornerRadius = 10
        UpdateOutlet.layer.borderColor = UIColor.red.cgColor
        
        DepartmentOutlet.layer.borderWidth = 1
        DepartmentOutlet.layer.cornerRadius = 10
        DepartmentOutlet.layer.borderColor = UIColor.red.cgColor
        
        LogoutOutlet.layer.borderWidth = 1
        LogoutOutlet.layer.cornerRadius = 10
        LogoutOutlet.layer.borderColor = UIColor.red.cgColor
        
        AddLeaveOulet.layer.borderWidth = 1
        AddLeaveOulet.layer.cornerRadius = 10
        AddLeaveOulet.layer.borderColor = UIColor.red.cgColor

        
        ViewBackground.layer.borderWidth = 1
        ViewBackground.layer.cornerRadius = 10
        ViewBackground.layer.borderColor = UIColor.red.cgColor
        


        
        

    }

    @IBAction func GoBarDataAction(_ sender: UIBarButtonItem)
    {

        
        if(showMenu)//if menu is showing then hide it
        {
            leadingContraint.constant = -240
            ViewBackground.backgroundColor = UIColor.white
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else//if menu is closing then show it
        {
            leadingContraint.constant = 0
            ViewBackground.backgroundColor = UIColor.darkGray
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })

        }
        
        showMenu = !showMenu;
    }
    
    
    @IBAction func HomeActionData(_ sender: UIButton)
    {
        
    }
    
    @IBAction func ProfileActionData(_ sender: UIButton)
    {
        let profile = self.storyboard?.instantiateViewController(withIdentifier: "AdminProfileViewController") as! AdminProfileViewController
        navigationController?.pushViewController(profile, animated: true)
    }
    
    @IBAction func NotificationActionData(_ sender: UIButton)
    {
        let shownoti = self.storyboard?.instantiateViewController(withIdentifier: "AdminShowNotificationViewController") as! AdminShowNotificationViewController
        navigationController?.pushViewController(shownoti, animated: true)
    }
    //UPDATE PASSWORD
    @IBAction func TeacherActionData(_ sender: UIButton)
    {
        let updateps = self.storyboard?.instantiateViewController(withIdentifier: "UpdatePasswordViewController") as! UpdatePasswordViewController
        navigationController?.pushViewController(updateps, animated: true)
    }
    
    @IBAction func StudentActionData(_ sender: UIButton)
    {
            //show student
        let showstud = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataViewController") as! ShowDataViewController
         navigationController?.pushViewController(showstud, animated: true)
    }
    
    @IBAction func SendActionData(_ sender: UIButton)
    {
        let showHistory = self.storyboard?.instantiateViewController(withIdentifier: "AdminLeaveHistoryShowViewController") as! AdminLeaveHistoryShowViewController
        navigationController?.pushViewController(showHistory, animated: true)
    }
    
    @IBAction func AddActionData(_ sender: UIButton)
    {
        let addinfo = self.storyboard?.instantiateViewController(withIdentifier: "AddInfoViewController") as! AddInfoViewController
        navigationController?.pushViewController(addinfo, animated: true)
    }
    
    @IBAction func UpdataActionData(_ sender: UIButton)
    {
        let updateNd = self.storyboard?.instantiateViewController(withIdentifier: "UpdateNDeleteViewController") as! UpdateNDeleteViewController
        navigationController?.pushViewController(updateNd, animated: true)
    }
    
    
    @IBAction func DepartmentActionData(_ sender: UIButton)
    {
        let AddDept = self.storyboard?.instantiateViewController(withIdentifier: "AddDepartmentViewController") as! AddDepartmentViewController
        navigationController?.pushViewController(AddDept, animated: true)
    }
    
    @IBAction func AddLeaveActionData(_ sender: UIButton)
    {
     let addleave = self.storyboard?.instantiateViewController(withIdentifier: "LeaveAddViewController") as! LeaveAddViewController
        navigationController?.pushViewController(addleave, animated: true)
    }
    @IBAction func LogoutActionData(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
       override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

