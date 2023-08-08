//
//  ViewController.swift
//  BeerProject
//
//  Created by 황인호 on 2023/08/08.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

struct Beer {
    var name: String
    var firstBrew: String
    var image: String
    var description: String
}


class ViewController: UIViewController {
    
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var beerFirstLabel: UILabel!
    @IBOutlet var beerDescription: UILabel!
    
    var beerList: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        setUI()
    }
    
    func callRequest() {
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                    
                    for item in json.arrayValue {
                        let name = item["name"].stringValue
                        let firstBrew = item["first_brewed"].stringValue
                        let beerImage = item["image_url"].stringValue
                        let description = item["description"].stringValue
                        
                        self.beerNameLabel.text = "\(name)"
                        self.beerFirstLabel.text = "\(firstBrew)"
                        self.beerDescription.text = "\(description)"
                            if let imageURL = URL(string: beerImage) {
                                self.beerImage.kf.setImage(with: imageURL)
//
                    }
                        
                   
                        }
                        
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            }
    func setUI() {
        beerDescription.numberOfLines = 0
    }
    }
    

