//
//  VersaPlayerOverlayContentManagerPlayerStatus.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/13/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import Foundation

public enum VersaPlayerOverlayContentManagerPlayerStatus {
    case assetLoaded
    case didPlay
    case timeChanged(Double)
    case didEnd
    case didPause
    case none
}
