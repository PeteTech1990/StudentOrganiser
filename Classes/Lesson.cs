using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;


namespace StudentOrganiser.Classes
{
    
    [Table("lesson")]
    public class Lesson
    {
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
