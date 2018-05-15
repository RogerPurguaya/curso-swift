
import UIKit
import AVFoundation
class SoundViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var lblTiempo: UILabel!
    
    var seconds = 00
    var timer = Timer()
    var isTimerrunning = false
    
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var audioURL:URL?
    var audioDuracionFin:TimeInterval?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        playButton.isEnabled = false
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
    
    func runTimmer () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector (SoundViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer () {
        seconds += 1
        lblTiempo.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    @IBAction func recordTapped(_ sender: Any) {
        if audioRecorder!.isRecording{
            //detener la grabacion
            audioRecorder?.stop()
            //cambiar el texto del boton grabar
            recordButton.setTitle("Grabar", for: .normal)
            playButton.isEnabled = true
            addButton.isEnabled = true
            timer.invalidate()
        }else{
            //empez<r a grabar
            audioRecorder?.record()
            //cambiar el texto del boton grabr a detener
            recordButton.setTitle("Detener", for: .normal)
            playButton.isEnabled = false
            runTimmer()
        }
    }
    @IBAction func playTapped(_ sender: Any) {
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: audioURL!)
            audioPlayer!.play()
        }catch{}
    }
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let sound = Sound(context: context)
        sound.name = nameTextField.text
        sound.tiempo = lblTiempo.text
        sound.audio = NSData(contentsOf: audioURL!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
