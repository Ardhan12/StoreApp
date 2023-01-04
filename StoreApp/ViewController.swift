//
//  ViewController.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    let tableView = UITableView()
    var user: User?
    let map : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(map)
        tableView.dataSource = self
        tableView.delegate = self
        LocationManager.shared.getUserLocation{ [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else{
                    return
                }
                strongSelf.addUserLocation(with: location)
            }
        }
        
        
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
        
        fetchData()
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








//        setMapConstraints()

//        let location = CLLocationCoordinate2D(latitude: -6.228472515314836, longitude: 106.78499711236272)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "your location"
//        mapView.addAnnotation(annotation)

//    private func setMapConstraints() {
//        view.addSubview(mapView)
//
//
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
////        mapView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
//
//    }
