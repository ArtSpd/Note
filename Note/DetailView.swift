//
//  DetailView.swift
//  Note
//
//  Created by Артем Волков on 17.03.2021.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
   
    @State var note = ""
    
    let noter: Note
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("\(noter.wrappedText)", text: $note)
                Spacer()
                
            }
            .padding()
            .onDisappear(perform: {
                let last = noter
                moc.delete(last)
    
                let newNote = Note(context: self.moc)
                newNote.textNote = self.note
                
                try? self.moc.save()
                
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(noter: Note())
    }
}
