//
//  RestaurantMapViewController.swift
//  TravelMagazine
//
//  Created by 이찬호 on 5/30/24.
//

import UIKit
import MapKit
import CoreLocation

class RestaurantMapViewController: UIViewController {
    
    var locationManager = CLLocationManager()
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
        configureMapView(center)
        configureNavigationItems()
        configureCLLocationManager()
    }
    
    private func configureMapView(_ center: CLLocationCoordinate2D) {
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.addAnnotations(annotaions)
    }
    
    private func configureNavigationItems() {
        let barButton = UIBarButtonItem(title: "카테고리 선택", style: .plain, target: self, action: #selector(barButtonClick))
        navigationItem.rightBarButtonItem = barButton
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.title = "모두"
    }
    
    @objc func barButtonClick() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let categories = ["모두", "한식", "일식", "중식", "경양식", "분식", "카페"]
        for category in categories {
            alert.addAction(makeAction(category))
        }
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
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
    
    private func makeAction(_ title: String) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default) { action in
            guard let actionTitle = action.title else { return }
            self.makeAnnotations(actionTitle)
            self.navigationItem.title = actionTitle
        }
        return action
    }


}

extension RestaurantMapViewController: CLLocationManagerDelegate {
    
    private func configureCLLocationManager() {
        locationManager.delegate = self
    }
    
    private func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization()
        }
        else {
            print("위치서비스 꺼짐")
        }
    }
    
    private func checkCurrentLocationAuthorization() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            print("거부됨")
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            print(status)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print(locations)
        if let coordinate = locations.last?.coordinate {
            configureMapView(coordinate)
        }
        locationManager.stopUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(#function)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
}
