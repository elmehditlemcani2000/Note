//
//  AddUserView.swift
//  MySqliteCrudAppSwiftUI
//
//  Created by user on 27/06/22.
//

import Foundation


//
//  AddUserView.swift
//  SQLite_Database
//
//  Created by Adnan Afzal on 24/11/2020.
//  Copyright © 2020 Adnan Afzal. All rights reserved.
//

import SwiftUI

struct AddUserView: View {
    
    // create variables to store user input values
    @State var name: String = ""
    @State var email: String = ""
    @State var age: String = ""
    @State var note: String = ""
    
    // to go back on the home screen when the user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack {
            
            Image("oi-2")
            // create name field
            TextField("Enter name", text: $name)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
            
            // create email field
            TextField("Enter email", text: $email)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // create age field, number pad
            TextField("Enter date", text: $age)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            TextEditor(text: $note)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
             
                
//                .font(.body)
//                .frame(width: .infinity, height: 40, alignment: .center)
//                    .border(Color.gray)
//                .foregroundColor(.white) // Text color
//                .background(Color.blue)
//                .padding()
            
           /*
            TextField("note", text: $note )
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
            */
            
            
            // button to add a user
            Button(action: {
                // call function to add row in sqlite database
                DB_Manager().addUser(nameValue: self.name, emailValue: self.email, ageValue: Int64(self.age) ?? 0, noteValue: self.note)
                
                // go back to home page
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Add Note")
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }.padding()
        
    }
}
