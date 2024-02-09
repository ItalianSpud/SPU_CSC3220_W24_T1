SELECT *
FROM Reviews
JOIN Recipes on Recipes.recipeID=Reviews.recipeId
WHERE Recipes.userId = 1;

UPDATE Reviews
SET taste = 10
WHERE userId = 1;