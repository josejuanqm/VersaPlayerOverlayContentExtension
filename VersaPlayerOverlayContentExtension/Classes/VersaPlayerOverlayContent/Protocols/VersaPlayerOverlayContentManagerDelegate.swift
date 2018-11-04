//
//  VersaPlayerOverlayContentManagerDelegate.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/13/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import Foundation
import UIKit
import VersaPlayer

public protocol VersaPlayerOverlayContentManagerDelegate {
    func positionIn(container: UIView, forContent content: VersaPlayerOverlayContent)
    func shouldShowOverlayContentForPlayer(player: VersaPlayerView, status: VersaPlayerOverlayContentManagerPlayerStatus) -> Bool
    func viewForOverlayContentIn(player: VersaPlayerView, status: VersaPlayerOverlayContentManagerPlayerStatus) -> VersaPlayerOverlayContent
    func willDisplayOverlayContentIn(player: VersaPlayerView, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus)
    func willRemoveOverlayContentIn(player: VersaPlayerView, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus)
}
