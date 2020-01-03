//
//  StudentProfileViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 17/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class StudentDashboardViewController: UIViewController
{
    
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var LeadingContraint: NSLayoutConstraint!
    var showMenu = false;
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        let SFN = UserDefaults.standard.value(forKey: "SFN") as! String
        let SLN = UserDefaults.standard.value(forKey: "SLN") as! String
        NameLabel.text = SFN
        print(SID)
        print(SFN)
        print(SLN)

    }
    
    @IBAction func MenuButton(_ sender: UIButton)
    {
        if(showMenu)
        {
            LeadingContraint.constant = -240
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
            print("1")
        }
        else
        {
            LeadingContraint.constant = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
            print("2")

        }
        showMenu = !showMenu;
    }
    
    
    @IBAction func DashboardBTNAction(_ sender: UIButton)
    {
    }
    
    @IBAction func ProfileBTNAction(_ sender: UIButton)
    {
        let profile = self.storyboard?.instantiateViewController(withIdentifier: "StudentProfileViewController") as! StudentProfileViewController
        navigationController?.pushViewController(profile, animated: true)
    }
    
    
    @IBAction func UpdateBTNAction(_ sender: UIButton)
    {
        //APPLAY LEAVE DATA CLICK
        let applyleave = self.storyboard?.instantiateViewController(withIdentifier: "ApplyLeaveViewController") as! ApplyLeaveViewController
        navigationController?.pushViewController(applyleave, animated: true)
    }
    
    @IBAction func ChangePasswordBTNAction(_ sender: UIButton)
    {
        let psUpdate = self.storyboard?.instantiateViewController(withIdentifier: "StudentPasswordUPDViewController") as! StudentPasswordUPDViewController
        navigationController?.pushViewController(psUpdate, animated: true)

    }
    
    
    @IBAction func NotificationBTNAction(_ sender: UIButton)
    {
        let showHistory = self.storyboard?.instantiateViewController(withIdentifier: "StudHistoryShowViewController") as! StudHistoryShowViewController
        navigationController?.pushViewController(showHistory, animated: true
        )
    }
    
    
    @IBAction func SendNotificationBTNAction(_ sender: UIButton)
    {
        let showHistory = self.storyboard?.instantiateViewController(withIdentifier: "StudLeaveHistoryShowViewController") as! StudLeaveHistoryShowViewController
        navigationController?.pushViewController(showHistory, animated: true)
    }
    
    
    @IBAction func LogoutBTNAction(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
