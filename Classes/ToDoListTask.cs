using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;


namespace StudentOrganiser.Classes
{
    [Table("task")]
    public class ToDoListTask
    {
        [PrimaryKey, AutoIncrement]
        public int taskID { get; set; }

        [MaxLength(50)]
        public string? taskTitle { get; set; }

        [MaxLength(250)]
        public string? taskDescription { get; set; }

        [Column("flag")]
        public bool taskImportance { get; set; }

        [MaxLength(50)]
        public int subjectID { get; set; }

        [MaxLength(100)]
        public DateTime taskDueDate { get; set; }

        [MaxLength(3)]
        public int recurrenceAddition { get; set; }

        public ToDoListTask() 
        {
            //this.taskTitle = title;
            //this.taskDescription = description;
            //this.taskSubject = subject;
            //this.taskImportance = important;
            //this.taskDueDate = DueDate;
            //this.taskID = taskID;
        }

        public int GetID()
        {
            return taskID;
        }

        public string? GetTitle()
        {
            return taskTitle;
        }

        public string? GetDescription()
        {
            return taskDescription;
        }

        public bool GetImportance()
        {
            return taskImportance;
        }
       
        public int GetImportanceValue()
        {
            if (taskImportance == true)
            {
                return 0;
            }

            else
            {
                return 1;
            }
        }

        public int GetSubjectID()
        {
            return subjectID;
        }

        public string GetSubjectName()
        {
            return App.databaseConnector.GetSubjectName(subjectID);
        }

        public DateTime GetDueDate()
        {
            return taskDueDate;
        }

        public int GetRecurrence()
        {
            return recurrenceAddition;
        }

    }
}
