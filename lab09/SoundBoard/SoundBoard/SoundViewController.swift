//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by MAC02 on 7/05/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var audioURL:URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        playButton.isEnabled = false
        addButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
   
    func setupRecorder(){
            do{
                //creando sesion de audio
                let session = AVAudioSession.sharedInstance()
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
                try session.overrideOutputAudioPort(.speaker)
                try session.setActive(true)
                
                //creando direccion para el archivo de audio
                let basePath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                let pathComponents = [basePath, "audio.m4a"]
                audioURL = NSURL.fileURL(withPathComponents: pathComponents )!
                
                print("***********")
                print(audioURL!)
                print("***********")
                
                //crear opciones para el grabador de audio
                var settings:[String:AnyObject] = [:]
                settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
                settings[AVSampleRateKey] = 44100.0 as AnyObject?
                settings[AVNumberOfChannelsKey] = 2 as AnyObject?
                
                //crear el objeto de grbacion de audio
                audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
                audioRecorder!.prepareToRecord()
                
            } catch let error as NSError{
                print(error)
            }
        }



    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    
    
    @IBAction func recordTapped(_ sender: Any) {
        if audioRecorder!.isRecording {
            //parar la grabacion
            audioRecorder?.stop()
            //Cambiar el texto del boton:
            recordButton.setTitle("Grabar", for: .normal)
            playButton.isEnabled = true
            addButton.isEnabled = true
            
        }else{
            //empezar a grabar:
            audioRecorder?.record()
            //cambiar el texto de nuevo:
            recordButton.setTitle("Detener", for: .normal)
            playButton.isEnabled = false
        }
    }
    
    
    @IBAction func playTapped(_ sender: Any) {
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: audioURL!)
            audioPlayer!.play()
        } catch  { }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let sound = Sound(context: context)
        sound.name = nameTextField.text
        sound.audio = NSData(contentsOf: audioURL!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    

}
