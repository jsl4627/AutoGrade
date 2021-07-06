//
//  ContentView.swift
//  AutoGrade
//
//  Created by Jared Lantner on 6/26/21.
//

import SwiftUI

struct ContentView: View {
    @State public var menu: Menu
    @State public var text: Text
    @State public var enterSolutions: EnterSolutions
    @State public var studentAttempt: StudentAttempt
    @State public var v: AnyView
    @State public var component: String
    @ObservedObject public var connection: Connection
    
    func changeView(){
        if self.connection.toEnterSolutions == true{
            self.v = AnyView(self.enterSolutions)
            self.connection.inMenu = false
            self.connection.toEnterSolutions = false
            self.connection.toStudentAttempt = false
        }
        else if self.connection.toStudentAttempt == true{
            self.v = AnyView(self.studentAttempt)
            self.connection.inMenu = false
            self.connection.toEnterSolutions = false
            self.connection.toStudentAttempt = false
        }
        
        else if self.connection.inMenu == false{
            self.v = AnyView(self.menu)
            self.connection.inMenu = true
            self.connection.toEnterSolutions = false
            self.connection.toStudentAttempt = false
        }
        
    }
    
    init(){
        let m = Menu()
        let connection = Connection()
        self.menu = m
        self.text = Text("Hello")
        self.enterSolutions = EnterSolutions(numQuestions: 10, connection: connection)
        self.studentAttempt = StudentAttempt(connection: connection)
        self.v = AnyView(m)
        self.component = "Menu"
        self.connection = m.connection
    }
    
    //@State private var menu: Menu
    var body: some View {
        VStack{
            self.v
            Button("Go", action: changeView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
