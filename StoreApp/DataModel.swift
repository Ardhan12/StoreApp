//
//  DataModel.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 05/01/23.
//

import Foundation
import CoreData

class CoreDataManager {
//    var user: [User]?
    
    private static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StoreApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: (error)")
            }
        }
        
        return container
    }()
    
    func saveData(stores: [Store], context: NSManagedObjectContext) {

        context.perform {
            for store in stores {
                let storeData = StoreData(context: context)
                storeData.storeID = store.storeID
                storeData.storeCode = store.storeCode
                storeData.storeName = store.storeName
                storeData.address = store.address
                storeData.dcID = store.dcID
                storeData.accountID = store.accountID
                storeData.accountName = store.accountName
                storeData.subChannelID = store.subchannelID
                storeData.subChannelName = store.subchannelName
                storeData.channelID = store.channelID
                storeData.channelName = store.channelName
                storeData.areaID = store.areaID
                storeData.areaName = store.areaName
                storeData.regionID = store.regionID
                storeData.regionName = store.regionName
                storeData.latidude = store.latitude
                storeData.longitude = store.longitude
            }
            
            do {
                try CoreDataManager.persistentContainer.viewContext.save()
            } catch {
                print("Failed to save store \(error)")
            }
        }
    }
}
