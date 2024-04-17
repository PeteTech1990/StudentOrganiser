﻿using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls.Maps;
using Microsoft.Maui.Maps;
using Microsoft.Maui.Devices.Sensors;
using System.Collections.ObjectModel;


//This class is a part of the StudentOrganiser.Classes namespace
namespace StudentOrganiser.Classes
{
    /// <summary>
    /// Class definition for the "DBConnect" class
    /// </summary>
    public class DBConnect
    {
        /// <summary>
        /// Private property declaration:
        /// The "classrooms" property is a String List object that is instantiated and set with 7 string objects, each representing the name of a classroom.
        /// The "tutors" property is a String List object that is instantiated and set with 7 string objects, each representing the name of a classroom tutor.
        /// (In the final version of the app, the classroom names and tutor names would be retrieved from the SQLite database)
        /// The "conn" property is a SQLite Async connection object that will be used to communicate with the app's embedded SQLite database.
        /// The "dbPath" property is a string object that will be used to hold the path to the embedded SQLite database.
        /// The "allSubjects" property is an ObservableCollection object, which represents a collection of "Subject" objects. This ObservableCollection will hold
        /// all of the "Subject" objects that are retrieved from the SQLite database.
        /// </summary>
        private List<string> classrooms = new List<string>() { "C110", "D110", "E110", "F110", "G110", "H110", "I110" };
        private List<string> tutors = new List<string>() { "Mr Griffiths", "Mrs Rutter", "Mr Gilmartin", "Mr Jones", "Mrs Summers" };
        private SQLiteAsyncConnection conn;
        private string dbPath;
        private ObservableCollection<Subject> allSubjects = new ObservableCollection<Subject>();

        /// <summary>
        /// Class constructor method definition. This method takes one string parameter "dbPath".
        /// The method takes the value of the passed parameter and assigns it to the local private property "dbPath".
        /// This will assign the path to the SQLite database to the "dbPath" property.
        /// The method calls the "PopulateSubjects" method.
        /// </summary>
        /// <param name="dbPath">The path to the SQLite database is passed into this string parameter</param>
        public DBConnect(string dbPath) 
        {
            this.dbPath = dbPath;
            PopulateSubjects();
        }

        //Inspiration for using a SQLite database as a persistent storage method for a mobile application, and inspiration for the "Init" method: (Microsoft, no date a)

        /// <summary>
        /// Public method definition.
        /// The method does not accept any parameters.
        /// This method is used to instantiate the "conn" property, forming the connection to the SQLite database.
        /// Then, 3 tables are created in the database (if they do not already exist)
        /// This method is defined "async", so that the database communication processes can execute in a thread other than the UI thread. This will stop the database communication
        /// processes from causing the app to "hang" until they are complete. 
        /// </summary>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task Init()
        {
            ///If Statement.
            ///If the value currently assigned to the "conn" property is not "null" (meaning it has already been instantiated)
            ///Then "return" and do not execute the remainder of the "Init" method.
            ///This statement prevents the "conn" property from being instantiated more than once per execution of the program, preventing possible errors.
            if (conn != null)
                return;

            ///If the value of "conn" was null, then it now needs to be instantiated. 
            ///This line of code instantiates the property, passing the value of "dbPath" as a parameter.
            ///This will create a link to the SQLite database located at the path stored in the "dbPath" property
            conn = new SQLiteAsyncConnection(dbPath);

            ///These 3 lines are used to create 3 tables in the database, if they do not already exist.
            ///The schemas for these tables are based on the properties of 3 classes within the program, namely "ToDoListTask", "Note" and "Lesson"
            await conn.CreateTableAsync<ToDoListTask>();
            await conn.CreateTableAsync<Note>();
            await conn.CreateTableAsync<Lesson>();
        }

