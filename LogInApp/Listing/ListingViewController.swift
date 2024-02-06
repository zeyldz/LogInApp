//
//  ListingViewController.swift
//  LogInApp
//
//  Created by Zeynep Sude Yıldız on 27.09.2023.
//

import UIKit
import Alamofire

class ListingViewController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var list: UITableView!
    
   
    var datas : [GameModel] = []
    
    
    var oldIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "GamesTableViewCell", bundle: nil)
        list.register(cellNib, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self

        fetchData()
       
        
        self.tabBarController?.delegate = self
        
        
    }
   
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        oldIndex = tabBarController.selectedIndex
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 1 && UserDefaults.standard.bool(forKey: "loginSuccess") == false{
            tabBarController.selectedIndex = oldIndex
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let nav = UINavigationController(rootViewController: vc)
            self.present(nav, animated: true)
        }
        
    }
}

extension ListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
}
extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GamesTableViewCell
        cell.title.text = datas[indexPath.row].title ?? ""
        cell.platform.text = datas[indexPath.row].platform ?? ""
        cell.id.text = "\(datas[indexPath.row].id ?? 0)"
        cell.url.text = datas[indexPath.row].game_url ?? ""
        cell.desc.text = datas[indexPath.row].short_description ?? ""
        cell.publisher.text = datas[indexPath.row].publisher ?? ""
        cell.date.text = datas[indexPath.row].release_date ?? ""
        
        if let thumbnailURLString = datas[indexPath.row].thumbnail, let thumbnailURL = URL(string: thumbnailURLString) {
                    AF.download(thumbnailURL).responseData { response in
                        switch response.result {
                        case .success(let data):
                            if let thumbnailImage = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    cell.img.image = thumbnailImage
                                }
                            }

                        case .failure(let error):
                            print("Error downloading thumbnail: \(error.localizedDescription)")
                        }
                    }
                }

        return cell

    }
    
    func fetchData() {
            let apiEndpoint = "https://www.freetogame.com/api/games"
        
        AF.request(apiEndpoint, method: .get).responseDecodable(of: [GameModel].self) { response in
                switch response.result {
                case .success(let value):
                    self.datas = value
                    self.list.reloadData()
                    
                case .failure(let error):
                  
                    print("Error: \(error)")
                }
            }
        }
    }



class GameModel : Codable{
    var title : String?
    var platform : String?
    var id : Int?
    var game_url : String?
    var short_description : String?
    var publisher : String?
    var release_date : String?
    var thumbnail : String?
}
