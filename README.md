# Project 4 - *InstaCam*

**InstaCam** is a photo sharing app using Parse as its backend.

Time spent: **30** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can tap a post to view post details, including timestamp and caption.

The following **optional** features are implemented:

- [X ] Run your app on your phone and use the camera to take the photo
- [X] Style the login page to look like the real Instagram login page.
- [ ] Style the feed to look like the real Instagram feed.
- [ ] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user. AKA, tabs for Home Feed and Profile
- [ ] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling.
- [ ] Show the username and creation time for each post
- [ ] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- User Profiles:
- [ ] Allow the logged in user to add a profile photo
- [ ] Display the profile photo with each post
- [ ] Tapping on a post's username or profile photo goes to that user's profile page
- [ ] User can comment on a post and see all comments for each post in the post details screen.
- [ ] User can like a post and see number of likes for each post in the post details screen.
- [ ] Implement a custom camera view.

The following **additional** features are implemented:

- [X] User can swipe on Register view to travel back to Login view.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. An explanation on the functionality of parse.
2. Knowing how to properly transition between view controllers in the most efficient way(s).

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/hSx8S1ij9o.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library


## Notes

- The images on the timeline are of a large size and cover over part of the layout. Had trouble with incorporating resize image method.
- Need to be more efficient with commenting to organize heavy code. 
- Need to touch up more on segue and transitioning between differene view controllers.



## License

Copyright [2019] [Camryn Belcher]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
