//
//  DetailViewController.swift
//  LogInApp
//
//  Created by Zeynep Sude Yıldız on 23.01.2024.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    var datas : [DetailModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBOutlet weak var DetailImg: UIImageView!
    
    @IBOutlet weak var DetailVcLabel: UILabel!
    
    @IBOutlet weak var IDLbl: UILabel!
    
    @IBOutlet weak var StatusLbl: UILabel!
    
    @IBOutlet weak var GenreLbl: UILabel!
    
    @IBOutlet weak var PlatformLbl: UILabel!
    
    @IBOutlet weak var PublisherLbl: UILabel!
    
    @IBOutlet weak var ReleaseDateLbl: UILabel!
    
    @IBOutlet weak var DescLbl: UILabel!
    
    @IBOutlet weak var UrlLbl: UILabel!
    @IBAction func FavoriteBtn(_ sender: Any) {
    }
}



func fetchData() {
        let apiEndpoint = "https://www.freetogame.com/api/game?id"
    
    AF.request(apiEndpoint, method: .get).responseDecodable(of: [DetailModel].self) { response in
            switch response.result {
            case .success(let value):
               // self.datas = value
               
                print("Error: \(value)")

            case .failure(let error):
              
                print("Error: \(error)")
            }
        }
    }

class DetailModel : Codable{
    var title : String?
    var id : Int?
    var status : String?
    var genre : String?
    var platform : String?
    var publisher : String?
    var release_date : String?
    var description : String?
    var game_url : String?
}
