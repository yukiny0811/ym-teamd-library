//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

public extension Util {
    static func getMyProfile() -> ProfileData {
        Defaults[.myProfile]
    }
    static func updateMyProfile(profile: ProfileData) {
        Defaults[.myProfile] = profile
    }
    static func appendMatchedPerson(person: ProfileData) {
        Defaults[.matchedPeople].append(person)
    }
}
