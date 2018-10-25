//
//  VersaPlayerOverlayContent.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/13/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit
import VersaPlayer

open class VersaPlayerOverlayContent: UIView {

    public var player: VersaPlayer!
    public var shown: Bool = false
    public var shouldPausePlayerOnShow: Bool = true
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            player.overlayContentManager?.delegate?.positionIn(container: superview!, forContent: self)
        }
    }
    
    public func show(with status: VersaPlayerOverlayContentManagerPlayerStatus) {
        if shown { return } else { shown = true }
        if shouldPausePlayerOnShow { player.pause() }
        player.overlayContentManager?.delegate?.willDisplayOverlayContentIn(player: player, content: self, status: status)
        player.controls?.behaviour.hide()
        player.showOverlay(content: self)
    }
    
    public func hide(with status: VersaPlayerOverlayContentManagerPlayerStatus) {
        player.overlayContentManager?.delegate?.willRemoveOverlayContentIn(player: player, content: self, status: status)
        player.controls?.behaviour.show()
        player.hideOverlay(content: self)
    }
    
    @IBAction public func hide() {
        player.overlayContentManager?.delegate?.willRemoveOverlayContentIn(player: player, content: self, status: player.overlayContentManager?.status ?? .none)
        player.controls?.behaviour.show()
        player.hideOverlay(content: self)
    }

}
