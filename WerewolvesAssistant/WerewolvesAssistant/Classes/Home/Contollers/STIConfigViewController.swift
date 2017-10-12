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
    
    @IBOutlet weak var cupidSwitch: UISwitch!
    @IBOutlet weak var littleGirlSwitch: UISwitch!
    @IBOutlet weak var elderSwitch: UISwitch!
    @IBOutlet weak var thiefSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem =
            UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(nextStep))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func roleShow(_ sender: UIBarButtonItem) {
        nextStep()
    }
    
    func nextStep() {
        var roles = Array<STIRoleProtocol>()
        
        let townsfolkCount = Int(townsfolkTextField.text!) ?? 0
        for _ in 0..<townsfolkCount {
            let townsfolk = STITownsfolk()
            roles.append(townsfolk)
        }
        
        let werewolfCount = Int(werewolfTextField.text!) ?? 0
        for _ in 0..<werewolfCount {
            roles.append(STIWerewolf())
        }
        
        if seerSwitch.isOn {
            roles.append(STISeer())
        }
        
        if witchSwitch.isOn {
            roles.append(STIWitch())
        }
        
        if hunterSwitch.isOn {
            roles.append(STIHunter())
        }
        
        if idiotSwitch.isOn {
            roles.append(STIIdiot())
        }
        
        if cupidSwitch.isOn {
            roles.append(STICupid())
        }
        
        if littleGirlSwitch.isOn {
            roles.append(STILittleGirl())
        }
        
        if elderSwitch.isOn {
            roles.append(STIElder())
        }
        
        if thiefSwitch.isOn {
            roles.append(STIThief())
        }
        
        var randomRoles = Array<STIRoleProtocol>()
        for _ in 0..<roles.count {
            let randomIndex = UInt32.randomInRange(range: 0..<UInt32(roles.count))
            randomRoles.append(roles[Int(randomIndex)])
            roles.remove(at: Int(randomIndex))
        }
        
        print(randomRoles)
        print("\n\n")
        
        navigationController?.pushViewController(STIRoleShowViewController(roles: randomRoles), animated: true)
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
    
    @IBAction func cupidSwitchValueChanged(_ sender: UISwitch) {
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
        
        count += cupidSwitch.isOn ? 1 : 0
        count += littleGirlSwitch.isOn ? 1 : 0
        count += elderSwitch.isOn ? 1 : 0
        count += thiefSwitch.isOn ? 1 : 0
        
        return count
    }
}
