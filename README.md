# treehouse_td_unit02
**The second unit of iOS dev boot camp by teamtreehouse.com**
* The primary goal

  * The starter files contain a Storyboard scene that is simulated to a 4.7 inch iPhone without any constraints to position elements. If you run the app in the simulator for a 5.5 inch iPhone, the layout looks fine but it breaks on any other device size. Convert the Storyboard back to a universal scene and add constraints to maintain the layout such all UI elements are sized and spaced appropriately for all iPhones of screen sizes 4.7 and 5.5. inches.
  * Refactor the existing code such that individual questions are modeled using a class or struct
  * Ensure that code adheres to the MVC pattern.
  * Place your new custom data structure for questions in a new Swift file.
  * Enhance the quiz so it can accommodate four answer choices for each question.
  * Add functionality such that during each game, questions are chosen at random, though no question will be repeated within a single game.

* The Secondary objective for a higher credit on the project

  * Implement a feature so that the app can neatly display a mix of 3-option questions as well as 4-option questions. Inactive buttons should be spaced or resized appropriately, not simply hidden, disabled, or marked as unused (e.g. with the string ‘N/A’). You *need to implement this feature using only one view controller.*
  * Implement a way to appropriately display the correct answer, when a player answers incorrectly.
  * Modify the app to be in "lightning" mode where users only have 15 seconds to select an answer for each question. Display the number of correct answers at the end of the quiz.
  * Add two sound effects, one for correct answers and one for incorrect. You may also add sounds at the end of the game, or wherever else you see fit. (Hint: you can base your solution on code already found in the starter app.)
