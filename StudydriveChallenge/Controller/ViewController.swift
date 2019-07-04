//
//  MarketViewController.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MarketManagerDelegate {
    
    
    let infoLabel: UILabel =  {
        let label = UILabel()
        label.basicSetUp("test label to count on numbers of p p and c")
        return label
    }()

    lazy var marketTableView: UITableView = {
        let market = UITableView()
        market.translatesAutoresizingMaskIntoConstraints = false
        market.dataSource = self
        market.delegate = self
        market.register(MarketCell.self, forCellReuseIdentifier: "marketCell")
        market.backgroundColor = .clear
        return market
    }()
    
    lazy var createProducerButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(createProducer), for: .touchUpInside)
        return button
    }()
    
    lazy var createConsumerButton: UIButton =  {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(createConsumer), for: .touchUpInside)
        return button
    }()
    
    
    
    var products = [Product]()
    var producers = [Producer]()
    var consumers = [Consumer]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUpViewAndConstraints()
    }
    
    func setUpViewAndConstraints(){
        view.addMultipleSubViews(infoLabel,marketTableView,createProducerButton,createConsumerButton)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        createProducerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        createProducerButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        createProducerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        createProducerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        createConsumerButton.bottomAnchor.constraint(equalTo: createProducerButton.bottomAnchor).isActive = true
        createConsumerButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        createConsumerButton.leftAnchor.constraint(equalTo: createProducerButton.rightAnchor).isActive = true
        createConsumerButton.heightAnchor.constraint(equalTo: createProducerButton.heightAnchor).isActive = true
        
        marketTableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor).isActive = true
        marketTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        marketTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        marketTableView.bottomAnchor.constraint(equalTo: createProducerButton.topAnchor).isActive = true
    }
 
    // buttons functions
    @objc func createProducer(_ sender: UIButton) {
        let newProducer = Producer(producerID: producers.count + 1)
        newProducer.delegate = self
        newProducer.startProduction()
        producers.append(newProducer)
    }
    
    
    @objc func createConsumer(_ sender: UIButton) {
        let newConsumer = Consumer()
        newConsumer.startConsuming()
        newConsumer.delegate = self
        consumers.append(newConsumer)
    }
    
    
    // market manager delegate functions....
    func consumeProduct() {
        products = Array(products.dropFirst(1))
        marketTableView.reloadData()
    }
    
    func produceProduct(_ product: Product) {
        products.append(product)
        marketTableView.reloadData()
    }
    
    
    // TableView datasourse and delegate functions...
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marketTableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath) as! MarketCell
        cell.product = products[indexPath.row]
        return cell
    }


}

