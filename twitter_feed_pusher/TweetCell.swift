//
//  TweetCell.swift
//  twitter_feed_pusher
//
//  Created by Esteban Herrera on 2/25/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    var tweet: Any? {
        didSet {
            guard let t = tweet as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: t.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            attributedText.append(NSAttributedString(string: " @\(t.username)\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: t.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
            
            messageText.attributedText = attributedText
            
            let imageUrl = URL(string: "https://twitter.com/" + t.username + "/profile_image")
            profileImage.af_setImage(withURL: imageUrl!)
        }
    }
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let messageText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImage)
        addSubview(messageText)
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        messageText.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        messageText.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 4).isActive = true
        messageText.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageText.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

