//
//  NestedModal.swift
//  NestedMenu
//
//  Created by Shanu on 24/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import Foundation
import UIKit
struct NestedModal {
    var role:String?
    var objective:[objectiveModal]?
    var isExpanded:Bool?
    var roleTag : Int?
}

struct objectiveModal {
    var isObjectExpanded:Bool?
    var objectName:String?
    var resultArr:[resultModal]?
    var objectiveTag : Int?
}
struct resultModal {
    var roleName : String?
    var isRoleExpanded : Bool
    var resultTag: Int?
}

