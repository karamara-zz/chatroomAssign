//
//  ViewController.swift
//  chatroom
//
//  Created by sung on 11/12/15.
//  Copyright © 2015 Sung Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var socket : SocketIOClient?

    @IBOutlet weak var urlLabel: UITextField!
    @IBAction func connectButtonPressed(sender: UIButton) {
        socket = SocketIOClient(socketURL: urlLabel.text!)
        socket?.connect()
        socket?.on("connect") { data, ack in
            print("iOS::WE ARE USING SOCKETS!")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

