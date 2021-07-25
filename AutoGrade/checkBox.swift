//
//  checkBox.swift
//  AutoGrade
//
//  Created by Jared Lantner on 7/24/21.
//

import SwiftUI

struct checkBox: View {
    var body: some View {
        Image("check_box")
            .renderingMode(.original)
            .resizable()
            .frame(width:10, height:10)
    }
}

struct checkBox_Previews: PreviewProvider {
    static var previews: some View {
        checkBox()
    }
}
