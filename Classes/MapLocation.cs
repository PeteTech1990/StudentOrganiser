using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using Microsoft.Maui.Devices.Sensors;

namespace StudentOrganiser.Classes
{
    
    public class MapLocation
    {
        public string label { get; set; }
        public string address { get; set; }
        public double locationPoint1;
        public double locationPoint2;
        public int locationID;

        public MapLocation(string label, string address, double addressPoint1, double addressPoint2, int locationID)
        {
            this.label = label;
            this.address = address;
            this.locationPoint1 = addressPoint1;
            this.locationPoint2 = addressPoint2;
            this.locationID = locationID;
        }

        public string GetLabel()
        {
            return label;
        }

        public int GetID()
        {
            return locationID;
        }

        public string GetAddress()
        {
            return address;
        }

        public Location GetLocation() 
        {
            return new Location(locationPoint1, locationPoint2);
        }
    }
}
