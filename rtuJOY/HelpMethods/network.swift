import Foundation
import RealmSwift


struct ParsingData {

    var onCompletion: ((schedulePerWeek)->Void)?
    
    
    func broadcastData(group: String){
        let realm = try! Realm()
        let scheduleTemp: Results<scheduleDatabase>! = realm.objects(scheduleDatabase.self)
        let urlString="http://api.mirea-assistant.ru/schedule?group=\(group)"
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
            if let data=data{
                if let scheduleForWeek = self.parseJSON(with: data){
                    DispatchQueue.main.async(execute: {
                                                self.onCompletion?(scheduleForWeek)
                                                let scheduleForSave=scheduleDatabase(scheduleWithJson: data)
                                                if scheduleTemp.isEmpty{
                                                    storageManager.saveObject(scheduleForSave)
                                                }else{
                                                    storageManager.deleteObject(scheduleTemp[0])
                                                    storageManager.saveObject(scheduleForSave)
                                                }                        })
                    
                }
            }
        }
        task.resume()
        return
    }
    
    
    func parseJSON(with data:Data)->schedulePerWeek?{
        let decoder = JSONDecoder()
        do {
            let tempSchedule = try decoder.decode(globalSchedule.self, from: data)
            print(tempSchedule.schedule.count)
            guard let schedule = schedulePerWeek(tempSchedule: tempSchedule) else {
                return nil
            }
            return schedule
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        return nil
    }
}
