//
//  SingleView.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//

import SwiftUI

struct SingleView: View {
    @FetchRequest var students: FetchedResults<User>
  
    
    init(username:String) {
        print(username)
        // We are not assining not we are changing the whole data
        _students = FetchRequest(sortDescriptors: [],predicate: NSPredicate(format: "name = %@", username) )
    }
    
    var body: some View {
        ForEach(students){ student in
            VStack {
                Text(student.name ?? "Unkown ")
                
                ForEach(student.friendsArray){ friend in
                    Text("\(friend.wrappedName)")
                }
          
                ForEach(student.tagsArray){ tag in
                    Text("\(tag.wrappedName) Tags")
                }
          
            }
        }
            
        }
    }

