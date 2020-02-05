//
//  Redux.swift
//  RxSwift-Sample
//
//  Created by Mikiya Abe on 2020/02/06.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift
import RxRelay

struct SingleAction: ReSwift.Action {
    public let single: Single<ReSwift.Action>
    public let disposeBag: DisposeBag
}
