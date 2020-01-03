
import UIKit

class LeaveAddViewController: UIViewController
{

    @IBOutlet weak var LeaveId: UITextField!
    
    
    @IBOutlet weak var LeaveName: UITextField!
    
    @IBOutlet weak var LeavebtnOutlet: UIButton!
    
    
    @IBOutlet weak var LeaveCancelbtnOutlet: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    
    @IBAction func LeaveActionData(_ sender: UIButton)
    {
        //Leave(LeaveId text,LeaveName text)
        let insertLeave = "insert into Leave(LeaveId,LeaveName) values('\(LeaveId.text!)','\(LeaveName.text!)')"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: insertLeave)
        if isSuccess
        {
            print("success")
            LeaveName.text = ""
            LeaveId.text = ""
            ShowAlertMessage11()

        }
        else
        {
            print("Failed")
            ShowAlertMessage12()

        }
    }
    
    @IBAction func LeaveCancelAction(_ sender: UIButton)
    {
        LeaveName.text = ""
        LeaveId.text = ""
    }
    
    func ShowAlertMessage11()
    {
        let alertController = UIAlertController(title: "Insert Data", message:
            "Insert Data successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func ShowAlertMessage12()
    {
        let alertController = UIAlertController(title: "Failed", message:
            "Something wrong", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    
}
