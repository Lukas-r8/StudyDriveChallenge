//
//  MarketViewController.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    var products = [Product]()
    var producers = [Producer]()
    var consumers = [Consumer]()
    
    let infoLabel = InfoLabel()

    
    lazy var marketTableView: UITableView = {
        let market = UITableView(frame: .zero, style: .grouped)
        market.translatesAutoresizingMaskIntoConstraints = false
        market.dataSource = self
        market.delegate = self
        market.separatorStyle = .none
        market.register(MarketCell.self, forCellReuseIdentifier: "marketCell")
        market.backgroundColor = .clear
        return market
    }()
    
    lazy var createProducerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ColorsTheme.springGreen
        button.titleLabel?.font = FontsTheme.buttonFont
        button.addShadow(-2)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Create producer", for: .normal)
        button.addTarget(self, action: #selector(createProducer), for: .touchUpInside)
        return button
    }()
    
    lazy var createConsumerButton: UIButton =  {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = ColorsTheme.lightSkyBlue
        button.titleLabel?.font = FontsTheme.buttonFont
        button.addShadow(-2)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Create consumer", for: .normal)
        button.addTarget(self, action: #selector(createConsumer), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpViewAndConstraints()
    }
    
 
    // buttons functions
    @objc func createProducer(_ sender: UIButton) {
        let newProducer = Producer(producerID: producers.count + 1)
        newProducer.delegate = self
        newProducer.startProduction()
        producers.append(newProducer)
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
    
    @objc func createConsumer(_ sender: UIButton) {
        let newConsumer = Consumer()
        newConsumer.startConsuming()
        newConsumer.delegate = self
        consumers.append(newConsumer)
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
}

