//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ayodeji Ayankola on 29/10/2023.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
	@Published var items: [ItemModel] = [] {
		didSet{
			saveItem()
		}
	}
//	let itemsKey: String =  "items_list"
	@AppStorage("items_list") var itemsData: Data?
	init() {
		getItems()
	}
	
	
	func getItems(){
//		let newItems = [
//			ItemModel(title: "This is the first title!", isCompleted: false),
//	 ItemModel(title: "This is the second title!", isCompleted: true),
//	 ItemModel(title: "This is the third title!", isCompleted: false)
//   ]
//		guard let  data = UserDefaults.standard.data(forKey: itemsKey) else {
//     		return
//		}
//		guard	let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
//			return }
//		let data = UserDefaults.standard.data(forKey: itemsKey)
//		items.append(contentsOf: newItems)
		
//		guard
//			let  data = UserDefaults.standard.data(forKey: itemsKey) ,
//				let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
//		else { return }
		guard
			let  data = itemsData ,
				let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
		else { return }
		self.items = savedItems
	}
	
	
	func deleteItem(indexSet: IndexSet) {
		items.remove(atOffsets: indexSet)
	}
	
	func moveItem(from: IndexSet, to: Int) {
		items.move(fromOffsets: from, toOffset: to)
	}
	
	func addItem(title: String) {
		let newItem = ItemModel(title: title, isCompleted: false)
		items.append(newItem)
	}
	func updateItem(item: ItemModel) {
		if let index = items.firstIndex(where: { $0.id == item.id }) {
			items[index] = item.updateCompletion()
		}
	}
	
	func saveItem() {
//		if let encodedData = try? JSONEncoder().encode(items) {
//			UserDefaults.standard.set(encodedData, forKey: itemsKey)
//		}
		
		if let encodedData = try? JSONEncoder().encode(items) {
			itemsData = encodedData
		}
	}
}

