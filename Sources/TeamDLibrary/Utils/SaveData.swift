//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

public extension Defaults.Keys {
    static let myProfile = Key<ProfileData>(
        "myProfile",
        default: .init(
            name: "",
            age: 0,
            image: Data(),
            isYamanashi: false,
            shoukaibun: ""
        )
    )
    static let matchedPeople = Key<[ProfileData]>(
        "matchedPeople",
        default: []
    )
}
