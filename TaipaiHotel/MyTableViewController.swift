//
//  MyTableViewController.swift
//  TaipaiHotel
//
//  Created by Mrosstro on 2017/6/12.
//  Copyright © 2017年 Mrosstro. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, MyDelegate {

    var eHttp: HttpController = HttpController() //讀取網頁
    var allData: Array<HotelSingle> = [] // 存所有資料
    var selectedHotel: Int = 0 // 使用者選取的旅館
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定 HttpController 委派 MyTableViewController 執行
        eHttp.delegate = self
        eHttp.onSearch(urls: "https://sheethub.com/data.taipei.gov.tw/%E8%87%BA%E5%8C%97%E5%B8%82-OK%E8%AA%8D%E8%AD%89-%E6%97%85%E9%A4%A8%E6%A5%AD?format=array_json")
    }

    func ReceiveResults(results: Any) {
        for json in results as! [Any] {
            let hotelSingle = HotelSingle(json: json as! [String: Any])
            allData.append(hotelSingle)
        }
        
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = String(allData[indexPath.row].name)
        cell.detailTextLabel?.text = String(allData[indexPath.row].tel) + " " + String(allData[indexPath.row].display_addr)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedHotel = indexPath.row
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController = segue.destination as! ViewController
        let hotelSingle = allData[selectedHotel]
        destViewController.hotelName = hotelSingle.name as! String
        destViewController.hotelAddr = hotelSingle.display_addr as! String
    }

}
