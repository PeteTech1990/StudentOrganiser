using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentOrganiser.Classes
{
    public class MapLocation
    {
        public string label { get; set; }
        public string address { get; set; }
        public Location location { get; set; }
        private int locationID;

        public MapLocation(string label, string address, Location location, int locationID)
        {
            this.location = location;
            this.label = label;
            this.address = address;
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
            return location;
        }
    }
}
