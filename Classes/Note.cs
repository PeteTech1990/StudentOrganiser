using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;


namespace StudentOrganiser.Classes
{
    [Table("note")]
    public class Note
    {
        [PrimaryKey, AutoIncrement]
        public int noteID { get; set; }

        [MaxLength(50)]
        public string? noteTitle { get; set; }

        [MaxLength(250)]
        public string? noteText { get; set; }

        [Column("audioData")]
        public string? noteAudio { get; set; }

        [Column("videoData")]
        public string? noteVideo { get; set; }

        [MaxLength(50)]
        public int subjectID { get; set; }

        [MaxLength(100)]
        public DateTime noteDate { get; set; }

        

        public Note()
        { 
        }

        public int GetID()
        {
            return noteID;
        }

        public string? GetTitle()
        {
            return noteTitle;
        }

        public string? GetText()
        {
            return noteText;
        }

        public string? GetAudio()
        {
            return noteAudio;
        }
       
        public string? GetVideo()
        {
            return noteVideo;
        }

        public int GetSubjectID()
        {
            return subjectID;
        }

        public string GetSubjectName()
        {
            return App.databaseConnector.GetSubjectName(subjectID);
        }

        public DateTime GetDate()
        {
            return noteDate;
        }

    }
}
