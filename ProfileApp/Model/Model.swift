//
//  Profile.swift
//  ExploreLayout
//
//  Created by Somaye Sabeti on 2/23/21.
//

import IGListKit

var headerCurrentId: Int = 0
var headerSectionCurrentId: Int = 0
var pageCurrentId: Int = 0
var pageSectionCurrentId: Int = 0
var postCurrentId: Int = 0
var postSectionCurrentId: Int = 0

protocol UniquableModel: ListDiffable {
    var id : Int { get }
}

class HeaderSectionModel: NSObject, UniquableModel {
    let id : Int
    let headers: [HeaderModel]
    
    init(headers: [HeaderModel]) {
        self.headers = headers
        self.id = headerSectionCurrentId
        headerSectionCurrentId += 1
    }
}

class HeaderModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = headerCurrentId
        headerCurrentId += 1
    }
}

class PageSectionModel: NSObject, UniquableModel {
    let id : Int
    let pages: [PageModel]
    
    init(pages: [PageModel]) {
        self.pages = pages
        self.id = pageSectionCurrentId
        pageSectionCurrentId += 1
    }
}

class PageModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = pageCurrentId
        pageCurrentId += 1
    }
}

class PostSectionModel: NSObject, UniquableModel {
    let id : Int
    let posts: [PostModel]
    
    init(posts: [PostModel]) {
        self.posts = posts
        self.id = postSectionCurrentId
        postSectionCurrentId += 1
    }
}

class PostModel: NSObject, UniquableModel {
    let id : Int
    
    override init() {
        self.id = postCurrentId
        postCurrentId += 1
    }
}
