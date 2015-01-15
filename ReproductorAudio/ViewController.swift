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
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 03.2 - Creamos las acciones con el IBACtion
    @IBAction func botonPlay(sender: AnyObject) {
        // 05 - Rellenamos las acciones
        reproductorAudio.play()
    }
    
    // 03.3
    @IBAction func botonStop(sender: AnyObject) {
        reproductorAudio.stop()
        reproductorAudio.currentTime = 0
    }

    // 03.4
    @IBAction func botonPausa(sender: AnyObject) {
        reproductorAudio.pause()
    }
    
    // 03.5
    @IBAction func cambiarVolumen(sender: AnyObject) {
        reproductorAudio.volume = valorVolumen.value
    }
    
    
    
    @IBAction func velocidadReproduccion(sender: AnyObject) {
        // 06.3 Cogemos el valos del slider y se lo pasamos
        reproductorAudio.rate = valorReproduccion.value
    }
    
    
    
    
    
}

