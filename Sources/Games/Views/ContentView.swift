//
//  ContentView.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import TokamakDOM

struct ContentView: View {
    @StateObject private var coordinator = RootCoordinator()
    @StateObject private var hashState = HashState()
    
    private var screenState: CoordinatorState {
        switch coordinator.state.modal {
        case .overlay:
            return coordinator.previousState ?? coordinator.state
        case .none:
            return coordinator.state
        }
    }
    
    private var overlayState: CoordinatorState? {
        switch coordinator.state.modal {
        case .overlay:
            return coordinator.state
        case .none:
            return nil
        }
    }
    
    private var background: some View {
        Color.clear
    }
    
    private var screen: some View {
        view(for: screenState.action, type: screenState.modal, with: screenState.data)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                NavigationBar(coordinator: coordinator)
                ZStack {
                    background.zIndex(1)
                    screen.zIndex(2)
                    overlay.zIndex(3)
                }
                Spacer()
                Footer()
            }
        }
        .environmentObject(hashState)
    }

    private var overlay: some View {
        let action: CoordinatorAction! = overlayState?.action
        let type: ModalType = overlayState?.modal ?? .none
        let data: Any? = overlayState?.data
        return ZStack {
            if action != nil {
                Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.4)
                view(for: action, type: type, with: data)
            }
        }
    }
    
    private func view(for action: CoordinatorAction, type: ModalType, with info: Any?) -> some View {
        switch action {
        case let .goTo(path):
            return view(for: path, type: type, with: info)
        default:
            return view(for: "", type: type, with: info)
        }
    }
    
    private func view(for path: String, type: ModalType, with info: Any?) -> some View {
        return ZStack {
            if path == "" {
                projectList(selected: "id1510216500")
            } else if let subRoute = subRoute(with: "game/*", for: path) {
                projectList(selected: subRoute)
            } else if let subRoute = subRoute(with: "privacy-policy/*", for: path) {
                PrivacyPolicy(coordinator: coordinator, product: subRoute)
            } else if let subRoute = subRoute(with: "terms-of-use/*", for: path) {
                TermsOfUse(coordinator: coordinator, product: subRoute)
            } else {
                Text("404 Page not found")
            }
        }
    }
    
    private func subRoute(with route: String, for path: String) -> String? {
        guard let range = path.range(of: route, options: [.regularExpression]) else {
            return nil
        }
        let sub = String(path[range.upperBound..<path.endIndex])
        return sub.removingPercentEncoding ?? sub
    }
}

// MARK: Route Views
extension ContentView {
    func projectList(selected: String? = nil) -> some View {
        ProjectListView(
            coordinator: coordinator,
            projects :
                [
                    Project(id: "id1510216500",
                            name: "Little Wars",
                            description: """
                        BATTLE. WIN. BATTLE.

                        Get ready for Little Wars, the ultimate single or multiplayer iOS battle game.
                        Hold your ground, defend your land, and battle to WIN! The more victories, the higher you climb on the leader board and the more coin you earn.
                        Grow your strength, unlock insane armour, weapons, and even hair!
                        Are you prepared to fight to become the top warrior, with the BEST, customised character?
                        Little Wars with Bigger Battles, download NOW!
                        """,
                            appStoreUrl: "https://apps.apple.com/app/little-wars-with-big-battles/id1510216500",
                            thumbnailUrl: "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/30/83/51/30835110-a35c-d93c-4aeb-38a402328fa5/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/540x540bb.jpg",
                            youtube: "https://www.youtube.com/embed/zB6TeBg0t2Q",
                            facebook: "https://www.facebook.com/littlewarsapp",
                            instagram: "https://www.instagram.com/littlewarsapp",
                            twitter: "https://twitter.com/littlewars1"
                    ),
                    Project(id: "id1547566845",
                            name: "Bobble Fish",
                            description: """
                        BE PREPARED!

                        This is not your average iOS mobile game, it’s insanely addictive so download at your own risk!
                        The objective? Simple! Sea’s the day and swim your way through a maze of underwater pipes, but be careful not to touch them in the process! For every pipe you pass, you earn a point.
                        Sounds easy? Oh buoy! Download today and try climb the leaderboard - be the best bobble fisher on iOS!
                        """,
                            appStoreUrl: "https://apps.apple.com/app/ho-ho-go/id1547566845",
                            thumbnailUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple124/v4/a9/3c/d0/a93cd0d3-efb7-067b-5ce8-af231b0608c7/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/540x540bb.jpg",
                            instagram: "https://www.instagram.com/fatsandwichgames/"
                    ),
                    Project(id: "id1542765652",
                            name: "Ho Ho Go",
                            description: """
                        Ho ho ho, it’s Christmas time all year round with this fun and festive single player iOS game! Sleigh-what?!
                        You’ll mistle-totally love helping Santa deliver his presents, but oh snow - make sure to avoid those pesky chimneys! For every chimney you pass, you earn a point.
                        Enjoy this festive game and keep the holiday cheer going! Download now!
                        """,
                            appStoreUrl: "https://apps.apple.com/app/ho-ho-go/id1542765652",
                            thumbnailUrl: "https://is3-ssl.mzstatic.com/image/thumb/Purple114/v4/78/9b/be/789bbefa-d3eb-a877-cea2-68f7be26601d/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/540x540bb.jpg",
                            instagram: "https://www.instagram.com/fatsandwichgames/"
                    ),
                ],
            activeProjectId: selected
        )
    }
}
 
