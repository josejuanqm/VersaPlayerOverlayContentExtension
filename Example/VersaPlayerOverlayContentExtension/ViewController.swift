//
//  ViewController.swift
//  VersaPlayerOverlayContentExtension
//
//  Created by jose.juan.qm@gmail.com on 10/13/2018.
//  Copyright (c) 2018 jose.juan.qm@gmail.com. All rights reserved.
//

import UIKit
import VersaPlayer
import VersaPlayerOverlayContentExtension

class ViewController: UIViewController {

    @IBOutlet weak var player: VersaPlayer!
    @IBOutlet weak var pauseOverlay: VersaPlayerOverlayContent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.useOverlayContent(manager: VersaPlayerOverlayContentManager.init(with: player, and: self))
        if let url = URL.init(string: "http://rmcdn.2mdn.net/Demo/html5/output.mp4") {
            let item = VPlayerItem(url: url)
            player.set(item: item)
        }
    }

}

extension ViewController: VersaPlayerOverlayContentManagerDelegate {
    
    func positionIn(container: UIView, forContent content: VersaPlayerOverlayContent) {
        content.translatesAutoresizingMaskIntoConstraints = false
        content.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        content.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        content.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        content.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
    
    func shouldShowOverlayContentForPlayer(player: VersaPlayer, status: VersaPlayerOverlayContentManagerPlayerStatus) -> Bool {
        switch status {
        case .assetLoaded:
            return true
        case .didPlay:
            return false
        case .didPause:
            return false
        case .didEnd:
            return false
        default:
            return false
        }
    }
    
    func viewForOverlayContentIn(player: VersaPlayer, status: VersaPlayerOverlayContentManagerPlayerStatus) -> VersaPlayerOverlayContent {
        pauseOverlay.shouldPausePlayerOnShow = true
        return pauseOverlay
    }
    
    func willDisplayOverlayContentIn(player: VersaPlayer, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus) {
        
    }
    
    func willRemoveOverlayContentIn(player: VersaPlayer, content: VersaPlayerOverlayContent, status: VersaPlayerOverlayContentManagerPlayerStatus) {
        player.play()
    }
    
}

