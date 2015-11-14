//
//  ViewController.swift
//  chatroom
//
//  Created by sung on 11/12/15.
//  Copyright © 2015 Sung Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    var messages = ["message 1 ", "message 2"]
    var socket : SocketIOClient?
    @IBOutlet weak var messageLabel: UITextField!
    @IBOutlet weak var urlLabel: UITextField!
    @IBAction func connectButtonPressed(sender: UIButton) {
        socket = SocketIOClient(socketURL: urlLabel.text!)
        socket?.connect()
        socket?.on("connect") { data, ack in
            print("iOS::WE ARE USING SOCKETS!")
        }
        
    }
    @IBOutlet weak var tableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection : Int) -> Int {
        return messages.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell")!
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendButtonPressed(sender: UIButton) {
        socket?.emit("messageToServer", messageLabel.text!)
        messageLabel.text = ""
    }


}

