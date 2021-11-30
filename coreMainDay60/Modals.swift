//
//  Modals.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//

import Foundation



struct UserModal: Codable,Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let about: String
    let tags: [String]
    let friends: [FriendModal]
}

struct FriendModal: Codable,Identifiable {
    let id: UUID
    let name: String
}


