//
//  RootCoordinator.swift
//  Games
//
//  Created by Szymon Lorenz on 12/12/20.
//

import Foundation
import TokamakDOM

class RootCoordinator: ObservableObject, Coordinator {
    @Published var state: CoordinatorState = (.goTo(route), .none, nil)
    
    var stateStack: [CoordinatorState] = []
    
    func performAction(_ action: CoordinatorAction, modalType: ModalType, with data: Any?) {
        let newState: CoordinatorState
        switch action {
        case .back:
            newState = popPreviousState()
        case let .goTo(path):
            newState = CoordinatorState(.goTo(path), modalType, data)
        }
        
        if action != .back { stateStack.append(state) }
        self.state = newState
    }
}
