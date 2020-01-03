//
//  File.swift
//  LeaveApplication
//
//  Created by Student P_08 on 06/09/19.
//  Copyright © 2019 prakash. All rights reserved.
//

import Foundation

class DBWrapper
{
    static let sharedObj = DBWrapper()
   
    
   
    
    
    func getDatabasePath()->String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path+"/myDatabase.sqlite"
    }
    func executeQuery(query: String)->Bool
    {
        var success = false
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                if(sqlite3_step(stmt)==SQLITE_DONE)
                {
                    success = true
                    sqlite3_close(dB!)
                    sqlite3_finalize(stmt!)
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        return success
    }
    
    //ADD STUNDENT ARRARY START
    
    var Stude_Add_Id_Array = [String]()
    var Stude_Add_fname_Array = [String]()
    var Stude_Add_lname_Array = [String]()
    var Stude_Add_mobile_Array = [String]()
    var Stude_Add_email_Array = [String]()
    var Stude_Add_username_Array = [String]()
    var Stude_Add_password_Array = [String]()
    var Stude_Add_departmetn_Array = [String]()
    
    //ADD STUDENT ARRAY END
    func StudentAllData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        Stude_Add_Id_Array = [String]()
        Stude_Add_fname_Array = [String]()
        Stude_Add_lname_Array = [String]()
        Stude_Add_mobile_Array = [String]()
        Stude_Add_email_Array = [String]()
        Stude_Add_username_Array = [String]()
        Stude_Add_password_Array = [String]()
        Stude_Add_departmetn_Array = [String]()
        
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let sid = sqlite3_column_text(stmt!, 0)
                    let sid1 = String(cString: sid!)
                    let sfn = sqlite3_column_text(stmt!, 1)
                    let sfn1 = String(cString: sfn!)
                    let sln = sqlite3_column_text(stmt!, 2)
                    let sln1 = String(cString: sln!)
                    let mob = sqlite3_column_text(stmt!, 3)
                    let mob1 = String(cString: mob!)
                    let eml = sqlite3_column_text(stmt!, 4)
                    let eml1 = String(cString: eml!)
                    let unm = sqlite3_column_text(stmt!, 5)
                    let unm1 = String(cString: unm!)
                    let psd = sqlite3_column_text(stmt!, 6)
                    let psd1 = String(cString: psd!)
                    let dept = sqlite3_column_text(stmt!, 7)
                    let dept1 = String(cString: dept!)

                    Stude_Add_Id_Array.append(sid1)
                    Stude_Add_fname_Array.append(sfn1)
                    Stude_Add_lname_Array.append(sln1)
                    Stude_Add_mobile_Array.append(mob1)
                    Stude_Add_email_Array.append(eml1)
                    Stude_Add_username_Array.append(unm1)
                    Stude_Add_password_Array.append(psd1)
                    Stude_Add_departmetn_Array.append(dept1)
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
       
    }

    
    //ADMIN ARRAY START
    var AdminLoginFNArray = [String]()
    var AdminLoginLNArray = [String]()
    var AdminLoginUNArray = [String]()
    var AdminLoginPSArray = [String]()

    //ADMIN ARRAY END
    
    // ADMIN DATA FETCH START
    func AdminData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        AdminLoginFNArray = [String]()
        AdminLoginLNArray = [String]()
        AdminLoginUNArray = [String]()
        AdminLoginPSArray = [String]()
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let fname = sqlite3_column_text(stmt!, 0)
                    let fn = String(cString: fname!)
                    let lname = sqlite3_column_text(stmt!, 1)
                    let ln = String(cString: lname!)
                    let uname = sqlite3_column_text(stmt!, 2)
                    let un = String(cString: uname!)
                    let passd = sqlite3_column_text(stmt!, 3)
                    let ps = String(cString: passd!)
                    
                    AdminLoginFNArray.append(fn)
                    AdminLoginLNArray.append(ln)
                    AdminLoginUNArray.append(un)
                    AdminLoginPSArray.append(ps)
                    
                    
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        
    }

    //ADMIN DATA FETCH END
    
    
    
    //DEPARTMENT ARRAY START
    var DepartmentIDArrayData = [String]()
    var DepartmentSNArrayData = [String]()
    var DepartmentFNArrayData = [String]()
    //DEPARTMENT ARRAY END

    // DEPARTMENT DATA FETCH START
    
    func DepartmentAllData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        DepartmentIDArrayData = [String]()
        DepartmentSNArrayData = [String]()
        DepartmentFNArrayData = [String]()
        
        
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let did = sqlite3_column_text(stmt!, 0)
                    let did1 = String(cString: did!)
                    let dfn = sqlite3_column_text(stmt!, 1)
                    let dfn1 = String(cString: dfn!)
                    let dsn = sqlite3_column_text(stmt!, 2)
                    let dsn1 = String(cString: dsn!)
                    
                    DepartmentIDArrayData.append(did1)
                    DepartmentFNArrayData.append(dfn1)
                    DepartmentSNArrayData.append(dsn1)
                  
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        
    }
    //DEPARTMENT DATA FETCH STOP
    
    
    
    // LEAVE DATA FETCH START
    var LeaveIdArray = [String]()
    var LeaveNameArray = [String]()
    func LeaveAllData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        LeaveIdArray = [String]()
        LeaveNameArray = [String]()
        
        
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let lid = sqlite3_column_text(stmt!, 0)
                    let lid1 = String(cString: lid!)
                    let lfn = sqlite3_column_text(stmt!, 1)
                    let lfn1 = String(cString: lfn!)
                    
                    LeaveIdArray.append(lfn1)
                    LeaveNameArray.append(lid1)
                    
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        
    }
    //LEAVE DATA FETCH STOP
    
    
    // LEAVE STUDENT DATA FETCH START
    var LeaveStudIdArray = [String]()
    var LeaveStudTypeArray = [String]()
    var LeaveStudToDateArray = [String]()
    var LeaveStudFromDateArray = [String]()
    var LeaveStudDescriptionArray = [String]()
    var LeaveStudActionArray = [String]()


    func LeaveStudAllData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        LeaveStudIdArray = [String]()
        LeaveStudTypeArray = [String]()
        LeaveStudToDateArray = [String]()
        LeaveStudFromDateArray = [String]()
        LeaveStudDescriptionArray = [String]()
        LeaveStudActionArray = [String]()

        
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let lsid = sqlite3_column_text(stmt!, 0)
                    let lsid1 = String(cString: lsid!)
                    let lstn = sqlite3_column_text(stmt!, 1)
                    let lstn1 = String(cString: lstn!)
                    let todate = sqlite3_column_text(stmt!, 2)
                    let todate1 = String(cString: todate!)
                    let fromdate = sqlite3_column_text(stmt!, 3)
                    let fromdate1 = String(cString: fromdate!)
                    let descpt = sqlite3_column_text(stmt!, 4)
                    let descpt1 = String(cString: descpt!)
                    let actionl = sqlite3_column_text(stmt!, 5)
                    let actionl1 = String(cString: actionl!)

                    LeaveStudIdArray.append(lsid1)
                    LeaveStudTypeArray.append(lstn1)
                    LeaveStudToDateArray.append(todate1)
                    LeaveStudFromDateArray.append(fromdate1)
                    LeaveStudDescriptionArray.append(descpt1)
                    LeaveStudActionArray.append(actionl1)
                    
                    
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        
    }
    //LEAVE STUDENT DATA FETCH STOP

    
    // LEAVE PENDING DATA FETCH START
    var PendingLeaveStudActionArray = [String]()
    
    
    func PendingLeaveStudAllData(query: String)
    {
        
        var dB:OpaquePointer?
        var stmt:OpaquePointer?
        let dbPath = getDatabasePath()
        
        PendingLeaveStudActionArray = [String]()
        
        
        if(sqlite3_open(dbPath, &dB)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(dB!, query, -1, &stmt, nil)==SQLITE_OK)
            {
                while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                    let psid = sqlite3_column_int(stmt!, 0)
                   // print(psid)
                    PendingLeaveStudActionArray.append(String(psid))
                }
            }
            else
            {
                print("Error in prepare v2:\(sqlite3_errmsg(stmt!))")
            }
        }
        else
        {
            print("Error in opening db:\(sqlite3_errmsg(stmt!))")
        }
        
    }
    //LEAVE PENDING DATA FETCH STOP
    
    func createTable()
    {
        
        let AdminLogin = "create table if not exists AdminLogin(FirstName text,LastName text,UserName text,Password text)"
        let AdminSuccess = executeQuery(query: AdminLogin)
        
        let AddStudent = "create table if not exists StudRegistration(StudId text,FirstName text,LastName text,Mobile text,EmailId text,UserName text,Password text,Department text)"
        let isSuccess1 = executeQuery(query: AddStudent)
        
        let Dept = "create table if not exists StudDepartment(Dept_Id text,Dept_Name text,Dept_Short_Name text)"
        let Department1 = executeQuery(query: Dept)

        let addleave = "create table if not exists Leave(LeaveId text,LeaveName text)"
        let addleave1 = executeQuery(query: addleave)
        
        let studleave = "create table if not exists StudLeave(StudId text,LeaveType text,LeaveToDate text,LeaveFromDate text,LeaveDescription text,LeaveAction text)"
        let studleave1 = executeQuery(query: studleave)

        
        if isSuccess1 && AdminSuccess && Department1 && addleave1 && studleave1
        {
            print("tableCreation:Success...")
        }
        else
        {
            print("Failed")
        }
    }
}
