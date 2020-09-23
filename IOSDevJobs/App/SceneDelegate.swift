//
//  SceneDelegate.swift
//  IOSDevJobs
//
//  Created by Роенко Денис on 29.07.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var user = UserModel()
    var vacancyListConnector = VacancyListConnector()
    
    func userDefaultsCheck() {
        let defaults = UserDefaults.standard
        if let userType = defaults.object(forKey: "UserType") as? String {
            print("\nUserType data was loaded succesfully\n")
            print(userType)
            switch userType {
                case "developer":
                    user.userType = .developer
                case "hr":
                    user.userType = .hr
                default:
                    break
            }
        } else {
            print("\nno UserType data was found!\n")
        }

        if let developerLevel = defaults.object(forKey: "DeveloperLevel") as? String {
            print("\nDeveloperLevel data was loaded succesfully\n")
            print(developerLevel)
            switch developerLevel {
                case "Trainee": user.developerLevel = .trainee
                case "Junior": user.developerLevel = .junior
                case "Middle": user.developerLevel = .middle
                case "Senior": user.developerLevel = .senior
                case "Team lead": user.developerLevel = .teamLead
                case "CTO": user.developerLevel = .chiefTechnicalOfficer
                default:
                    break
            }
        } else {
            print("\nno DeveloperLevel data was found!\n")
        }

        if ((user.userType != nil) && (user.developerLevel != nil)) || (user.userType == .hr) {
            user.mainScreen = true
        }
    }
    


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        userDefaultsCheck()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
                            .environmentObject(user)
                            .environmentObject(vacancyListConnector)
                            .environment(\.managedObjectContext, CoreDataConnector.persistentContainer.viewContext)
        
        

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

