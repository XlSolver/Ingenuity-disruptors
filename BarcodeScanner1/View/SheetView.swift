//
//  SheetView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 21/02/24.
//

import SwiftUI
import SwiftData

struct SheetView: View {
    @Environment(\.modelContext) var foodContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var expiryingDate: Date
    
    var body: some View {
        VStack {
            Image(systemName: "test")
            
            Button {
                try! foodContext.save()
                print("Item saved")
                dismiss()
            } label: {
                Text("Add")
            }
            
            DatePicker("Expiry date", selection: $expiryingDate, displayedComponents: [.date])
        }
    }
}


#Preview {
    SheetView(expiryingDate: .constant(Date()))
}
