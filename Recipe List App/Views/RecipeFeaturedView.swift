//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Juan Carlos Pazos on 26/07/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
            
            GeometryReader { geo in
                TabView {
                    // Loop through each recipe
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        // Only shows those that should be featured
                        if model.recipes[index].featured {
                            // Recipe card
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}

/*
 Line 28:
 ForEach(0..<model.recipes.count) { index in
 Throws the warning: Non-constant range: argument must be an integer literal

 It can be fixed by adding id: \.self so that the code is now

Why id: \.self appears to be necessary now or was the previous code dead wrong in the first place?
 
 When you use a range in a ForEach like that, it is read initially and never updated, so if you add/remove items from your array (model.recipes in this case), you can run into an index out of range error that will crash your app.
 */
