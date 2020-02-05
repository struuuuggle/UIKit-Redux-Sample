//
//  SearchReducer.swift
//  RxSwift-Sample
//
//  Created by Mikiya Abe on 2020/02/06.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import Foundation
import ReSwift

struct SearchReducer {
    static func reduce(action: Action, state: SearchState) -> SearchState {
        var state = state
        
        guard let action = action as? SearchAction else { return state }
        switch action {
        case let .searchUsers(results):
            state.users = results
        }
        return state
    }
}
