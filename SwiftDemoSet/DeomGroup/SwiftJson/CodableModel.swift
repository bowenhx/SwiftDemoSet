//
//  CodableModel.swift
//  SwiftDemoSet
//
//  Created by ligb on 2018/12/5.
//  Copyright © 2018 com.professional.cn. All rights reserved.
//

import Foundation

// 1、模型需要继承Codable协议。
// 2、某些字段不确定是否有值的时，需要将模型中相应的字段定义为Optional, 这告诉JSONEncoder/JSONDecoder此字段没有值时不用拆包，否则将导致crash的发生。
// 3、模型嵌套模型时，所涉及到的模型都要继承Codable协议。
// 4、有时候json数据中的key不一定和我的们模型中的字段名一样，这时候我们就要做关联。
// 5. 关联需要遵循CodingKey 协议的枚举来做映射。 如何关联请参考： SmipleEx2


struct SmipleEx: Codable {
    let fullName: String
    let id: Int
    let twitter: URL
    var email: String?
    var type: String?
    var fine: Int?
}



struct SmipleEx2: Codable {
    var name: String
    var points: Int?         //API 返回的结果会有一个不可控的因素,可能不返回值，使用optional
    var ability: Ability
    var description: String?

    struct Ability: Codable {
        var mathematics: Appraise
        var physics: Appraise
        var chemistry: Appraise
        var type: String?
        var url: String?

        enum CodingKeys: String, CodingKey {
            case mathematics
            case physics
            case chemistry
            case type = "type_str"
            case url = "url_str"
        }

        // 使用枚举来标示成绩的好与坏
        enum Appraise: String, Codable {
            case excellent, fine, bad
        }
    }

    
    // 当返回的json key 和自定义key 不一致情况可以使用 CodingKeys 来作关联
    // 注意1:CodingKeys是固定的枚举的名称，不能自定义。
    // 注意2:一旦定义了CodingKeys，JSONEncoder/JSONDecoder将根据CodingKeys去工作
    // 上面的key 每一个都要定义，不需要关联直接写key
    enum CodingKeys: String, CodingKey {
        case name = "nick_name"
        case description = "description_str"
        case points
        case ability
    }
}





