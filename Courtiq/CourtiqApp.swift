//
//  CourtiqApp.swift
//  Courtiq
//
//  Created by Pranav Suri on 2024-06-12.
//

import AuthenticationService
import FirebaseCore
import InstantSearchTelemetry
import RDDesignSystem
import RelationshipService
import StorageService
import SwiftUI
import SwiftData
import UserService
import UserNotifications
import FirebaseMessaging

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    @AppStorage("notificationToken") var notificationToken: String?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        InstantSearchTelemetry.shared.isEnabled = false

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print("Permission granted: \(granted)")
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        Messaging.messaging().delegate = self
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge, .list])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withcompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        NotificationCenter.default.post(name: Notification.Name("didReceiveRemoteNotification"), object: nil, userInfo: userInfo)
        completionHandler()
    }
    
    @objc func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        notificationToken = fcmToken
    }
}


// MARK: - CourtiqApp

@main
struct CourtiqApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authService = AuthService(provider: FirebaseAuthProvider())
    @StateObject var router = AppRouter()
    @StateObject var userService = UserService()
    @StateObject var relationsService = RelationshipService()
    @StateObject var storageService = StorageService()

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                    .environmentObject(authService)
                    .environmentObject(router)
                    .environmentObject(userService)
                    .environmentObject(relationsService)
                    .environmentObject(storageService)
                    .sheet(item: $router.currentSheet) { sheet in
                        sheet.view
                    }
                    .sheet(item: $router.currentHalfSheet) { sheet in
                        sheet.view
                            .presentationDetents(Set(arrayLiteral: .medium))
                    }
                    .fullScreenCover(item: $router.currentScreenCover) { screen in
                        ScreenCoverView(viewWrapper: screen)
                            .environmentObject(router)
                    }
                    .background(Color.TokenColor.Semantic.Background.default)
//                    .transition(.opacity)
                
                if router.isLoading {
                    withAnimation {
                        LoadingView()
                            .transition(.opacity)
                    }
                }
            }
        }
    }
}


