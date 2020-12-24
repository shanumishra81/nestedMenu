//
//  ViewController.swift
//  Music Player
//
//  Created by Shanu on 23/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var musicModalObj = MusicModal()
    var musicURL = ["https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3","https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3"]
    var musicName = ["Test 1","Test 2"]
    var selectIdArr = [Int]()
    var idArr = [11,12]
    var player: AVPlayer?
    var playerItem:AVPlayerItem?
    fileprivate let seekDuration: Float64 = 10
    var currentTime = String()
    var durationTime = String()
    var isPlaying = Bool()
    var senderNumber = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initAudioPlayer(urlM : String){
     let url = URL(string: urlM)
     let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
     player = AVPlayer(playerItem: playerItem)

     
     //To get overAll duration of the audio
        var duration : CMTime = playerItem.asset.duration
     let seconds : Float64 = CMTimeGetSeconds(duration)
     durationTime = self.stringFromTimeInterval(interval: seconds)
     
     //To get the current duration of the audio
     let currentDuration : CMTime = playerItem.currentTime()
     let currentSeconds : Float64 = CMTimeGetSeconds(currentDuration)
     currentTime = self.stringFromTimeInterval(interval: currentSeconds)
     
        player?.play()

//     player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
//         if self.player!.currentItem?.status == .readyToPlay {
//             let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
//            // self.labelCurrentTime.text = self.stringFromTimeInterval(interval: time)
//         }
//         let playbackLikelyToKeepUp = self.player?.currentItem?.isPlaybackLikelyToKeepUp
//         if playbackLikelyToKeepUp == false{
//             print("IsBuffering")
//             //self.ButtonPlay.isHidden = true
//             //        self.loadingView.isHidden = false
//         } else {
//             //stop the activity indicator
//             print("Buffering completed")
//            // self.ButtonPlay.isHidden = false
//             //        self.loadingView.isHidden = true
//         }
//     }
    }
    
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let interval = Int(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }


    @objc func btnPlayAction(sender:UIButton) {
        
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell else {
            print("button is not contained in a CollectionView cell")
            return
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            print("failed to get index path for cell containing button")
            return
        }
        guard let cell1 = superview as? MusicTableViewCell else {
            print("rferffddvd")
            return
        }

        
        if isPlaying == false {
            let url_music = musicURL[sender.tag]
            initAudioPlayer(urlM: url_music)
            sender.setImage(UIImage(named: "pause"), for: .normal)
            cell1.btnPause.isHidden = true
            isPlaying = true
            senderNumber = sender.tag
            selectIdArr.append(idArr[sender.tag])
             tableView.reloadData()
        }
        else {
            if senderNumber == sender.tag {
                if player?.rate  == 1 {
                    isPlaying = true
                    player?.pause()
                    sender.setImage(UIImage(named: "play"), for: .normal)
                    selectIdArr.removeAll()
                     tableView.reloadData()
                }
                else {
                    isPlaying = true
                    player?.play()
                    sender.setImage(UIImage(named: "pause"), for: .normal)
                    selectIdArr.removeAll()
                    selectIdArr.append(idArr[sender.tag])
                     tableView.reloadData()
                }

            }
            else {
                player?.pause()
                let url_music = musicURL[sender.tag]
                initAudioPlayer(urlM: url_music)
                
                selectIdArr.removeAll()
           //     sender.setImage(UIImage(named: "pause"), for: .normal)
                sender.setImage(UIImage(named: "pause"), for: .normal)
                cell1.btnPause.isHidden = true
                isPlaying = true
                senderNumber = sender.tag
                selectIdArr.append(idArr[sender.tag])
                tableView.reloadData()
            }
        }

    }
    @objc func btnPauseAction(sender:UIButton) {
        player?.pause()
        
    }
    @objc func btnReplayAction(sender:UIButton) {
        
    }
    

    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicURL.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        cell.lblName.text = musicName[indexPath.row]
        cell.bgview.layer.cornerRadius = 5
        cell.bgview.addShadow1()
        
        if selectIdArr.count != 0 {
            if selectIdArr.contains(idArr[indexPath.row]) {
                cell.btnPlay.setImage(UIImage(named: "pause"), for: .normal)
            }
            else {
                 cell.btnPlay.setImage(UIImage(named: "play"), for: .normal)
            }
        }
        else {
            cell.btnPlay.setImage(UIImage(named: "play"), for: .normal)
        }
        print(selectIdArr)

        
        cell.btnPlay.tag = indexPath.row
        cell.btnPlay.addTarget(self, action: #selector(btnPlayAction), for: .touchUpInside)
        
        cell.btnPause.tag = indexPath.row
        cell.btnPause.addTarget(self, action: #selector(btnPauseAction), for: .touchUpInside)
        
        cell.btnReplay.tag = indexPath.row
        cell.btnReplay.addTarget(self, action: #selector(btnReplayAction), for: .touchUpInside)
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

