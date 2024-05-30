//
//  RestaurantMapViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/30/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    
    // 새싹좌표
    let center = CLLocationCoordinate2D(latitude: 37.517857, longitude: 126.886714)
    
    let list = RestaurantList().restaurantArray
    
    var annotaions: [MKPointAnnotation] {
        var arr: [MKPointAnnotation] = []
        for res in list{
            let point = CLLocationCoordinate2D(latitude: res.latitude, longitude: res.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = point
            annotation.title = res.name
            annotation.subtitle = res.category
            arr.append(annotation)
        }
        return arr
    }
    var filterAnnotaions: [MKPointAnnotation] = []

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
//        mapView.addAnnotations(annotaions)
        
        let barButton = UIBarButtonItem(title: "모두", style: .plain, target: self, action: #selector(barButtonClick))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func barButtonClick() {
//        mapView.removeAnnotations(annotaions)
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "모두", style: .default) { a in
            self.makeAnnotations(a.title ?? "")
        }
        let action2 = UIAlertAction(title: "카페", style: .default) { a in
            self.makeAnnotations(a.title ?? "")
        }
        let action3 = UIAlertAction(title: "한식", style: .default) { a in
            self.makeAnnotations(a.title ?? "")
        }
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true)
    }
    
    private func makeAnnotations(_ category: String) {
        mapView.removeAnnotations(mapView.annotations)
        guard category != "모두" else {
            mapView.addAnnotations(annotaions)
            return
        }
        var filterAnnotations: [MKPointAnnotation] = []
        for res in list.filter({ $0.category == category }) {
            let point = CLLocationCoordinate2D(latitude: res.latitude, longitude: res.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = point
            annotation.title = res.name
            annotation.subtitle = res.category
            filterAnnotations.append(annotation)
        }
        mapView.addAnnotations(filterAnnotations)
    }



}

