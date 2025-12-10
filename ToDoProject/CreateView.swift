//Mục đichL tạo một khung mới hiển thị khi tạo TODO mới

import SwiftUI

//SwiftData: để quản lý dữ liệu persist (ToDoItem) và dùng @Query/@Environment(\.modelContext)
import SwiftData

struct CreateTodoView: View {
    //khai báo dòng này thì: sau khi gọi hàm dismiss() thì cửa sổ hiện hành sẽ đóng
    @Environment(\.dismiss) var dismiss
    
    //giúp thực hiện các thao tác ínsert, delete, update
    @Environment(\.modelContext) var context
    
    //@State để khai báo biến mà sau này người dùng sẽ thay đổi nó: Nhập
    @State private var item = ToDoItem()
    
    var body: some View {
        List {
            //$ hiểu là Nhập, trong trường hợp này là nhập biến item
            //TextField("tạm thời hiện ra", text: khi người dùng nhập: văn bản hiện ra ở đây, và giá trị item.title được cập nhật)
            TextField("Name", text: $item.title)
            //DataPicker("tạm thời hiện ra", selection: cho phép người dùng thay đổi Date, và giá trị item.timstamp đc cập nhật)
            DatePicker("Choose a date",
                       selection: $item.timestamp)
            //tương tự, Toggle là tạo một bjts trạng thái bật tắt
            Toggle("Important?", isOn: $item.isCritical)
            
            //Button ("" {...}): tạo ra một nút bấm, có label: "" và khi người dùng nhấn nút thì {...} bên trong sẽ chạy
            //trong trường hợp này, sau khi ấn create thì cừa sổ tạo todo mới sẽ tắt
            Button("Create") {
                //trong trường hợp này: withAnimation sẽ giúp hành động context.ínsert(item) mượt mà hơn thôi
                withAnimation {
                    //thêm item vào container đã tạo trước đó .modelContainer(for: )
                    context.insert(item)
                }
                dismiss()
            }
        }
        //tạo tiêu đề cho màn hình TODO lúc đc tạo
        .navigationTitle("Create ToDo")
    }
}

#Preview {
    CreateTodoView()
    //khi chạy test cũng cần tạo một container tạm thời
        .modelContainer(for: ToDoItem.self)
}
