using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentOrganiser.Classes
{
    public class DBConnect
    {
        private SQLiteAsyncConnection conn;
        string dbPath;

        public DBConnect(string dbPath) 
        {
            this.dbPath = dbPath;
        }

        //https://learn.microsoft.com/en-us/training/modules/store-local-data/4-exercise-store-data-locally-with-sqlite
        public async Task Init()
        {
            if (conn != null)
                return;

            conn = new SQLiteAsyncConnection(dbPath);

            await conn.CreateTableAsync<ToDoListTask>();
        }

        public async Task AddTaskToDatabase(string title, string description, bool importance, string subject, DateTime dueDate)
        {
            int result = 0;
            await Init();

            result = await conn.InsertAsync(new ToDoListTask { taskTitle = title, taskDescription = description, taskImportance = importance, taskSubject = subject, taskDueDate = dueDate });


        }

        public async Task<List<ToDoListTask>> GetAllToDoListTasks()
        {
            await Init();
            return await conn.Table<ToDoListTask>().ToListAsync();
        }

        public async Task RemoveTaskFromDatabase(int id)
        {
            await Init();

            await conn.DeleteAsync<ToDoListTask>(id);
        }


        //https://learn.microsoft.com/en-us/training/modules/store-local-data/3-store-data-locally-with-sqlite
        public async Task<ToDoListTask> GetTaskDetails(int id)
        {
            var task = from t in conn.Table<ToDoListTask>()
                       where t.taskID == id
                       select t;
            return await task.FirstOrDefaultAsync();
        }

    }
}
