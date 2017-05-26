//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Robert Shrestha on 5/26/17.
//  Copyright © 2017 AccessibleICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ExpandableHeaderViewDelegate {
    
    var sections = [
        Section(genre: "🦁 Animation",
                movies: ["The Lion King", "The Incredibles"],
                expanded: false),
        Section(genre: "💥 Superhero",
                movies: ["Guardians of the Galaxy", "The Flash", "The Avengers", "The Dark Knight"],
                expanded: false),
        Section(genre: "👻 Horror",
                movies: ["The Walking Dead", "Insidious", "Conjuring"],
                expanded: false)
    ]
    var openedSection=Int()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded){
            return 44
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header=ExpandableHeaderView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.titleLblText.text=sections[indexPath.section].movies[indexPath.row]
        //cell.textLabel?.text=sections[indexPath.section].movies[indexPath.row]
        return cell

    }
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        //sections[section].expanded = !sections[section].expanded
        if openedSection==section{
            sections[section].expanded = !sections[section].expanded
            openedSection=100
            print(openedSection)
        }else{
            if(openedSection==100){
                sections[section].expanded=true
                openedSection=section
                print(openedSection)
            }else{
                
                sections[openedSection].expanded=false
                
                sections[section].expanded=true
                openedSection=section
                print(openedSection)
                
            }
        }

        tableView.beginUpdates()
        for i in 0..<sections[section].movies.count{
            tableView.reloadRows(at: [IndexPath(row:i,section:section)], with: .automatic)
        }
        tableView.endUpdates()
    }

}

