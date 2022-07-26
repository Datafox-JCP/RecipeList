//
//  Recipe_List_App.swift
//  Recipe List App
//
//  Created by Juan Carlos Pazos on 21/07/22.
//

import SwiftUI

@main
struct Recipe_List_App: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
