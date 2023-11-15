//
//  AddView.swift
//  TodoList
//
//  Created by Ayodeji Ayankola on 15/10/2023.
//

import SwiftUI

struct AddView: View {
	@Environment(\.dismiss) var dismiss
	
	@EnvironmentObject var listViewModel: ListViewModel
	
	@State private var alertTitle: String = ""
	
	@State private var showAlert = false

	@State var textFieldText: String = ""
	
    var body: some View {
			ScrollView {
				VStack {
					TextField("Type something Here ...", text: $textFieldText)
						.frame(height: 55)
						.padding(.horizontal)
						.background(Color(UIColor.secondarySystemBackground))
					.cornerRadius(10)
					
					Button {
						saveButtonPressed()
					} label: {
						Text("Save".uppercased())
							.foregroundColor(.white)
							.font(.headline)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
							.background(Color.accentColor)
							.cornerRadius(10)
					}

				}
				.padding(14)
			}
			.navigationTitle("Add an Item🖋️")
			.alert(isPresented: $showAlert) {
				getAlert()
			}
    }
	
	func saveButtonPressed() {
		if textIsMinimum() {
			listViewModel.addItem(title: textFieldText)
				dismiss()
		}
	}
	
	func textIsMinimum() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "Your new todo item must be at least 3 characters long!!! 😢"
			showAlert.toggle()
			return false
		}
		return true
	}
	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
	
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
			Group {
				NavigationView {
					AddView()
				}
				.environmentObject(ListViewModel())
				
				NavigationView {
					AddView()
				}
				.environmentObject(ListViewModel())
			}

        
    }
}
