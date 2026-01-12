//
//  File.swift
//  hello
//
//  Created by Vishal Kothari on 12/01/26.
//

import Foundation
import Fluent

struct CreateUser: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .id()
            .field("email", .string, .required)
            .field("password_hash",.string,.required)
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("users").delete()
    }
}


struct AddPasswordToUser: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .field("password_hash", .string, .required)
            .update()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        database.schema("users")
            .deleteField("password_hash")
            .update()
    }
}
