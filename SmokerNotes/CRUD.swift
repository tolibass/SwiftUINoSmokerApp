//
//  CRUD.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 15.12.2020.
//

import Foundation
import RealmSwift
import Realm
import WidgetKit

class CRUD: ObservableObject {
    
    
    var realm: Realm
    var result : Results<ThoughtsModel>
    
    init () {
        let fileManager = FileManager.default
        let appGroupURL = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.smokeNotes.contens")!
            .appendingPathComponent("default.realm")
        if !fileManager.fileExists(atPath: appGroupURL.path) {
            let originalPath = Realm.Configuration.defaultConfiguration.fileURL!
            do{
                let testRealm = try! Realm()
                try _ = fileManager.replaceItemAt(appGroupURL, withItemAt: originalPath)
            }
            catch{
                print("Error info: \(error)")
            }
        }
        
        realm = try! Realm(fileURL: appGroupURL)
        print(realm.configuration.fileURL!)
        
        self.result = realm.objects(ThoughtsModel.self)
    }
    
    
    func create (title: String, discription: String ) {
        do {
         let newModel = ThoughtsModel()
            newModel.nameTask = title
            newModel.textThoughts = discription
            try realm.write({
                realm.add(newModel)
            })
        }
        catch {
            print (error.localizedDescription)
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
     func del (allIndex : IndexSet) {
        allIndex.forEach ({ index in
                try! realm.write {
                    realm.delete(result[index].self)
                }
            })
        self.result = realm.objects(ThoughtsModel.self)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
     func getObjects()->[ThoughtsModel] {
            let realmResults = realm.objects(ThoughtsModel.self)
            return Array(realmResults)
    }
}
