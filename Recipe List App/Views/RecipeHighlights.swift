//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Juan Hernandez Pazos on 29/07/22.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highligths:[String]) {
        // Loop through the highlights and build the string
        for index in 0..<highligths.count {
            // If this is the last item, don't add a comma
            if index == highligths.count - 1 {
                allHighlights = highligths[index]
            } else {
                allHighlights = highligths[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highligths: ["test", "test2", "test3"])
    }
}
