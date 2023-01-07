//
//  DetailViewController.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var user: User?
    var storeID = ""
    var storeCode = ""
    var storeName = ""
    var address = ""
    var dcID = ""
    var dcName = ""
    var accountID = ""
    var accountName = ""
    var subchannelID = ""
    var subchannelName = ""
    var channelID = ""
    var channelName = ""
    var areaID = ""
    var areaName = ""
    var regionID = ""
    var regionName = ""
    var latitude = ""
    var longitude = ""
    
    private let viewPage: UIView = {
        let viewpage = UIView()
        viewpage.translatesAutoresizingMaskIntoConstraints = true
        viewpage.backgroundColor = .red
        
        return viewpage
    }()
    //
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "alfa")
        imageview.frame = CGRect(x:0, y: 90, width:400 , height: 300)
        
        return imageview
    }()
    private let imageNav: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "location.north.circle.fill" )
        imageview.tintColor = .white
        imageview.backgroundColor = .systemBlue
        imageview.frame = CGRect(x:320, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    private let imageCam: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "camera.circle.fill")
        imageview.tintColor = .white
        imageview.backgroundColor = .systemBlue
        imageview.frame = CGRect(x:260, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    private let imageLoc: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "map.circle.fill")
        imageview.tintColor = .white
        imageview.backgroundColor = .systemBlue
        imageview.frame = CGRect(x:200, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    
    
    private let buttonNoVisit: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 85, y: 750, width: 100, height: 50)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("No Visit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    private let buttonVisit: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 215, y: 750, width: 100, height: 50)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Visit", for: .normal)
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonAction2(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Page"
        let text = UITextView()
        text.frame = CGRect(x: 0, y: 420, width: 400, height: 300)
        text.text = """
        storeID         : \(storeID)
        storeCode       : \(storeCode)
        storeName       : \(storeName)
        address         : \(address)
        dcID            : \(dcID)
        dcName          : \(dcName)
        accountID       : \(accountID)
        accountName     : \(accountName)
        subchannelID    : \(subchannelID)
        subchannelName  : \(subchannelName)
        channelID       : \(channelID)
        channelName     : \(channelName)
        areaID          : \(areaID)
        areaName        : \(areaName)
        regionID        : \(regionID)
        regionName      : \(regionName)
        latitude        : \(latitude)
        longitude       : \(longitude)
"""
        view.addSubview(text)
        setView()
        
    }
    
    func setView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
//        view.addSubview(textDetail)
        view.addSubview(buttonVisit)
        view.addSubview(buttonNoVisit)
        view.addSubview(imageNav)
        view.addSubview(imageCam)
        view.addSubview(imageLoc)
        addConstraint()
    }
    private func addConstraint() {
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
    }
}
