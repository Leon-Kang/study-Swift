//
//  ViewController.swift
//  MapKit-swift
//
//  Created by 康梁 on 15/12/29.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let coordinate = CLLocationCoordinate2D(latitude: 31.22, longitude: 121.48)
        let coordinateSpan = MKCoordinateSpanMake(3.5, 3.5)
        
        let regionSH = MKCoordinateRegionMake(coordinate, coordinateSpan)
        
        mapView.setRegion(regionSH, animated: true)
        
        
        let annotationOne = MKPointAnnotation()
        annotationOne.title = "Welcome to _"
        annotationOne.subtitle = "THX"
        annotationOne.coordinate = CLLocationCoordinate2D(latitude: 30.12, longitude: 121.00)
        
        mapView.addAnnotation(annotationOne)
        
        let annotationTwo = Annotation(title: "wei", subTitle: "rrr", coordiante: CLLocationCoordinate2D(latitude: 30.00, longitude: 121.48))
        mapView.addAnnotation(annotationTwo)
        
        mapView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        
//    }

}

