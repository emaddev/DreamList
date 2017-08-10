//
//  ItemDetailsVC.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/15/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    var stores = [Store]()
    var inEditing: DreamItem?
    
    @IBOutlet weak var storePicker:UIPickerView!
    @IBOutlet weak var titleTxtField:CustomTextField!
    @IBOutlet weak var priceTxtField:CustomTextField!
    @IBOutlet weak var detailsTxtField:CustomTextField!
    
    
    
    @IBAction func saveItemBtnPressed(_ sender: Any) {
        
        var item: DreamItem!
        
        if inEditing == nil {
            item = DreamItem(context: context)
        } else {
            item = inEditing
        }
        
        if let title = titleTxtField.text {
            item.title = title
        }
        
        if let details = detailsTxtField.text {
            item.details = details
        }
        
        if let price = priceTxtField.text {
            item.price = price
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        appDelegate.saveContext()
        _ = navigationController?.popViewController(animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        storePicker.delegate = self
        storePicker.dataSource = self
        
        //change the back button
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        if inEditing != nil {
            loadDreamItemData()
        }
        
//        
//        let store1 = Store(context: context)
//        store1.name = "Amazon"
//        
//        let store2 = Store(context: context)
//        store2.name = "Target"
//        
//        let store3 = Store(context: context)
//        store3.name = "Digikala"
//        
//        let store4 = Store(context: context)
//        store4.name = "Pro Mobile"
//        
//        let store5 = Store(context: context)
//        store5.name = "Best Buy"
//        
//        let store6 = Store(context: context)
//        store6.name = "Tesla Dealership"
//        
//        do {
//            try context.save()
//        }catch {
//            
//        }
        
        setStores()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TODO
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = stores[row]
        return title.name
    }
    
    func setStores() {
        let store: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(store)
            self.storePicker.reloadAllComponents()
        } catch {
            
        }
    }
    
    func loadDreamItemData() {
        
        if let item = inEditing {
            titleTxtField.text = item.title
            detailsTxtField.text = item.details
            priceTxtField.text = item.price
            
            
            if let store = item.toStore {
                var index:Int = 0
                repeat {
                    let sStore = self.stores[index]
                    if sStore.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while (index < stores.count)
            }
        }
        
    }//end loadDreamItemData function
    
    @IBAction func deleteBtnPressed(_ sender: UIBarButtonItem) {
        
        if inEditing != nil {
            context.delete(inEditing!)
            appDelegate.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
}
