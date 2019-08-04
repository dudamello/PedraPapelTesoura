//
//  InterfaceController.swift
//  PedraPapelTesoura WatchKit Extension
//
//  Created by Eduarda Mello on 03/08/19.
//  Copyright © 2019 Eduarda Mello. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var imagem: WKInterfaceImage!
    @IBOutlet weak var txtResultado: WKInterfaceLabel!
    @IBAction func buttonTesoura() {
        escolherGanhador(escolhaUsuario: 0)
    }
    @IBAction func buttonPedra() {
        escolherGanhador(escolhaUsuario: 1)
    }
    @IBAction func buttonPapel() {
        escolherGanhador(escolhaUsuario: 2)
    }
    
    func escolherGanhador(escolhaUsuario: Int){
        
        let escolhaApp = Int(arc4random_uniform(3))
        let escolhas = ["tesoura.png","pedra.png","papel.png"]
        let nomeImagemEscolhida = escolhas[escolhaApp]
        
        //0-tesoura
        //1-pedra
        //2-papel
        
        imagem.setImageNamed(nomeImagemEscolhida)
        
        //app ganha
        if((escolhaApp == 0 && escolhaUsuario == 2) ||
            (escolhaApp == 1 && escolhaUsuario == 0) ||
            (escolhaApp == 2 && escolhaUsuario == 1)){
                txtResultado.setText("Você perdeu :(")
            //usuario ganha
        } else if((escolhaUsuario == 0 && escolhaApp == 2) ||
                    (escolhaUsuario == 1 && escolhaApp == 0) ||
                    (escolhaUsuario == 2 && escolhaApp == 1)){
            txtResultado.setText("Você ganhou :)")
        }else{
            txtResultado.setText("Empatamos!")
        }
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
