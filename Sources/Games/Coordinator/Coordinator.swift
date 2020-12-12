//
//  Coordinator.swift
//  Games
//
//  Created by Szymon Lorenz on 12/12/20.
//

import Foundation

enum CoordinatorAction: Equatable {
    case back
    case goTo(String)
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.back, .back):
            return true
        case (let .goTo(lpath), let .goTo(rpath)):
            return lpath == rpath
        default:
            return false
        }
    }
}

enum ModalType: CaseIterable {
    case none
    case overlay

    var showDarkenedOverlay: Bool {
        switch self {
        case .overlay:
            return true
        default:
            return false
        }
    }
}

typealias CoordinatorState = (action: CoordinatorAction, modal: ModalType, data: Any?)

protocol Coordinator: class {
    var parent: Coordinator? { get }
    var state: CoordinatorState { get set }
    var stateStack: [CoordinatorState] { get set }

    func performAction(_ action: CoordinatorAction, modalType: ModalType, with data: Any?)
}

extension Coordinator {
    var parent: Coordinator? { nil }

    var previousState: CoordinatorState? {
        if stateStack.isEmpty {
            return nil
        }
        return stateStack.last
    }

    func popPreviousState() -> CoordinatorState {
        if stateStack.isEmpty {
            return state
        }
        let previous = stateStack.removeLast()
        return previous
    }
    
    func performAction(_ action: CoordinatorAction) {
        performAction(action, modalType: .none, with: nil)
    }
    
    func performAction(_ action: CoordinatorAction, modalType: ModalType = .none) {
        performAction(action, modalType: modalType, with: nil)
    }
    
    func performAction(_ action: CoordinatorAction, with data: Any? = nil) {
        performAction(action, modalType: .none, with: data)
    }
}
