using Android.Text.Method;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentOrganiser.Classes
{
    public class AllTasks
    {
        private static List<ToDoListTask> taskList = new List<ToDoListTask>();

        public AllTasks() 
        { 
            
        }

        public static ToDoListTask GetTask(int taskID)
        {
            foreach (ToDoListTask task in taskList)
            {
                if (task.GetID() == taskID)
                {
                    return task;
                }
            }

            return null;
        }

        public static void AddTask(ToDoListTask task) 
        {
            taskList.Add(task);
        }

        public static void RemoveTask(int taskID) 
        {
            foreach (ToDoListTask task in taskList)
            {
                if (task.GetID() == taskID)
                {
                    taskList.Remove(task);
                }
            }
        }
    }
}
