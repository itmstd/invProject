class DrinksCategories {
  var strDrink;
  var strDrinkThumb;
  var idDrink;
  var strSearchDrink;

  DrinksCategories({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
    required this.strSearchDrink,
  });
}

List<DrinksCategories> beveragesType = [
  DrinksCategories(strSearchDrink: "Ordinary Drink", strDrink: "Ordinary Drink", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg", idDrink: 1),
  DrinksCategories(strSearchDrink: "Cocktail", strDrink: "Cocktail", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg", idDrink: 2),
  DrinksCategories(strSearchDrink: "Cocoa", strDrink: "Cocoa", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/3nbu4a1487603196.jpg", idDrink: 3),
  DrinksCategories(strSearchDrink: "Shot", strDrink: "Shot", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg", idDrink: 4),
  DrinksCategories(strSearchDrink: "Homemade Liqueur", strDrink: "Homemade Liqueur", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/uxxtrt1472667197.jpg", idDrink: 5),
  DrinksCategories(strSearchDrink: "Beer", strDrink: "Beer", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/xxyywq1454511117.jpg", idDrink: 6),
];