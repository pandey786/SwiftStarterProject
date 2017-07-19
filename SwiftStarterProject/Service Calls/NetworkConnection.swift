//
//  NetworkConnection.swift
//  SwiftStarterProject
//
//  Created by Pandey on 18/07/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import Foundation
import Gloss

public class NetworkConnection: NSObject {
    
    // MARK: - Share Instance Initialization
    static let sharedInstance: NetworkConnection = {
        return NetworkConnection()
    }()
    
    // MARK: - Global Variables
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: - Service Request
    // MARK: -
    func serviceRequest(urlString: String, completion: @escaping (_ respJSON: JSON?, _ success: Bool, _ error: String) -> Void) {
        
        //Create URL
        guard let url = URL(string: urlString) else {
            completion(nil, false, "Error: cannot create URL")
            return
        }
        
        //Get URL Request
        let urlRequest = URLRequest(url: url)
        
        //Set Up Session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        //Call Service
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            //Check for Error in Response
            guard error == nil else {
                completion(nil, false, "Error: Calling Service")
                return
            }
            
            //Check for Data
            guard let responseData = data else {
                completion(nil, false, "Error: did not receive data")
                return
            }
            
            //Send Response Json to Completion Handler
            do {
                if let responseDict = try JSONSerialization.jsonObject(with: responseData, options: .mutableLeaves) as? [String: AnyObject] {
                    completion(responseDict, true, "")
                }
            } catch {
                completion(nil, false, "Error: Could Not Process data")
            }
        }
        
        task.resume()
    }
    
}
