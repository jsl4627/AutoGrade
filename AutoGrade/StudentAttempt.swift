//
//  StudentAttempt.swift
//  AutoGrade
//
//  Created by Jared Lantner on 7/3/21.
//

import SwiftUI

struct StudentAttempt: View {
    @State private var toMenu = false
    @State private var attemptedSolutions: Array<String>
    @State private var attemptedSolutionsAnimations: Array<String>
    @State private var grade: Double
    @State private var gradeView: AnyView
    
    @ObservedObject public var connection: Connection
    init(connection: Connection){
        self.connection = connection
        self.grade = 0.00
        self.gradeView = AnyView(EmptyView())
        self.attemptedSolutions = Array<String>(repeating:"", count: connection.numQuestions)
        self.attemptedSolutionsAnimations = Array<String>(repeating:"", count: connection.numQuestions)
    }
    
    func gradeAttempt(){
        var score = 0.00
        for i in Range(uncheckedBounds: (0, self.connection.numQuestions)){
            if self.attemptedSolutions[i] == self.connection.solutions[i]{
                score += 1.00
                self.attemptedSolutionsAnimations[i] = "check_box"
            }
            else{
                self.attemptedSolutionsAnimations[i] = "x_box"
            }
            
        }
        score = score / Double(self.connection.numQuestions) * 100
        self.grade = score
        self.gradeView = AnyView(Text("Score: " + String(score) + "%"))
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .center, spacing: 8){
                VStack(alignment: .leading){
                    ForEach((0...(self.connection.numQuestions - 1)), id: \.self){
                        animation in Image(attemptedSolutionsAnimations[animation])
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 21)
                    }
                }
                
                VStack(alignment: .trailing, spacing:8){
                    ForEach((0...(self.connection.numQuestions - 1)), id: \.self){
                        label in Text(self.connection.question_labels[label])
                            .scaledToFit()
                            .frame(width: 40, height: 21)
                            
                            
                    }
                }
                
                
               
        
                VStack(alignment: .trailing){
        
                    ForEach((0...(self.connection.numQuestions - 1)), id: \.self){
                            question in TextField("Question", text: $attemptedSolutions[question])
                                
                    }
            
                }
            }
        
            Button("Grade", action: gradeAttempt)
                self.gradeView
            
    
        }.frame(maxWidth: .infinity)
            .padding()
            .padding(.bottom)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
            
    }
}
    

struct StudentAttempt_Previews: PreviewProvider {
    static var previews: some View {
        StudentAttempt(connection: Connection())
    }
}
