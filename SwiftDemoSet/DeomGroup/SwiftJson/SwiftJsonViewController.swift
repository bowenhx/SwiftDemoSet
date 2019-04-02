//
//  SwiftJsonViewController.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/14.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import UIKit

class SwiftJsonViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Json 转模型例子"
        
        /*let jsonPath = Bundle.main.path(forResource: "example1", ofType: "json")
        if jsonPath != nil {
            let data = NSData.init(contentsOfFile: jsonPath!)
            
            // 传统解析是拿到data 再转发为字典去对应模型
            let dict: Data = try! JSONSerialization.jsonObjNSDictionaryect(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            print(dict)
        }*/
    }
    
    
    func getJsonData(jsonName: String) -> Data? {
        let jsonPath = Bundle.main.path(forResource: jsonName, ofType: "json")
        if jsonPath != nil {
            let data = NSData.init(contentsOfFile: jsonPath!)
            return data! as Data
        }
        return nil
    }
    
    
    @IBAction func jsonEncodeModelAction(_ sender: UIButton) {
        if sender.tag == 0 {
            // 1.简单的json 和模型互转
            if let data: Data = getJsonData(jsonName: "example1") {
                //拿到json data 转化为模型
                jsonEncodeModel(jsonData: data)
            }
        } else {
            // 2.嵌套模型和json 互转
            if let data: Data = getJsonData(jsonName: "example2") {
                //拿到json data 转化为模型
                jsonEncodeModel2(jsonData: data)
            }
        }
    }
    
    
    // json 转模型
    func jsonEncodeModel(jsonData: Data) {
        let model = try! JSONDecoder().decode(SmipleEx.self, from: jsonData)
        print(model.fullName, model.twitter)

        // 拿到模型转 json
        modelEncodeJson(model: model)
    }

    
    // 模型转 json 数据
    func modelEncodeJson(model: SmipleEx) {
        let jsonData = try! JSONEncoder().encode(model)
        let jsonString = String.init(data: jsonData, encoding: .utf8)
        print(jsonString!)
    }
    
    
    //嵌套模型 json 互转
    func jsonEncodeModel2(jsonData: Data) {
        let model = try! JSONDecoder().decode(SmipleEx2.self, from: jsonData)
        print(model.name, model.ability.mathematics, model.ability.url!)
        
        // 拿到模型转 json
        let jsonData = try! JSONEncoder().encode(model)
        let jsonString = String.init(data: jsonData, encoding: .utf8)
        print(jsonString!)
    }

}
