
import UIKit

class StudLeaveHistoryShowViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{

    var LeaveStudIdArraySH = [String]()
    var LeaveStudTypeArraySH = [String]()
    var LeaveStudToDateArraySH = [String]()
    var LeaveStudFromDateArraySH = [String]()
    var LeaveStudDescriptionArraySH = [String]()
    var LeaveStudActionArraySH = [String]()

    
    @IBOutlet weak var CollectionViewData: UICollectionView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // LeaveStudIdArraySH = ["1","2","3"]
        
        CollectionViewData.delegate = self
        CollectionViewData.dataSource = self
        
        let SID = UserDefaults.standard.value(forKey: "SID") as! String
        let SFN = UserDefaults.standard.value(forKey: "SFN") as! String
        let SLN = UserDefaults.standard.value(forKey: "SLN") as! String
        print(SID)
        print(SFN)
        print(SLN)
        
        //StudLeave(StudId text,LeaveType text,LeaveToDate text,LeaveFromDate text,LeaveDescription text,LeaveAction text)
        
        let showData = "select StudId,LeaveType,LeaveToDate,LeaveFromDate,LeaveDescription,LeaveAction from StudLeave where LeaveAction='Pending' and StudId ='\(SID)'"
        DBWrapper.sharedObj.LeaveStudAllData(query: showData)
        if DBWrapper.sharedObj.LeaveStudIdArray.count > 0 && DBWrapper.sharedObj.LeaveStudTypeArray.count > 0 && DBWrapper.sharedObj.LeaveStudToDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudFromDateArray.count > 0 && DBWrapper.sharedObj.LeaveStudDescriptionArray.count > 0 && DBWrapper.sharedObj.LeaveStudActionArray.count > 0
        {
            LeaveStudIdArraySH = DBWrapper.sharedObj.LeaveStudIdArray
            LeaveStudTypeArraySH = DBWrapper.sharedObj.LeaveStudTypeArray
           LeaveStudToDateArraySH = DBWrapper.sharedObj.LeaveStudToDateArray
            LeaveStudFromDateArraySH = DBWrapper.sharedObj.LeaveStudFromDateArray
            LeaveStudDescriptionArraySH = DBWrapper.sharedObj.LeaveStudDescriptionArray
            LeaveStudActionArraySH = DBWrapper.sharedObj.LeaveStudActionArray
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
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return LeaveStudIdArraySH.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! StudeLeaveHistoryCollectionViewCell
        cell2.ShowId.text = LeaveStudIdArraySH[indexPath.row]
        cell2.ShowToDate.text = LeaveStudToDateArraySH[indexPath.row]
        cell2.ShowFromDate.text = LeaveStudFromDateArraySH[indexPath.row]
        cell2.ShowDescription.text = LeaveStudDescriptionArraySH[indexPath.row]
        cell2.ShowAction.text = LeaveStudActionArraySH[indexPath.row]
        return cell2
    }
}
