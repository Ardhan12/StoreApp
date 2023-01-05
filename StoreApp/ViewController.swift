//
//  ViewController.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

import UIKit
import MapKit
import CoreLocation
import SwiftUI

class ViewController: UIViewController {
    let tableView = UITableView()
    var user: User?
    let map : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    private let buttonLogout: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 320, y: 0, width: 70, height: 35)
        button.backgroundColor = .white
        button.tintColor = .red
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 10
        button.setTitle("logout", for: .normal)
        button.addTarget(ViewController.self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        return button
    }()
    @objc func logoutButtonTapped() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")// Return to the login screen
        let login = UIHostingController(rootView: loginView())
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = login
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        view.addSubview(tableView)
        view.addSubview(map)
        view.addSubview(buttonLogout)
        tableView.dataSource = self
        tableView.delegate = self
        getUserlocation()
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        map.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
//        buttonLogout.translatesAutoresizingMaskIntoConstraints = false
        
        fetchData()
    }
    
    func getUserlocation() {
        LocationManager.shared.getUserLocation{ [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else{
                    return
                }
                strongSelf.addUserLocation(with: location)
            }
        }
    }
    
    func fetchData() {
        APIService.loginUser(username: "pitjarus", password: "admin") { [weak self] result in
            switch result {
            case .success(let userData):
                self?.user = userData
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    for storeData in userData.stores {
                        self?.addMapPin(latitude: storeData.latitude, longitude: storeData.longitude, title: storeData.storeName)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addMapPin(latitude: String, longitude: String, title: String) {
        // Add a pin to the map
        let location = CLLocationCoordinate2D(latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        map.addAnnotation(annotation)
    }
    
    func addUserLocation(with location: CLLocation) {
            let pin = MKPointAnnotation()
            pin.coordinate = location.coordinate
            map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
            
            map.addAnnotation(pin)
        }
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.stores.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = user?.stores[indexPath.row].storeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.storeID = user?.stores[indexPath.row].storeID ?? ""
        vc.storeName = user?.stores[indexPath.row].storeName ?? ""
        vc.storeCode = user?.stores[indexPath.row].storeCode ?? ""
        vc.address = user?.stores[indexPath.row].address ?? ""
        vc.dcID = user?.stores[indexPath.row].dcID ?? ""
        vc.dcName = user?.stores[indexPath.row].dcName ?? ""
        vc.accountID = user?.stores[indexPath.row].accountID ?? ""
        vc.accountName = user?.stores[indexPath.row].accountName ?? ""
        vc.subchannelID = user?.stores[indexPath.row].subchannelID ?? ""
        vc.subchannelName = user?.stores[indexPath.row].subchannelName ?? ""
        vc.channelID = user?.stores[indexPath.row].channelID ?? ""
        vc.channelName = user?.stores[indexPath.row].channelName ?? ""
        vc.areaID = user?.stores[indexPath.row].areaID ?? ""
        vc.areaName = user?.stores[indexPath.row].areaName ?? ""
        vc.regionID = user?.stores[indexPath.row].regionID ?? ""
        vc.regionName = user?.stores[indexPath.row].regionName ?? ""
        vc.latitude = user?.stores[indexPath.row].latitude ?? ""
        vc.longitude = user?.stores[indexPath.row].longitude ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        return "List terkahir diupdate \(dateString)"
    }
}
