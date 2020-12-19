//
//  ContentView.swift
//  NoSmokeDiary
//
//  Created by Anatoliy on 14.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var crud: CRUD
    
    var body: some View {
        Home()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CRUD())
    }
}

struct Home: View {
    @State private var disableButton = true
    @State private var _user_ = ""
    @State private var presentedView = false
    var userName: String {
        get {
        return _user_
        }
        set {
            if Array(_user_).count > 3 {
                disableButton = false
            }
        }
    
    }
    var KEY_FOR_USERNAME = "SmokerName"
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("redMainColor"), Color("grad1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                Text("StopSmokingApp")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                
                Image("Smokk")
                    .resizable()
                    .cornerRadius(30.0)
                    .frame(width: 350.0, height: 230.0)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    .padding(.bottom, 20)
                
                
                Text("Log in your account ")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.vertical, 25)
                
                VStack(spacing: 15) {
                    TextField("Username", text: self.$_user_)
                        .padding(.top, 15)
                        .background(RoundedRectangle(cornerRadius: 6)
                                        .stroke(self.userName != "" ?  Color("redMainColor") : .black, lineWidth: 2 ))
                  
                    Button(action: {
                        if  Array(userName).count > 3 {
                            UserDefaults.standard.set(userName, forKey: KEY_FOR_USERNAME)
                            presentedView = true
                            
                        }
                    }) {
                        Text("Enter")
                            .foregroundColor(.black)
                    }.fullScreenCover(isPresented: $presentedView, content: {
                        SmokingList()
                    })
                    .disabled(disableButton)
                    .frame(width: 310, height: 60, alignment: .center)
                    .background(Color("redMainColor"))
                    .cornerRadius(60)
                    .padding(.top, 10)
                    
                }
                
                .padding(.horizontal, 35)
            }
        }
        .onAppear {
            
        }
    }
    
}
