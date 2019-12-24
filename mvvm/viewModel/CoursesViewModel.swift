//
//  CoursesViewModel.swift
//  mvvm
//
//  Created by DD Dev on 2019/12/24.
//  Copyright © 2019 JinSeong. All rights reserved.
//

import Foundation

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

class CoursesViewModel: ObservableObject {
    
    @Published
    var courses: [Course] = []
    
    init() {
        fetchCourses()
    }
    
    func fetchCourses(){
        // jetch json and decode and update some array property
        
        guard let url = URL(string: apiUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // make sure to check error / response
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
    
}
