protocol FinanceHandler {
    var arrayRepresentation: [Double] {get}
}

extension FinanceHandler {
    static func getData<T>( object: Object.Type) throws -> T where T : FinanceHandler {
        let realm = try! Realm()
        guard let realmData = realm.objects(object).filter("year == \(FinanceYear.getYear())").first else {
            throw RealmError.NoObject(Reason: "No ROC object in Realm")
        }
        guard let financeData = realmData as? T else {
            throw FinanceObjectError.NotFinanceObject(reason: "ROC object no FinanceObject")
        }
        return financeData
    }
}
