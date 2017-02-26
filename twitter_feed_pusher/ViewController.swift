//
//  ViewController.swift
//  twitter_feed_pusher
//
//  Created by Esteban Herrera on 2/25/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit
import PusherSwift

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var tweets = [Tweet]()
    var pusher: Pusher! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pusher Feed"
        
        tableView.register(TweetCell.self, forCellReuseIdentifier: cellId)
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        pusher = Pusher(
            key: "<INSERT_YOUR_PUSHER_KEY_HERE>"
        )
        
        // subscribe to channel and bind to event
        let channel = pusher.subscribe("hashtags")
        
        let _ = channel.bind(eventName: "new_tweet", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                
                let message = data["message"] as! String
                let name = data["name"] as! String
                let username = data["username"] as! String
                
                let tweet = Tweet(name: name, username: username, message: message)
                
                self.tweets.insert(tweet, at: self.tweets.startIndex)
                
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.none, animated: true)
            }
        })
        
        pusher.connect()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.item]
        
        return cell;
    }


}

