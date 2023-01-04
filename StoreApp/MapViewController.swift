//
//  MapViewController.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

//import UIKit
//import MapKit
//import CoreLocation
//
//class MapViewController: UIViewController, MKMapViewDelegate {
//
//    var mapView: MKMapView!
//    let locationManager = CLLocationManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Request location permission
//        locationManager.requestWhenInUseAuthorization()
//
//        // Initialize the map view
//        mapView = MKMapView(frame: view.bounds)
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mapView.delegate = self
//        view.addSubview(mapView)
//
//        // Add a pin to the map
//        let location = CLLocationCoordinate2D(latitude: -6.228472515314836, longitude: 106.78499711236272)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "San Francisco"
//        mapView.addAnnotation(annotation)
//
//        // Show the user's location on the map
//        mapView.showsUserLocation = true
//    }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            // Return the default user location view
//            return nil
//        }
//
//        // Customize the pin appearance
//        let reuseIdentifier = "pin"
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKPinAnnotationView
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
//            pinView?.pinTintColor = UIColor.purple
//        } else {
//            pinView?.annotation = annotation
//        }
//        return pinView
//    }
//
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        print("Tapped on pin at coordinate: (\(view.annotation?.coordinate.latitude), \(view.annotation?.coordinate.longitude))")
//    }
//}







import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the map view
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
        mapView.showsUserLocation = true

        // Add a pin to the map
        let location = CLLocationCoordinate2D(latitude: -6.228472515314836, longitude: 106.78499711236272)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "your location"
        mapView.addAnnotation(annotation)
    }
}

////
//extension UIViewController {
//    /// Embeds a UIViewController inside of another UIViewController using its view.
//    /// - Parameters:
//    ///   - Parameter viewController: UIViewController to embed
//    ///   - Parameter frame:  A frame to be used. Nil by default and used view's frame.
//    func embed(viewController: UIViewController, frame: CGRect? = nil) {
//        
//        addChild(viewController)
//        view.addSubview(viewController.view)
//        viewController.view.frame = view.bounds
//        viewController.didMove(toParent: self)
//    }
//    
//    /// Removes an embedded UIViewController from a UIVIewController
//    /// - Parameters:
//    ///   - Parameter embeddedViewController: UIViewController to remove
//    func remove(embeddedViewController: UIViewController) {
//        guard children.contains(embeddedViewController) else {
//            return
//        }
//        
//        embeddedViewController.willMove(toParent: nil)
//        embeddedViewController.view.removeFromSuperview()
//        embeddedViewController.removeFromParent()
//    }
//}     




