//
//  CallTextAI.swift
//  basicLocation
//
//  Created by Amit Gupta on 7/30/23.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct CallTextAI: View {
    @State var inputText="ABC"
    @State var params: Parameters = [:]
    @State var prediction="Unknown"
    let uploadURL = "https://askai.aiclub.world/d261f274-fc07-4dbb-8945-6f3af514891f"
    var body: some View {
        VStack {
            Text("Predict AI")
                .font(.system(size: 30))
            Spacer()
            TextField("Input text",text: $inputText)
                .font(.system(size: 20))
            Spacer()
            Text(prediction)
                .font(.system(size: 30))
            Spacer()
            Button("Call AI") {
                predictAI()
            }
            .font(.system(size: 20))
                       .padding()
                       .background(Color.yellow)
                       .clipShape(Capsule())
            Spacer()
        }
    }
    
    func predictAI() {
            print("Just got the call to PredictAI()")
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            
            params["sentence"] = inputText
            
            
            debugPrint("Calling the AI service with parameters=",params)
            
            AF.request(uploadURL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
                
                //debugPrint("AF.Response:",response)
                switch response.result {
                case .success(let value):
                    var json = JSON(value)
                    //debugPrint("Initial value is ",value)
                    //debugPrint("Initial JSON is ",json)
                    let body = json["body"].stringValue
                    //debugPrint("Initial Body is ",body)
                    json = JSON.init(parseJSON: body)
                    debugPrint("Second JSON is ",json)
                    let predictedLabel = json["predicted_label"].stringValue
                    //debugPrint("Predicted label equals",predictedLabel)
                    self.prediction=predictedLabel
                case .failure(let error):
                    print("\n\n Request failed with error: \(error)")
                }
            }
        }
}

struct CallTextAI_Previews: PreviewProvider {
    static var previews: some View {
        CallTextAI()
    }
}
