import Foundation


struct ParsingData {
    
    var onCompletion: ((schedulePerWeek)->Void)?
    
      func checkGroup(group: String){
          let urlString="http://api.mirea-assistant.ru/schedule?group=\(group)"
          guard let url=URL(string: urlString) else {
              return
          }
          let session=URLSession(configuration: .default)
          let task = session.dataTask(with: url){data, response, error in
              if let data=data{
                  if let scheduleForWeek = self.parseJSON(with: data){
                    
                }
              }
          }
          task.resume()
          return
      }
    
    
    func broadcastData(group: String){
        let urlString="http://api.mirea-assistant.ru/schedule?group=\(group)"
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
            if let data=data{
                if let scheduleForWeek = self.parseJSON(with: data){
                    self.onCompletion?(scheduleForWeek)
                }
            }
        }
        task.resume()
        return
    }
    
    
    func parseJSON(with data:Data)->schedulePerWeek?{
        let decoder = JSONDecoder()
        do {
            let tempSchedule = try decoder.decode(gg.self, from: data)
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





