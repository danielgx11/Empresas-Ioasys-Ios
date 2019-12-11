//
//  ViewController.swift
//  Empresas Ios
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    //Coordinator main
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailDigitado: UITextField!
    @IBOutlet weak var senhaDigitada: UITextField!
    
    @IBAction func botaoEntrar(_ sender: Any) {
        coordinator?.empresasLista()
    }
    
    

}

