//
//  ViewController.swift
//  Learning1
//
//  Created by Anytimes on 8/29/17.
//  Copyright © 2017 crisler. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import SwiftyJSON

struct Note {
    let id: Int
    let text: String
    
    init(json: JSON) {
        id = json["id"].intValue 
        text = json["text"].stringValue 
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonUrlString = "https://emarc.firebaseio.com/todo/emarc.json"
        
        guard let url = URL(string: jsonUrlString) else { return }
        #if true
        Alamofire.request(url).validate()
        .responseJSON { (result) in
            
            switch result.result {
            case .success(let data):
                let resultJson = JSON(data)
                print(resultJson)
                
                for (_, json) in resultJson {
                    //print(json)
                    let testnote = Note(json: json)
                    print(testnote.text)
                }
                if let json = result.result.value {
                    //print("JSON: \(json)") // serialized json response
                    //print(testnote.text)
                }
                
            case .failure(let err):
                print(err)
            }
        }
        #else
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
            
            do {
                //                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                //                print(websiteDescription.name, websiteDescription.description)
                
                //let courses = try JSONDecoder().decode([Course].self, from: data)
                //print(courses)
                
                //Swift 2/3/ObjC
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                
                print(json)
                let course = Note(json: json)
                print(course.text)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }

        }.resume()
        #endif
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

