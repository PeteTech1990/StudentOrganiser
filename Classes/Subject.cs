using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentOrganiser.Classes
{
    public class Subject
    {
        public int subjectID { get; set; }
        public string name { get; set; }
        public Color color { get; set; }

        public Subject(int subjectID, string name, Color color) 
        {
            this.subjectID = subjectID;
            this.name = name;
            this.color = color;
        }

        public int GetID()
        {
            return subjectID;
        }

        public string GetName() 
        {
            return name;
        }

        public Color GetColour()
        {
            return color;
        }
    }
}
