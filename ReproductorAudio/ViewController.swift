//
//  ViewController.swift
//  ReproductorAudio
//
//  Created by Kike on 15/1/15.
//  Copyright (c) 2015 Kike. All rights reserved.
//

import UIKit

// 01 Importamos el framework
import AVFoundation





class ViewController: UIViewController {

    // 02 - Creamos el Objeto reproductor de audio
    var reproductorAudio = AVAudioPlayer()
    
    // 03 ENLAZAMOS ELEMENTOS CON EL CONTROLADOR
    // 03.1 - Creamos un IBOutlet para poder acceder a sus propiedades
    @IBOutlet weak var valorVolumen: UISlider!
    
    
    
    
    // 07 - Slider control reproduccion
    @IBOutlet weak var controlReproduccion: UISlider!

    // 07 - Labels de reproduccion
    @IBOutlet weak var tiempoActual: UILabel!
    
    // 07 - Labels de reproduccion
    @IBOutlet weak var tiempoTotal: UILabel!
    
    
    
    
    // 09 - Oulets para funcionamienrto de botones
    @IBOutlet weak var IBOuletPlay: UIButton!
    @IBOutlet weak var IBOuletPause: UIButton!
    @IBOutlet weak var IBOuletStop: UIButton!
    
    
    
    
    
    
    
    
    
    
    
    
    //06 - DOCUMENTACION ENABLE RATE
    //06.2 - Accedemos al slider
    @IBOutlet weak var valorReproduccion: UISlider!
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 04 - Creamos una constante y le decimos donde está ubicado el audio
    
        let ubicacionAudio = NSBundle.mainBundle().pathForResource("tachan", ofType: "mp3")
        
        var elAudio = NSURL(fileURLWithPath: ubicacionAudio!)
        
        
        
        reproductorAudio = AVAudioPlayer(contentsOfURL: elAudio, error: nil)
        
        
        // 06.1 - Habilitamos el rate
        reproductorAudio.enableRate = true
        
        reproductorAudio.prepareToPlay()
        

        
        
        
        // 08 -
        var duracionTotal:Int = Int(reproductorAudio.duration)
        tiempoTotal.text = "\(duracionTotal)"
        
   

        
        // Control del slider
        controlReproduccion.minimumValue = 0
        
        
        var finSlider:Float = Float(reproductorAudio.duration)
        controlReproduccion.maximumValue = finSlider
        
        
        
        // 08.1  NSTimer
        var temporizador = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "actualizaControlReproduccion", userInfo: nil, repeats: true)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 03.2 - Creamos las acciones con el IBACtion
    @IBAction func botonPlay(sender: AnyObject) {
        // 05 - Rellenamos las acciones
        reproductorAudio.play()
        
        // 11 - control de botones
        controlBotones(true)
    }
    
    // 03.3
    @IBAction func botonStop(sender: AnyObject) {
        reproductorAudio.stop()
        reproductorAudio.currentTime = 0
        
        tiempoActual.text = "0"
        controlReproduccion.value = 0
        
        // 11 - control de botones
        controlBotones(false)
    }

    // 03.4
    @IBAction func botonPausa(sender: AnyObject) {
        reproductorAudio.pause()
        
        // 11 - control de botones
        controlBotones(false)
    }
    
    // 03.5
    @IBAction func cambiarVolumen(sender: AnyObject) {
        reproductorAudio.volume = valorVolumen.value
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func velocidadReproduccion(sender: AnyObject) {
        // 06.3 Cogemos el valos del slider y se lo pasamos
        reproductorAudio.rate = valorReproduccion.value
    }
    
    
    
    
    
    // 9 crear la funcion para el NSTimer
    
    var contador: Int = 0
    
    func actualizaControlReproduccion(){
    
        
        if reproductorAudio.playing == true {
        
            contador += 1
            tiempoActual.text = "\(contador)"
            
            
            var contadorFloat: Float = Float(contador)
          
            controlReproduccion.value = contadorFloat
        
            
        }

        
    }
    
    
    
    // 10 - Slider cambiar de reproduccion
    @IBAction func valueChangeControlReproduccion(sender: AnyObject) {
        
        
        var tiempo: NSTimeInterval = NSTimeInterval(controlReproduccion.value)
        
        contador = Int(controlReproduccion.value)
        
        reproductorAudio.currentTime = tiempo
        
        
    }
    
    
    
    
    // 11 - funcion para controlar botones y luego se las pasamos a cada boton
    
    func controlBotones(seEstaReproduciendo: Bool){
    
        IBOuletPlay.enabled = !seEstaReproduciendo
        IBOuletPause.enabled = seEstaReproduciendo
        IBOuletStop.enabled = seEstaReproduciendo
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

