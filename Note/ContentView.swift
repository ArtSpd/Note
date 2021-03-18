//
//  ContentView.swift
//  Note
//
//  Created by Артем Волков on 17.03.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State var isShoweAddView = false
    @State var textNote = ""
    
    
    var body: some View {
        NavigationView{
                List{
                    ForEach(notes, id:\.self){ note in
                        NavigationLink(
                            destination: DetailView(noter: note),
                            label: {
                                Text(note.textNote ?? "Enter your note")
                                    .lineLimit(1)
                            })
                    }
                    .onDelete(perform: deleteNote)
                }
                .navigationBarTitle(Text("Notes"))
                .navigationBarItems(leading: EditButton() ,trailing: Button("Add"){
                    self.isShoweAddView = true
                })
                .sheet(isPresented: $isShoweAddView, content: {
                    AddView().environment(\.managedObjectContext, self.moc)
                })
        }
    }
    
    func deleteNote(at offSets: IndexSet){
        for offset in offSets{
            let note = notes[offset]
            moc.delete(note)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
