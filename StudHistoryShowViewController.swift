
import UIKit

class StudHistoryShowViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{

    
    
    var LeaveStudIdArrayShow = [String]()
    var LeaveStudTypeArrayShow = [String]()
    var LeaveStudToDateArrayShow = [String]()
    var LeaveStudFromDateArrayShow = [String]()
    var LeaveStudDescriptionArrayShow = [String]()
    var LeaveStudActionArrayShow = [String]()
    
    @IBOutlet weak var CollectionViewShow: UICollectionView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        CollectionViewShow.delegate = self
        CollectionViewShow.dataSource = self

        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        let SFN = UserDefaults.standard.value(forKey: "SFN") as! String
        let SLN = UserDefaults.standard.value(forKey: "SLN") as! String
        print(SID)
        print(SFN)
        print(SLN)
        
        //StudLeave(StudId text,LeaveType text,LeaveToDate text,LeaveFromDate text,LeaveDescription text,LeaveAction text)
        //and LeaveAction='Accepted' and LeaveAction='Rejected'
        let showData = "select StudId,LeaveType,LeaveToDate,LeaveFromDate,LeaveDescription,LeaveAction from StudLeave where StudId = '\(SID)' "
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudIdArray.count > 0 && DBWrapper.sharedObj.LeaveStudTypeArray.count > 0 && DBWrapper.sharedObj.LeaveStudToDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudFromDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudDescriptionArray.count > 0 && DBWrapper.sharedObj.LeaveStudActionArray.count > 0
        {
            LeaveStudIdArrayShow = DBWrapper.sharedObj.LeaveStudIdArray
            LeaveStudTypeArrayShow = DBWrapper.sharedObj.LeaveStudTypeArray
            LeaveStudToDateArrayShow = DBWrapper.sharedObj.LeaveStudToDateArray
            LeaveStudFromDateArrayShow = DBWrapper.sharedObj.LeaveStudFromDateArray
            LeaveStudDescriptionArrayShow = DBWrapper.sharedObj.LeaveStudDescriptionArray
            LeaveStudActionArrayShow = DBWrapper.sharedObj.LeaveStudActionArray
        }
        else
        {
            print("Failed")
            ShowAlertMessage11()
        }
    }
    func ShowAlertMessage11()
    {
        let alertController = UIAlertController(title: "Data Not Found", message:
            "No Data Found", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return LeaveStudIdArrayShow.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! StudHistoryCollectionViewCell
        cell3.IdShow.text = LeaveStudIdArrayShow[indexPath.row]
        cell3.ToDateShow.text = LeaveStudToDateArrayShow[indexPath.row]
        cell3.FromDateShow.text = LeaveStudFromDateArrayShow[indexPath.row]
        cell3.DescriptionShow.text = LeaveStudDescriptionArrayShow[indexPath.row]
        cell3.ActionShow.text = LeaveStudActionArrayShow[indexPath.row]
        return cell3
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

   }
