//
//  ShowDataViewController.swift
//  LeaveApplication
//
//  Created by Student P_08 on 06/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{

    var Stude_Add_Id_Array_S = [String]()
    var Stude_Add_fname_Array_S = [String]()
    var Stude_Add_lname_Array_S = [String]()
    var Stude_Add_mobile_Array_S = [String]()
    var Stude_Add_email_Array_S = [String]()
    var Stude_Add_username_Array_S = [String]()
    var Stude_Add_password_Array_S = [String]()
    var Stude_Add_departmetn_Array_S = [String]()
    
    @IBOutlet weak var CollectionViewCellData: UICollectionView!
    
    
    @IBOutlet weak var UpdateOutlet: UIButton!
    @IBOutlet weak var DeleteOutlet: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        CollectionViewCellData.delegate = self
        CollectionViewCellData.dataSource = self
        
        let select = "select * from StudRegistration"
        DBWrapper.sharedObj.StudentAllData(query: select)
        if DBWrapper.sharedObj.Stude_Add_Id_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_fname_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_lname_Array.count > 0
        {
            Stude_Add_Id_Array_S = DBWrapper.sharedObj.Stude_Add_Id_Array
             Stude_Add_fname_Array_S = DBWrapper.sharedObj.Stude_Add_fname_Array
            Stude_Add_lname_Array_S = DBWrapper.sharedObj.Stude_Add_lname_Array
            
            /*&&  &&  && DBWrapper.sharedObj.Stude_Add_mobile_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_email_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_username_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_password_Array.count > 0 && DBWrapper.sharedObj.Stude_Add_departmetn_Array.count > 0
            
           
            Stude_Add_lname_Array_S = DBWrapper.sharedObj.Stude_Add_lname_Array
            Stude_Add_mobile_Array_S = DBWrapper.sharedObj.Stude_Add_mobile_Array
            Stude_Add_email_Array_S = DBWrapper.sharedObj.Stude_Add_email_Array
            Stude_Add_username_Array_S = DBWrapper.sharedObj.Stude_Add_username_Array
            Stude_Add_password_Array_S = DBWrapper.sharedObj.Stude_Add_password_Array
            Stude_Add_departmetn_Array_S = DBWrapper.sharedObj.Stude_Add_departmetn_Array*/

            
        }
        else
        {
            print("Not Found Records")
        }
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func UpdateDataAction(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func DeleteDataAction(_ sender: UIButton)
    {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return Stude_Add_Id_Array_S.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! InfoCollectionViewCell
        cell.IdShow.text = Stude_Add_Id_Array_S[indexPath.row]
        cell.fnameInfo.text = Stude_Add_fname_Array_S[indexPath.row]
        cell.lnameInfo.text = Stude_Add_lname_Array_S[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    
        let cell = collectionView.cellForItem(at: indexPath) as! InfoCollectionViewCell
        let updatendelete = self.storyboard?.instantiateViewController(withIdentifier: "UpdateNDeleteViewController")as! UpdateNDeleteViewController
       updatendelete.studid1 = cell.IdShow.text
       /* updatendelete.lname = cell.lnameInfo.text
        updatendelete.mob = cell.mobileInfo.text
        updatendelete.email = cell.emailInfo.text*/

          navigationController?.pushViewController(updatendelete, animated: true)
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
