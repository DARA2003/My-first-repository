//
//  ToDoItem.swift
//  MyToDos
//
//  Created by Tunde Adegoroye on 10/06/2023.
//

import Foundation
import SwiftData

//@Model đánh dấu ToDoItem là một entity được dùng cho @Query lấy dữ liệu -> dùng khi có sử dụng @query
@Model
//sử dụng class khi thao tác trên SwiftData , nếu chỉ sử dụng SwiftUI thì có thể sử dụng thêm stuct
final class ToDoItem {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool

    init(title: String = "",
         //kiểu Date bào gồm cả ngày và giờ
         timestamp: Date = .now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
