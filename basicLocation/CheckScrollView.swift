//
//  CheckScrollView.swift
//  basicLocation
//
//  Created by Amit Gupta on 7/30/23.
//

import SwiftUI

struct CheckScrollView: View {
    @State var textInput="ABC"
    var longText="""
We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.

Article. I.
Section. 1.
All legislative Powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.

Section. 2.
The House of Representatives shall be composed of Members chosen every second Year by the People of the several States, and the Electors in each State shall have the Qualifications requisite for Electors of the most numerous Branch of the State Legislature.

No Person shall be a Representative who shall not have attained to the Age of twenty five Years, and been seven Years a Citizen of the United States, and who shall not, when elected, be an Inhabitant of that State in which he shall be chosen.
"""

    var body: some View {
        ScrollView {
            Text("Scroll Test")
                .font(.system(size: 40))
            Spacer()
            TextField("User's Current Location",text: $textInput)

            Text(longText)
                .font(.system(size: 30))
            Spacer()
            Button("Get Location") {
                print("Button Pressed")
            }
        }
        .padding([.top,.bottom],1)
    }
}

struct CheckScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CheckScrollView()
    }
}