        /// <summary>
        /// Public method definition.
        /// This method accepts 6 parameters.
        /// This method is defined "async" and returns a "Task" object.
        /// This method is used to instantiate a "ToDoListTask" object, and then store the properties of that object to a record in the database.
        /// This method is called when the user creates a new To Do List task.
        /// </summary>
        /// <param name="title">This string parameter represents the title of the newly created to do list task</param>
        /// <param name="description">This string parameter represents the description of the newly created to do list task</param>
        /// <param name="importance">This boolean parameter represents the whether or not this task has been marked as "important"</param>
        /// <param name="subjectID">This integer parameter represents the unique ID for the Subject Object that has is associated with the newly created task</param>
        /// <param name="dueDate">This DateTime parameter represents the due date of the newly created task</param>
        /// <param name="recurrenceAddition">This integer parameter represents the increment value for a recurring task. For example, a value of 1 means
        /// that the task recurs every day and a value of 7 means the task recurs every week.</param>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task AddTaskToDatabase(string title, string description, bool importance, int subjectID, DateTime dueDate, int recurrenceAddition)
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///First, create a new "ToDoListTask" object, using the 6 passed parameters as the properties of the new object.
            ///Then, using the "InsertASync" method of the "conn" object, insert a new record into the "ToDoListTask" table in the SQLite database, using the new ToDoListTask object
            ///as the values of the record.
            await conn.InsertAsync(new ToDoListTask { taskTitle = title, taskDescription = description, taskImportance = importance, subjectID = subjectID, taskDueDate = dueDate, recurrenceAddition = recurrenceAddition });


        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is defined "async" and returns a "Task" object.
        /// This method is used to perform a SELECT query on the "ToDoListTask" table in the database, and then return all records as a List of "ToDoListTask" objects.
        /// This method is called when the "ToDoList.xaml.cs" requests all To do list tasks from the database, in order to display them.
        /// </summary>
        /// <returns>The method returns a List of ToDoListTask objects, stored within a "Threading.Tasks.Task" object.</returns>
        public async Task<List<ToDoListTask>> GetAllToDoListTasks()
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///Using the "ToListAsync" method on a specific "Table" property of the "conn" object, retrieve all of the records in the "ToDoListTask"
            ///table, create a "ToDoListTask" object for each record, then create a List containing all of these "ToDoListTask" objects.
            ///This list of objects is then returned to the caller.
            return await conn.Table<ToDoListTask>().ToListAsync();
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is defined "async" and returns a "Task" object.
        /// This method is used to perform a DELETE query on the "ToDoListTask" table in the database, in order to delete a single record.
        /// This method is called when the user completes or deletes a task from the to do list.
        /// </summary>
        /// <param name="id">This parameter represents the unique ID for the task that the user has completed or deleted</param>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task RemoveTaskFromDatabase(int id)
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///Using the "DeleteAsync" method on a specific "Table" property of the "conn" object, delete a single record from the "ToDoListTask"
            ///table, by using the value of "id" to indicate which record to delete.
            await conn.DeleteAsync<ToDoListTask>(id);
        }


        //Inspiration for using a LINQ for querying a SQLite database: (Microsoft, no date b)

        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is defined "async" and returns a "Task" object.
        /// This method is used to perform a SELECT query on the "ToDoListTask" table in the database, in order to retrieve a single record.
        /// This method is called when the user wants to retrieve the details for a specific To do List Task.
        /// </summary>
        /// <param name="id">This parameter represents the unique ID for the task that the user wishes to retrieve</param>
        /// <returns>The method returns a ToDoListTask object, stored within a "Threading.Tasks.Task" object.</returns>
        public async Task<ToDoListTask> GetTaskDetails(int id)
        {
            ///A variable named "task" is created, and instantiated with a LINQ query.
            ///The query SELECTS all records from the ToDoListTask table WHERE the taskID value of the record matches the value of the "id" parameter
            var task = from t in conn.Table<ToDoListTask>()
                       where t.taskID == id
                       select t;
            
            ///Using the "FirstOrDefaultAsync" method of the "task" variable, the first record that matches the LINQ query is retrieved from the database
            ///(There should only be 1 matching record).
            ///The values from that record are then used to instantiate a ToDoListTask object, which is then returned to the caller.
            return await task.FirstOrDefaultAsync();
        }

