//
//  SingUp.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 15.12.2020.
//

import SwiftUI

struct SingUp: View {
    @ObservedObject private var userModel = UserViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("username", text: $userModel.name)
                    .autocapitalization(.none)
            }
            Section {
                TextField("Password", text: $userModel.password)
                    .autocapitalization(.none)
                TextField("Password again", text: $userModel.passwordAgain)
                    .autocapitalization(.none)
            }
            Section {
                Button(action: {}) {
                    Text("Sing up")
                }.disabled(!self.userModel.isValid)
            }
        }
    }
}

struct SingUp_Previews: PreviewProvider {
    static var previews: some View {
        SingUp()
    }
}
