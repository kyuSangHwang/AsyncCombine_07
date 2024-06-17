//
//  UserProfileScreen.swift
//  StateManagement
//
//  Created by 황규상 on 6/17/24.
//

import SwiftUI

struct UserProfileScreen: View {
    @EnvironmentObject var profile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("User Profile")) {
                    TextField("Name", text: $profile.name)
                    TextField("Favorite Programming Laguage", text: $profile.favoriteProgrammingLanguage)
                    ColorPicker("Favorite color", selection: $profile.favoriteColor)
                }
            }
        }
        .navigationTitle("User Profile")
    }
}

#Preview {
    NavigationStack {
        UserProfileScreen()
    }
    .environmentObject(UserProfile(name: "Peter", favoriteProgrammingLanguage: "Swift", favoriteColor: .pink))
}
