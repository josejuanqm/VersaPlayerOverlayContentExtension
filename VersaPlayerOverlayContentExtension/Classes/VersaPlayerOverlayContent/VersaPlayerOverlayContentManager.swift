//
//  VersaPlayerOverlayContentManager.swift
//  VersaPlayer Demo
//
//  Created by Jose Quintero on 10/13/18.
//  Copyright © 2018 Quasar. All rights reserved.
//

import UIKit
import CoreMedia
import AVFoundation
import Foundation
import VersaPlayer

open class VersaPlayerOverlayContentManager: VersaPlayerExtension {

    public var delegate: VersaPlayerOverlayContentManagerDelegate? = nil
    public var status: VersaPlayerOverlayContentManagerPlayerStatus? = nil
    internal var isShowing: Bool = false
    
    public init(with player: VersaPlayerView, and delegate: VersaPlayerOverlayContentManagerDelegate) {
        super.init(with: player)
        self.delegate = delegate
    }
    
    open override func prepare() {
        NotificationCenter.default.addObserver(forName: VersaPlayer.VPlayerNotificationName.assetLoaded.notification, object: nil, queue: OperationQueue.main) { (notification) in
            self.status = VersaPlayerOverlayContentManagerPlayerStatus.assetLoaded
            self.showIfNeededWith(status: self.status!)
        }
        NotificationCenter.default.addObserver(forName: VersaPlayer.VPlayerNotificationName.timeChanged.notification, object: nil, queue: OperationQueue.main) { (notification) in
            if let time = notification.userInfo?[VersaPlayer.VPlayerNotificationInfoKey.time.rawValue] as? CMTime {
                self.status = VersaPlayerOverlayContentManagerPlayerStatus.timeChanged(round(time.seconds))
                self.showIfNeededWith(status: self.status!)
            }
        }
        NotificationCenter.default.addObserver(forName: VersaPlayer.VPlayerNotificationName.didEnd.notification, object: nil, queue: OperationQueue.main) { (notification) in
            self.status = VersaPlayerOverlayContentManagerPlayerStatus.didEnd
            self.showIfNeededWith(status: self.status!)
        }
        NotificationCenter.default.addObserver(forName: VersaPlayer.VPlayerNotificationName.play.notification, object: nil, queue: OperationQueue.main) { (notification) in
            self.status = VersaPlayerOverlayContentManagerPlayerStatus.didPlay
            self.showIfNeededWith(status: self.status!)
        }
        NotificationCenter.default.addObserver(forName: VersaPlayer.VPlayerNotificationName.pause.notification, object: nil, queue: OperationQueue.main) { (notification) in
            self.status = VersaPlayerOverlayContentManagerPlayerStatus.didPause
            self.showIfNeededWith(status: self.status!)
        }
    }
    
    public func showIfNeededWith(status: VersaPlayerOverlayContentManagerPlayerStatus) {
        if isShowing {
            return
        }
        if (delegate?.shouldShowOverlayContentForPlayer(player: player, status: status) ?? false) {
            if let view = delegate?.viewForOverlayContentIn(player: player, status: status) {
                view.player = player
                delegate?.willDisplayOverlayContentIn(player: player, content: view, status: status)
                isShowing = true
                view.show(with: status)
            }
        }
    }
    
}
