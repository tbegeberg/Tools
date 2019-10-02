//
//  MySQL Query Vapor.swift
//  App
//
//  Created by TørK on 29/10/2018.
//

import Foundation


struct TableMedInfo: Content {
    
    let name: String
    let packaging: String
    let avgPrice: Double
    let date: Date
    
    init(name: String, packaging: String, avgPrice: Double, date: Date) {
        self.name = name
        self.packaging = packaging
        self.avgPrice = avgPrice
        self.date = date
    }
    
}


private func getTableMedInfo(req: Request, itemNumber: Int) throws -> Future<TableMedInfo?> {
    let futureConnection = req.newConnection(to: .mysql)
    
    
    let simpleQuery = futureConnection.map { (conn) -> (Future<[[MySQLColumn: MySQLData]]>) in
        let query = conn.simpleQuery( "SELECT MedInfo.name AS name, MedInfo.packaging AS packaging, MedPriceAverage.avgPrice AS avgPrice FROM MedInfo LEFT OUTER JOIN MedPriceAverage ON MedInfo.itemNumber = MedPriceAverage.itemNumber WHERE MedInfo.itemNumber = '\(itemNumber)' ORDER BY MedPriceAverage.date DESC LIMIT 1;")
        return query
    }
    
    
    
    return simpleQuery.flatMap { (mySQLArrayFuture) -> Future<TableMedInfo?> in
        return mySQLArrayFuture.map({ (mySQLArray) -> (TableMedInfo?) in
            guard let firstData = mySQLArray.first else {
                return nil
            }
            guard let name: String = firstData.firstValue(forColumn:"name")?.string() else {
                return nil
            }
            guard let packaging: String = firstData.firstValue(forColumn:"packaging")?.string() else {
                return nil
            }
            guard let avgPriceString: String = firstData.firstValue(forColumn:"avgPrice")?.string() else {
                return nil
            }
            
            guard let avgPrice: Double = Double(avgPriceString) else {
                return nil
            }
            
            let tableMedInfo = TableMedInfo(name: name, packaging: packaging, avgPrice: avgPrice, date: Date())
            return tableMedInfo
            
        })
    }
}

