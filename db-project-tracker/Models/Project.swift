//
//  Project.swift
//  db-project-tracker
//
//  Created by Omer Cagri Sayir on 9.01.2024.
//

import Foundation
import SwiftData

@Model
class Project: Identifiable {
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var update: [ProjectUpdate] = [ProjectUpdate]()
    
    init(){
        id = UUID().uuidString
    }
}
