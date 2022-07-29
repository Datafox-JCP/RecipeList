    //
    //  RecipeDetailView.swift
    //  Recipe List App
    //
    //  Created by Juan Carlos Pazos on 21/07/22.
    //

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedServingSize = 2
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy",  size: 24))
                
                // MARK: Serving size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir",  size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir",  size: 15))
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
                .padding(.horizontal)
                
                    // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy",  size: 16))
                        .padding(.bottom, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("● " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .padding([.bottom, .top], 5)
                            .font(Font.custom("Avenir",  size: 15))
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                                .font(Font.custom("Avenir Heavy",  size: 16))
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
            //  Create a dummy recipe
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
