//
//  LogsViewController.swift
//  App_Calucator
//
//  Created by Thông Đoàn on 26/04/2021.
//

import UIKit
class LogsViewController: UIViewController, UITableViewDataSource {

    

    @IBOutlet weak var lbTest: UILabel!
    var stringResult:String?
    var result:String?
    var arr:[String] = []
    
    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
//        tbView.backgroundColor
        
    }
    override func viewDidAppear(_ animated: Bool) {

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        }
        let item = arr[indexPath.row]// mỗi row sẽ lấy xuống 1 item tương ứng
        print("item = \(item)")
        cell?.textLabel?.text = item
        cell?.detailTextLabel?.text = item
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
