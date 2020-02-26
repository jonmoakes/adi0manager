//
//  ProgressViewController.swift
//  ADI App
//
//  Created by Jonathan Oakes on 04/02/2019.
//  Copyright © 2019 Jonathan Oakes. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class ProgressViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextViewDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var progressEntry: PupilEntries!

    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var emailButton: UIBarButtonItem!
    
    @IBOutlet var cockpitDrillLabel: UILabel!
    @IBOutlet var blueGradeLabel: UILabel!
    @IBOutlet var cockpitSlider: UISlider!
    @IBOutlet var currentGradeLabel: UILabel!
    @IBOutlet var cockpitDrillTextView: UITextView!
    
    @IBOutlet var movingOffRedLabel: UILabel!
    @IBOutlet var movingOffBlueLabel: UILabel!
    @IBOutlet var movingOffSlider: UISlider!
    @IBOutlet var movingOffPurpleGrade: UILabel!
    @IBOutlet var movingOffTextView: UITextView!
    
    @IBOutlet var turningLeftRedLabel: UILabel!
    @IBOutlet var turningLeftBlueLabel: UILabel!
    @IBOutlet var turningLeftSlider: UISlider!
    @IBOutlet var turningLeftPurpleGrade: UILabel!
    @IBOutlet var turningLeftTextView: UITextView!
    
    @IBOutlet var turningRightRedLabel: UILabel!
    @IBOutlet var turningRightBlueLabel: UILabel!
    @IBOutlet var turningRightSlider: UISlider!
    @IBOutlet var turningRightPurpleGrade: UILabel!
    @IBOutlet var turningRightTextView: UITextView!
    
    @IBOutlet var emergingRedLabel: UILabel!
    @IBOutlet var emergingBlueLabel: UILabel!
    @IBOutlet var emergingSlider: UISlider!
    @IBOutlet var emergingPurplegrade: UILabel!
    @IBOutlet var emergingTextView: UITextView!
    
    @IBOutlet var crossroadsRedLabel: UILabel!
    @IBOutlet var crossroadsBlueLabel: UILabel!
    @IBOutlet var crossroadsSlider: UISlider!
    @IBOutlet var crossroadsPurpleGrade: UILabel!
    @IBOutlet var crossroadsTextView: UITextView!
    
    @IBOutlet var boxJunctionsRedLAbel: UILabel!
    @IBOutlet var boxJunctionsBlueLabel: UILabel!
    @IBOutlet var boxJunctionsSlider: UISlider!
    @IBOutlet var boxJunctionsPurpleGrade: UILabel!
    @IBOutlet var boxJunctionsTextView: UITextView!
    
    @IBOutlet var roundaboutsRedLabel: UILabel!
    @IBOutlet var roundaboutsBlueLabel: UILabel!
    @IBOutlet var roundaboutsSlider: UISlider!
    @IBOutlet var roundaboutsPurpleGrade: UILabel!
    @IBOutlet var roundaboutsTextView: UITextView!
    
    @IBOutlet var miniRoundaboutsRedLabel: UILabel!
    @IBOutlet var miniRoundaboutsBlueLabel: UILabel!
    @IBOutlet var miniRoundaboutsSlider: UISlider!
    @IBOutlet var miniRoundaboutsPurpleGrade: UILabel!
    @IBOutlet var miniRoundaboutsTextView: UITextView!
    
    @IBOutlet var meetingTrafficRedLabel: UILabel!
    @IBOutlet var meetingTrafficBlueLabel: UILabel!
    @IBOutlet var meetingTrafficSlider: UISlider!
    @IBOutlet var meetingTrafficPurpleGrade: UILabel!
    @IBOutlet var meetingTrafficTextView: UITextView!
    
    @IBOutlet var adequateClearanceRedLabel: UILabel!
    @IBOutlet var adequateClearanceBlueLabel: UILabel!
    @IBOutlet var adequateClearanceSlider: UISlider!
    @IBOutlet var adequateClearancePurpleGrade: UILabel!
    @IBOutlet var adequateClearanceTextView: UITextView!
    
    @IBOutlet var trafficLightsRedLabel: UILabel!
    @IBOutlet var trafficLightsBlueLabel: UILabel!
    @IBOutlet var trafficLightsSlider: UISlider!
    @IBOutlet var trafficLightsPurpleGrade: UILabel!
    @IBOutlet var trafficLightsTextView: UITextView!
    
    @IBOutlet var pedestrianCrossingsRedLabel: UILabel!
    @IBOutlet var pedestrianCrossingsBlueLabel: UILabel!
    @IBOutlet var pedestrianCrossingsSlider: UISlider!
    @IBOutlet var pedestrianCrossingsPurpleGrade: UILabel!
    @IBOutlet var pedestrianCrossingsTextView: UITextView!
    
    @IBOutlet var oneWayStreetsRedLabel: UILabel!
    @IBOutlet var oneWayStreetsBlueLabel: UILabel!
    @IBOutlet var oneWayStreetsSlider: UISlider!
    @IBOutlet var oneWayStreetsPurpleGrade: UILabel!
    @IBOutlet var oneWayStreetsTextView: UITextView!
    
    @IBOutlet var countryLanesRedLabel: UILabel!
    @IBOutlet var countryLanesBlueLabel: UILabel!
    @IBOutlet var countryLanesSlider: UISlider!
    @IBOutlet var countryLanesPurpleGrade: UILabel!
    @IBOutlet var countryLanesTextView: UITextView!
    
    @IBOutlet var dualCRedLabel: UILabel!
    @IBOutlet var dualCBlueLabel: UILabel!
    @IBOutlet var dualCSlider: UISlider!
    @IBOutlet var dualCPurpleGrade: UILabel!
    @IBOutlet var dualCTextView: UITextView!
    
    @IBOutlet var mwaysRedLabel: UILabel!
    @IBOutlet var mwaysBlueLabel: UILabel!
    @IBOutlet var mwaysPurpleGrade: UILabel!
    @IBOutlet var mwaysSlider: UISlider!
    @IBOutlet var mwaysTextView: UITextView!
    
    @IBOutlet var indyRedLabel: UILabel!
    @IBOutlet var indyBlueLabel: UILabel!
    @IBOutlet var indyPurpleGrade: UILabel!
    @IBOutlet var indySlider: UISlider!
    @IBOutlet var indyTextView: UITextView!
    
    @IBOutlet var satNavRedLabel: UILabel!
    @IBOutlet var satNavBlueLabel: UILabel!
    @IBOutlet var satNavPurpleGrade: UILabel!
    @IBOutlet var satNavSlider: UISlider!
    @IBOutlet var satNavTextView: UITextView!
    
    @IBOutlet var pullUpRightRedLabel: UILabel!
    @IBOutlet var pullUpRightBlueLabel: UILabel!
    @IBOutlet var pullUpRightPurpleGrade: UILabel!
    @IBOutlet var pullUpRightSlider: UISlider!
    @IBOutlet var pullUpRightTextView: UITextView!
    
    @IBOutlet var emStopRedLabel: UILabel!
    @IBOutlet var emStopBlueLabel: UILabel!
    @IBOutlet var emStopPurpleGrade: UILabel!
    @IBOutlet var emStopSlider: UISlider!
    @IBOutlet var emStopTextView: UITextView!
    
    @IBOutlet var tirRedLabel: UILabel!
    @IBOutlet var tirBlueLabel: UILabel!
    @IBOutlet var tirPurpleGrade: UILabel!
    @IBOutlet var tirSlider: UISlider!
    @IBOutlet var tirTextView: UITextView!
    
    @IBOutlet var pParkRedLabel: UILabel!
    @IBOutlet var pParkBlueLabel: UILabel!
    @IBOutlet var pParkPurpleGrade: UILabel!
    @IBOutlet var pParkSlider: UISlider!
    @IBOutlet var pParkTextView: UITextView!
    
    @IBOutlet var fBayRedLabel: UILabel!
    @IBOutlet var fBayBlueLabel: UILabel!
    @IBOutlet var fBayPurpleGrade: UILabel!
    @IBOutlet var fBaySlider: UISlider!
    @IBOutlet var fBayTextView: UITextView!
    
    @IBOutlet var rBayRedLabel: UILabel!
    @IBOutlet var rBayBlueLabel: UILabel!
    @IBOutlet var rBayPurpleGrade: UILabel!
    @IBOutlet var rBaySlider: UISlider!
    @IBOutlet var rBayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let firstNameOnly = progressEntry.name
        let word = firstNameOnly?.components(separatedBy: " ").first
        
        title = "\(word!)'s Progress"
        
        topLabel.isHidden = true
        bottomLabel.isHidden = true
        
        saveButton.isEnabled = false
    
        blueGradeLabel.isHidden = true
        cockpitSlider.isHidden = true
        currentGradeLabel.isHidden = true
        currentGradeLabel.applyRoundedCorners()
        cockpitDrillTextView.isHidden = true
        cockpitDrillTextView.delegate = self
        cockpitDrillTextView.applyRoundedCorners()
        
        movingOffBlueLabel.isHidden = true
        movingOffSlider.isHidden = true
        movingOffPurpleGrade.isHidden = true
        movingOffPurpleGrade.applyRoundedCorners()
        movingOffTextView.isHidden = true
        movingOffTextView.delegate = self
        movingOffTextView.applyRoundedCorners()
        
        turningLeftBlueLabel.isHidden = true
        turningLeftSlider.isHidden = true
        turningLeftPurpleGrade.isHidden = true
        turningLeftPurpleGrade.applyRoundedCorners()
        turningLeftTextView.isHidden = true
        turningLeftTextView.delegate = self
        turningLeftTextView.applyRoundedCorners()
        
        turningRightBlueLabel.isHidden = true
        turningRightSlider.isHidden = true
        turningRightPurpleGrade.isHidden = true
        turningRightPurpleGrade.applyRoundedCorners()
        turningRightTextView.isHidden = true
        turningRightTextView.delegate = self
        turningRightTextView.applyRoundedCorners()
        
        emergingBlueLabel.isHidden = true
        emergingSlider.isHidden = true
        emergingPurplegrade.isHidden = true
        emergingPurplegrade.applyRoundedCorners()
        emergingTextView.isHidden = true
        emergingTextView.delegate = self
        emergingTextView.applyRoundedCorners()
        
        crossroadsBlueLabel.isHidden = true
        crossroadsSlider.isHidden = true
        crossroadsPurpleGrade.isHidden = true
        crossroadsPurpleGrade.applyRoundedCorners()
        crossroadsTextView.isHidden = true
        crossroadsTextView.delegate = self
        crossroadsTextView.applyRoundedCorners()
        
        boxJunctionsBlueLabel.isHidden = true
        boxJunctionsSlider.isHidden = true
        boxJunctionsPurpleGrade.isHidden = true
        boxJunctionsPurpleGrade.applyRoundedCorners()
        boxJunctionsTextView.isHidden = true
        boxJunctionsTextView.delegate = self
        boxJunctionsTextView.applyRoundedCorners()
        
        roundaboutsBlueLabel.isHidden = true
        roundaboutsSlider.isHidden = true
        roundaboutsPurpleGrade.isHidden = true
        roundaboutsPurpleGrade.applyRoundedCorners()
        roundaboutsTextView.isHidden = true
        roundaboutsTextView.delegate = self
        roundaboutsTextView.applyRoundedCorners()
        
        miniRoundaboutsBlueLabel.isHidden = true
        miniRoundaboutsSlider.isHidden = true
        miniRoundaboutsPurpleGrade.isHidden = true
        miniRoundaboutsPurpleGrade.applyRoundedCorners()
        miniRoundaboutsTextView.isHidden = true
        miniRoundaboutsTextView.delegate = self
        miniRoundaboutsTextView.applyRoundedCorners()
        
        meetingTrafficBlueLabel.isHidden = true
        meetingTrafficSlider.isHidden = true
        meetingTrafficPurpleGrade.isHidden = true
        meetingTrafficPurpleGrade.applyRoundedCorners()
        meetingTrafficTextView.isHidden = true
        meetingTrafficTextView.delegate = self
        meetingTrafficTextView.applyRoundedCorners()
        
        adequateClearanceBlueLabel.isHidden = true
        adequateClearanceSlider.isHidden = true
        adequateClearancePurpleGrade.isHidden = true
        adequateClearancePurpleGrade.applyRoundedCorners()
        adequateClearanceTextView.isHidden = true
        adequateClearanceTextView.delegate = self
        adequateClearanceTextView.applyRoundedCorners()
        
        trafficLightsBlueLabel.isHidden = true
        trafficLightsSlider.isHidden = true
        trafficLightsPurpleGrade.isHidden = true
        trafficLightsPurpleGrade.applyRoundedCorners()
        trafficLightsTextView.isHidden = true
        trafficLightsTextView.delegate = self
        trafficLightsTextView.applyRoundedCorners()
        
        pedestrianCrossingsBlueLabel.isHidden = true
        pedestrianCrossingsSlider.isHidden = true
        pedestrianCrossingsPurpleGrade.isHidden = true
        pedestrianCrossingsPurpleGrade.applyRoundedCorners()
        pedestrianCrossingsTextView.isHidden = true
        pedestrianCrossingsTextView.delegate = self
        pedestrianCrossingsTextView.applyRoundedCorners()
        
        oneWayStreetsBlueLabel.isHidden = true
        oneWayStreetsSlider.isHidden = true
        oneWayStreetsPurpleGrade.isHidden = true
        oneWayStreetsPurpleGrade.applyRoundedCorners()
        oneWayStreetsTextView.isHidden = true
        oneWayStreetsTextView.delegate = self
        oneWayStreetsTextView.applyRoundedCorners()
        
        countryLanesBlueLabel.isHidden = true
        countryLanesSlider.isHidden = true
        countryLanesPurpleGrade.isHidden = true
        countryLanesPurpleGrade.applyRoundedCorners()
        countryLanesTextView.isHidden = true
        countryLanesTextView.delegate = self
        countryLanesTextView.applyRoundedCorners()
        
        dualCBlueLabel.isHidden = true
        dualCSlider.isHidden = true
        dualCPurpleGrade.isHidden = true
        dualCPurpleGrade.applyRoundedCorners()
        dualCTextView.isHidden = true
        dualCTextView.delegate = self
        dualCTextView.applyRoundedCorners()
        
        mwaysBlueLabel.isHidden = true
        mwaysPurpleGrade.isHidden = true
        mwaysPurpleGrade.applyRoundedCorners()
        mwaysSlider.isHidden = true
        mwaysTextView.isHidden = true
        mwaysTextView.delegate = self
        mwaysTextView.applyRoundedCorners()
        
        indyBlueLabel.isHidden = true
        indyPurpleGrade.isHidden = true
        indyPurpleGrade.applyRoundedCorners()
        indySlider.isHidden = true
        indyTextView.isHidden = true
        indyTextView.delegate = self
        indyTextView.applyRoundedCorners()
        
        satNavBlueLabel.isHidden = true
        satNavPurpleGrade.isHidden = true
        satNavPurpleGrade.applyRoundedCorners()
        satNavSlider.isHidden = true
        satNavTextView.isHidden = true
        satNavTextView.delegate = self
        satNavTextView.applyRoundedCorners()
        
        pullUpRightBlueLabel.isHidden = true
        pullUpRightPurpleGrade.isHidden = true
        pullUpRightPurpleGrade.applyRoundedCorners()
        pullUpRightSlider.isHidden = true
        pullUpRightTextView.isHidden = true
        pullUpRightTextView.delegate = self
        pullUpRightTextView.applyRoundedCorners()
        
        emStopBlueLabel.isHidden = true
        emStopPurpleGrade.isHidden = true
        emStopPurpleGrade.applyRoundedCorners()
        emStopSlider.isHidden = true
        emStopTextView.isHidden = true
        emStopTextView.delegate = self
        emStopTextView.applyRoundedCorners()
        
        tirBlueLabel.isHidden = true
        tirPurpleGrade.isHidden = true
        tirPurpleGrade.applyRoundedCorners()
        tirSlider.isHidden = true
        tirTextView.isHidden = true
        tirTextView.delegate = self
        tirTextView.applyRoundedCorners()
        
        pParkBlueLabel.isHidden = true
        pParkPurpleGrade.isHidden = true
        pParkPurpleGrade.applyRoundedCorners()
        pParkSlider.isHidden = true
        pParkTextView.isHidden = true
        pParkTextView.delegate = self
        pParkTextView.applyRoundedCorners()
        
        fBayBlueLabel.isHidden = true
        fBayPurpleGrade.isHidden = true
        fBayPurpleGrade.applyRoundedCorners()
        fBaySlider.isHidden = true
        fBayTextView.isHidden = true
        fBayTextView.delegate = self
        fBayTextView.applyRoundedCorners()
        
        rBayBlueLabel.isHidden = true
        rBayPurpleGrade.isHidden = true
        rBayPurpleGrade.applyRoundedCorners()
        rBaySlider.isHidden = true
        rBayTextView.isHidden = true
        rBayTextView.delegate = self
        rBayTextView.applyRoundedCorners()
        
        let thumbImageNormal = #imageLiteral(resourceName: "arrowSlider")  // type imageLiteral To view Images in catalogue.
        cockpitSlider.setThumbImage(thumbImageNormal, for: .normal)
        movingOffSlider.setThumbImage(thumbImageNormal, for: .normal)
        turningLeftSlider.setThumbImage(thumbImageNormal, for: .normal)
        turningRightSlider.setThumbImage(thumbImageNormal, for: .normal)
        emergingSlider.setThumbImage(thumbImageNormal, for: .normal)
        crossroadsSlider.setThumbImage(thumbImageNormal, for: .normal)
        boxJunctionsSlider.setThumbImage(thumbImageNormal, for: .normal)
        roundaboutsSlider.setThumbImage(thumbImageNormal, for: .normal)
        miniRoundaboutsSlider.setThumbImage(thumbImageNormal, for: .normal)
        meetingTrafficSlider.setThumbImage(thumbImageNormal, for: .normal)
        adequateClearanceSlider.setThumbImage(thumbImageNormal, for: .normal)
        trafficLightsSlider.setThumbImage(thumbImageNormal, for: .normal)
        pedestrianCrossingsSlider.setThumbImage(thumbImageNormal, for: .normal)
        oneWayStreetsSlider.setThumbImage(thumbImageNormal, for: .normal)
        countryLanesSlider.setThumbImage(thumbImageNormal, for: .normal)
        dualCSlider.setThumbImage(thumbImageNormal, for: .normal)
        mwaysSlider.setThumbImage(thumbImageNormal, for: .normal)
        indySlider.setThumbImage(thumbImageNormal, for: .normal)
        satNavSlider.setThumbImage(thumbImageNormal, for: .normal)
        pullUpRightSlider.setThumbImage(thumbImageNormal, for: .normal)
        emStopSlider.setThumbImage(thumbImageNormal, for: .normal)
        tirSlider.setThumbImage(thumbImageNormal, for: .normal)
        pParkSlider.setThumbImage(thumbImageNormal, for: .normal)
        fBaySlider.setThumbImage(thumbImageNormal, for: .normal)
        rBaySlider.setThumbImage(thumbImageNormal, for: .normal)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14) // stretching the left and right of image.
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        cockpitSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        movingOffSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        turningLeftSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        turningRightSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        emergingSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        crossroadsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        boxJunctionsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        roundaboutsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        miniRoundaboutsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        meetingTrafficSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        adequateClearanceSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        trafficLightsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        pedestrianCrossingsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        oneWayStreetsSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        countryLanesSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        dualCSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        mwaysSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        indySlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        satNavSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        pullUpRightSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        emStopSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        tirSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        pParkSlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        fBaySlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        rBaySlider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        cockpitSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        movingOffSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        turningLeftSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        turningRightSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        emergingSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        crossroadsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        boxJunctionsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        roundaboutsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        miniRoundaboutsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        meetingTrafficSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        adequateClearanceSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        trafficLightsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        pedestrianCrossingsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        oneWayStreetsSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        countryLanesSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        dualCSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        mwaysSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        indySlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        satNavSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        pullUpRightSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        emStopSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        tirSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        pParkSlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        fBaySlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        rBaySlider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        cockpitDrillLabel.isUserInteractionEnabled = true
        movingOffRedLabel.isUserInteractionEnabled = true
        turningLeftRedLabel.isUserInteractionEnabled = true
        turningRightRedLabel.isUserInteractionEnabled = true
        emergingRedLabel.isUserInteractionEnabled = true
        crossroadsRedLabel.isUserInteractionEnabled = true
        boxJunctionsRedLAbel.isUserInteractionEnabled = true
        roundaboutsRedLabel.isUserInteractionEnabled = true
        miniRoundaboutsRedLabel.isUserInteractionEnabled = true
        meetingTrafficRedLabel.isUserInteractionEnabled = true
        adequateClearanceRedLabel.isUserInteractionEnabled = true
        trafficLightsRedLabel.isUserInteractionEnabled = true
        pedestrianCrossingsRedLabel.isUserInteractionEnabled = true
        oneWayStreetsRedLabel.isUserInteractionEnabled = true
        countryLanesRedLabel.isUserInteractionEnabled = true
        dualCRedLabel.isUserInteractionEnabled = true
        mwaysRedLabel.isUserInteractionEnabled = true
        indyRedLabel.isUserInteractionEnabled = true
        satNavRedLabel.isUserInteractionEnabled = true
        pullUpRightRedLabel.isUserInteractionEnabled = true
        emStopRedLabel.isUserInteractionEnabled = true
        tirRedLabel.isUserInteractionEnabled = true
        pParkRedLabel.isUserInteractionEnabled = true
        fBayRedLabel.isUserInteractionEnabled = true
        rBayRedLabel.isUserInteractionEnabled = true
        
        let cockpitTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.cockpitTapGesture))
        let moveOffTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.movingOffTapGesture))
        let turningLeftTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.turningLeftTapGesture))
        let turningRightTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.turningRightTapGesture))
        let emergingTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.emergingTapGesture))
        let crossroadsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.crossroadsTapGesture))
        let boxJunctionsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.boxJunctionsTapGesture))
        let roundaboutsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.roundaboutsTapGesture))
        let miniRoundaboutsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.miniRoundaboutsTapGesture))
        let meetingTrafficTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.meetingTrafficTapGesture))
        let adequateClearanceTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.adequateClearanceTapGesture))
        let trafficLightsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.trafficLightsTapGesture))
        let pedestrianCrossingsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pedestrianCrossingsTapGesture))
        let oneWayStreetsTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.oneWayStreetsTapGesture))
        let countryLanesTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.countryLanesTapGesture))
        let dualCTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dualCTapGesture))
        let mwaysTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.mwaysTapGesture))
        let indyTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.indyTapGesture))
        let satNavTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.satNavTapGesture))
        let pullUpRightTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pullUpRightTapGesture))
        let emStopTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.emStopTapGesture))
        let tirTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tirTapGesture))
        let pParkTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.pParkTapGesture))
        let fBayTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.fBayTapGesture))
        let rBayTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.rBayTapGesture))
        
        cockpitDrillLabel.addGestureRecognizer(cockpitTapGesture)
        movingOffRedLabel.addGestureRecognizer(moveOffTapGesture)
        turningLeftRedLabel.addGestureRecognizer(turningLeftTapGesture)
        turningRightRedLabel.addGestureRecognizer(turningRightTapGesture)
        emergingRedLabel.addGestureRecognizer(emergingTapGesture)
        crossroadsRedLabel.addGestureRecognizer(crossroadsTapGesture)
        boxJunctionsRedLAbel.addGestureRecognizer(boxJunctionsTapGesture)
        roundaboutsRedLabel.addGestureRecognizer(roundaboutsTapGesture)
        miniRoundaboutsRedLabel.addGestureRecognizer(miniRoundaboutsTapGesture)
        meetingTrafficRedLabel.addGestureRecognizer(meetingTrafficTapGesture)
        adequateClearanceRedLabel.addGestureRecognizer(adequateClearanceTapGesture)
        trafficLightsRedLabel.addGestureRecognizer(trafficLightsTapGesture)
        pedestrianCrossingsRedLabel.addGestureRecognizer(pedestrianCrossingsTapGesture)
        oneWayStreetsRedLabel.addGestureRecognizer(oneWayStreetsTapGesture)
        countryLanesRedLabel.addGestureRecognizer(countryLanesTapGesture)
        dualCRedLabel.addGestureRecognizer(dualCTapGesture)
        mwaysRedLabel.addGestureRecognizer(mwaysTapGesture)
        indyRedLabel.addGestureRecognizer(indyTapGesture)
        satNavRedLabel.addGestureRecognizer(satNavTapGesture)
        pullUpRightRedLabel.addGestureRecognizer(pullUpRightTapGesture)
        emStopRedLabel.addGestureRecognizer(emStopTapGesture)
        tirRedLabel.addGestureRecognizer(tirTapGesture)
        pParkRedLabel.addGestureRecognizer(pParkTapGesture)
        fBayRedLabel.addGestureRecognizer(fBayTapGesture)
        rBayRedLabel.addGestureRecognizer(rBayTapGesture)
        
        cockpitDrillTextView.text = progressEntry.cockpitDrill
        currentGradeLabel.text = progressEntry.progressGrade
        
        movingOffTextView.text = progressEntry.movingOffAndStopping
        movingOffPurpleGrade.text = progressEntry.movingOffAndStoppingPurpleGrade
        
        turningLeftTextView.text = progressEntry.turningLeft
        turningLeftPurpleGrade.text = progressEntry.turningLeftPurpleGrade
        
        turningRightTextView.text = progressEntry.turningRight
        turningRightPurpleGrade.text = progressEntry.turningRightPurpleGrade
        
        emergingTextView.text = progressEntry.emerging
        emergingPurplegrade.text = progressEntry.emergingPurpleGrade
        
        crossroadsTextView.text = progressEntry.crossroads
        crossroadsPurpleGrade.text = progressEntry.crossroadsPurpleGrade
        
        boxJunctionsTextView.text = progressEntry.boxJunctions
        boxJunctionsPurpleGrade.text = progressEntry.boxJunctionsPurpleGrade
        
        roundaboutsTextView.text = progressEntry.roundabouts
        roundaboutsPurpleGrade.text = progressEntry.roundaboutsPurpleGrade
        
        miniRoundaboutsTextView.text = progressEntry.miniRoundabouts
        miniRoundaboutsPurpleGrade.text = progressEntry.miniRoundaboutsPurpleGrade
        
        meetingTrafficTextView.text = progressEntry.meetingTraffic
        meetingTrafficPurpleGrade.text = progressEntry.meetingTrafficPurpleGrade
        
        adequateClearanceTextView.text = progressEntry.adequateClearance
        adequateClearancePurpleGrade.text = progressEntry.adequateClearancePurpleGrade
        
        trafficLightsTextView.text = progressEntry.trafficLights
        trafficLightsPurpleGrade.text = progressEntry.trafficLightsPurpleGrade
        
        pedestrianCrossingsTextView.text = progressEntry.pedestrianCrossings
        pedestrianCrossingsPurpleGrade.text = progressEntry.pedestrianCrossingsPurpleGrade
        
        oneWayStreetsTextView.text = progressEntry.oneWayStreets
        oneWayStreetsPurpleGrade.text = progressEntry.oneWayStreetsPurpleGrade
        
        countryLanesTextView.text = progressEntry.countryLanes
        countryLanesPurpleGrade.text = progressEntry.countryLanesPurpleGrade
        
        dualCTextView.text = progressEntry.dualCarriageways
        dualCPurpleGrade.text = progressEntry.dualCarriagewaysPurpleGrade
        
        mwaysTextView.text = progressEntry.motorways
        mwaysPurpleGrade.text = progressEntry.motorwaysPurpleGrade
        
        indyTextView.text = progressEntry.independentDriving
        indyPurpleGrade.text = progressEntry.independentDrivingPurpleGrade
        
        satNavTextView.text = progressEntry.satNav
        satNavPurpleGrade.text = progressEntry.satNavPurpleGrade
        
        pullUpRightTextView.text = progressEntry.pullUpOnTheRight
        pullUpRightPurpleGrade.text = progressEntry.pullUpOnTheRightPurpleGrade
        
        emStopTextView.text = progressEntry.emergencyStop
        emStopPurpleGrade.text = progressEntry.emergencyStopPurpleGrade
        
        tirTextView.text = progressEntry.turnInTheRoad
        tirPurpleGrade.text = progressEntry.turnInTheRoadPurpleGrade
        
        pParkTextView.text = progressEntry.parallelPark
        pParkPurpleGrade.text = progressEntry.parallelParkPurpleGrade
        
        fBayTextView.text = progressEntry.forwardBayPark
        fBayPurpleGrade.text = progressEntry.forwardBayParkPurpleGrade
        
        rBayTextView.text = progressEntry.reverseBayPark
        rBayPurpleGrade.text = progressEntry.reverseBayParkPurpleGrade
    }
    
    @objc func cockpitTapGesture()  {
        if cockpitDrillTextView.isHidden == true {
            cockpitDrillTextView.fadeIn()
            cockpitSlider.fadeIn()
            currentGradeLabel.fadeIn()
            blueGradeLabel.fadeIn()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            cockpitDrillTextView.fadeOut()
            cockpitSlider.fadeOut()
            currentGradeLabel.fadeOut()
            blueGradeLabel.fadeOut()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func movingOffTapGesture()  {
        if movingOffTextView.isHidden == true {
            movingOffTextView.fadeIn()
            movingOffSlider.fadeIn()
            movingOffPurpleGrade.fadeIn()
            movingOffBlueLabel.fadeIn()
            cockpitDrillLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            movingOffTextView.fadeOut()
            movingOffSlider.fadeOut()
            movingOffPurpleGrade.fadeOut()
            movingOffBlueLabel.fadeOut()
            cockpitDrillLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func turningLeftTapGesture()  {
        if turningLeftTextView.isHidden == true {
            turningLeftTextView.fadeIn()
            turningLeftSlider.fadeIn()
            turningLeftPurpleGrade.fadeIn()
            turningLeftBlueLabel.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            turningLeftBlueLabel.fadeOut()
            turningLeftSlider.fadeOut()
            turningLeftPurpleGrade.fadeOut()
            turningLeftTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func turningRightTapGesture()  {
        if turningRightTextView.isHidden == true {
            turningRightTextView.fadeIn()
            turningRightSlider.fadeIn()
            turningRightPurpleGrade.fadeIn()
            turningRightBlueLabel.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            turningRightTextView.fadeOut()
            turningRightSlider.fadeOut()
            turningRightPurpleGrade.fadeOut()
            turningRightBlueLabel.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeOut()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func emergingTapGesture()  {
        if emergingTextView.isHidden == true {
            emergingBlueLabel.fadeIn()
            emergingSlider.fadeIn()
            emergingPurplegrade.fadeIn()
            emergingTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            emergingBlueLabel.fadeOut()
            emergingSlider.fadeOut()
            emergingPurplegrade.fadeOut()
            emergingTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func crossroadsTapGesture()  {
        if crossroadsTextView.isHidden == true {
            crossroadsBlueLabel.fadeIn()
            crossroadsSlider.fadeIn()
            crossroadsPurpleGrade.fadeIn()
            crossroadsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            crossroadsBlueLabel.fadeOut()
            crossroadsSlider.fadeOut()
            crossroadsPurpleGrade.fadeOut()
            crossroadsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func boxJunctionsTapGesture()  {
        if boxJunctionsTextView.isHidden == true {
            boxJunctionsBlueLabel.fadeIn()
            boxJunctionsSlider.fadeIn()
            boxJunctionsPurpleGrade.fadeIn()
            boxJunctionsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            boxJunctionsBlueLabel.fadeOut()
            boxJunctionsSlider.fadeOut()
            boxJunctionsPurpleGrade.fadeOut()
            boxJunctionsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func roundaboutsTapGesture() {
        if roundaboutsTextView.isHidden == true {
            roundaboutsBlueLabel.fadeIn()
            roundaboutsSlider.fadeIn()
            roundaboutsPurpleGrade.fadeIn()
            roundaboutsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            roundaboutsBlueLabel.fadeOut()
            roundaboutsSlider.fadeOut()
            roundaboutsPurpleGrade.fadeOut()
            roundaboutsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func miniRoundaboutsTapGesture() {
        if miniRoundaboutsTextView.isHidden == true {
            miniRoundaboutsBlueLabel.fadeIn()
            miniRoundaboutsSlider.fadeIn()
            miniRoundaboutsPurpleGrade.fadeIn()
            miniRoundaboutsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            miniRoundaboutsBlueLabel.fadeOut()
            miniRoundaboutsSlider.fadeOut()
            miniRoundaboutsPurpleGrade.fadeOut()
            miniRoundaboutsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func meetingTrafficTapGesture() {
        if meetingTrafficTextView.isHidden == true {
            meetingTrafficBlueLabel.fadeIn()
            meetingTrafficSlider.fadeIn()
            meetingTrafficPurpleGrade.fadeIn()
            meetingTrafficTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            meetingTrafficBlueLabel.fadeOut()
            meetingTrafficSlider.fadeOut()
            meetingTrafficPurpleGrade.fadeOut()
            meetingTrafficTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func adequateClearanceTapGesture() {
        if adequateClearanceTextView.isHidden == true {
            adequateClearanceBlueLabel.fadeIn()
            adequateClearanceSlider.fadeIn()
            adequateClearancePurpleGrade.fadeIn()
            adequateClearanceTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            adequateClearanceBlueLabel.fadeOut()
            adequateClearanceSlider.fadeOut()
            adequateClearancePurpleGrade.fadeOut()
            adequateClearanceTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func trafficLightsTapGesture() {
        if trafficLightsTextView.isHidden == true {
            trafficLightsBlueLabel.fadeIn()
            trafficLightsSlider.fadeIn()
            trafficLightsPurpleGrade.fadeIn()
            trafficLightsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            trafficLightsBlueLabel.fadeOut()
            trafficLightsSlider.fadeOut()
            trafficLightsPurpleGrade.fadeOut()
            trafficLightsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func pedestrianCrossingsTapGesture() {
        if pedestrianCrossingsTextView.isHidden == true {
            pedestrianCrossingsBlueLabel.fadeIn()
            pedestrianCrossingsSlider.fadeIn()
            pedestrianCrossingsPurpleGrade.fadeIn()
            pedestrianCrossingsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            pedestrianCrossingsBlueLabel.fadeOut()
            pedestrianCrossingsSlider.fadeOut()
            pedestrianCrossingsPurpleGrade.fadeOut()
            pedestrianCrossingsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func oneWayStreetsTapGesture() {
        if oneWayStreetsTextView.isHidden == true {
            oneWayStreetsBlueLabel.fadeIn()
            oneWayStreetsSlider.fadeIn()
            oneWayStreetsPurpleGrade.fadeIn()
            oneWayStreetsTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            oneWayStreetsBlueLabel.fadeOut()
            oneWayStreetsSlider.fadeOut()
            oneWayStreetsPurpleGrade.fadeOut()
            oneWayStreetsTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func countryLanesTapGesture() {
        if countryLanesTextView.isHidden == true {
            countryLanesBlueLabel.fadeIn()
            countryLanesSlider.fadeIn()
            countryLanesPurpleGrade.fadeIn()
            countryLanesTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            countryLanesBlueLabel.fadeOut()
            countryLanesSlider.fadeOut()
            countryLanesPurpleGrade.fadeOut()
            countryLanesTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func dualCTapGesture() {
        if dualCTextView.isHidden == true {
            dualCBlueLabel.fadeIn()
            dualCSlider.fadeIn()
            dualCTextView.fadeIn()
            dualCPurpleGrade.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            dualCBlueLabel.fadeOut()
            dualCSlider.fadeOut()
            dualCPurpleGrade.fadeOut()
            dualCTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func mwaysTapGesture() {
        if mwaysTextView.isHidden == true {
            mwaysBlueLabel.fadeIn()
            mwaysPurpleGrade.fadeIn()
            mwaysSlider.fadeIn()
            mwaysTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            mwaysBlueLabel.fadeOut()
            mwaysPurpleGrade.fadeOut()
            mwaysSlider.fadeOut()
            mwaysTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func indyTapGesture() {
        if indyTextView.isHidden == true {
            indyBlueLabel.fadeIn()
            indyPurpleGrade.fadeIn()
            indySlider.fadeIn()
            indyTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            indyBlueLabel.fadeOut()
            indyPurpleGrade.fadeOut()
            indySlider.fadeOut()
            indyTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func satNavTapGesture() {
        if satNavTextView.isHidden == true {
            satNavBlueLabel.fadeIn()
            satNavPurpleGrade.fadeIn()
            satNavSlider.fadeIn()
            satNavTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            satNavBlueLabel.fadeOut()
            satNavPurpleGrade.fadeOut()
            satNavSlider.fadeOut()
            satNavTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func pullUpRightTapGesture() {
        if pullUpRightTextView.isHidden == true {
            pullUpRightBlueLabel.fadeIn()
            pullUpRightPurpleGrade.fadeIn()
            pullUpRightSlider.fadeIn()
            pullUpRightTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            pullUpRightBlueLabel.fadeOut()
            pullUpRightPurpleGrade.fadeOut()
            pullUpRightSlider.fadeOut()
            pullUpRightTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func emStopTapGesture() {
        if emStopTextView.isHidden == true {
            emStopBlueLabel.fadeIn()
            emStopPurpleGrade.fadeIn()
            emStopSlider.fadeIn()
            emStopTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            emStopBlueLabel.fadeOut()
            emStopPurpleGrade.fadeOut()
            emStopSlider.fadeOut()
            emStopTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func tirTapGesture() {
        if tirTextView.isHidden == true {
            tirBlueLabel.fadeIn()
            tirPurpleGrade.fadeIn()
            tirSlider.fadeIn()
            tirTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            tirBlueLabel.fadeOut()
            tirPurpleGrade.fadeOut()
            tirSlider.fadeOut()
            tirTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func pParkTapGesture() {
        if pParkTextView.isHidden == true {
            pParkBlueLabel.fadeIn()
            pParkPurpleGrade.fadeIn()
            pParkSlider.fadeIn()
            pParkTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            pParkBlueLabel.fadeOut()
            pParkPurpleGrade.fadeOut()
            pParkSlider.fadeOut()
            pParkTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func fBayTapGesture() {
        if fBayTextView.isHidden == true {
            fBayBlueLabel.fadeIn()
            fBayPurpleGrade.fadeIn()
            fBaySlider.fadeIn()
            fBayTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            rBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            fBayBlueLabel.fadeOut()
            fBayPurpleGrade.fadeOut()
            fBaySlider.fadeOut()
            fBayTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            rBayRedLabel.fadeIn()
        }
    }
    
    @objc func rBayTapGesture() {
        if rBayTextView.isHidden == true {
            rBayBlueLabel.fadeIn()
            rBayPurpleGrade.fadeIn()
            rBaySlider.fadeIn()
            rBayTextView.fadeIn()
            cockpitDrillLabel.fadeOut()
            movingOffRedLabel.fadeOut()
            turningLeftRedLabel.fadeOut()
            turningRightRedLabel.fadeOut()
            emergingRedLabel.fadeOut()
            crossroadsRedLabel.fadeOut()
            boxJunctionsRedLAbel.fadeOut()
            roundaboutsRedLabel.fadeOut()
            miniRoundaboutsRedLabel.fadeOut()
            meetingTrafficRedLabel.fadeOut()
            adequateClearanceRedLabel.fadeOut()
            trafficLightsRedLabel.fadeOut()
            pedestrianCrossingsRedLabel.fadeOut()
            oneWayStreetsRedLabel.fadeOut()
            countryLanesRedLabel.fadeOut()
            dualCRedLabel.fadeOut()
            mwaysRedLabel.fadeOut()
            indyRedLabel.fadeOut()
            satNavRedLabel.fadeOut()
            pullUpRightRedLabel.fadeOut()
            emStopRedLabel.fadeOut()
            tirRedLabel.fadeOut()
            pParkRedLabel.fadeOut()
            fBayRedLabel.fadeOut()
            scrollView.setContentOffset(.zero, animated: true)
        } else {
            rBayBlueLabel.fadeOut()
            rBayPurpleGrade.fadeOut()
            rBaySlider.fadeOut()
            rBayTextView.fadeOut()
            cockpitDrillLabel.fadeIn()
            movingOffRedLabel.fadeIn()
            turningLeftRedLabel.fadeIn()
            turningRightRedLabel.fadeIn()
            emergingRedLabel.fadeIn()
            crossroadsRedLabel.fadeIn()
            boxJunctionsRedLAbel.fadeIn()
            roundaboutsRedLabel.fadeIn()
            miniRoundaboutsRedLabel.fadeIn()
            meetingTrafficRedLabel.fadeIn()
            adequateClearanceRedLabel.fadeIn()
            trafficLightsRedLabel.fadeIn()
            pedestrianCrossingsRedLabel.fadeIn()
            oneWayStreetsRedLabel.fadeIn()
            countryLanesRedLabel.fadeIn()
            dualCRedLabel.fadeIn()
            mwaysRedLabel.fadeIn()
            indyRedLabel.fadeIn()
            satNavRedLabel.fadeIn()
            pullUpRightRedLabel.fadeIn()
            emStopRedLabel.fadeIn()
            tirRedLabel.fadeIn()
            pParkRedLabel.fadeIn()
            fBayRedLabel.fadeIn()
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
            emailButton.isEnabled = true
            saveButton.isEnabled = true
    }

    @IBAction func sliderChanged(_ sender: Any) {
        let sliderValueAsInt = Int(cockpitSlider.value)
        currentGradeLabel.text = String(sliderValueAsInt)
        saveButton.isEnabled = true
        
        if sliderValueAsInt <= 20 {
            currentGradeLabel.text = "⭐️"
        } else if sliderValueAsInt > 20 && sliderValueAsInt <= 40 {
            currentGradeLabel.text = "⭐️⭐️"
        } else if sliderValueAsInt > 40 && sliderValueAsInt <= 60 {
            currentGradeLabel.text = "⭐️⭐️⭐️"
        } else if sliderValueAsInt > 60 && sliderValueAsInt <= 80 {
            currentGradeLabel.text = "⭐️⭐️⭐️⭐️"
        } else if sliderValueAsInt > 80 && sliderValueAsInt <= 100 {
            currentGradeLabel.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func movingOffSliderChanged(_ sender: Any) {
        let movingOffSliderAsInt = Int(movingOffSlider.value)
        movingOffPurpleGrade.text = String(movingOffSliderAsInt)
        saveButton.isEnabled = true
        
        if movingOffSliderAsInt <= 20 {
            movingOffPurpleGrade.text = "⭐️"
        } else if movingOffSliderAsInt > 20 && movingOffSliderAsInt <= 40 {
            movingOffPurpleGrade.text = "⭐️⭐️"
        } else if movingOffSliderAsInt > 40 && movingOffSliderAsInt <= 60 {
            movingOffPurpleGrade.text = "⭐️⭐️⭐️"
        } else if movingOffSliderAsInt > 60 && movingOffSliderAsInt <= 80 {
            movingOffPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if movingOffSliderAsInt > 80 && movingOffSliderAsInt <= 100 {
            movingOffPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func turningLeftSliderChanged(_ sender: Any) {
        let turningLeftSliderAsInt = Int(turningLeftSlider.value)
        turningLeftPurpleGrade.text = String(turningLeftSliderAsInt)
        saveButton.isEnabled = true
        
        if turningLeftSliderAsInt <= 20 {
            turningLeftPurpleGrade.text = "⭐️"
        } else if turningLeftSliderAsInt > 20 && turningLeftSliderAsInt <= 40 {
            turningLeftPurpleGrade.text = "⭐️⭐️"
        } else if turningLeftSliderAsInt > 40 && turningLeftSliderAsInt <= 60 {
            turningLeftPurpleGrade.text = "⭐️⭐️⭐️"
        } else if turningLeftSliderAsInt > 60 && turningLeftSliderAsInt <= 80 {
            turningLeftPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if turningLeftSliderAsInt > 80 && turningLeftSliderAsInt <= 100 {
            turningLeftPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func turningRightSliderHasChanged(_ sender: Any) {
        let turningRightSliderAsInt = Int(turningRightSlider.value)
        turningRightPurpleGrade.text = String(turningRightSliderAsInt)
        saveButton.isEnabled = true
        
        if turningRightSliderAsInt <= 20 {
            turningRightPurpleGrade.text = "⭐️"
        } else if turningRightSliderAsInt > 20 && turningRightSliderAsInt <= 40 {
            turningRightPurpleGrade.text = "⭐️⭐️"
        } else if turningRightSliderAsInt > 40 && turningRightSliderAsInt <= 60 {
            turningRightPurpleGrade.text = "⭐️⭐️⭐️"
        } else if turningRightSliderAsInt > 60 && turningRightSliderAsInt <= 80 {
            turningRightPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if turningRightSliderAsInt > 80 && turningRightSliderAsInt <= 100 {
            turningRightPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func emergingsliderChanged(_ sender: Any) {
        let emergingSliderAsInt = Int(emergingSlider.value)
        emergingPurplegrade.text = String(emergingSliderAsInt)
        saveButton.isEnabled = true
        
        if emergingSliderAsInt <= 20 {
            emergingPurplegrade.text = "⭐️"
        } else if emergingSliderAsInt > 20 && emergingSliderAsInt <= 40 {
            emergingPurplegrade.text = "⭐️⭐️"
        } else if emergingSliderAsInt > 40 && emergingSliderAsInt <= 60 {
            emergingPurplegrade.text = "⭐️⭐️⭐️"
        } else if emergingSliderAsInt > 60 && emergingSliderAsInt <= 80 {
            emergingPurplegrade.text = "⭐️⭐️⭐️⭐️"
        } else if emergingSliderAsInt > 80 && emergingSliderAsInt <= 100 {
            emergingPurplegrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func crossroadsSliderChanged(_ sender: Any) {
        let crossroadsSliderAsInt = Int(crossroadsSlider.value)
        crossroadsPurpleGrade.text = String(crossroadsSliderAsInt)
        saveButton.isEnabled = true
        
        if crossroadsSliderAsInt <= 20 {
            crossroadsPurpleGrade.text = "⭐️"
        } else if crossroadsSliderAsInt > 20 && crossroadsSliderAsInt <= 40 {
            crossroadsPurpleGrade.text = "⭐️⭐️"
        } else if crossroadsSliderAsInt > 40 && crossroadsSliderAsInt <= 60 {
            crossroadsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if crossroadsSliderAsInt > 60 && crossroadsSliderAsInt <= 80 {
            crossroadsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if crossroadsSliderAsInt > 80 && crossroadsSliderAsInt <= 100 {
            crossroadsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func boxJunctionsSliderChanged(_ sender: Any) {
        let boxJunctionsSliderAsInt = Int(boxJunctionsSlider.value)
        boxJunctionsPurpleGrade.text = String(boxJunctionsSliderAsInt)
        saveButton.isEnabled = true
        
        if boxJunctionsSliderAsInt <= 20 {
            boxJunctionsPurpleGrade.text = "⭐️"
        } else if boxJunctionsSliderAsInt > 20 && boxJunctionsSliderAsInt <= 40 {
            boxJunctionsPurpleGrade.text = "⭐️⭐️"
        } else if boxJunctionsSliderAsInt > 40 && boxJunctionsSliderAsInt <= 60 {
            boxJunctionsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if boxJunctionsSliderAsInt > 60 && boxJunctionsSliderAsInt <= 80 {
            boxJunctionsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if boxJunctionsSliderAsInt > 80 && boxJunctionsSliderAsInt <= 100 {
            boxJunctionsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func roundaboutsSliderChanged(_ sender: Any) {
        let roundaboutsSliderAsInt = Int(roundaboutsSlider.value)
        roundaboutsPurpleGrade.text = String(roundaboutsSliderAsInt)
        saveButton.isEnabled = true
        
        if roundaboutsSliderAsInt <= 20 {
            roundaboutsPurpleGrade.text = "⭐️"
        } else if roundaboutsSliderAsInt > 20 && roundaboutsSliderAsInt <= 40 {
            roundaboutsPurpleGrade.text = "⭐️⭐️"
        } else if roundaboutsSliderAsInt > 40 && roundaboutsSliderAsInt <= 60 {
            roundaboutsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if roundaboutsSliderAsInt > 60 && roundaboutsSliderAsInt <= 80 {
            roundaboutsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if roundaboutsSliderAsInt > 80 && roundaboutsSliderAsInt <= 100 {
            roundaboutsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func miniRoundaboutsSliderChanged(_ sender: Any) {
        let miniRoundaboutsSliderAsInt = Int(miniRoundaboutsSlider.value)
        miniRoundaboutsPurpleGrade.text = String(miniRoundaboutsSliderAsInt)
        saveButton.isEnabled = true
        
        if miniRoundaboutsSliderAsInt <= 20 {
            miniRoundaboutsPurpleGrade.text = "⭐️"
        } else if miniRoundaboutsSliderAsInt > 20 && miniRoundaboutsSliderAsInt <= 40 {
            miniRoundaboutsPurpleGrade.text = "⭐️⭐️"
        } else if miniRoundaboutsSliderAsInt > 40 && miniRoundaboutsSliderAsInt <= 60 {
            miniRoundaboutsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if miniRoundaboutsSliderAsInt > 60 && miniRoundaboutsSliderAsInt <= 80 {
            miniRoundaboutsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if miniRoundaboutsSliderAsInt > 80 && miniRoundaboutsSliderAsInt <= 100 {
            miniRoundaboutsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func meetingTrafficSliderChanged(_ sender: Any) {
        let meetingTrafficSliderAsInt = Int(meetingTrafficSlider.value)
        meetingTrafficPurpleGrade.text = String(meetingTrafficSliderAsInt)
        saveButton.isEnabled = true
        
        if meetingTrafficSliderAsInt <= 20 {
            meetingTrafficPurpleGrade.text = "⭐️"
        } else if meetingTrafficSliderAsInt > 20 && meetingTrafficSliderAsInt <= 40 {
            meetingTrafficPurpleGrade.text = "⭐️⭐️"
        } else if meetingTrafficSliderAsInt > 40 && meetingTrafficSliderAsInt <= 60 {
            meetingTrafficPurpleGrade.text = "⭐️⭐️⭐️"
        } else if meetingTrafficSliderAsInt > 60 && meetingTrafficSliderAsInt <= 80 {
            meetingTrafficPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if meetingTrafficSliderAsInt > 80 && meetingTrafficSliderAsInt <= 100 {
            meetingTrafficPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func adequateClearanceSliderChanged(_ sender: Any) {
        let adequateClearanceSliderAsInt = Int(adequateClearanceSlider.value)
        adequateClearancePurpleGrade.text = String(adequateClearanceSliderAsInt)
        saveButton.isEnabled = true
        
        if adequateClearanceSliderAsInt <= 20 {
            adequateClearancePurpleGrade.text = "⭐️"
        } else if adequateClearanceSliderAsInt > 20 && adequateClearanceSliderAsInt <= 40 {
            adequateClearancePurpleGrade.text = "⭐️⭐️"
        } else if adequateClearanceSliderAsInt > 40 && adequateClearanceSliderAsInt <= 60 {
            adequateClearancePurpleGrade.text = "⭐️⭐️⭐️"
        } else if adequateClearanceSliderAsInt > 60 && adequateClearanceSliderAsInt <= 80 {
            adequateClearancePurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if adequateClearanceSliderAsInt > 80 && adequateClearanceSliderAsInt <= 100 {
            adequateClearancePurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func trafficLightsSliderChanged(_ sender: Any) {
        let trafficLightsSliderAsInt = Int(trafficLightsSlider.value)
        trafficLightsPurpleGrade.text = String(trafficLightsSliderAsInt)
        saveButton.isEnabled = true
        
        if trafficLightsSliderAsInt <= 20 {
            trafficLightsPurpleGrade.text = "⭐️"
        } else if trafficLightsSliderAsInt > 20 && trafficLightsSliderAsInt <= 40 {
            trafficLightsPurpleGrade.text = "⭐️⭐️"
        } else if trafficLightsSliderAsInt > 40 && trafficLightsSliderAsInt <= 60 {
            trafficLightsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if trafficLightsSliderAsInt > 60 && trafficLightsSliderAsInt <= 80 {
            trafficLightsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if trafficLightsSliderAsInt > 80 && trafficLightsSliderAsInt <= 100 {
            trafficLightsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func pedestrianCrossingsSliderChanged(_ sender: Any) {
        let pedestrianCrossingsSliderAsInt = Int(pedestrianCrossingsSlider.value)
        pedestrianCrossingsPurpleGrade.text = String(pedestrianCrossingsSliderAsInt)
        saveButton.isEnabled = true
        
        if pedestrianCrossingsSliderAsInt <= 20 {
            pedestrianCrossingsPurpleGrade.text = "⭐️"
        } else if pedestrianCrossingsSliderAsInt > 20 && pedestrianCrossingsSliderAsInt <= 40 {
            pedestrianCrossingsPurpleGrade.text = "⭐️⭐️"
        } else if pedestrianCrossingsSliderAsInt > 40 && pedestrianCrossingsSliderAsInt <= 60 {
            pedestrianCrossingsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if pedestrianCrossingsSliderAsInt > 60 && pedestrianCrossingsSliderAsInt <= 80 {
            pedestrianCrossingsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if pedestrianCrossingsSliderAsInt > 80 && pedestrianCrossingsSliderAsInt <= 100 {
            pedestrianCrossingsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func oneWayStreetsSliderChanged(_ sender: Any) {
        let oneWayStreetsSliderAsInt = Int(oneWayStreetsSlider.value)
        oneWayStreetsPurpleGrade.text = String(oneWayStreetsSliderAsInt)
        saveButton.isEnabled = true
        
        if oneWayStreetsSliderAsInt <= 20 {
            oneWayStreetsPurpleGrade.text = "⭐️"
        } else if oneWayStreetsSliderAsInt > 20 && oneWayStreetsSliderAsInt <= 40 {
            oneWayStreetsPurpleGrade.text = "⭐️⭐️"
        } else if oneWayStreetsSliderAsInt > 40 && oneWayStreetsSliderAsInt <= 60 {
            oneWayStreetsPurpleGrade.text = "⭐️⭐️⭐️"
        } else if oneWayStreetsSliderAsInt > 60 && oneWayStreetsSliderAsInt <= 80 {
            oneWayStreetsPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if oneWayStreetsSliderAsInt > 80 && oneWayStreetsSliderAsInt <= 100 {
            oneWayStreetsPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func countryLanesSliderChanged(_ sender: Any) {
        let countryLanesSliderAsInt = Int(countryLanesSlider.value)
        countryLanesPurpleGrade.text = String(countryLanesSliderAsInt)
        saveButton.isEnabled = true
        
        if countryLanesSliderAsInt <= 20 {
            countryLanesPurpleGrade.text = "⭐️"
        } else if countryLanesSliderAsInt > 20 && countryLanesSliderAsInt <= 40 {
            countryLanesPurpleGrade.text = "⭐️⭐️"
        } else if countryLanesSliderAsInt > 40 && countryLanesSliderAsInt <= 60 {
            countryLanesPurpleGrade.text = "⭐️⭐️⭐️"
        } else if countryLanesSliderAsInt > 60 && countryLanesSliderAsInt <= 80 {
            countryLanesPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if countryLanesSliderAsInt > 80 && countryLanesSliderAsInt <= 100 {
            countryLanesPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func dualCSliderChanged(_ sender: Any) {
        let dualCSliderAsInt = Int(dualCSlider.value)
        dualCPurpleGrade.text = String(dualCSliderAsInt)
        saveButton.isEnabled = true
        
        if dualCSliderAsInt <= 20 {
            dualCPurpleGrade.text = "⭐️"
        } else if dualCSliderAsInt > 20 && dualCSliderAsInt <= 40 {
            dualCPurpleGrade.text = "⭐️⭐️"
        } else if dualCSliderAsInt > 40 && dualCSliderAsInt <= 60 {
            dualCPurpleGrade.text = "⭐️⭐️⭐️"
        } else if dualCSliderAsInt > 60 && dualCSliderAsInt <= 80 {
            dualCPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if dualCSliderAsInt > 80 && dualCSliderAsInt <= 100 {
            dualCPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func mwaysSliderChanged(_ sender: Any) {
        let mwaysSliderAsInt = Int(mwaysSlider.value)
        mwaysPurpleGrade.text = String(mwaysSliderAsInt)
        saveButton.isEnabled = true
        
        if mwaysSliderAsInt <= 20 {
            mwaysPurpleGrade.text = "⭐️"
        } else if mwaysSliderAsInt > 20 && mwaysSliderAsInt <= 40 {
            mwaysPurpleGrade.text = "⭐️⭐️"
        } else if mwaysSliderAsInt > 40 && mwaysSliderAsInt <= 60 {
            mwaysPurpleGrade.text = "⭐️⭐️⭐️"
        } else if mwaysSliderAsInt > 60 && mwaysSliderAsInt <= 80 {
            mwaysPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if mwaysSliderAsInt > 80 && mwaysSliderAsInt <= 100 {
            mwaysPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func indySliderChanged(_ sender: Any) {
        let indySliderAsInt = Int(indySlider.value)
        indyPurpleGrade.text = String(indySliderAsInt)
        saveButton.isEnabled = true
        
        if indySliderAsInt <= 20 {
            indyPurpleGrade.text = "⭐️"
        } else if indySliderAsInt > 20 && indySliderAsInt <= 40 {
            indyPurpleGrade.text = "⭐️⭐️"
        } else if indySliderAsInt > 40 && indySliderAsInt <= 60 {
            indyPurpleGrade.text = "⭐️⭐️⭐️"
        } else if indySliderAsInt > 60 && indySliderAsInt <= 80 {
            indyPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if indySliderAsInt > 80 && indySliderAsInt <= 100 {
            indyPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func satNavSliderChanged(_ sender: Any) {
        let satNavSliderAsInt = Int(satNavSlider.value)
        satNavPurpleGrade.text = String(satNavSliderAsInt)
        saveButton.isEnabled = true
        
        if satNavSliderAsInt <= 20 {
            satNavPurpleGrade.text = "⭐️"
        } else if satNavSliderAsInt > 20 && satNavSliderAsInt <= 40 {
            satNavPurpleGrade.text = "⭐️⭐️"
        } else if satNavSliderAsInt > 40 && satNavSliderAsInt <= 60 {
            satNavPurpleGrade.text = "⭐️⭐️⭐️"
        } else if satNavSliderAsInt > 60 && satNavSliderAsInt <= 80 {
            satNavPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if satNavSliderAsInt > 80 && satNavSliderAsInt <= 100 {
            satNavPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func pullUpRightSliderChanged(_ sender: Any) {
        let pullUpRightSliderAsInt = Int(pullUpRightSlider.value)
        pullUpRightPurpleGrade.text = String(pullUpRightSliderAsInt)
        saveButton.isEnabled = true
        
        if pullUpRightSliderAsInt <= 20 {
            pullUpRightPurpleGrade.text = "⭐️"
        } else if pullUpRightSliderAsInt > 20 && pullUpRightSliderAsInt <= 40 {
            pullUpRightPurpleGrade.text = "⭐️⭐️"
        } else if pullUpRightSliderAsInt > 40 && pullUpRightSliderAsInt <= 60 {
            pullUpRightPurpleGrade.text = "⭐️⭐️⭐️"
        } else if pullUpRightSliderAsInt > 60 && pullUpRightSliderAsInt <= 80 {
            pullUpRightPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if pullUpRightSliderAsInt > 80 && pullUpRightSliderAsInt <= 100 {
            pullUpRightPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func emStopSliderChanged(_ sender: Any) {
        let emStopSliderAsInt = Int(emStopSlider.value)
        emStopPurpleGrade.text = String(emStopSliderAsInt)
        saveButton.isEnabled = true
        
        if emStopSliderAsInt <= 20 {
            emStopPurpleGrade.text = "⭐️"
        } else if emStopSliderAsInt > 20 && emStopSliderAsInt <= 40 {
            emStopPurpleGrade.text = "⭐️⭐️"
        } else if emStopSliderAsInt > 40 && emStopSliderAsInt <= 60 {
            emStopPurpleGrade.text = "⭐️⭐️⭐️"
        } else if emStopSliderAsInt > 60 && emStopSliderAsInt <= 80 {
            emStopPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if emStopSliderAsInt > 80 && emStopSliderAsInt <= 100 {
            emStopPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func tirSliderChanged(_ sender: Any) {
        let tirSliderAsInt = Int(tirSlider.value)
        tirPurpleGrade.text = String(tirSliderAsInt)
        saveButton.isEnabled = true
        
        if tirSliderAsInt <= 20 {
            tirPurpleGrade.text = "⭐️"
        } else if tirSliderAsInt > 20 && tirSliderAsInt <= 40 {
            tirPurpleGrade.text = "⭐️⭐️"
        } else if tirSliderAsInt > 40 && tirSliderAsInt <= 60 {
            tirPurpleGrade.text = "⭐️⭐️⭐️"
        } else if tirSliderAsInt > 60 && tirSliderAsInt <= 80 {
            tirPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if tirSliderAsInt > 80 && tirSliderAsInt <= 100 {
            tirPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func pParkSliderChanged(_ sender: Any) {
        let pParkSliderAsInt = Int(pParkSlider.value)
        pParkPurpleGrade.text = String(pParkSliderAsInt)
        saveButton.isEnabled = true
        
        if pParkSliderAsInt <= 20 {
            pParkPurpleGrade.text = "⭐️"
        } else if pParkSliderAsInt > 20 && pParkSliderAsInt <= 40 {
            pParkPurpleGrade.text = "⭐️⭐️"
        } else if pParkSliderAsInt > 40 && pParkSliderAsInt <= 60 {
            pParkPurpleGrade.text = "⭐️⭐️⭐️"
        } else if pParkSliderAsInt > 60 && pParkSliderAsInt <= 80 {
            pParkPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if pParkSliderAsInt > 80 && pParkSliderAsInt <= 100 {
            pParkPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func fBaySliderChanged(_ sender: Any) {
        let fBaySliderAsInt = Int(fBaySlider.value)
        fBayPurpleGrade.text = String(fBaySliderAsInt)
        saveButton.isEnabled = true
        
        if fBaySliderAsInt <= 20 {
            fBayPurpleGrade.text = "⭐️"
        } else if fBaySliderAsInt > 20 && fBaySliderAsInt <= 40 {
            fBayPurpleGrade.text = "⭐️⭐️"
        } else if fBaySliderAsInt > 40 && fBaySliderAsInt <= 60 {
            fBayPurpleGrade.text = "⭐️⭐️⭐️"
        } else if fBaySliderAsInt > 60 && fBaySliderAsInt <= 80 {
            fBayPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if fBaySliderAsInt > 80 && fBaySliderAsInt <= 100 {
            fBayPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func rBaySliderChanged(_ sender: Any) {
        let rBaySliderAsInt = Int(rBaySlider.value)
        rBayPurpleGrade.text = String(rBaySliderAsInt)
        saveButton.isEnabled = true
        
        if rBaySliderAsInt <= 20 {
            rBayPurpleGrade.text = "⭐️"
        } else if rBaySliderAsInt > 20 && rBaySliderAsInt <= 40 {
            rBayPurpleGrade.text = "⭐️⭐️"
        } else if rBaySliderAsInt > 40 && rBaySliderAsInt <= 60 {
            rBayPurpleGrade.text = "⭐️⭐️⭐️"
        } else if rBaySliderAsInt > 60 && rBaySliderAsInt <= 80 {
            rBayPurpleGrade.text = "⭐️⭐️⭐️⭐️"
        } else if rBaySliderAsInt > 80 && rBaySliderAsInt <= 100 {
            rBayPurpleGrade.text = "⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    @IBAction func saveEntryButtonPressed(_ sender: Any) {
        self.updateEntry()
        Alert.SavedAlert(on: self)
        reset()
        saveButton.isEnabled = false
    }
    
    @IBAction func sendEmailButtonTapped(_ sender: Any) {
        let userEmail = progressEntry.email
        
        if MFMailComposeViewController.canSendMail()  {
        
            if  userEmail == ""  {
                let alert = UIAlertController(title: "Alert", message: "Please Make Sure You Have Entered The Pupils Email In The 'Info' Section Of The Pupils Tab. Don't Forget To Save It Once You Have Entered It.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let firstNameOnly = progressEntry.name
            let word = firstNameOnly?.components(separatedBy: " ").first
            let defaultText = "No Rating - You May Not Have Covered This Subject Yet."
            let defaultTextViewText = "No Notes Yet."
            
            
            if cockpitDrillTextView.text == "" {
                cockpitDrillTextView.text = "\(defaultTextViewText)"
            }
            if movingOffTextView.text == "" {
                movingOffTextView.text = "\(defaultTextViewText)"
            }
            if turningLeftTextView.text == "" {
                turningLeftTextView.text = "\(defaultTextViewText)"
            }
            if turningRightTextView.text == "" {
                turningRightTextView.text = "\(defaultTextViewText)"
            }
            if emergingTextView.text == "" {
                emergingTextView.text = "\(defaultTextViewText)"
            }
            if crossroadsTextView.text == "" {
                crossroadsTextView.text = "\(defaultTextViewText)"
            }
            if boxJunctionsTextView.text == "" {
                boxJunctionsTextView.text = "\(defaultTextViewText)"
            }
            if roundaboutsTextView.text == "" {
                roundaboutsTextView.text = "\(defaultTextViewText)"
            }
            if miniRoundaboutsTextView.text == "" {
                miniRoundaboutsTextView.text = "\(defaultTextViewText)"
            }
            if meetingTrafficTextView.text == "" {
                meetingTrafficTextView.text = "\(defaultTextViewText)"
            }
            if adequateClearanceTextView.text == "" {
                adequateClearanceTextView.text = "\(defaultTextViewText)"
            }
            if trafficLightsTextView.text == "" {
                trafficLightsTextView.text = "\(defaultTextViewText)"
            }
            if pedestrianCrossingsTextView.text == "" {
                pedestrianCrossingsTextView.text = "\(defaultTextViewText)"
            }
            if oneWayStreetsTextView.text == "" {
                oneWayStreetsTextView.text = "\(defaultTextViewText)"
            }
            if countryLanesTextView.text == "" {
                countryLanesTextView.text = "\(defaultTextViewText)"
            }
            if dualCTextView.text == "" {
                dualCTextView.text = "\(defaultTextViewText)"
            }
            if mwaysTextView.text == "" {
                mwaysTextView.text = "\(defaultTextViewText)"
            }
            if indyTextView.text == "" {
                indyTextView.text = "\(defaultTextViewText)"
            }
            if satNavTextView.text == "" {
                satNavTextView.text = "\(defaultTextViewText)"
            }
            if pullUpRightTextView.text == "" {
                pullUpRightTextView.text = "\(defaultTextViewText)"
            }
            if emStopTextView.text == "" {
                emStopTextView.text = "\(defaultTextViewText)"
            }
            if tirTextView.text == "" {
                tirTextView.text = "\(defaultTextViewText)"
            }
            if pParkTextView.text == "" {
                pParkTextView.text = "\(defaultTextViewText)"
            }
            if fBayTextView.text == "" {
                fBayTextView.text = "\(defaultTextViewText)"
            }
            if rBayTextView.text == "" {
                rBayTextView.text = "\(defaultTextViewText)"
            }
            
            let toRecipients = [userEmail]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            
            mc.mailComposeDelegate = self
            
            mc.setToRecipients(toRecipients as? [String])
            mc.setSubject("Your Driving Lesson Progress Report")
            
            mc.setMessageBody("Hi There \(word!)!\n\nHere Is Your Progress Report For Your Driving. You Are Graded 1 Star To 5 Depending On Your Current Level.\n\n⭐️ = Introduced Topic\n⭐️⭐️ = You Can Do The Subject Being Fully Talked Through It\n⭐️⭐️⭐️ = You Can Do the Subject With Just Prompting\n⭐️⭐️⭐️⭐️ = You Can Do The Subject Seldom Being Prompted\n⭐️⭐️⭐️⭐️⭐️ = You Can Do The Subject Completely Independently!\n\nCOCKPIT DRILL:\n-----------------\n\(currentGradeLabel.text ?? "\(defaultText)")\n\nCOCKPIT DRILL NOTES:\n------------------------\n\(cockpitDrillTextView.text ?? "")\n\n\nMOVING OFF AND STOPPING:\n-------------------------------\n\(movingOffPurpleGrade.text ?? "\(defaultText)")\n\nMOVING OFF AND STOPPING NOTES:\n--------------------------------------\n\(movingOffTextView.text ?? "\(defaultText)")\n\n\nJUNCTIONS - TURNING LEFT:\n----------------------------\n\(turningLeftPurpleGrade.text ?? "\(defaultText)")\n\nJUNCTIONS - TURNING LEFT NOTES:\n--------------------------------\n\(turningLeftTextView.text ?? "\(defaultText)")\n\n\nJUNCTIONS TURNING RIGHT:\n-----------------------\n\(turningRightPurpleGrade.text ?? "\(defaultText)")\n\nJUNCTIONS - TURNING RIGHT NOTES:\n---------------------------------\n\(turningRightTextView.text ?? "\(defaultText)")\n\n\nJUNCTIONS - EMERGING:\n----------------------\n\(emergingPurplegrade.text ?? "\(defaultText)")\n\nJUNCTIONS - EMERGING NOTES:\n-------------------------------\n\(emergingTextView.text ?? "\(defaultText)")\n\n\nCROSSROADS:\n-------------\n\(crossroadsPurpleGrade.text ?? "\(defaultText)")\n\nCROSSROADS NOTES:\n-------------------\n\(crossroadsTextView.text ?? "\(defaultText)")\n\n\nBOX JUNCTIONS:\n--------------\n\(boxJunctionsPurpleGrade.text ?? "\(defaultText)")\n\nBOX JUNCTIONS NOTES:\n------------------------\n\(boxJunctionsTextView.text ?? "\(defaultText)")\n\n\nROUNDABOUTS:\n--------------\n\(roundaboutsPurpleGrade.text ?? "\(defaultText)")\n\nROUNDABOUTS NOTES:\n------------------\n\(roundaboutsTextView.text ?? "\(defaultText)")\n\n\nMINI ROUNDABOUTS:\n-------------------\n\(miniRoundaboutsPurpleGrade.text ?? "\(defaultText)")\n\nMINI ROUNDABOUTS NOTES:\n-------------------\n\(miniRoundaboutsTextView.text ?? "\(defaultText)")\n\n\nMEETING TRAFFIC:\n------------------\n\(meetingTrafficPurpleGrade.text ?? "\(defaultText)")\n\nMEETING TRAFFIC NOTES:\n------------------------\n\(meetingTrafficTextView.text ?? "\(defaultText)")\n\n\nADEQUATE CLEARANCE\n---------------------\n\(adequateClearancePurpleGrade.text ?? "\(defaultText)")\n\nADEQUATE CLEARANCE NOTES:\n------------------------\n\(adequateClearanceTextView.text ?? "\(defaultText)")\n\n\nTRAFFIC LIGHTS:\n-----------------\n\(trafficLightsPurpleGrade.text ?? "\(defaultText)")\n\nTRAFFIC LIGHTS NOTES:\n------------------------\n\(trafficLightsTextView.text ?? "\(defaultText)")\n\n\nPEDESTRIAN CROSSINGS:\n------------------------\n\(pedestrianCrossingsPurpleGrade.text ?? "\(defaultText)")\n\nPEDESTRIAN CROSSINGS NOTES:\n------------------------------\n\(pedestrianCrossingsTextView.text ?? "\(defaultText)")\n\n\nONE WAY STREETS:\n------------------\n\(oneWayStreetsPurpleGrade.text ?? "\(defaultText)")\n\nONE WAY STREET NOTES:\n-----------------------\n\(oneWayStreetsTextView.text ?? "\(defaultText)")\n\n\nDUAL CARRIAGEWAYS:\n--------------------\n\(dualCPurpleGrade.text ?? "\(defaultText)")\n\nDUAL CARRIAGEWAYS NOTES:\n--------------------------\n\(dualCTextView.text ?? "\(defaultText)")\n\n\nMOTORWAYS:\n------------\n\(mwaysPurpleGrade.text ?? "\(defaultText)")\n\nMOTORWAYS NOTES:\n---------------\n\(mwaysTextView.text ?? "\(defaultText)")\n\n\nINDEPENDENT DRIVING:\n--------------------\n\(indyPurpleGrade.text ?? "\(defaultText)")\n\nINDEPENDENT DRIVING NOTES:\n--------------------------\n\(indyTextView.text ?? "\(defaultText)")\n\n\nSAT NAV:\n---------\n\(satNavPurpleGrade.text ?? "\(defaultText)")\n\nSAT NAV NOTES:\n----------------\n\(satNavTextView.text ?? "\(defaultText)")\n\n\nPULL UP ON THE RIGHT:\n-----------------------\n\(pullUpRightPurpleGrade.text ?? "\(defaultText)")\n\nPULL UP ON THE RIGHT NOTES:\n-----------------------------\n\(pullUpRightTextView.text ?? "\(defaultText)")\n\n\nEMERGENCY STOP:\n-----------------\n\(emStopPurpleGrade.text ?? "\(defaultText)")\n\nEMERGENCY STOP NOTES:\n------------------------\n\(emStopTextView.text ?? "\(defaultText)")\n\n\nTURN IN THE ROAD:\n-------------------\n\(tirPurpleGrade.text ?? "\(defaultText)")\n\nTURN IN THE ROAD NOTES:\n------------------------\n\(tirTextView.text ?? "\(defaultText)")\n\n\nPARALLEL PARK:\n----------------\n\(pParkPurpleGrade.text ?? "\(defaultText)")\n\nPARALLEL PARK NOTES:\n----------------------\n\(pParkTextView.text ?? "\(defaultText)")\n\n\nFORWARD BAY PARK:\n-------------------\n\(fBayPurpleGrade.text ?? "\(defaultText)")\n\nFORWARD BAY PARK NOTES:\n-------------------------\n\(fBayTextView.text ?? "\(defaultText)")\n\n\nREVERSE BAY PARK:\n-------------------\n\(rBayPurpleGrade.text ?? "\(defaultText)")\n\nREVERSE BAY PARK NOTES:\n-------------------------\n\(rBayTextView.text ?? "\(defaultText)")\n\nKeep Up The Good Work \(word!)!\n\nSee You Soon!", isHTML: false)
            
            self.present(mc, animated: true, completion: nil)
        } else {
            Alert.showNoEmailAccountFoundError(on: self)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            Alert.showEmailCancelledMessage(on: self)
        case MFMailComposeResult.failed.rawValue:
            Alert.showEmailFailedMessage(on: self)
        case MFMailComposeResult.saved.rawValue:
            Alert.showEmailSavedMessage(on: self)
        case MFMailComposeResult.sent.rawValue:
            Alert.showSuccessEmailSentMessage(on: self)
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func reset() {
        cockpitDrillLabel.fadeIn()
        movingOffRedLabel.fadeIn()
        turningLeftRedLabel.fadeIn()
        turningRightRedLabel.fadeIn()
        emergingRedLabel.fadeIn()
        crossroadsRedLabel.fadeIn()
        boxJunctionsRedLAbel.fadeIn()
        trafficLightsRedLabel.fadeIn()
        pedestrianCrossingsRedLabel.fadeIn()
        meetingTrafficRedLabel.fadeIn()
        adequateClearanceRedLabel.fadeIn()
        dualCRedLabel.fadeIn()
        mwaysRedLabel.fadeIn()
        roundaboutsRedLabel.fadeIn()
        miniRoundaboutsRedLabel.fadeIn()
        oneWayStreetsRedLabel.fadeIn()
        countryLanesRedLabel.fadeIn()
        tirRedLabel.fadeIn()
        pParkRedLabel.fadeIn()
        rBayRedLabel.fadeIn()
        fBayRedLabel.fadeIn()
        satNavRedLabel.fadeIn()
        pullUpRightRedLabel.fadeIn()
        emStopRedLabel.fadeIn()
        indyRedLabel.fadeIn()
        blueGradeLabel.isHidden = true
        cockpitSlider.isHidden = true
        currentGradeLabel.isHidden = true
        cockpitDrillTextView.isHidden = true
        movingOffBlueLabel.isHidden = true
        movingOffSlider.isHidden = true
        movingOffPurpleGrade.isHidden = true
        movingOffTextView.isHidden = true
        turningLeftBlueLabel.isHidden = true
        turningLeftSlider.isHidden = true
        turningLeftPurpleGrade.isHidden = true
        turningLeftTextView.isHidden = true
        turningRightBlueLabel.isHidden = true
        turningRightSlider.isHidden = true
        turningRightPurpleGrade.isHidden = true
        turningRightTextView.isHidden = true
        emergingBlueLabel.isHidden = true
        emergingSlider.isHidden = true
        emergingPurplegrade.isHidden = true
        emergingTextView.isHidden = true
        crossroadsBlueLabel.isHidden = true
        crossroadsSlider.isHidden = true
        crossroadsPurpleGrade.isHidden = true
        crossroadsTextView.isHidden = true
        boxJunctionsBlueLabel.isHidden = true
        boxJunctionsSlider.isHidden = true
        boxJunctionsPurpleGrade.isHidden = true
        boxJunctionsTextView.isHidden = true
        roundaboutsBlueLabel.isHidden = true
        roundaboutsSlider.isHidden = true
        roundaboutsPurpleGrade.isHidden = true
        roundaboutsTextView.isHidden = true
        miniRoundaboutsBlueLabel.isHidden = true
        miniRoundaboutsSlider.isHidden = true
        miniRoundaboutsPurpleGrade.isHidden = true
        miniRoundaboutsTextView.isHidden = true
        meetingTrafficBlueLabel.isHidden = true
        meetingTrafficSlider.isHidden = true
        meetingTrafficPurpleGrade.isHidden = true
        meetingTrafficTextView.isHidden = true
        adequateClearanceBlueLabel.isHidden = true
        adequateClearanceSlider.isHidden = true
        adequateClearancePurpleGrade.isHidden = true
        adequateClearanceTextView.isHidden = true
        trafficLightsBlueLabel.isHidden = true
        trafficLightsSlider.isHidden = true
        trafficLightsPurpleGrade.isHidden = true
        trafficLightsTextView.isHidden = true
        pedestrianCrossingsBlueLabel.isHidden = true
        pedestrianCrossingsSlider.isHidden = true
        pedestrianCrossingsPurpleGrade.isHidden = true
        pedestrianCrossingsTextView.isHidden = true
        oneWayStreetsBlueLabel.isHidden = true
        oneWayStreetsSlider.isHidden = true
        oneWayStreetsPurpleGrade.isHidden = true
        oneWayStreetsTextView.isHidden = true
        countryLanesBlueLabel.isHidden = true
        countryLanesSlider.isHidden = true
        countryLanesTextView.isHidden = true
        dualCBlueLabel.isHidden = true
        dualCSlider.isHidden = true
        dualCPurpleGrade.isHidden = true
        dualCTextView.isHidden = true
        mwaysBlueLabel.isHidden = true
        mwaysPurpleGrade.isHidden = true
        mwaysSlider.isHidden = true
        mwaysTextView.isHidden = true
        indyBlueLabel.isHidden = true
        indyPurpleGrade.isHidden = true
        indySlider.isHidden = true
        indyTextView.isHidden = true
        satNavBlueLabel.isHidden = true
        satNavPurpleGrade.isHidden = true
        satNavSlider.isHidden = true
        satNavTextView.isHidden = true
        pullUpRightBlueLabel.isHidden = true
        pullUpRightPurpleGrade.isHidden = true
        pullUpRightSlider.isHidden = true
        pullUpRightTextView.isHidden = true
        emStopBlueLabel.isHidden = true
        emStopPurpleGrade.isHidden = true
        emStopSlider.isHidden = true
        emStopTextView.isHidden = true
        tirBlueLabel.isHidden = true
        tirPurpleGrade.isHidden = true
        tirSlider.isHidden = true
        tirTextView.isHidden = true
        pParkBlueLabel.isHidden = true
        pParkPurpleGrade.isHidden = true
        pParkSlider.isHidden = true
        pParkTextView.isHidden = true
        fBayBlueLabel.isHidden = true
        fBayPurpleGrade.isHidden = true
        fBaySlider.isHidden = true
        fBayTextView.isHidden = true
        rBayBlueLabel.isHidden = true
        rBayPurpleGrade.isHidden = true
        rBaySlider.isHidden = true
        rBayTextView.isHidden = true
    }
    
    func updateEntry()  {
        progressEntry.cockpitDrill = self.cockpitDrillTextView.text
        progressEntry.progressGrade = self.currentGradeLabel.text
        
        progressEntry.movingOffAndStopping = self.movingOffTextView.text
        progressEntry.movingOffAndStoppingPurpleGrade = self.movingOffPurpleGrade.text
        
        progressEntry.turningLeft = self.turningLeftTextView.text
        progressEntry.turningLeftPurpleGrade = self.turningLeftPurpleGrade.text
        
        progressEntry.turningRight = self.turningRightTextView.text
        progressEntry.turningRightPurpleGrade = self.turningRightPurpleGrade.text
        
        progressEntry.emerging = self.emergingTextView.text
        progressEntry.emergingPurpleGrade = self.emergingPurplegrade.text
        
        progressEntry.crossroads = self.crossroadsTextView.text
        progressEntry.crossroadsPurpleGrade = self.crossroadsPurpleGrade.text
        
        progressEntry.boxJunctions = self.boxJunctionsTextView.text
        progressEntry.boxJunctionsPurpleGrade = self.boxJunctionsPurpleGrade.text
        
        progressEntry.roundabouts = self.roundaboutsTextView.text
        progressEntry.roundaboutsPurpleGrade = self.roundaboutsPurpleGrade.text
        
        progressEntry.miniRoundabouts = self.miniRoundaboutsTextView.text
        progressEntry.miniRoundaboutsPurpleGrade = self.miniRoundaboutsPurpleGrade.text
        
        progressEntry.meetingTraffic = self.meetingTrafficTextView.text
        progressEntry.meetingTrafficPurpleGrade = self.meetingTrafficPurpleGrade.text
        
        progressEntry.adequateClearance = self.adequateClearanceTextView.text
        progressEntry.adequateClearancePurpleGrade = self.adequateClearancePurpleGrade.text
        
        progressEntry.trafficLights = self.trafficLightsTextView.text
        progressEntry.trafficLightsPurpleGrade = self.trafficLightsPurpleGrade.text
        
        progressEntry.pedestrianCrossings = self.pedestrianCrossingsTextView.text
        progressEntry.pedestrianCrossingsPurpleGrade = self.pedestrianCrossingsPurpleGrade.text
        
        progressEntry.oneWayStreets = self.oneWayStreetsTextView.text
        progressEntry.oneWayStreetsPurpleGrade = self.oneWayStreetsPurpleGrade.text
        
        progressEntry.countryLanes = self.countryLanesTextView.text
        progressEntry.countryLanesPurpleGrade = self.countryLanesPurpleGrade.text
        
        progressEntry.dualCarriageways = self.dualCTextView.text
        progressEntry.dualCarriagewaysPurpleGrade = self.dualCPurpleGrade.text
        
        progressEntry.motorways = self.mwaysTextView.text
        progressEntry.motorwaysPurpleGrade = self.mwaysPurpleGrade.text
        
        progressEntry.independentDriving = self.indyTextView.text
        progressEntry.independentDrivingPurpleGrade = self.indyPurpleGrade.text
        
        progressEntry.satNav = self.satNavTextView.text
        progressEntry.satNavPurpleGrade = self.satNavPurpleGrade.text
        
        progressEntry.pullUpOnTheRight = self.pullUpRightTextView.text
        progressEntry.pullUpOnTheRightPurpleGrade = self.pullUpRightPurpleGrade.text
        
        progressEntry.emergencyStop = self.emStopTextView.text
        progressEntry.emergencyStopPurpleGrade = self.emStopPurpleGrade.text
        
        progressEntry.turnInTheRoad = self.tirTextView.text
        progressEntry.turnInTheRoadPurpleGrade = self.tirPurpleGrade.text
        
        progressEntry.parallelPark = self.pParkTextView.text
        progressEntry.parallelParkPurpleGrade = self.pParkPurpleGrade.text
        
        progressEntry.forwardBayPark = self.fBayTextView.text
        progressEntry.forwardBayParkPurpleGrade = self.fBayPurpleGrade.text
        
        progressEntry.reverseBayPark = self.rBayTextView.text
        progressEntry.reverseBayParkPurpleGrade = self.rBayPurpleGrade.text
        
        do  {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could Not Save The New Entry \(error.localizedDescription)")
        }
    }
}

extension UIView {

    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        self.alpha = 0.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.isHidden = false
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        self.alpha = 1.0
        
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }) { (completed) in
            self.isHidden = true
            completion(true)
        }
    }
}

