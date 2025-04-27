## The Assignment ##
- Connect connect to a DND api and display 4 buttons on the home page that show lists of items like monsters.
- Duration about 60-90 minutes
- Only consume and show data for 4 list endpoints

### Considerations if this were a production app: ###
- We need loading spinners for each list when our app is fetching from the api
- We need error handling for api. We should show an error in the ui to let the user know something went wrong
- We need empty states in case the api has no items to return
- We should store our data in a relational DB in the app like core data.
- There are more endpoints in this api and there for many more relationships
- We reused some UI elements and some code looks duplicated. We would need more custom ui since each page will have unique design. We also can simply duplicated code if possible but most likely we will have more customization for sub objects like Armor on a Monster
- Unit tests. This demo is almost too basic to need unit tests but in production we will need them and the ability to mock api calls
