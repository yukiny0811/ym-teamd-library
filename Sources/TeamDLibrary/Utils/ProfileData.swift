//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

public struct ProfileData: Codable, Identifiable, Defaults.Serializable {
    
    public init(name: String, age: Int, image: Data, isYamanashi: Bool, shoukaibun: String) {
        self.name = name
        self.age = age
        self.image = image
        self.isYamanashi = isYamanashi
        self.shoukaibun = shoukaibun
    }
    
    public var id: String = UUID().uuidString
    public var name: String
    public var age: Int
    public var image: Data
    public var isYamanashi: Bool
    public var shoukaibun: String
}
