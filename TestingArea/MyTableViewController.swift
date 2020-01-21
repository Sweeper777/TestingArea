import UIKit
import SwiftyUtils
import SwiftyJSON

class MyTableViewController: UITableViewController {
    var strings = [("Some Very Long Black Text That Doesn't Fit. Foo Bar Baz.", ""),
                   ("A", "Short Text"),
                   ("B", "Foo Bar"),
                   ("Some Very Long Grey Text That Doesn't Fit. Foo Bar Baz", "Some Very Long Grey Text That Doesn't Fit. Foo Bar Baz"),
                   ("C", "Another Text")]
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "cell")
        let jsonString = """
{
    "matches": {
        "page1": [{
            "name": "John",
            "surname": "Doe",
            "interests": [{
                    "id": 13,
                    "text": "basketball"
                },
                {
                    "id": 37,
                    "text": "competitive knitting"
                },
                {
                    "id": 127,
                    "text": "romcoms"
                }
            ]
        }],
        "page2": [{
            "name": "Dwayne",
            "surname": "Johnson",
            "interests": [{
                    "id": 42,
                    "text": "sci-fi"
                },
                {
                    "id": 255,
                    "text": "round numbers"
                }
            ]
        }]
    }
}
"""
        let json = JSON(parseJSON: jsonString)
        let matchesObject = json["matches"]
        let interests = (0..<2).flatMap {
            matchesObject["page\($0 + 1)"].arrayValue.flatMap {
                $0["interests"].arrayValue.map {
                    Interest(id: $0["id"].intValue, text: $0["text"].stringValue)
                }
            }
        }
        
        print(interests.map { $0.text })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel!.text = strings[indexPath.row].0
        cell.detailTextLabel!.text = strings[indexPath.row].1
        return cell
    }
    
}

struct Interest {
    let id: Int
    let text: String
}
