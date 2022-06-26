//
//  FireBaseUtils.swift
//  Comics
//
//  Created by Joey Chau on 27/03/2022.
//

import Foundation
import Firebase
import UIKit

class fireBaseUtils: UIViewController, ObservableObject {
    
     func checkForUpdate() {
       AppDistribution.appDistribution().checkForUpdate(completion: { [self] release, error in
         var uiAlert: UIAlertController

         if error != nil {
           uiAlert = UIAlertController(title: "Error", message: "Error Checking for update! \(error?.localizedDescription ?? "")", preferredStyle: .alert)
         } else if release == nil {
           uiAlert = UIAlertController(title: "Check for Update", message: "No releases found!!", preferredStyle: .alert)
           uiAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
         } else {
           guard let release = release else { return }

           let title = "New Version Available"
           let message = "Version \(release.displayVersion)(\(release.buildVersion)) is available."
           uiAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)

           uiAlert.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default) {
             _ in
             UIApplication.shared.open(release.downloadURL)
           })
           uiAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
             _ in
           })
         }
         self.present(uiAlert, animated: true, completion: nil)
       })
     }
    
}
