//
//  Menu.swift
//  AutoGrade
//
//  Created by Jared Lantner on 6/26/21.
//

import SwiftUI

class Connection: ObservableObject {
    @Published var inMenu: Bool
    @Published var toEnterSolutions: Bool
    @Published var toStudentAttempt: Bool
    @Published var numQuestions: Int
    @Published var solutions: Array<String>
    
    init() {
        self.inMenu = true
        self.toEnterSolutions = false
        self.toStudentAttempt = false
        let num = 10
        self.numQuestions = num
        self.solutions = Array<String>(repeating:"", count: num)
    }
} 


struct Menu: View {
    @State public var toSolutions = false
    @State private var showDetails = false
    @ObservedObject var connection = Connection()
    
    
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                self.connection.toStudentAttempt = true
                self.connection.toEnterSolutions = false
            }){
                Text("Student Attempt")
            }
            
            
            
                
            Spacer()
                .frame(width: 25)
            
            //NavigationView{
            //NavigationLink(destination: EnterSolutions(numQuestions: 10), //isActive: $toSolutions){
                Button(action:{
                    self.connection.toEnterSolutions = true
                    self.connection.toStudentAttempt = false
                }){
                    Text("Enter Solutions")
                }

            }
            }
           
        }
    //}
//}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
