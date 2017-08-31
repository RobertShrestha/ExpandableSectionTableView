//
//  Section.swift
//  ExpandableTableView
//
//  Created by Robert Shrestha on 5/26/17.
//  Copyright © 2017 AccessibleICT. All rights reserved.
//

import Foundation



struct MailModel {
    var mailId=String()
    var mailSubject=String()
    var mailDate=String()
    var mailStatus=String()
    var mailAttachment=Bool()
    
}
struct MailDetailModel{
    var mailSubject = String()
    var mailMessage = String()
    var mailRecievedOn = String()
    var mailPartner = String()
    var mailAttachment = [NSDictionary]()
    var mailDraft = Bool()
}
struct MailNewDetailModel{
    var allowedSize = Int()
    var allowedType = [String]()
    var allowedPeople = [NSDictionary]()
}

struct Section{
    var title=String()
    var mails=[MailModel]()
    var expanded=Bool()
    
    init(title:String,mails:[MailModel],expanded:Bool) {
        self.title=title
        self.mails=mails
        self.expanded=expanded
    }
    
}
