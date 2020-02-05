//
//  SearchAction.swift
//  RxSwift-Sample
//
//  Created by Mikiya Abe on 2020/02/06.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

enum SearchAction: ReSwift.Action {
    case searchUsers(results: [String])
    
    // action creator
    static func requestAsyncCreator(by name: String) -> SingleAction {
        let results = MockData.users.filter { $0.contains(name) }
        let action = SearchAction.searchUsers(results: results)
        let single = Single<ReSwift.Action>.just(action)
        return SingleAction(single: single, disposeBag: DisposeBag())
    }
}
