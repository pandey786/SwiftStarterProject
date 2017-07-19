//
//  ViewController.swift
//  SwiftStarterProject
//
//  Created by Pandey on 18/07/17.
//  Copyright © 2017 Pandey. All rights reserved.
//

import UIKit
import Gloss

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var itunesResultsArray = [ITunesResultDataModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set Dynamic Height of Tableview
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //get Data From Web Service
        getDataFromWebService()
    }
    
    func getDataFromWebService() {
        
        //Start Hud
        NetworkConnection.sharedInstance.appDelegate.startHUDWith(title: "Loading")
        
        //Call web Service
        let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=SalmanKhan"
        
        NetworkConnection.sharedInstance.serviceRequest(urlString: urlString) { (responseJson, success, errorStr) in
            
            DispatchQueue.main.async {
                
                //Stop Hud
                NetworkConnection.sharedInstance.appDelegate.stopHUD()
                
                //Get Model From Response
                if success {
                    
                    if let respJson = responseJson {
                        guard let itunesModel = [ITunesResultDataModel].from(jsonArray: respJson["results"] as! [JSON]) else {
                            return
                        }
                        
                        self.itunesResultsArray = itunesModel
                        
                        //Reload Table
                        self.tableView.reloadData()
                    }
                    
                } else {
                    print(errorStr)
                }
            }
        }
    }
    
    // MARK: - Table View Datasource
    // MARK: -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itunesResultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let songsListCell: SongsListTVCell = tableView.dequeueReusableCell(withIdentifier: "SongsListTVCell") as! SongsListTVCell
        
        let itunesModel = self.itunesResultsArray[indexPath.row]
        songsListCell.lblTitle.text = itunesModel.trackName
        songsListCell.lblSubTitle.text = itunesModel.artistName
        
        //Set Async Image
        if let imgUrl = itunesModel.artworkUrl100 {
            songsListCell.imgViewSong.loadImageWithUrl(urlString: imgUrl)
        }
        //songsListCell.imgViewSong.moa.url = itunesModel.artworkUrl100
        
        return songsListCell
    }
    
}

