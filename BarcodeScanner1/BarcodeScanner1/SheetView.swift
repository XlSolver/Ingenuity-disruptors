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
        NavigationStack {
            
            
            DatePicker("Expiry date", selection: $expiryingDate, displayedComponents: [.date])
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button("Add") {
                        try! foodContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SheetView(expiryingDate: .constant(Date()))
}
