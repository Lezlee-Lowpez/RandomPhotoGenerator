//
//  DataService.swift
//  RandomPhoto
//
//  Created by Lesley Lopez on 8/14/24.
//

import Foundation

struct DataService {
    
    var apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getRandomPhoto() async -> String {
        //check api key
        
        if apiKey != nil{
            //URL
            
            if let url = URL(string: "https://api.unsplash.com/photos/random"){
                
               //url request
                var request = URLRequest(url: url)
                request.addValue("Client-ID \(apiKey!)", forHTTPHeaderField: "Authorization")
                
                //url session
                do {
                    let (data, response) = try await URLSession.shared.data(for: request)
//                    print("This is the data: \(data)")
                    
                    //status code
                    if let httpResponse = response as? HTTPURLResponse{
                        
                        if httpResponse.statusCode == 200 {
//                            print(httpResponse.statusCode)
                            
                            //parse
                            let decoder = JSONDecoder()
                            let results = try decoder.decode(PhotoResponse.self, from: data)
                            
                            
                        
                            return results.urls?.regular ?? "This didnt return well"
                            
                            
                        } else {
                            print("Your status code is not 200")
                            let responseBody = String(data:data, encoding: .utf8) ?? "no response body"
                            print("Status code: \(httpResponse.statusCode), Response Body: \(responseBody)")
                    }
                        
                    } else {
                        print("httpResponse was not created.")
                    }
                   
                } catch {
                    print("There's an issue with the request")
                }
               
            }
        } else {
            print("You have an invalid API KEY")
        }
        
       return ""
  
    } // end of function
  
}
