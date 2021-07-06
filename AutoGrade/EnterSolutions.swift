//
//  EnterSolutions.swift
//  AutoGrade
//
//  Created by Jared Lantner on 6/26/21.
//

import SwiftUI

struct EnterSolutions: View {
    @State private var toMenu = false
    @State private var numQuestions: Int
    @State private var Answers: Array<String>
    @ObservedObject private var connection: Connection
    init(numQuestions: Int, connection: Connection){
        self.connection = connection
        let num = 10
        self.numQuestions = num
        self.Answers = Array<String>(repeating:"", count: num)
        
    }
    
    func addQuestion(){
        self.numQuestions += 1
        self.connection.numQuestions += 1
        self.Answers += [""]
        self.connection.solutions += [""]
    }
    
    func removeQuestion(){
        self.numQuestions -= 1
        self.connection.numQuestions -= 1
        //var new_array = Array<String>(repeating: "", count: self.numQuestions)
        //var i = 0
       // while(i < numQuestions){
         //   new_array[i] = self.Answers[i]
          //  i += 1
        //}
    
        Answers[self.numQuestions] = ""
        self.connection.solutions[self.connection.numQuestions] = ""
    }
    var body: some View {
        
        //ScrollView{
        
            VStack(alignment: .leading){
            
                ForEach((0...(self.connection.numQuestions - 1)), id: \.self){
                    question in TextField("Question", text: $connection.solutions[question])
                }
            }.frame(maxWidth: .infinity)
            .padding()
                .padding(.bottom)
                .edgesIgnoringSafeArea(.bottom)
                .animation(.easeOut(duration: 0.16))
    
            HStack(alignment: .bottom){
                Button("Add", action: addQuestion)
                Button("Delete", action: removeQuestion)
            }
            
        //}
    }
}


struct EnterSolutions_Previews: PreviewProvider {
    static var previews: some View {
        EnterSolutions(numQuestions: 1, connection: Connection())
    }
}

