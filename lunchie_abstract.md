**Lunchie**

**Abstract:** 
Are you a professional at Fueled that suffers from "Lunch Choice Overload Anxiety"?  Maybe you're not alone; maybe your whole team suffers from LCOA.  Tired of losing valuable work hours staring at pizza and Chinese food takeout menus, or chasing down that forgetful producer that never gets her lunch order in to you on time?  Enter Lunchie, the streamlined lunch experience that will get you and your team back on track.  

Lunchie picks three restaurants in your area, just three.  No more sweaty palms while wading through 100 Thai restaurants on seamless.  Once you've chosen your restaurant, (Lunchie provides the restaurant menu in-app) you can send that menu out to your teammates that you're going to lunch with.  They get a notification on their iPhones and can choose what they want to eat in just two taps of their thumbs.  

Got a meeting hungry producer that's always too busy to reply to the team list?  We've got you covered there as well.  Lunchie fires out an alarm at a time you set so you get all the orders you need on time and can get back to what matters most, doing great work.

**Approach:**
I hate having too many choices.  When I used to live in the LES, I'd get so overwhelmed by the number of good restaurants in my area, I'd end up going home and making pb&j.  Limiting choice is a good way to tackle choice overload, so that's why the app only returns 3 restaurants.  That's a number that I'd like to be able to be modified in the real version of the app.

The problem specifically said that the app needed to address the needs of the team.  While the timer and team functionality is not yet implemented, sending the menu out to a specific group of people can help streamline the often daunting task of getting more than one busy person on task to order food.

**Strategy:**
Given that the client Fueled exhibits a high level of design and usability in their products, I wanted to produce something reflective of that.  While this was a code challenge, and design was not a part of the challenge, I found it hard to picture a product appropriate for the client without taking design into consideration.  At the expense of this, I sacrificed most of, if not all general error testing and unit testing code that I would normally employ under less stringent time conditions.  

I'm attaching a project called ystrdy to this email as well.  It is a simple concept that shows the user today's temperature in relation to yesterday's.  In it you'll find a unit testing and error testing model that is more reflective of my general approach to those topics.

**Design:**
The problem specified the team at Fueled, so picturing the app being used at Fueled, naturally I thought a Fueled aesthetic would be appropriate.  I got the color scheme from the Fueled website and chose a similarly bold font.  If given more time, I could've done a better job at nailing the overall look and feel, but I had to code at some point.

I created the logo as well.  Growing up, my father worked at an agency in Soho.  We'd always go to noodle shops so I can't really think about soho and lunch without thinking about noodles; that was the inspiration behind that.

**Requirements:**
All of the functional requirements assigned were met.

1. **Should keep track of visited restaurants:** When the VenuePanel is opened and the "send to teammates" button is pressed, a checkmark appears next to the liked heart.  This is how a restaurant is marked as visited and this will persist over multiple uses of the app.
2. **Ability to read/write reviews:** Pressing the reviews button will take the user to the reviews page.  You can leave a review and it will be stored locally for each venue.
3. **Ability to thumbs-down a restaurant and it is not considered in the future:** There is a thumbs-down button at the top right of the image in venue detail view.  While I'm not in love with its placement, pressing it marks the venue as thumbs downed.  Upon the next loading of the app, venues that are thumbs downed are not added to the model's venue array.  Eventually you can run out of venues to show.  I'd have another view or some way to see the thumbs downed venues in a future version of the app.
4. **Twitter & Facebook native api usage:** In the initial signup screen, when you press either the Twitter or Facebook buttons, the app will attempt to access the locally stored Facebook or Twitter account on the phone and then populate the "Your Name" field with the username or full name of the user.  This screen serves no other purpose than to demonstrate that functionality.  In the real app, there'd be a more robust signup process of course.

**Design Patterns**
I like to code iteratively.  As Donald Knuth said, "premature optimization is the root of all evil" and I approached this project (sans tests) the same.  Because of my overall strategy and priorities of this project, I was only able to iterate a limited number of times.  I'll address the patterns that I used, and the ones that I left out and would add had I had more time.
1. **Singleton Pattern:** There is always a single instance of the model, LCHModel.  The plus side of this is that I never have to worry about my model being overwritten or using it in an unexpected state, i.e. without the setup code that is done in my managers.
2. **Façade Pattern:** The LCHNetworkManager sits as a façade between it's service and builders.  This hides the implementation details of a manager call from the rest of the app.  This allows the addition of any number of services/builders to the manager without affecting the rest of the app.  
3. **Builder Pattern:** The LCHFoursquareVenueBuilder and LCHFoursquareVenueMenuBuilders abstract the json response parsing from the manager.  If Foursquare were to ever change the output of their api, or we were to migrate to a different api version, all I'd have to do is update the corresponding builder and I'd ensure that the rest of the app works fine.
4. **MVC & Delegate Patterns:** It is impossible to write a Cocoa app without implicitly using MVC, as it is a crucial pattern found in the framework.  It is very possible to break this pattern explicitly.  In my code, namely in the LCHVenuePanel, I adhere to this pattern by never calling my model singleton directly.  Using the delegate pattern I have the Panel's delegate, which is a view controller, handle all interfacing with the app's model.
5. **General Inheritance:** This is an area that the code could use some work.  I try to avoid using UINavigationBar as it is weird and unintuitive to me.  I like to use my own navigation bar, but the UINavigationViewController is a great controller to have.  I would've rather had a parent view controller that my other vc's would've inherited from with just a single instance of my custom navbar and other stuff put in there.  Because there are only 3 vc's that need to use the code, really 2, I thought the duplication negligible, but it still can be improved upon.
6. **External Libraries Used:**
EAIntroView: This helped with the horizontal paging.  It is code that I could've written myself, but having it saved time.
FSNetworking: MKNetworkKit was overkill for this project.  I needed a simple library so I could grab venues from Foursquare.

**Other General Points About the Code:**
I would've liked to use a more functional programming approach to this challenge, but given the constraints, I went with the delegate/block patterns that I'm more comfortable with.  

I like to abstract visual constants out of my view controllers.  I've done that in the LCHColorHelper and LCHFontHelpers, and I additionally like to do that with my common margins & view sizes as well.

I thought Core Data was overkill for this assignment.  In a more robust approach, I think Core Data would be the definitive choice because the app has users etc.  Just writing plists and then pairing them with initial list of venues unload seemed sufficient for this challenge.

I kept the comments to a minimum, and come from the school of thought that comments in code are mostly evil.  I the code and the unit tests should be written clearly enough that they serve as documentation themselves.

**Summary**
This challenge was a lot of fun.  It pushed me in a lot of ways, and I honestly am very proud of what I was able to produce in such a short period of time.  Please do not hesitate to contact me if you have any questions or would like me to clarify any parts of the code.

Thanks for the opportunity!

