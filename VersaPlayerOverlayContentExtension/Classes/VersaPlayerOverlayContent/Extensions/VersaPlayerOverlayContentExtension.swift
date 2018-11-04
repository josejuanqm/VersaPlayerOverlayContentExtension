//
//  VersaPlayerOverlayContentExtension.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/13/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import Foundation
import UIKit
import VersaPlayer

public extension VersaPlayerView {
    
    public var overlayContentManager: VersaPlayerOverlayContentManager? {
        let overlayContentManager = getExtension(with: "overlayContentManager") as? VersaPlayerOverlayContentManager
        return overlayContentManager
    }
    
    public func useOverlayContent(manager: VersaPlayerOverlayContentManager) {
        addExtension(extension: manager, with: "overlayContentManager")
    }
    
    public func hideOverlay(content: VersaPlayerOverlayContent) {
        overlayContentManager?.delegate?.willRemoveOverlayContentIn(player: self, content: content, status: overlayContentManager?.status ?? .none)
        content.removeFromSuperview()
    }
    
    public func showOverlay(content: VersaPlayerOverlayContent) {
        addSubview(content)
        bringSubview(toFront: content)
    }
    
}
