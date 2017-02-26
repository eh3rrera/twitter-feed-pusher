# twitter-feed-pusher

iOS app that shows tweets in a feed in realtime from a [Node.js process](https://github.com/eh3rrera/hashtags_pusher) using Pusher.

# Requirements

- Xcode 8
- [Pusher account](https://pusher.com/signup)

# Installation
1. Clone this repository and `cd` into it.
2. Execute `open twitter_feed_pusher.xcworkspace` to open the project in Xcode.
3. Replace your Pusher app key in the `ViewController.swift` file
4. Run the project in the simulator and execute the [Node.js process](https://github.com/eh3rrera/hashtags_pusher) or use the [Pusher Debug Console on your dashboard](http://dashboard.pusher.com/) to start sending tweets.

# License
MIT