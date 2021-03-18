//
//  AddView.swift
//  Note
//
//  Created by Артем Волков on 17.03.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var moc
    
    @State var noteText = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $noteText)
                .border(Color.black)
                
            Spacer()
            Button("Save"){
                let newNote = Note(context: self.moc)
                newNote.textNote = self.noteText
                
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
