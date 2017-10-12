//
//  STIRoleShowViewController.swift
//  WerewolvesAssistant
//
//  Created by Jun on 2017/6/3.
//  Copyright © 2017年 Jun. All rights reserved.
//

import UIKit

class STIRoleShowViewController: UIViewController {
    var roles: Array<STIRoleProtocol>
    
    init(roles: Array<STIRoleProtocol>) {
        self.roles = roles
        /// 根据Swift构造方法的特点，如果子类没有定义任何*Designated*类型的构造方法，则默认继承父类所有的*Designated*构造方法。
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "身份确认"
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: screenWidth * CGFloat(roles.count), height: screenHeight)
        view.addSubview(scrollView)
        
        for index in 0..<roles.count {
            let role = roles[index]
            
            let bgView = UIView()
            bgView.frame = CGRect(x: CGFloat(index) * screenWidth, y: 0, width: screenWidth, height: screenHeight)
//            bgView.backgroundColor = .red
            scrollView.addSubview(bgView)
            
            
            let indexLabel = UILabel()
            indexLabel.frame = CGRect(x: screenWidth/2-15, y: 50, width: 30, height: 30)
            indexLabel.textAlignment = .center
            indexLabel.backgroundColor = .gray
            indexLabel.textColor = .white
            indexLabel.text = "\(index+1)"
            indexLabel.layer.masksToBounds = true
            indexLabel.layer.cornerRadius = 15
            bgView.addSubview(indexLabel)
            
            let avatarView = UIImageView(image: UIImage(named: role.avatar))
            avatarView.frame = CGRect(x: screenWidth/2-100, y: indexLabel.frame.maxY + 20, width: 200, height: 200)
            bgView.addSubview(avatarView)
            
            
            let roleLabel = UILabel()
            roleLabel.frame = CGRect(x: 20, y: avatarView.frame.maxY + 20, width: screenWidth-40, height: 50)
            roleLabel.textAlignment = .center
//            roleLabel.backgroundColor = .white
//            roleLabel.textColor = .gray
            roleLabel.text = role.name
            bgView.addSubview(roleLabel)
        }
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

}
