using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentOrganiser.Classes
{
    public class ToDoListTask
    {
        private int taskID;
        private string? taskTitle;
        private string? taskDescription;
        private bool taskImportance;
        private string? taskSubject;
        private DateTime taskDueDate;

        public ToDoListTask(string title, bool important, string description, string subject, DateTime DueDate, int taskID) 
        {
            this.taskTitle = title;
            this.taskDescription = description;
            this.taskSubject = subject;
            this.taskImportance = important;
            this.taskDueDate = DueDate;
            this.taskID = taskID;
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

        public string? GetSubject()
        {
            return taskSubject;
        }

        public DateTime GetDueDate()
        {
            return taskDueDate;
        }

    }
}
