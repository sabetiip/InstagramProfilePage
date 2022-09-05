//
//  Profile.swift
//  ExploreLayout
//
//  Created by Somaye Sabeti on 2/23/21.
//

import IGListKit

let headerCellHeight = 60.0
let pagerCollectionHeight = 60.0

var headerCurrentId: Int = 0
var headerSectionCurrentId: Int = 0
var pageCurrentId: Int = 0
var pageSectionCurrentId: Int = 0
var postCurrentId: Int = 0
var postSectionCurrentId: Int = 0

protocol UniquableModel: ListDiffable {
    var id : Int { get }
}

//MARK: - Header Date Model

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

//MARK: - Bottom Date Model

class BottomViewDataModel: NSObject {
    private var identifier: String = UUID().uuidString
    private(set) var pageSectionModel: PageSectionModel
    private(set) var postSectionModels: [PostSectionModel]

    init(pageSectionModel: PageSectionModel, postSectionModels: [PostSectionModel]) {
        self.pageSectionModel = pageSectionModel
        self.postSectionModels = postSectionModels
    }
}

//MARK: - Bottom Page Date Model
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

//MARK: - Bottom Post Date Model
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

//MARK: - Static Data

enum StaticData {
    private static func getPostModels(count: Int) -> [PostModel] {
        var posts = [PostModel]()
        for _ in 1 ... count {
            posts.append(PostModel())
        }
        return posts
    }
    
    static let headerDataModel = HeaderSectionModel(headers: [HeaderModel(), HeaderModel(), HeaderModel()])

    static let bottomDataModel = BottomViewDataModel(pageSectionModel: PageSectionModel(pages: [PageModel(),
                                                                                         PageModel(),
                                                                                         PageModel(),
                                                                                         PageModel(),
                                                                                         PageModel()]),
                                              postSectionModels: [PostSectionModel(posts: getPostModels(count: 5)),
                                                                  PostSectionModel(posts: getPostModels(count: 15)),
                                                                  PostSectionModel(posts: getPostModels(count: 30)),
                                                                  PostSectionModel(posts: getPostModels(count: 60)),
                                                                  PostSectionModel(posts: getPostModels(count: 90))])
}

