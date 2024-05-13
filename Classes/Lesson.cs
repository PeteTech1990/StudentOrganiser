using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

//This class is a part of the StudentOrganiser.Classes namespace
namespace StudentOrganiser.Classes
{
    /// <summary>
    /// Class definition for the "Lesson" class
    /// Attribute "Table("lesson")" indicates that this class definition also constitutes a table definition for the local SQLite database
    /// This class defines the schema for the "lesson" table.
    /// </summary>
    [Table("lesson")]
    public class Lesson
    {
        //--Property/field definition
        [PrimaryKey, AutoIncrement]
        public int lessonID { get; set; }

        [MaxLength(50)]
        public string? lessonTitle { get; set; }

        [MaxLength(250)]
        public string? lessonTutor { get; set; }

        [MaxLength(5)]
        public string? lessonClassroom { get; set; }

        [MaxLength(100)]
        public DateTime lessonDate { get; set; }

        [MaxLength(100)]
        public int lessonTimePeriod { get; set; }

        [MaxLength(50)]
        public int subjectID { get; set; }


        

        public Lesson()
        { 
        }

        public int GetID()
        {
            return lessonID;
        }

        public string? GetTitle()
        {
            return lessonTitle;
        }

        public int GetSubjectID()
        {
            return subjectID;
        }

        public DateTime GetDate()
        {
            return lessonDate;
        }

        public int GetTimePeriod()
        {
            return lessonTimePeriod;
        }

    }
}
