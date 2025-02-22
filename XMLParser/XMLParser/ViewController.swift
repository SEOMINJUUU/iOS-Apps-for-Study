//
//  ViewController.swift
//  XMLParser
//
//  Created by 서민주 on 2020/10/05.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {
    
    var dataList = [[String:String]]()
    var detaildata = [String:String]()
    var elementTemp: String = ""
    var blank: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        
        guard let baseURL = URL(string: urlString) else {
            print("URL error")
            return
        }
        
        guard let parser = XMLParser(contentsOf: baseURL) else {
            print("Can't read data")
            return
        }
        
        parser.delegate = self
        if !parser.parse() {
            print("Parse failure")
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo" {
            detaildata[elementTemp] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            dataList += [detaildata]
        }
        blank = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let dicTemp = dataList[indexPath.row]
        
        cell.countryLabel.text = dicTemp["country"]
        let weatherStr = dicTemp["weather"]
        
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = dicTemp["temperature"]
        
        if weatherStr == "맑음" {
            cell.imgView.image = UIImage(named: "sunny.png")
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        } else if weatherStr == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        } else {
            cell.imgView.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
}

