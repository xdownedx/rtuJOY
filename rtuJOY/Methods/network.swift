import Foundation


//struct parsing {
    func pars(){
        let urlString="http://api.mirea-assistant.ru/schedule?group=ktso-01-19"
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
            if let data=data{
                let schedule = parseJSON(with: data)
                print(schedule?.tuesday.count)
            }
        }
        task.resume()
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
//}

   
    


