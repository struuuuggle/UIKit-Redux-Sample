//
//  AppState.swift
//  RxSwift-Sample
//
//  Created by Mikiya Abe on 2020/02/06.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
    var searchState = SearchState()
}

func appReduce(action: ReSwift.Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    state.searchState = SearchReducer.reduce(action: action, state: state.searchState)
    return state
}
