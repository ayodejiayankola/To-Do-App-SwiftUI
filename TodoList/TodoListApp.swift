//
//  TodoListApp.swift
//  TodoList
//
//  Created by Ayodeji Ayankola on 15/10/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
 @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
					NavigationView {
						ListView()
					}
					.environmentObject(listViewModel)
        }
    }
}
