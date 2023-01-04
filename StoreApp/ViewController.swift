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
    //    let tableView = UITableView()
    //    let items = ["Item 1", "Item 2", "Item 3"]
    
    let map : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List Page"
        // Add the table view to the view controller's view
        //        view.addSubview(tableView)
        view.addSubview(map)
        //        tableView.dataSource = self
        //        tableView.delegate = self
        LocationManager.shared.getUserLocation{ [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else{
                    return
                }
                strongSelf.addMapPin(with: location)
            }
        }
        
        //        setMapConstraints()
        
        //        let location = CLLocationCoordinate2D(latitude: -6.228472515314836, longitude: 106.78499711236272)
        //        let annotation = MKPointAnnotation()
        //        annotation.coordinate = location
        //        annotation.title = "your location"
        //        mapView.addAnnotation(annotation)
        
        // Constrain the table view to the edges of the view controller's view
        //            tableView.translatesAutoresizingMaskIntoConstraints = false
        //            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //            tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //            tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
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
    
    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        map.addAnnotation(pin)
        
        LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
}



//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = items[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("you click this")
//
//        let vc = DetailViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
