//
//  mymodel.swift
//  map
//
//  Created by frh alshaalan on 08/05/2023.
//

import SwiftUI

struct mymodel: View {
    // pass this var as binding to other views
    @State var showAlert = false
    
    func notificationReminder() -> Alert {
            Alert(
                title: Text("Notifications Required"),
                message: Text("Please authorize notifications by going to Settings > Notifications > Remindr"),
                dismissButton: .default(Text("Okay")))
    }
    
    var body: some View {
        
        VStack {
            Text("this is my main view")
        }
        .alert(isPresented: self.$showAlert,
               content: { self.notificationReminder() })
        
    }
    
}
