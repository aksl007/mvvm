//
//  Course.swift
//  mvvm
//
//  Created by DD Dev on 2019/12/24.
//  Copyright © 2019 JinSeong. All rights reserved.
//

import Foundation
import UIKit

struct Course: Identifiable, Decodable{
    let id = UUID()
    let name: String
    let price: Int
    let bannerUrl: String

}
