//
//  GithubUserData+CoreDataProperties.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 19/06/2021.
//
//

import Foundation
import CoreData


extension GithubUserData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GithubUserData> {
        return NSFetchRequest<GithubUserData>(entityName: "GithubUserData")
    }

    @NSManaged public var avatar_url: String?
    @NSManaged public var bio: String?
    @NSManaged public var blog: String?
    @NSManaged public var company: String?
    @NSManaged public var created_at: String?
    @NSManaged public var email: String?
    @NSManaged public var events_url: String?
    @NSManaged public var followers: Int64
    @NSManaged public var followers_url: String?
    @NSManaged public var following: Int64
    @NSManaged public var following_url: String?
    @NSManaged public var gists_url: String?
    @NSManaged public var gravatar_id: String?
    @NSManaged public var hireable: String?
    @NSManaged public var html_url: String?
    @NSManaged public var id: Int64
    @NSManaged public var location: String?
    @NSManaged public var login: String?
    @NSManaged public var name: String?
    @NSManaged public var node_id: String?
    @NSManaged public var organizations_url: String?
    @NSManaged public var public_gists: Int64
    @NSManaged public var public_repos: Int64
    @NSManaged public var received_events_url: String?
    @NSManaged public var repos_url: String?
    @NSManaged public var site_admin: Bool
    @NSManaged public var starred_url: String?
    @NSManaged public var subscriptions_url: String?
    @NSManaged public var twitter_username: String?
    @NSManaged public var type: String?
    @NSManaged public var updated_at: String?
    @NSManaged public var url: String?

}

extension GithubUserData : Identifiable {
   
}


