//
//  File.swift
//  hello
//
//  Created by Vishal Kothari on 12/01/26.
//

import Foundation
import Fluent
import Vapor

//user Model class

final class User:Model,Content,@unchecked Sendable{
    static let schema = "users"
    
    @ID(key: .id)
    var id:UUID?
    
    @Field(key:"Email")
    var email:String
    
    @Field(key:"passord_hash")
    var passwordHash:String
    init() {
    
    }
    
    
    init(id: UUID? = nil, email: String,passwordHash:String) {
        self.id = id
        self.email = email
        self.passwordHash = passwordHash
    }
}
