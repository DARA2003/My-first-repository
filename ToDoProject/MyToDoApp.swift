//
//  MyToDosApp.swift
//  MyToDos
//
//  Created by Tunde Adegoroye on 10/06/2023.
//

import SwiftUI
import SwiftData

@main
struct MyToDosApp: App {
    var body: some Scene {
        // cho biết đây là cửa sổ màn hình chính của app
        WindowGroup {
            ContentView()
                //.modelContainter(for: ): tạo ra một nơi lưu trữ giữ liệu -> phải có để các @environment và @query biết để truy vấn
                //khai báo ngay sau ContentView()
                //nếu có nhiều entity thì khai báo như sau: .moderContainer(for: [ToDoItem.self, AnotherEntity.self])
                //trong trường hợp này sẽ tạo ra một container có kiểu là ToDoItem
                .modelContainer(for: ToDoItem.self)
        }
    }
}

