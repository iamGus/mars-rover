
# Mars Rover Image Viewer

An app that allows people to view images taken by the Mars rovers. Using the NASA Open APIs.


## My progress

### First Commits
After an hour I had all main components setup to show the data, but unfortunately I had a json decoding error. [SHA: 6a22c8a41e8dc076cba6fa542b735ddc885f60b8](https://github.com/iamGus/mars-rover/commit/6a22c8a41e8dc076cba6fa542b735ddc885f60b8)

After the hour I soon found the issue and this commit has working data in the app. [SHA: b50b5ab53bd901e81e2e2d80a63386ff44b44e68](https://github.com/iamGus/mars-rover/commit/b50b5ab53bd901e81e2e2d80a63386ff44b44e68)

Though I did not complete all features in the hour I wanted to show you a completed example of what I can do so you will find these commits after the above mentioned ones.

### Dependencies used
After the above first commits I then got image caching working quickly thanks to a third party library. Another option would have been to use operations and async download each image and store them locally in the file system but as of time constraints I decided to use KingFisher which async downloads images, saves them locally and will use saved versions when same url is accessed.

### Data persistence
As of time constraints I used UserDefaults to store the RoverPhoto models as json. Of course UserDefaults should not be used for large amounts of data. Instead in a production app I would instead look into other persistence methods, like a database.

### Testing
As of the time I had already spent on the project I decided to stop there and not add the tests. But if you would like me to write any tests then please let me know.
