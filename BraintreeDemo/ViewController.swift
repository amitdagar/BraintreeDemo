//
//  ViewController.swift
//  BraintreeDemo
//
//  Created by Abhishek Gupta on 20/04/17.
//  Copyright © 2017 Abhishek Gupta. All rights reserved.
//

import UIKit
import BraintreeDropIn
import Braintree
class ViewController: UIViewController, BTDropInViewControllerDelegate  {

    @IBOutlet weak var lblPymntMethod: UILabel!
    @IBOutlet weak var imgPaymntMthod: UIImageView!
   var braintree: Braintree?
    var clientToken = "eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiIyNDIwMGFkMzQ4YTA2MmQyNGZhN2NhNTczYjZiN2E2MjY1MDA4N2FmOTQ2ZGMwNzRkNzhjMDNlMDBkNjZiYWJjfGNyZWF0ZWRfYXQ9MjAxNy0wNC0yMFQwNToyOTo0NS4xNjA3NTAxNzQrMDAwMFx1MDAyNm1lcmNoYW50X2lkPTM0OHBrOWNnZjNiZ3l3MmJcdTAwMjZwdWJsaWNfa2V5PTJuMjQ3ZHY4OWJxOXZtcHIiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvMzQ4cGs5Y2dmM2JneXcyYi9jbGllbnRfYXBpL3YxL2NvbmZpZ3VyYXRpb24iLCJjaGFsbGVuZ2VzIjpbXSwiZW52aXJvbm1lbnQiOiJzYW5kYm94IiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuc2FuZGJveC5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzLzM0OHBrOWNnZjNiZ3l3MmIvY2xpZW50X2FwaSIsImFzc2V0c1VybCI6Imh0dHBzOi8vYXNzZXRzLmJyYWludHJlZWdhdGV3YXkuY29tIiwiYXV0aFVybCI6Imh0dHBzOi8vYXV0aC52ZW5tby5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tLzM0OHBrOWNnZjNiZ3l3MmIifSwidGhyZWVEU2VjdXJlRW5hYmxlZCI6dHJ1ZSwicGF5cGFsRW5hYmxlZCI6dHJ1ZSwicGF5cGFsIjp7ImRpc3BsYXlOYW1lIjoiQWNtZSBXaWRnZXRzLCBMdGQuIChTYW5kYm94KSIsImNsaWVudElkIjpudWxsLCJwcml2YWN5VXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3BwIiwidXNlckFncmVlbWVudFVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS90b3MiLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOnRydWUsImVudmlyb25tZW50Tm9OZXR3b3JrIjp0cnVlLCJlbnZpcm9ubWVudCI6Im9mZmxpbmUiLCJ1bnZldHRlZE1lcmNoYW50IjpmYWxzZSwiYnJhaW50cmVlQ2xpZW50SWQiOiJtYXN0ZXJjbGllbnQzIiwiYmlsbGluZ0FncmVlbWVudHNFbmFibGVkIjp0cnVlLCJtZXJjaGFudEFjY291bnRJZCI6ImFjbWV3aWRnZXRzbHRkc2FuZGJveCIsImN1cnJlbmN5SXNvQ29kZSI6IlVTRCJ9LCJjb2luYmFzZUVuYWJsZWQiOmZhbHNlLCJtZXJjaGFudElkIjoiMzQ4cGs5Y2dmM2JneXcyYiIsInZlbm1vIjoib2ZmIn0="
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPayClick(_ sender: Any) {
        let apiClient = BTAPIClient(authorization: "sandbox_rmrhg2vv_dgjwkfb34qjhdvrs")
        self.showDropIn(clientTokenOrTokenizationKey: self.clientToken)
        
      //  self.fetchExistingPaymentMethod(clientToken: clientToken)
        
        
        
       
    }

    //MARK:-SHOW DROP IN UI
    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let pymntreqst = BTPaymentRequest()
        pymntreqst.summaryTitle = "Test item title";
        pymntreqst.summaryDescription = "This is a summary description";
        pymntreqst.displayAmount = "$19.00"
        pymntreqst.callToActionText = "$19 - Pay Now";
        
//        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
//        { (controller, result, error) in
//        
//            if (error != nil) {
//                print("ERROR")
//            } else if (result?.isCancelled == true) {
//                print("CANCELLED")
//            } else if result != nil {
//                // Use the BTDropInResult properties to update your UI
//              //  result?.paymentOptionType
//                // result.paymentMethod
//                // result.paymentIcon
//                // result.paymentDescription
//                 print(">>Desciption  \(String(describing: result?.paymentDescription))")
//                    print(">>Nonce key  \(String(describing: result?.paymentMethod?.nonce))")
//                
//            
//            }
//            controller.dismiss(animated: true, completion: nil)
//        }
//    
//        self.present(dropIn!, animated: true, completion: nil)
        
        
        
        // Create a BTDropInViewController
        let dropInViewController = braintree!.dropInViewController(with: self)
        
        // This is where you might want to customize your Drop-in. (See below.)
        
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(ViewController.userDidCancelPayment))
        
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    //MARK:-Displaying the last used payment method
    func fetchExistingPaymentMethod(clientToken: String) {
        BTDropInResult.fetch(forAuthorization: clientToken, handler: { (result, error) in
            if (error != nil) {
                print("ERROR")
            } else if result != nil {
                // Use the BTDropInResult properties to update your UI
                // result.paymentOptionType
                // result.paymentMethod
                
                print(">>Desciption  \(String(describing: result?.paymentDescription))")
        
                // result.paymentDescription
            }
        })
    }
    func postNonceToServer(paymentMethodNonce: String) {
        // Update URL with your server
        let paymentURL = URL(string: "https://your-server.example.com/payment-methods")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(paymentMethodNonce)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            // TODO: Handle success or failure
            print("Sucsess >> \(response)")
            }.resume()
    }
   
 
  }

