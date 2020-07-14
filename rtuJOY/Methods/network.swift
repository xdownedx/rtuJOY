import Foundation


    func pars(){
        let urlString="http://api.mirea-assistant.ru/schedule?group=ktso-01-19"
        guard let url=URL(string: urlString) else {
            return
        }
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url){data, response, error in
            if let data=data{
                parseJSON(with: data)
            }
        }
        task.resume()
    }
    
    
    func parseJSON(with data:Data){
        let decoder = JSONDecoder()
        do {
            let schedule = try decoder.decode(gg.self, from: data)
            print(schedule.schedule[10].info[0].name)
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    


