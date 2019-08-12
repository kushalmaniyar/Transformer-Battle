//
//	Transformer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Transformer : NSObject{

	var courage : Int!
	var endurance : Int!
	var firepower : Int!
	var id : Int!
	var intelligence : Int!
	var name : String!
	var rank : Int!
	var skill : Int!
	var speed : Int!
	var strength : Int!
	var team : String!
	var teamIcon : String!
    var overAllRating :Int!
    


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		courage = json["courage"].intValue
		endurance = json["endurance"].intValue
		firepower = json["firepower"].intValue
		id = json["id"].intValue
		intelligence = json["intelligence"].intValue
		name = json["name"].stringValue
		rank = json["rank"].intValue
		skill = json["skill"].intValue
		speed = json["speed"].intValue
		strength = json["strength"].intValue
		team = json["team"].stringValue
		teamIcon = json["team_icon"].stringValue
        overAllRating = strength + intelligence + speed + endurance + firepower
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if courage != nil{
			dictionary["courage"] = courage
		}
		if endurance != nil{
			dictionary["endurance"] = endurance
		}
		if firepower != nil{
			dictionary["firepower"] = firepower
		}
		if id != nil{
			dictionary["id"] = id
		}
		if intelligence != nil{
			dictionary["intelligence"] = intelligence
		}
		if name != nil{
			dictionary["name"] = name
		}
		if rank != nil{
			dictionary["rank"] = rank
		}
		if skill != nil{
			dictionary["skill"] = skill
		}
		if speed != nil{
			dictionary["speed"] = speed
		}
		if strength != nil{
			dictionary["strength"] = strength
		}
		if team != nil{
			dictionary["team"] = team
		}
		if teamIcon != nil{
			dictionary["team_icon"] = teamIcon
		}
		return dictionary
	}

}

extension Transformer {
    /*
     fighter is down 4 or more points of courage and 3 or more points of strength
     */
    static func checkCourageAndStrength(lhs : Transformer , rhs : Transformer) {
        
        var lhsCount : Int = 0
        var rhsCount : Int = 0
        
        let isAwinnerForCondition1 = ((lhs.courage - rhs.courage)) <= 4 ? (lhsCount = lhsCount + 1) : (lhsCount = lhsCount - 1)
        
        
        let isDAwinnerForCondition1 = ((rhs.courage - lhs.courage) <= 4) ? (rhsCount = rhsCount + 1) : (rhsCount = rhsCount - 1)
        
        let isAwinnerForCondition2 = ((lhs.strength - rhs.strength) <= 3) ? (lhsCount = lhsCount + 1) : (lhsCount = lhsCount - 1)
        
        let isDAwinnerForCondition2 = ((rhs.strength - lhs.strength) <= 2) ? (rhsCount = rhsCount + 1) : (rhsCount = rhsCount - 1)
        
        
    }
    
    func text(battleUsers : [Transformer]){
//        let courage = battleUsers.allSatisfy { $0.courage < 4 }
//        let strength = battleUsers.allSatisfy { $0.strength < 3 }
        
        
    }
}
