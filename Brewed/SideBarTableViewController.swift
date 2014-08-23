//
//  SideBarTableViewController.swift
//  Brewed
//
//  Created by Brian Corbin on 8/22/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

import UIKit

class SideBarTableViewController: UITableViewController {
    
    let menuOptions = ["home", "stylesandingredients", "styles", "fermentables", "hops", "yeasts", "extras"]
    var stylesAndIngredientsShowing = false
    
    @IBOutlet weak var stylesLbl: UILabel!
    @IBOutlet weak var fermentablesLbl: UILabel!
    @IBOutlet weak var hopsLbl: UILabel!
    @IBOutlet weak var yeastsLbl: UILabel!
    @IBOutlet weak var extrasLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stylesLbl.hidden = true
        fermentablesLbl.hidden = true
        hopsLbl.hidden = true
        yeastsLbl.hidden = true
        extrasLbl.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        var height = 55.0
        if(indexPath.row >= 2 && indexPath.row <= 6)
        {
            height = stylesAndIngredientsShowing ? 55.0 : 0.0
        }
        
        return CGFloat(height)
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.row == 1)
        {
            if(stylesAndIngredientsShowing)
            {
                self .hideStylesAndIngredientsCells()
            }
            else
            {
                self .showStylesAndIngredientsCells()
            }
            
        }
    }
    
    func hideStylesAndIngredientsCells() {
        stylesAndIngredientsShowing = false
        
        self.tableView .beginUpdates()
        self.tableView .endUpdates()

        UIView .animateWithDuration(0.25, animations:{() in
            self.stylesLbl.alpha = 0.0;
            self.fermentablesLbl.alpha = 0.0;
            self.hopsLbl.alpha = 0.0;
            self.yeastsLbl.alpha = 0.0;
            self.extrasLbl.alpha = 0.0
            }, completion:{(Bool) in
                self.stylesLbl.hidden = true;
                self.fermentablesLbl.hidden = true;
                self.hopsLbl.hidden = true;
                self.yeastsLbl.hidden = true;
                self.extrasLbl.hidden = true
        })
        
    }
    
    func showStylesAndIngredientsCells() {
        stylesAndIngredientsShowing = true
        
        self.tableView .beginUpdates()
        self.tableView .endUpdates()
        
        self.stylesLbl.hidden = false
        self.fermentablesLbl.hidden = false
        self.hopsLbl.hidden = false
        self.yeastsLbl.hidden = false
        self.extrasLbl.hidden = false
        
        UIView .animateWithDuration(0.25, animations:{() in
            self.stylesLbl.alpha = 1.0;
            self.fermentablesLbl.alpha = 1.0;
            self.hopsLbl.alpha = 1.0;
            self.yeastsLbl.alpha = 1.0;
            self.extrasLbl.alpha = 1.0
        })
    }

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
