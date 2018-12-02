//
//  Requeste.swift
//  Segues and Navigation
//
//  Created by Juan Gerardo Cruz on 11/9/18.
//  Copyright © 2018 Digital Leaves. All rights reserved.
//

import Foundation

class Requeste: NSObject {

    let opQueue = OperationQueue()
    var response:URLResponse?
    var session:URLSession?
    
    var time:DispatchTime! {
        return DispatchTime.now() + 1.0 // seconds
    }
    
    func request() {
        print("Requesting...")
        // suspend the OperationQueue (operations will be queued but won't get executed)
        self.opQueue.isSuspended = true
        let sessionConfiguration = URLSessionConfiguration.default
        // disable the caching
        sessionConfiguration.urlCache = nil
        
        // initialize the URLSession
        self.session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: self.opQueue)
        
        // create a URLRequest with the given URL and initialize a URLSessionDataTask
        if let url = URL(string: "https://localhost/uploader/redirect.php") {
            let request = URLRequest(url: url)
            if let task = self.session?.dataTask(with: request) {
                // start the task, tasks are not started by default
                task.resume()
            }
        }
        
        // Open the operations queue after 1 second
        DispatchQueue.main.asyncAfter(deadline: self.time, execute: {[weak self] in
            print("Opening the OperationQueue")
            self?.opQueue.isSuspended = false
        })
    }
}

extension Requeste:URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // We've got a URLAuthenticationChallenge - we simply trust the HTTPS server and we proceed
        print("didReceive challenge")
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
    
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        // We've got an error
        if let err = error {
            print("Error: \(err.localizedDescription)")
        } else {
            print("Error. Giving up")
        }
        //PlaygroundPage.current.finishExecution()
    }
}

extension Requeste:URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask) {
        // The task became a stream task - start the task
        print("didBecome streamTask")
        streamTask.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask) {
        // The task became a download task - start the task
        print("didBecome downloadTask")
        downloadTask.resume()
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // We've got a URLAuthenticationChallenge - we simply trust the HTTPS server and we proceed
        print("didReceive challenge")
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        // The original request was redirected to somewhere else.
        // We create a new dataTask with the given redirection request and we start it.
        if let urlString = request.url?.absoluteString {
            print("willPerformHTTPRedirection to \(urlString)")
        } else {
            print("willPerformHTTPRedirection")
        }
        if let task = self.session?.dataTask(with: request) {
            task.resume()
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        // We've got an error
        if let err = error {
            print("Error: \(err.localizedDescription)")
        } else {
            print("Error. Giving up")
        }
        //PlaygroundPage.current.finishExecution()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        // We've got the response headers from the server.
        print("didReceive response")
        self.response = response
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        // We've got the response body
        print("didReceive data")
        if let responseText = String(data: data, encoding: .utf8) {
            print(self.response!)
            print("\nServer's response text")
            print(responseText)
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: AnyObject]
            if let firstCategory = json["categories"]  as? String {
                print("The first category in the JSON list is \"\(firstCategory)\"")
            }
        } catch let error as NSError {
            print("Error parsing JSON: \(error.localizedDescription)")
        }
        
        self.session?.finishTasksAndInvalidate()
        //PlaygroundPage.current.finishExecution()
    }
}

