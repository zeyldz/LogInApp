
import UIKit

class CreateAccountViewController: UIViewController {
  //  @IBOutlet weak var crtemailtxt: UITextField!
  //  @IBOutlet weak var crtpasswordTxt: UITextField!
  //  @IBOutlet weak var crtnameTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction public func crtaccountBtn(_ sender: Any) {
        UserDefaults.standard.set(nameTxt.text, forKey: "Name")
        UserDefaults.standard.set(emailTxt.text, forKey: "Mail")
        UserDefaults.standard.set(passwordTxt.text, forKey: "Password")
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
