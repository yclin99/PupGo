//
//  Event.swift
//  PupGo_TextField
//
//  Created by ace_ye on 11/2/21.
//

import SwiftUI

class Event {
    
  var username: String
  var location: String
  var starttime: String
  var endtime: String
  var image: Image
  
  init(username: String, location: String, starttime: String, endtime: String, image: Image) {
    self.username = username
    self.location = location
    self.starttime = starttime
    self.endtime = endtime
    self.image = image
  }
  
}
