//
//  Middleware.swift
//  RxSwift-Sample
//
//  Created by Mikiya Abe on 2020/02/06.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

let rxThunkMiddleware: ReSwift.Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            if let action = action as? SingleAction {
                action.single
                    .observeOn(MainScheduler.instance)
                    .subscribe(onSuccess: { next($0) })
                    .disposed(by: action.disposeBag)
            } else {
                return next(action)
            }
        }
    }
}
