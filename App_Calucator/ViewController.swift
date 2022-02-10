//
//  ViewController.swift
//  App_Calucator
//
//  Created by Thông Đoàn on 23/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var lbRecipe: UILabel!
    @IBOutlet weak var lbResults: UILabel!
    var stringResult:String = ""
    var stringValue: String = ""
    var tt:Float = 0
    var kq:Float = 0
    var tam:Float = 0

    var arrLogs:[String] = []
    //Tạo storyboard
    let sb = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addString(num: "0")
        addString(num: "+")
        lbRecipe.text = "= 0"
        lbResults.text = "00"
    }
    override func viewWillAppear(_ animated: Bool) {
        print("WILL APPEAR")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("DID APPEAR")
    }
    override func viewWillDisappear(_ animated: Bool) {

        print("WILL DIS APPEAR")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("DID APPEAR")
    }

    @IBAction func btnAC_clicked(_ sender: UIButton) {

        //Tạo màn hình
       let x = lbResults.text ?? ""
       let y = lbRecipe.text ?? ""
        arrLogs.append(x+" "+y)
        print(arrLogs)
        delValue()
    }

    @IBAction func btnC_clicked(_ sender: UIButton) {

        rollBack()
            
    }
    @IBAction func btnDiv_clicked(_ sender: UIButton) {
        addString(num: "/")
    }
    
    @IBAction func btnMul_clicked(_ sender: UIButton) {
        addString(num: "*")
    }
    
    @IBAction func btnSub_clicked(_ sender: UIButton) {

        addString(num: "-")
    }
    
    @IBAction func btnAdd_clicked(_ sender: UIButton) {

        addString(num: "+")


    }


    
    @IBAction func btnLogs_clicked(_ sender: UIButton) {

        //Tạo màn hình
        let logScreen = sb.instantiateViewController(identifier: "LogStoryboard") as! LogsViewController
        logScreen.arr = arrLogs
        self.navigationController?.pushViewController(logScreen, animated: true)
    }
    
    @IBAction func btnCom_clicked(_ sender: UIButton) {
        addString(num: ".")
    }
    @IBAction func btnRound_clicked(_ sender: UIButton) {
 
        handleRound()
    }
    
    @IBAction func btn0_clicked(_ sender: UIButton) {
        addString(num: "0")
    }
    @IBAction func btn1_clicked(_ sender: UIButton) {
        addString(num: "1")
    }
    @IBAction func btn2_clicked(_ sender: UIButton) {
        addString(num: "2")
    }
    @IBAction func btn3_clicked(_ sender: UIButton) {
        addString(num: "3")
    }
    @IBAction func btn4_clicked(_ sender: UIButton) {
        addString(num: "4")
    }
    
    @IBAction func btn5_clicked(_ sender: UIButton) {
        addString(num: "5")
    }
    @IBAction func btn6_clicked(_ sender: UIButton) {
        addString(num: "6")
    }
    
    @IBAction func btn7_clicked(_ sender: UIButton) {
        addString(num: "7")
    }
    
    @IBAction func btn8_clicked(_ sender: UIButton) {
        addString(num: "8")
    }
    @IBAction func btn9_clicked(_ sender: UIButton) {
        addString(num: "9")
    }
    func addString(num: String) {

        stringResult += num
        lbResults.text = stringResult
        switch num {
        case "1","2","3","4","5","6","7","8","9","0",".":
            stringValue += num
            print("string result = \(stringResult)")
            tam = Float(stringValue) ?? 0
            print("tam = \(tam)")
            for i in stringResult {
                if i == "+" {
                    kq = tt + tam
                } else if i == "-" {
                    kq = tt - tam
                } else if i == "*" {
                    kq = tt * tam
                } else if i == "/" {
                    if String(tam) != "0.0"
                    {
                        kq = tt / tam
                    } else{
                        let alert = UIAlertController(title: "Lỗi", message: "Không thể thực hiện thao tác!", preferredStyle: .alert)
                        let actionOK = UIAlertAction(title: "Hoàn tác", style: .cancel, handler: nil )
                        alert.addAction(actionOK)
                        self.present(alert, animated: true) {
                            self.rollBack()
                        }
                    }
                    
                }
            }
            lbRecipe.text = "= \(String(kq))"
            tam = kq
            print("tam = \(tam)")
            print("KQ = \(kq)")
        default:
            tt = tam
            print("tt = \(tt)")
            stringValue = ""
        }
    }
    func loadScreen()  {
        
    }
    func delValue() {

        kq = 0
        tam = 0
        tt = 0
        stringResult = ""
        stringValue = ""
        addString(num: "0")
        addString(num: "+")
        lbResults.text = "00"
        lbRecipe.text = "= 0"
    }
    func rollBack()  {
        if stringResult != "" && lbResults.text != "0+" && lbResults.text != "00"{

            stringResult.removeLast()
            let b = stringResult
            lbResults.text = b

            kq = 0
            tam = 0
            tt = 0
            stringResult = ""
            stringValue = ""
            for i in b {
                let a = String(i)
                addString(num: a )
            }
        } else
        {

        }
    }
    func handleRound() {
        lbRecipe.text = "= \(String(round(kq)))"
    }

}

