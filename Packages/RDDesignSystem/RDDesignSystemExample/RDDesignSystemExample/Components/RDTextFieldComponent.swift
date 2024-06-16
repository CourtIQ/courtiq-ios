//
//  RDTextFieldComponent.swift
//  CraftKitExample
//
//  Created by RDDesignSystem on 15/11/2023.
//

import SwiftUI
import RDDesignSystem

struct RDTextFieldComponent: View {
    
    @State var text0 = ""
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var text5 = ""
    @State var status1: RDTextFieldStatus = .none
    @State var status2: RDTextFieldStatus = .warning
    @State var status3: RDTextFieldStatus = .info
    @State var status4: RDTextFieldStatus = .error
    @State var status5: RDTextFieldStatus = .success
    
    var body: some View {
        VStack(spacing: 20) {
            RDTextField(
                params: RDTextFieldParams(
                    type: .search,
                    placehlder: "Search",
                    isBorderExists: false
                ),
                text: $text0,
                status: .constant(.none),
                errorString: .constant("")
            )
            RDTextField(
                params: RDTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text1,
                status: $status1,
                errorString: .constant("")
            )
            RDTextField(
                params: RDTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text2,
                status: $status2,
                errorString: .constant("")
            )
            RDTextField(
                params: RDTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text3,
                status: $status3,
                errorString: .constant("")
            )
            RDTextField(
                params: RDTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text4,
                status: $status4,
                errorString: .constant("* Description")
            )
            RDTextField(
                params: RDTextFieldParams(
                    placehlder: "TextField"
                ),
                text: $text5,
                status: $status5,
                errorString: .constant("")
            )
            
        }
        .navigationTitle("Toggle")
        .padding()
    }
}

struct RDTextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        RDTextFieldComponent()
    }
}
