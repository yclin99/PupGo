//
//  Photo.swift
//  RWDevCon
//
//  Created by Mic Pringle on 04/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class Event {
  
  class func allEvents() -> [Event] {
    var events = [Event]()
    if let URL = Bundle.main.url(forResource: "Photos", withExtension: "plist") {
      if let photosFromPlist = NSArray(contentsOf: URL) {
        for dictionary in photosFromPlist {
          let event = Event(dictionary: dictionary as! NSDictionary)
          events.append(event)
        }
      }
    }
    return events
  }
  
  var location: String
  var starttime: String
  var endtime: String
  var image: UIImage
  
  init(location: String, starttime: String, endtime: String, image: UIImage) {
    self.location = location
    self.starttime = starttime
    self.endtime = endtime
    self.image = image
  }
  
  convenience init(dictionary: NSDictionary) {
    let location = dictionary["Location"] as? String
    let starttime = dictionary["starttime"] as? String
    let endtime = dictionary["endtime"] as? String
    let image = UIImage(named: photo!)?.decompressedImage
    self.init(caption: caption!, comment: comment!, image: image!)
  }
  
  func heightForComment(_ font: UIFont, width: CGFloat) -> CGFloat {
    let rect = NSString(string: comment).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    return ceil(rect.height)
  }
  
}
