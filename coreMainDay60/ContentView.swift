//
//  ContentView.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [],predicate: nil ) var students: FetchedResults<User>
    
    
    var body: some View {
        NavigationView {
        VStack {
            List(students){ student in
                NavigationLink(destination: SingleView(username: student.name ?? "Unkown")) {
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
            }.navigationBarTitle("User List")
            
            Button("Add"){
                
                
                
                guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                    print("Invalid URL")
                    return
                }
                let request  = URLRequest(url: url)
                
                
                URLSession.shared.dataTask(with: request){ data, reponse,   error in
                    if let data = data {
                        if let decodedResponse = try?  JSONDecoder().decode([UserModal].self,from:data) {
                            DispatchQueue.main.async {
                                
                                print(decodedResponse)
        
                                
                                
                                for user in decodedResponse {
                                    
                                    let student = User(context: moc)
                                    student.name = user.name
                                    student.id = user.id
                                    var friendSet = Set<Friend>()
                                    
                                    for friend in user.friends {
                                        let friend1 = Friend(context: moc)
                                        friend1.id = UUID()
                                        friend1.name = friend.name
                                        friendSet.insert(friend1)
                                    }
                                 
                                    
                                    var tagSet = Set<Tag>()
                                    for tagA in user.tags{
                                        let tag = Tag(context: moc)
                                        tag.name = tagA
                                        tagSet.insert(tag)
                                    }
                               
                                    
                                    student.addToTags(tagSet)
                                    student.addToFriends(friendSet)
                                    

                                    
                                    try? self.moc.save()
                                }
                                
                                
                                
                            }
                            return
                        }
                    }
                    print("Fetch Failed: \(error?.localizedDescription ?? "Unknown error")")
                }.resume()
                
            }
        }
            //.onAppear {
//
//            for usr in students {
//                moc.delete(usr)
//                try? moc.save()
//            }
//
//        }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
