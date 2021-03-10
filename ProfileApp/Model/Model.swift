//
//  Profile.swift
//  ExploreLayout
//
//  Created by Somaye Sabeti on 2/23/21.
//

import IGListKit

var profileCurrentId: Int = 0
var headerPostCollectionCurrentId: Int = 0
var postCollectionCurrentId: Int = 0
var postCurrentId: Int = 0

protocol UniquableModel: ListDiffable {
    var id : Int { get }
}

class ProfileCellModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = profileCurrentId
        profileCurrentId += 1
    }
}

class HeaderPostsModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = headerPostCollectionCurrentId
        headerPostCollectionCurrentId += 1
    }
}

class PostModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = postCurrentId
        postCurrentId += 1
    }
}
