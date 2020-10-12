# ProKarmaCodeChallenge

## Project Highlights

### MVVM architecture   
MVVM (Model-View-ViewModel) is derived from MVC(Model-View-Controller). It is introduced to solve existing problems of Cocoa's MVC architecture in iOS world. One of its feature is to make a better separation of concerns so that it is easier to maintain and extend.
Key Features: Distribution, Testability, Reusability
* Model: It is similar to model layer in MVC (contains data business logic)
* View: UIViews + UIViewControllers (We treat both layout view and controllers as View)
* ViewModel: A mediator to glue above two layers together.

### ImageCache  
With ImageCache, you can optimize the image loading within an app and enhance user experience. After all, loading images from cache should be always faster than getting ones from the network.

Infinite Scrolling: Requesting Next Pages  
We need to modify the view model code to request the next pages of the API. Here’s an overview of what we need to do:
* Keep track of the last page received so you know which page is needed next when the UI calls the request method
* Build the full list of feed. When you receive a new page from the API, you have to add it to your feed’s list (instead of replacing it ). When get a response, can update the table view to include all of the feeds received thus far.
