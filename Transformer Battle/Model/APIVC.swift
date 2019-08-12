//
//  APIVC.swift
//  Transformer Battle
//
//  Created by admin on 10/08/19.
//  Copyright © 2019 Kushal. All rights reserved.
//

import UIKit
import Moya
import QorumLogs
import SwiftyJSON
class APIVC: UIViewController {


    /*
     
     -
    */
    @IBAction func btnAllSparkTapped(_ sender: AnyObject) {
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.allSpark) { (result) in
            
            switch result{
                
            case .success(let result):
               
              QL1(String(data: result.data, encoding: .utf8))
              Authorization.authToken = String(data: result.data, encoding: .utf8)
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
            
        }
        
    }
    
    @IBAction func btnGetAllTransformer(_ sender: AnyObject) {
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.transformers) { (result) in
            
            switch result{
                
            case .success(let response):
                
                do{
                    
                    if response.statusCode == 200 {
                        
                        
                        let res = try response.mapJSON()
                        let resJSON = JSON(res)
                        
                        let objTansfromers = resJSON["transformers"].arrayValue
                        
                        let mappedObjectsArray = objTansfromers.compactMap { (json) -> Transformer in
                            let mappedObject = Transformer(fromJson: json)
                            return mappedObject
                        }
                        
                        QL1(objTansfromers)
                        
                        self.checkCourageAndStrength(lhs: mappedObjectsArray[0], rhs: mappedObjectsArray[1])
                        
                        QL1(mappedObjectsArray.count)
                    }else{
                        
                        QL1(try response.mapString())
                        
                    }
                    
                }catch(let error){
                    QL1(error.localizedDescription)
                }

                
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
        }
    }
    
    func checkCourageAndStrength(lhs : Transformer , rhs : Transformer) {
        
        var lhsCount : Int = 0
        var rhsCount : Int = 0
        
        let isAwinnerForCondition1 = ((lhs.courage - rhs.courage)) >= 4
        if isAwinnerForCondition1{
            lhsCount = lhsCount + 1
        }

        let isDAwinnerForCondition1 = (rhs.courage - lhs.courage) >= 4
        if isDAwinnerForCondition1 {
            rhsCount = rhsCount + 1
        }
        
        let isAwinnerForCondition2 = (lhs.strength - rhs.strength) >= 3
        if isAwinnerForCondition2{
            lhsCount = lhsCount + 1
        }
        
        let isDAwinnerForCondition2 = (rhs.strength - lhs.strength) >= 2
        if isDAwinnerForCondition2 {
            rhsCount = rhsCount + 1
        }
        
        print(lhsCount,rhsCount)
    
    }
    
    
    @IBAction func btnAddTransformerTapped(_ sender: AnyObject) {
        
        
        let param : [String : Any] = [
            "name" : "aa",
            "strength" : 4,
            "intelligence" : 3,
            "speed" : 4,
            "endurance" : 3 ,
            "rank" : 4 ,
            "courage" : 5,
            "firepower" : 5,
            "skill" : 5,
            "team" : "D"
        ]
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.addTransformer(params: param)) { (result) in
            
            switch result{
            case .success(let response):
                do{
                    if response.statusCode == 200 {
                        let res = try response.mapJSON()
                        let resJSON = JSON(res)
                        QL1(resJSON)
                    }else{
                        QL1(try response.mapString())
                    }
                }catch(let error){
                    QL1(error.localizedDescription)
                }
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
        }
    }
    
    
    @IBAction func btnDeleteTapped(_ sender: AnyObject) {
        //
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.deleteTransformer(id: "-LlxM7IqnRuK-Pv-51eF")) { (result) in
            
            switch result{
            case .success(let response):
                do{
                    if response.statusCode == 200 {
                        let res = try response.mapJSON()
                        let resJSON = JSON(res)
                        QL1(resJSON)
                    }else{
                        QL1(try response.mapString())
                    }
                }catch(let error){
                    QL1(error.localizedDescription)
                }
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
        }
        
    }
    
    
    @IBAction func btnEditTapped(_ sender: AnyObject) {
        
        let param : [String : Any] = [
            "name" : "Edit",
            "strength" : 4,
            "intelligence" : 3,
            "speed" : 4,
            "endurance" : 3 ,
            "rank" : 4 ,
            "courage" : 5,
            "firepower" : 5,
            "skill" : 5,
            "team" : "D",
            "id" : "-LlxQLRGgMug5pwsd_7m"
        ]
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.addTransformer(params: param)) { (result) in
            
            switch result{
            case .success(let response):
                do{
                    if response.statusCode == 200 {
                        let res = try response.mapJSON()
                        let resJSON = JSON(res)
                        QL1(resJSON)
                    }else{
                        QL1(try response.mapString())
                    }
                }catch(let error){
                    QL1(error.localizedDescription)
                }
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
        }
    }
    
    @IBAction func btnGetTransformerDetails(_ sender: AnyObject) {
        
        let provider = MoyaProvider<TransformerService>()
        provider.request(TransformerService.getTransformerDetails(id: "-LlxTnqJkPR6zzLguIo-")) { (result) in
            
            switch result{
                
            case .success(let response):
                
                do{
                    if response.statusCode == 200 {
                        
                        let res = try response.mapJSON()
                        let resJSON = JSON(res)
                        QL1(resJSON)
                    }else{
                        QL1(try response.mapString())
                    }
                    
                }catch(let error){
                    QL1(error.localizedDescription)
                }
                break
            case .failure(let error):
                QL1(error.localizedDescription)
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
