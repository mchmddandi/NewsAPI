//
//  ViewController.swift
//  NewsAPI
//
//  Created by Mochamad Dandi on 25/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var newsSegment: UISegmentedControl!
    @IBOutlet weak var newsSearchBar: UISearchBar!
    
    var dataNews = [News]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        getDataNews(msg: "indonesia")
        
    }

    func getDataNews(msg : String) {
        AF.request("https://newsapi.org/v2/everything?q=\(msg)&from=2021-08-24&to=2021-08-24&sortBy=popularity&apiKey=2dd1de60e3ac43e38c8913aeedc3c66d")
            .responseJSON{ (responeJson) in
                
                let json = JSON(responeJson.value as Any)
                
                let article = json["articles"].arrayValue
                
                if article.count > 0 {
                    
                    article.forEach{ (item) in
                        
                        let author = item["author"].stringValue
                        let title = item["title"].stringValue
                        let description = item["description"].stringValue
                        let url = item["url"].stringValue
                        let urlToImage = item["urlToImage"].stringValue
                        
                        let news = News()
                        news.title = title
                        news.author = author
                        news.description = description
                        news.url = url
                        news.urlToImage = urlToImage
                        self.dataNews.append(news)
                        
                        if self.dataNews.count > 0 {
                            self.newsTableView.reloadData()
                        }
                        
                    }
                }
            }
    }
    @IBAction func newsSegmentAction(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newscell", for: indexPath) as! NewsTableViewCell
        
        cell.titleNews.text = dataNews[indexPath.row].title
        cell.authorNews.text = dataNews[indexPath.row].author
        cell.descriptionNews.text = dataNews[indexPath.row].description
        
        
        AF.request(dataNews[indexPath.row].urlToImage ?? "").responseImage{ (responeImg ) in
            
            cell.imageNews.image = responeImg.value
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

