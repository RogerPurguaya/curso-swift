//
//  SoundViewController.swift
//  Snapchat
//
//  Created by MAC02 on 25/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
class SoundViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var playButtomn: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    var snap = Snap()
    
    var seconds = 00
    
    var timer = Timer()
    
    var isTimerrunning = false
    
    var audioID = NSUUID().uuidString
    
    
    
    var audioRecorder:AVAudioRecorder?
    
    var audioPlayer:AVAudioPlayer?
    
    var audioURL:URL?
    
    var audioDuracionFin:TimeInterval?
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupRecorder()
        
        playButtomn.isEnabled = false
        
        addButton.isEnabled = false
        
    }
    
    func setupRecorder(){
        
        do{
            
            //Creando sesion de audio
            
            let session = AVAudioSession.sharedInstance()
            
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
            try session.overrideOutputAudioPort(.speaker)
            
            try session.setActive (true)
            
            
            
            //creando direccion para el archivo de audio
            
            let basePath:String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            
            let pathComponents = [basePath,"audio.m4a"]
            
            audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            
            
            
            print("**************")
            
            print(audioURL!)
            
            print("**************")
            
            //creando opciones para el grabador de audio
            
            var settings:[String:AnyObject] = [:]
            
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            
            settings [AVSampleRateKey] = 44100.0 as AnyObject?
            
            settings [AVNumberOfChannelsKey] =  2 as AnyObject?
            
            
            
            //crear el objeto de granbacion de audio
            
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
            
            audioRecorder!.prepareToRecord()
            
        }catch let error as NSError{
            
            print(error)
            
        }
        
    }
    
    @IBAction func recordTapped(_ sender: Any) {
        
        if audioRecorder!.isRecording{
            
            //detener la grabacion
            
            audioRecorder?.stop()
            
            //cambiar el texto del boton grabar
            
            recordButton.setTitle("Grabar", for: .normal)
            
            playButtomn.isEnabled = true
            
            addButton.isEnabled = true
            
        }else{
            
            //empez<r a grabar
            
            audioRecorder?.record()
            
            //cambiar el texto del boton grabr a detener
            
            recordButton.setTitle("Detener", for: .normal)
            
            playButtomn.isEnabled = false
            
        }
        
    }
    
    @IBAction func playTapped(_ sender: Any) {
        
        do{
            
            try audioPlayer = AVAudioPlayer(contentsOf: audioURL!)
            
            audioPlayer!.play()
            
        }catch{}
        
    }
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        do {try
            
            self.snap.audio =  Data(contentsOf: audioURL!)
            
        }catch{}
        
        
        
        let audiosFolder = Storage.storage().reference().child("audios")
        
        let audioData = snap.audio!
        
        let audio = audiosFolder.child("\(audioID).m4a")
        
        audio.putData(audioData as! Data, metadata: nil) {(metadata,error) in
            
            if error != nil {
                
                print("Error al subir audio: \(error) ")
                
                return
                
            }
            
        }
        
        audio.downloadURL(completion: {(url,error) in
            
            guard let enlaceURL = url else {
                
                return
                
            }
            
            self.performSegue(withIdentifier: "audioContactoSegue", sender: url?.absoluteString)
            
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let siguienteVC = segue.destination as! ElegirUsuarioViewController
        
        siguienteVC.audioURL = sender as! String
        
        siguienteVC.descripAudio = nameTextField.text!
        
        siguienteVC.audioID = audioID
        
    }
    
}
