//
//  ViewController.swift
//  music
//
//  Created by Luke Davitt on 2/27/15.
//  Copyright (c) 2015 Luke Davitt. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var currentSong = 0
    var player:AVAudioPlayer = AVAudioPlayer()
    var songs = ["cheeseburger","FYou","ShakeIt"]
    var images = ["burger", "FU", "ShakeIt"]
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
       setVolume()
    }
 
    @IBAction func clickPlay(sender: AnyObject) {
        playSong()
        
    }
    @IBAction func clickStop(sender: AnyObject) {
        player.stop()
    }
    @IBAction func clickPrevious(sender: AnyObject) {
        if currentSong != 0{
            currentSong -= 1
        }else{
            currentSong = songs.count - 1
        }
        playSong()
        
    }
    @IBAction func clickNext(sender: AnyObject) {
        if currentSong != songs.count - 1{
            currentSong += 1
        }else{
            currentSong = 0
        }
        playSong()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playSong()
        
    }
    
    func playSong(){
        var fileLocation = NSString(string:NSBundle.mainBundle().pathForResource(songs[currentSong], ofType:"mp3")!)

        var error: NSError? = nil
        player = AVAudioPlayer(contentsOfURL: NSURL(string: fileLocation), error: &error)
        
        var image = UIImage(named: images[currentSong]+".jpg")
        imageView.image = image
        setVolume()
        player.play()
        
    }
    
    func setVolume(){
        var value = volumeSlider.value
        player.volume = value
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

