//
//  ContentView.swift
//  mvvm
//
//  Created by JinSeong on 2019/12/23.
//  Copyright © 2019 JinSeong. All rights reserved.
//
import SwiftUI
import struct Kingfisher.KFImage

struct ContentView: View {
    @ObservedObject
    var coursesVM = CoursesViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                
                
                List(self.coursesVM.courses){ course in
                    
                    HStack{
                        VStack(){
                            KFImage(URL(string: course.bannerUrl))
                                .resizable()
                                .frame(width: geometry.size.width * 0.45, height: 100.0)
                            
                            Text(course.name).frame(width: geometry.size.width * 0.4)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action:{
                print("Fetching json data")
                self.coursesVM.fetchCourses()
            },label: {
                Text("Fetch Courses")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
