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
    func shouldShowOverlayContentForPlayer(player: VersaPlayer, status: VersaPlayerOverlayContentManagerPlayerStatus) -> Bool
    func viewForOverlayContentIn(player: VersaPlayer, status: VersaPlayerOverlayContentManagerPlayerStatus) -> VersaPlayerOverlayContent 
    func willDisplayOverlayContentIn(player: VersaPlayer, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus)
    func willRemoveOverlayContentIn(player: VersaPlayer, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus)
}
