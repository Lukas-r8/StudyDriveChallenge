//
//  MarketViewController.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MarketManagerDelegate {
    
    
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
        button.backgroundColor = .green
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
        button.backgroundColor = .blue
        button.titleLabel?.font = FontsTheme.buttonFont
        button.addShadow(-2)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Create consumer", for: .normal)
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
        infoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        createProducerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        createProducerButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        createProducerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        createProducerButton.heightAnchor.constraint(equalToConstant: 70).isActive = true

        createConsumerButton.bottomAnchor.constraint(equalTo: createProducerButton.bottomAnchor).isActive = true
        createConsumerButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        createConsumerButton.leftAnchor.constraint(equalTo: createProducerButton.rightAnchor).isActive = true
        createConsumerButton.heightAnchor.constraint(equalTo: createProducerButton.heightAnchor).isActive = true
        
        marketTableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor).isActive = true
        marketTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        marketTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
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
        if products.count != 0 {
            products = Array(products.dropFirst(1))
            let indexPath = IndexPath(row: 0, section: 0)
            marketTableView.beginUpdates()
            marketTableView.deleteRows(at: [indexPath], with: .right)
            marketTableView.endUpdates()
        }
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
    func produceProduct(_ product: Product) {
        products.append(product)
        let indexPath = IndexPath(row: products.count - 1, section: 0)
        marketTableView.beginUpdates()
        marketTableView.insertRows(at: [indexPath], with: .left)
        marketTableView.endUpdates()
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
    
    // TableView datasourse and delegate functions...
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Market"
        label.font = FontsTheme.headerFont
        return label
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

