//
//  SingleView.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//

import SwiftUI

struct SingleView: View {
    @FetchRequest var users: FetchedResults<User>
  
    
    init(username:String) {
        print(username)
        // We are not assining not we are changing the whole data
        _users = FetchRequest(sortDescriptors: [],predicate: NSPredicate(format: "name = %@", username) )
    }
    
    var body: some View {
        ForEach(users){ user in
            VStack {
                Text(user.name ?? "Unkown ")
                
                ForEach(user.friendsArray){ friend in
                    
                    NavigationLink(destination: SingleView(username: friend.wrappedName)){
                        Text("\(friend.wrappedName)")
                    }
                    
                }
          
                ForEach(user.tagsArray){ tag in
                    Text("\(tag.wrappedName) Tags")
                }
          
            }
        }
            
        }
    }

