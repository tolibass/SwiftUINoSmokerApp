//
//  AddThoughts.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 15.12.2020.
//

import SwiftUI

struct AddThoughts: View {
    
    @State var name = ""
    @State var descripton = ""
    @EnvironmentObject var crud: CRUD
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Tittle", text: $name)
                TextField("Description", text: $descripton)
            }
            
            Form {
                Button(action: {
                    self.crud.create(title: name, discription: descripton)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save note")
                }
            }
            .navigationBarTitle("Add")
            
        }
    }
}

struct AddThoughts_Previews: PreviewProvider {
    static var previews: some View {
        AddThoughts()
    }
}
