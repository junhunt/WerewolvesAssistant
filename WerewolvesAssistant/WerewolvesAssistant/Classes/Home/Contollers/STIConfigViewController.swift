//
//  STIConfigViewController.swift
//  WerewolvesAssistant
//
//  Created by Jun on 2017/5/27.
//  Copyright © 2017年 Jun. All rights reserved.
//  配置

import UIKit

class STIConfigViewController: UIViewController {

    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var townsfolkTextField: UITextField!
    @IBOutlet weak var werewolfTextField: UITextField!
    
    @IBOutlet weak var playerSlider: UISlider!
    
    @IBOutlet weak var townsfolkStepper: UIStepper!
    @IBOutlet weak var werewolfStepper: UIStepper!
    
    @IBOutlet weak var seerSwitch: UISwitch!
    @IBOutlet weak var witchSwitch: UISwitch!
    @IBOutlet weak var hunterSwitch: UISwitch!
    @IBOutlet weak var idiotSwitch: UISwitch!
    
    @IBOutlet weak var qupidSwitch: UISwitch!
    @IBOutlet weak var littleGirlSwitch: UISwitch!
    @IBOutlet weak var elderSwitch: UISwitch!
    @IBOutlet weak var thiefSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playerSliderValueChanged(_ sender: UISlider) {
        let allPlayers = Int(sender.value)
        let countingOpening = countingOpeningSwitch()
        print(allPlayers)
        if allPlayers < countingOpening {
            playerTextField.text = "\(countingOpening)"
            sender.value = Float(countingOpening)
            return
        }
        
        playerTextField.text = "\(allPlayers)"

        let preWerewolf =  Int(werewolfTextField.text!)!
        let townsfolk = allPlayers - countingOpening - preWerewolf

        if townsfolk > 0 {
            changeTownsfolk(count: townsfolk)
            return
        }
        
        changeTownsfolk(count: 0)
        changeWerewolf(count: allPlayers - countingOpening)
    }
    @IBAction func townsfolkStepperValueChanged(_ sender: UIStepper) {
        let allPlayers = Int(playerTextField.text!)!
        let countingOpening = countingOpeningSwitch()
        var townsfolk = Int(sender.value)
        var werewolf =  allPlayers - countingOpening - townsfolk
        
        if werewolf < 0 {
            werewolf = 0
            townsfolk = allPlayers - countingOpening
        }
        
        changeTownsfolk(count: townsfolk)
        changeWerewolf(count: werewolf)
    }
    @IBAction func werewolfStepperValueChanged(_ sender: UIStepper) {
        let allPlayers = Int(playerTextField.text!)!
        let countingOpening = countingOpeningSwitch()
        var werewolf = Int(sender.value)
        var townsfolk =  allPlayers - countingOpening - werewolf
        
        if townsfolk < 0 {
            townsfolk = 0
            werewolf = allPlayers - countingOpening
        }
        
        changeTownsfolk(count: townsfolk)
        changeWerewolf(count: werewolf)
    }
    
    @IBAction func seerSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func witchSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func hunterSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func idiotSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    
    @IBAction func qupidSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func littleGirlSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func elderSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    @IBAction func thiefSwitchValueChanged(_ sender: UISwitch) {
        action(swi: sender)
    }
    
    var isIgnoreAction = false
    func action(swi: UISwitch) {
        let townsfolkes = Int(townsfolkTextField.text!)!
        let werewolves = Int(werewolfTextField.text!)!
        
        if townsfolkes == 0 && werewolves == 0 && swi.isOn {
            swi.isOn = false
            isIgnoreAction = true
            return
        }
        
        if isIgnoreAction {
            isIgnoreAction = false
            return
        }
        
        // 打开
        if swi.isOn {
            if werewolves >= townsfolkes {
                changeWerewolf(count: werewolves - 1)
            } else {
                changeTownsfolk(count: townsfolkes - 1)
            }
            
            return
        }
        
        // 关闭
        if townsfolkes <= werewolves {
            changeTownsfolk(count: townsfolkes + 1)
        } else {
            changeWerewolf(count: werewolves + 1)
        }
    }
    
    func action(stepper: UIStepper) {
        
    }
    
    func changeTownsfolk(count: Int) {
        townsfolkStepper.value = Double(count)
        townsfolkTextField.text = "\(count)"
    }
    
    func changeWerewolf(count: Int) {
        werewolfStepper.value = Double(count)
        werewolfTextField.text = "\(count)"
    }
    
    func countingOpeningSwitch() -> Int {
        var count = 0
        
        count += seerSwitch.isOn ? 1 : 0
        count += witchSwitch.isOn ? 1 : 0
        count += hunterSwitch.isOn ? 1 : 0
        count += idiotSwitch.isOn ? 1 : 0
        
        count += qupidSwitch.isOn ? 1 : 0
        count += littleGirlSwitch.isOn ? 1 : 0
        count += elderSwitch.isOn ? 1 : 0
        count += thiefSwitch.isOn ? 1 : 0
        
        return count
    }
}
