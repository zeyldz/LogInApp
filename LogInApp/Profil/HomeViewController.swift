

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var passwordLbl: UILabel!
    
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        whenDidLoad()

    }

    func whenDidLoad() {
        let isim = UserDefaults.standard.string(forKey: "Name")
        nameLbl.text = isim
            
            let eposta = UserDefaults.standard.string(forKey: "Mail")
            emailLbl.text = eposta
            
            let şifre = UserDefaults.standard.string(forKey: "Password")
            passwordLbl.text = şifre
        }   
        
        func backAction() -> Void {
            self.navigationController?.popViewController(animated: true)
        }
        
        func onClickLogout(_ sender: Any) {
            UserDefaults.standard.removeObject(forKey: "Name")
            UserDefaults.standard.removeObject(forKey: "Mail")
            UserDefaults.standard.removeObject(forKey: "Password")
            
            
            //let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
            // let navVC = UINavigationController(rootViewController: vc!)
            //let share = UIApplication.shared.delegate as? AppDelegate
            //share?.window?.rootViewController = navVC
            //share?.window?.makeKeyAndVisible()
        }
        
    @IBAction func logoutBtn(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "Name")
        UserDefaults.standard.removeObject(forKey: "Mail")
        UserDefaults.standard.removeObject(forKey: "Password")
        UserDefaults.standard.removeObject(forKey: "loginSuccess")
        
        self.tabBarController?.selectedIndex = 0
        
    }
}

