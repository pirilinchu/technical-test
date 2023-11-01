//
//  DBManager.swift
//  testApp
//
//  Created by Macbook on 30/10/23.
//

import Foundation
import RealmSwift

class DBManager: NSObject {
    static let shared = DBManager()
    
    var posts: [MyPost] {
        Array(instantiateRealm().objects(MyPost.self).detached)
    }

    func instantiateRealm() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Could not create a Realm instance")
        }
    }
    
    func savePosts(posts: [MyPost]) {
        let realm = instantiateRealm()
        
        realm.beginWrite()
        realm.delete(realm.objects(MyPost.self))
        realm.add(posts)
        do {
           try realm.commitWrite()
        } catch {
            fatalError("Error saving posts")
        }
    }
}