        public ObservableCollection<MapLocation> GetAllLocations()
        {          

            ObservableCollection<MapLocation> allLocations = new ObservableCollection<MapLocation>();
            allLocations.Add(new MapLocation("B100", "Classroom B100", 53.049888165360315, -2.99382285460766, 0));
            allLocations.Add(new MapLocation("C100", "Classroom C100", 53.049520553036494, -2.994036090199386, 1));
            allLocations.Add(new MapLocation("D100", "Classroom D100", 53.049582628144314, -2.9929055391696155, 2));
            allLocations.Add(new MapLocation("Cafe", "Ial Cafe", 53.04889742433294, -2.993014895621946, 3));
            allLocations.Add(new MapLocation("Student Services", "Student Service Desk", 53.048814387458435, -2.9928231176998277, 4));

            return allLocations;
        }
        
        private void PopulateSubjects()
        {
            allSubjects.Add(new Subject(0, "English", Color.FromRgb(0, 255, 0)));
            allSubjects.Add(new Subject(1, "Science", Color.FromRgb(255, 0, 0)));
            allSubjects.Add(new Subject(2, "PE", Color.FromRgb(255, 255, 0)));
        }

        public ObservableCollection<Subject> GetAllSubjects()
        {
            return allSubjects;
        }

        public string? GetSubjectName(int subjectID)
        {
            foreach(Subject subject in allSubjects)
            {
                if (subject.GetID() == subjectID)
                {
                    return subject.GetName();
                }
            }

            return null;
        }

        public Color GetSubjectColour(int subjectID)
        {
            foreach (Subject subject in allSubjects)
            {
                if (subject.GetID() == subjectID)
                {
                    return subject.GetColour();
                }
            }

            return null;
        }

        public async Task<List<Note>> GetAllNotes()
        {
            await Init();
            return await conn.Table<Note>().ToListAsync();
        }

        public async Task RemoveNoteFromDatabase(int id)
        {
            await Init();

            await conn.DeleteAsync<Note>(id);
        }

        public async Task AddNoteToDatabase(string title, string text, int subjectID, string audio, string video, DateTime currentDateTime, int noteID)
        {
            int result = 0;
            await Init();

            result = await conn.InsertAsync(new Note { noteTitle = title, noteText = text, subjectID = subjectID, noteAudio = audio, noteVideo = video, noteDate = currentDateTime, noteID = noteID });


        }

        public async Task PopulateLessons()
        {
            await Init();
            await conn.DeleteAllAsync<Lesson>();
            Random subjectRandomiser = new Random();
            Random tutorRandomiser = new Random();
            Random classroomRandomiser = new Random();

            DateTime lessonDateAssigned = Convert.ToDateTime("04/01/2024");

            for (int i = 0;i< 100;i++)
            {               

                while (lessonDateAssigned.DayOfWeek == DayOfWeek.Saturday || lessonDateAssigned.DayOfWeek == DayOfWeek.Sunday)
                {
                    lessonDateAssigned.AddDays(1);
                }

                for(int j = 0;j<7;j++)
                {
                    int subjectID = subjectRandomiser.Next(0,3);
                    string tutor = tutors[tutorRandomiser.Next(0,5)];
                    string classroom = classrooms[classroomRandomiser.Next(0,7)];

                    await conn.InsertAsync(new Lesson { lessonTitle = allSubjects[subjectID].GetName(), subjectID = subjectID, lessonTutor = tutor, lessonClassroom = classroom, lessonDate = lessonDateAssigned, lessonTimePeriod = j });
                }

                lessonDateAssigned = lessonDateAssigned.AddDays(1);
            }

            
        }

        public async Task<List<Lesson>> GetLessonsForMonth(int month, int year)
        {
            await Init();
            //await PopulateLessons();

            List<Lesson> lessonsThisMonth = new List<Lesson>();

            List<Lesson> allLessons = await conn.Table<Lesson>().ToListAsync();

            foreach (Lesson lesson in allLessons)
            {
                if(lesson.lessonDate.Month == month && lesson.lessonDate.Year == year)
                {
                    lessonsThisMonth.Add(lesson);
                }
            }

            return lessonsThisMonth;
            

        }



    }
}
