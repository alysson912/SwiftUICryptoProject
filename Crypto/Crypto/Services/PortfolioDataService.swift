//
//  PortfolioDataService.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 27/02/25.
//MARK: dados p/ coreData

import Foundation
import CoreData

class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var saveEntities: [PortfolioEntity] = [] //salvando e atualizando os dados no coreData aqui
    
    init() { // cria
        container = NSPersistentContainer(name: containerName)// procura o container
        container.loadPersistentStores { (_, error) in // carrega-lo
            if let error = error {
                print("error loading Core data! \(error)")
            }
            self.getPortfolio() // obtem o portfolio
        }
    }
    //MARK: PUBLIC
    
    public func updatePortfolio(coin: CoinModel, amount: Double) {
        // verificando se a moeda ja esta no portfolio
        if let entity = saveEntities.first(where: { $0.coinID == coin.id }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                delete(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
        
    }
    
    //MARK: PRIVATE SECTION
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)// get all entitys in container, no filter
        
        do {
            saveEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching Portfolio entities \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext) // add entidade ao contexto
        entity.coinID = coin.id // atualizando os dados na entidade
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolio()
    }
}
