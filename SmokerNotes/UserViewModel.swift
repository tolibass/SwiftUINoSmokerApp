//
//  UserViewModel.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 15.12.2020.
//

import Foundation

class UserViewModel : ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    @Published var isValid = false
    
}
