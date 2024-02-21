% Knowledge base (ingredients list):

ingredient(bell_pepper)
ingredient(onion)
ingredient(carrot)
ingredient(peas)
ingredient(tomato)
ingredient(corn)
ingredient(asparagus)
ingredient(scallion)
ingredient(spinach)
ingredient(potato)

ingredient(lemon_juice)
ingredient (lemon)
ingredient(lime)
ingredient(taco_seasoning)
ingredient(salt)
ingredient(garlic)
ingredient(chili_powder)
ingredient(turmeric)
ingredient(cumin)
ingredient(cayenne_pepper)
ingredient(ginger)
ingredient(cinnamon)
ingredient(oregano)
ingredient(parsley)
ingredient(black_pepper)
ingredient(cilantro)
ingredient(basil)
ingredient(red_pepper_flakes)
ingredient(curry_powder)
ingredient(paprika)
ingredient(sesame_seeds)

ingredient(ground_beef)
ingredient(chicken_breast)
ingredient(whole_chicken)
ingredient(salmon)
ingredient(shrimp)
ingredient(ground_turkey)
ingredient(steak)
ingredient(bacon)

ingredient(black_beans)
ingredient(rice_noodles)
ingredient(rice)
ingredient(pasta)
ingredient(nori)
ingredient(spaghetti)

ingredient(heavy_cream)
ingredient(milk)
ingredient(coconut_milk)
ingredient(butter)
ingredient(mexican_cheese)
ingredient(parmesan_cheese)
ingredient(cheddar_cheese)
ingredient(mozzarella_cheese)
ingredient(egg)

ingredient(olive_oil)
ingredient(vegetable_oil)
ingredient(sesame_oil)
ingredient(salsa)
ingredient(tomato_sauce)
ingredient(flour)
ingredient(honey)
ingredient(marinara)
ingredient(soy_sauce)
ingredient(brown_sugar)



% Define recipes and their required ingredients
recipe('Fajita Parchment-Baked Chicken', [chicken, bell_pepper, onion, taco_seasoning, oil]).
recipe('One-Pot Taco Soup', [beef, onion, beans, tomato, tomato_sauce, taco_seasoning]).
recipe('Easy Chicken Alfredo Penne', [butter, chicken, basil, pasta, garlic, flour, milk]).
recipe('Cacio e Pepe', [pasta, oil, butter, cheese]).
recipe('Chicken Stir Fry', [soy_sauce, chicken, oil, sesame_oil]).
recipe('5-ingredient Black Bean Soup', [beans, tomato, cilantro, garlic, cumin]).
recipe('Easy Cheesy Tortellini Bake', [pasta, marinara, cheese, parsley]).
recipe('Onigirazu', [nori, rice, sesame_seeds, salmon]).
recipe('Steak & Potato Hash', [steak, potato, oil, bell_pepper, onion, garlic]).
recipe('Lemon Garlic Chicken', [lemon, garlic, chicken]).
recipe('caprese_sandwich', [bread, tomato, cheese, oil]). 

% Define a predicate to check if you have all the ingredients for a recipe
has_ingredients(Ingredients, RequiredIngredients) :-
    subset(RequiredIngredients, Ingredients).
% Define a predicate to find recipes based on available ingredients
find_recipe(Ingredients, Recipe) :-
    recipe(Recipe, RequiredIngredients),
    has_ingredients(Ingredients, RequiredIngredients).

% Check if a recipe is "mashed potato" and print additional ingredients
print_additional_ingredients('Fajita Parchment-Baked Chicken') :-
    writeln("Additional ingredients: salsa, cheese").
print_additional_ingredients('One-Pot Taco Soup') :-
    writeln("Additional ingredients: corn, cheese").
print_additional_ingredients('Easy Chicken Alfredo Penne') :-
    writeln("Additional ingredients: oregano, parsley, cheese").
print_additional_ingredients('Chicken Stir Fry') :- 
    writeln("Additional ingredients: honey, scallion, asparagus").
print_additional_ingredients('5-ingredient Black Bean Soup') :-
    writeln("Additional ingredients: cumin, garlic").
print_additional_ingredients('Easy Cheesy Tortellini Bake') :-
    writeln("Additional ingredients: N/A").
print_additional_ingredients('Onigirazu') :-
    writeln("Additional ingredients: N/A").
print_additional_ingredients('Steak & Potato Hash') :-
    writeln("Additional ingredients: paprika").
print_additional_ingredients('Spaghetti Carbonara') :-
    writeln("Additional ingredients: bacon, parsley").
print_additional_ingredients('Lemon Garlic Chicken') :-
    writeln("Additional ingredients: N/A").
print_additional_ingredients(_).

% Recursively find and display all matching recipes while avoiding duplicates
find_and_display_recipes(_, []).
find_and_display_recipes(Ingredients, [Recipe|Rest]) :-
    find_recipe(Ingredients, Recipe),
    write("Recipe: "), write(Recipe), nl,
    print_additional_ingredients(Recipe),
    find_and_display_recipes(Ingredients, Rest),
    \+ member(Recipe, Rest).

% Query for recipes based on the provided ingredients
query_recipes(Ingredients) :-
    findall(Recipe, find_recipe(Ingredients, Recipe), Recipes),
    find_and_display_recipes(Ingredients, Recipes).
