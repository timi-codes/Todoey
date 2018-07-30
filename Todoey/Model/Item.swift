//
//  Item.swift
//  Todoey
//
//  Created by Tejumola David on 7/27/18.
//  Copyright © 2018 Tejumola David. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var isDone : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
