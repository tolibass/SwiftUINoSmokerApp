//
//  SmokingList.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 15.12.2020.
//

import SwiftUI

struct SmokingList: View {
    
    
    @State private var showingAddThoughts = false
    @EnvironmentObject var crud: CRUD 
        
    var body: some View {
        NavigationView {
            List {
                ForEach(crud.result) { item in
                    Text (item.nameTask)
                            Text (item.description)
                        }
                .onDelete(perform: { indexSet in
                    self.crud.del(allIndex: indexSet)
                })
            }
            
            .navigationTitle("My  thought")
            .navigationBarItems(trailing: Button (action: {
                self.showingAddThoughts = true
            }) {
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $showingAddThoughts) {
                AddThoughts()
            }
        
        }
    }
    
}

struct SmokingList_Previews: PreviewProvider {
    static var previews: some View {
        SmokingList().environmentObject(CRUD())
    }
}
