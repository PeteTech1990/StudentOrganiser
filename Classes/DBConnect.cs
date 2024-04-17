using SQLite;
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
        /// The "connAsync" property is a SQLite Async connection object that will be used to communicate with the app's embedded SQLite database asynchronously 
        /// (i.e in another processor thread than the UI thread) and the "connSync" property is a SQLite Sync connection object 
        /// that will be used to communicate with the database synchronously (using the UI thread).
        /// The "dbPath" property is a string object that will be used to hold the path to the embedded SQLite database.
        /// The "allSubjects" property is an ObservableCollection object, which represents a collection of "Subject" objects. This ObservableCollection will hold
        /// all of the "Subject" objects that are retrieved from the SQLite database.
        /// </summary>
        private List<string> classrooms = new List<string>() { "C110", "D110", "E110", "F110", "G110", "H110", "I110" };
        private List<string> tutors = new List<string>() { "Mr Griffiths", "Mrs Rutter", "Mr Gilmartin", "Mr Jones", "Mrs Summers" };
        private SQLiteAsyncConnection connAsync;
        private SQLiteConnection connSync;
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
        /// This method is used to instantiate the "connAsync" property, forming the connection to the SQLite database.
        /// Then, 3 tables are created in the database (if they do not already exist)
        /// This method is defined "async", so that the database communication processes can execute in a thread other than the UI thread. This will stop the database communication
        /// processes from causing the app to "hang" until they are complete. 
        /// </summary>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task Init()
        {
            ///If Statement.
            ///If the value currently assigned to the "connAsync" property is not "null" (meaning it has already been instantiated)
            ///Then "return" and do not execute the remainder of the "Init" method.
            ///This statement prevents the "connAsync" property from being instantiated more than once per execution of the program, preventing possible errors.
            if (connAsync != null)
                return;
            else
            {
                ///If the value of "connAsync" was null, then it now needs to be instantiated. 
                ///This line of code instantiates the property, passing the value of "dbPath" as a parameter.
                ///This will create a link to the SQLite database located at the path stored in the "dbPath" property
                connAsync = new SQLiteAsyncConnection(dbPath);
            }


            ///If Statement.
            ///If the value currently assigned to the "connSync" property is not "null" (meaning it has already been instantiated)
            ///Then "return" and do not execute the remainder of the "Init" method.
            ///This statement prevents the "connSync" property from being instantiated more than once per execution of the program, preventing possible errors.
            if (connSync != null)
                return;
            else
            {
                ///If the value of "connAsync" was null, then it now needs to be instantiated. 
                ///This line of code instantiates the property, passing the value of "dbPath" as a parameter.
                ///This will create a link to the SQLite database located at the path stored in the "dbPath" property
                connSync = new SQLiteConnection(dbPath);
            }

            ///These 3 lines are used to create 3 tables in the database, if they do not already exist.
            ///The schemas for these tables are based on the properties of 3 classes within the program, namely "ToDoListTask", "Note" and "Lesson"
            await connAsync.CreateTableAsync<ToDoListTask>();
            await connAsync.CreateTableAsync<Note>();
            await connAsync.CreateTableAsync<Lesson>();
        }



        ///--------- ToDoListTask object methods ---------------


        /// <summary>
        /// Public method definition.
        /// This method accepts 6 parameters.
        /// This method is defined "async".
        /// This method is used to instantiate a "ToDoListTask" object, and then store the properties of that object to a record in the database.
        /// This method is called when the user creates a new To Do List task.
        /// </summary>
        /// <param name="title">This string parameter represents the title of the newly created to do list task</param>
        /// <param name="description">This string parameter represents the description of the newly created to do list task</param>
        /// <param name="importance">This boolean parameter represents the whether or not this task has been marked as "important"</param>
        /// <param name="subjectID">This integer parameter represents the unique ID for the Subject Object that has been associated with the newly created task</param>
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
            ///Then, using the "InsertASync" method of the "connAsync" object, insert a new record into the "ToDoListTask" table in the SQLite database, using the properties of the
            ///new ToDoListTask object as the values of the record.
            await connAsync.InsertAsync(new ToDoListTask { taskTitle = title, taskDescription = description, taskImportance = importance, subjectID = subjectID, taskDueDate = dueDate, recurrenceAddition = recurrenceAddition });


        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is defined "async".
        /// This method is used to perform a SELECT query on the "ToDoListTask" table in the database, and then return all records as a List of "ToDoListTask" objects.
        /// This method is called when the "ToDoList.xaml.cs" requests all To do list tasks from the database, in order to display them.
        /// </summary>
        /// <returns>The method returns a List of ToDoListTask objects, stored within a "Threading.Tasks.Task" object.</returns>
        public async Task<List<ToDoListTask>> GetAllToDoListTasks()
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///Using the "ToListAsync" method on a specific "Table" property of the "connAsync" object, retrieve all of the records in the "ToDoListTask"
            ///table, create a "ToDoListTask" object for each record, then create a List containing all of these "ToDoListTask" objects.
            ///This list of objects is then returned to the caller.
            return await connAsync.Table<ToDoListTask>().ToListAsync();
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is defined "async".
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

            ///Using the "DeleteAsync" method on a specific "Table" property of the "connAsync" object, delete a single record from the "ToDoListTask"
            ///table, by using the value of "id" to indicate which record to delete.
            await connAsync.DeleteAsync<ToDoListTask>(id);
        }


        //Inspiration for using a LINQ for querying a SQLite database: (Microsoft, no date b)

        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is defined "async".
        /// This method is used to perform a SELECT query on the "ToDoListTask" table in the database, in order to retrieve a single record.
        /// This method is called when the user wants to retrieve the details for a specific To do List Task.
        /// </summary>
        /// <param name="id">This parameter represents the unique ID for the task that the user wishes to retrieve</param>
        /// <returns>The method returns a ToDoListTask object, stored within a "Threading.Tasks.Task" object.</returns>
        public async Task<ToDoListTask> GetTaskDetails(int id)
        {
            ///A variable named "task" is created, and instantiated with a LINQ query.
            ///The query SELECTS all records from the ToDoListTask table WHERE the taskID value of the record matches the value of the "id" parameter
            var task = from t in connAsync.Table<ToDoListTask>()
                       where t.taskID == id
                       select t;
            
            ///Using the "FirstOrDefaultAsync" method of the "task" variable, the first record that matches the LINQ query is retrieved from the database
            ///(There should only be 1 matching record).
            ///The values from that record are then used to instantiate a ToDoListTask object, which is then returned to the caller.
            return await task.FirstOrDefaultAsync();
        }

        //-------------------------------------------------------------------

        ///--------- Campus Map methods ---------------

        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is used to instantiate and return a List of "MapLocation" objects.
        /// This method is called when the user launches the "CampusMaps" page.
        /// </summary>
        /// <returns>This method returns an "ObservableCollection" of MapLocation objects</returns>
        public ObservableCollection<MapLocation> GetAllLocations()
        {          
            ///Create and instantiate an ObservableCollection object, called "allLocations", which will contain MapLocation objects.
            ObservableCollection<MapLocation> allLocations = new ObservableCollection<MapLocation>();
            
            ///Instantiate 5 MapLocation objects, passing 5 values to the object constructor. Each time an object is created,
            ///it is added to the "allLocations" ObservableCollection
            allLocations.Add(new MapLocation("B100", "Classroom B100", 53.049888165360315, -2.99382285460766, 0));
            allLocations.Add(new MapLocation("C100", "Classroom C100", 53.049520553036494, -2.994036090199386, 1));
            allLocations.Add(new MapLocation("D100", "Classroom D100", 53.049582628144314, -2.9929055391696155, 2));
            allLocations.Add(new MapLocation("Cafe", "Ial Cafe", 53.04889742433294, -2.993014895621946, 3));
            allLocations.Add(new MapLocation("Student Services", "Student Service Desk", 53.048814387458435, -2.9928231176998277, 4));

            ///The "allLocations" ObservableCollection is returned to the caller
            return allLocations;
        }


        //-------------------------------------------------------------------

        ///--------- Subject object methods ---------------

        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters and returns no object.
        /// This method is used to instantiate 3 "Subject" objects, and store them as records in the database, for the purposes of this prototype app.
        /// This method is called as part of the constructor method for this class definition.
        /// </summary>
        private void PopulateSubjects()
        {
            ///3 Subject objects are created, each time passing 3 parameters to the object constructor. Each newly created Subject object is 
            ///added to the "allSubjects" local ObservableCollection property
            allSubjects.Add(new Subject(0, "English", Color.FromRgb(0, 255, 0)));
            allSubjects.Add(new Subject(1, "Science", Color.FromRgb(255, 0, 0)));
            allSubjects.Add(new Subject(2, "PE", Color.FromRgb(255, 255, 0)));
        }

        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is used to return the local ObservableCollection object "allSubjects" to the caller.
        /// This method is called whenever the application needs to query the list of available subjects that a to do list task, a note or a lesson can be categorized into
        /// </summary>
        /// <returns>This method returns an "ObservableCollection" of Subject objects</returns>
        public ObservableCollection<Subject> GetAllSubjects()
        {
            return allSubjects;
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is used to return a string object that represents the name assigned to a particular "Subject" object.
        /// This method is called whenever the application needs to know the name assigned to a Subject object
        /// </summary>
        /// <param name="subjectID">This parameter represents the unique identifier for the Subject object that the application is requesting the name of</param>
        /// <returns>This method returns a nullable string object</returns>
        public string? GetSubjectName(int subjectID)
        {

            ///Foreach loop.
            ///Loops through each index in the "allSubjects" ObservableCollection, and on each iteration, assigns the "Subject" object referenced by the index
            ///to the "subject" Subject object
            foreach(Subject subject in allSubjects)
            {
                //For each Subject in the allSubjects collection

                ///If statement
                ///First, get the integer value that is returned when the "GetID" method is called on the "subject" object. 
                ///If the returned integer is equal to the "subjectID" parameter, 
                ///then the Subject object currently referenced by "subject" is the Subject object that the application wishes to know the name of
                if (subject.GetID() == subjectID)
                {
                    ///Call the "GetName" method on the "subject" object. This will return the string value representing the name of the Subject object.
                    ///This string value is then returned to the caller.
                    return subject.GetName();
                }
            }

            ///If none of the Subject objects within the "allSubjects" ObservableCollection had a unique ID matching the "subjectID" parameter, then the method
            ///will return a null value
            return null;
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is used to return a Color object that represents the colour assigned to a particular "Subject" object.
        /// This method is called whenever the application needs to know the colour assigned to a Subject object
        /// </summary>
        /// <param name="subjectID">This parameter represents the unique identifier for the Subject object that the application is requesting the colour of</param>
        /// <returns>This method returns a Color object</returns>
        public Color GetSubjectColour(int subjectID)
        {

            ///Foreach loop.
            ///Loops through each index in the "allSubjects" ObservableCollection, and on each iteration, assigns the "Subject" object referenced by the index
            ///to the "subject" Subject object
            foreach (Subject subject in allSubjects)
            {

                //For each Subject in the allSubjects collection

                ///If statement
                ///First, get the integer value that is returned when the "GetID" method is called on the "subject" object. 
                ///If the returned integer is equal to the "subjectID" parameter, 
                ///then the Subject object currently referenced by "subject" is the Subject object that the application wishes to know the colour of
                if (subject.GetID() == subjectID)
                {
                    ///Call the "GetColour" method on the "subject" object. This will return the Color value representing the colour of the Subject object.
                    ///This Color value is then returned to the caller.
                    return subject.GetColour();
                }
            }

            ///If none of the Subject objects within the "allSubjects" ObservableCollection had a unique ID matching the "subjectID" parameter, then the method
            ///will return a null value
            return null;
        }


        //-------------------------------------------------------------------

        ///--------- Note object methods ---------------


        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is defined "async".
        /// This method is used to perform a SELECT query on the "Note" table in the database, and then return all records as a List of "Note" objects.
        /// This method is called when the "Notes.xaml.cs" requests all notes from the database, in order to display them.
        /// </summary>
        /// <returns>The method returns a List of Note objects, stored within a "Threading.Tasks.Task" object.</returns>
        public async Task<List<Note>> GetAllNotes()
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///Using the "ToListAsync" method on a specific "Table" property of the "connAsync" object, retrieve all of the records in the "Note"
            ///table, create a "Note" object for each record, then create a List containing all of these "Note" objects.
            ///This list of objects is then returned to the caller.
            return await connAsync.Table<Note>().ToListAsync();
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 1 parameter.
        /// This method is defined "async".
        /// This method is used to perform a DELETE query on the "Note" table in the database, in order to delete a single record.
        /// This method is called when the user deletes a note from the notes page.
        /// </summary>
        /// <param name="id">This parameter represents the unique ID for the note that the user has deleted</param>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task RemoveNoteFromDatabase(int id)
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///Using the "DeleteAsync" method on a specific "Table" property of the "connAsync" object, delete a single record from the "Note"
            ///table, by using the value of "id" to indicate which record to delete.
            await connAsync.DeleteAsync<Note>(id);
        }


        /// <summary> 
        /// Public method definition.
        /// This method accepts 7 parameters.
        /// This method is defined "async".
        /// This method is used to instantiate a "Note" object, and then store the properties of that object to a record in the database.
        /// This method is called when the user creates a new note on the notes page.
        /// </summary>        
        /// <param name="title">This string parameter represents the title of the newly created note</param>
        /// <param name="text">This string parameter represents the text field of the newly created note</param>
        /// <param name="subjectID">This integer parameter represents the unique ID for the Subject Object that has been associated with the newly created note</param>
        /// <param name="audio">This string parameter represents the path to the audio file for the newly created note</param>
        /// <param name="video">This string parameter represents the path to the video file for the newly created note</param>
        /// <param name="currentDateTime">This DateTime parameter represents the date that the note was created</param>
        /// <param name="noteID">This integer parameter represents the unique identifier for the newly created note</param>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public async Task AddNoteToDatabase(string title, string text, int subjectID, string audio, string video, DateTime currentDateTime, int noteID)
        {

            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            await Init();

            ///First, create a new "Note" object, using the 7 passed parameters as the properties of the new object.
            ///Then, using the "InsertASync" method of the "connAsync" object, insert a new record into the "Note" table in the SQLite database, using the properties of the new Note object
            ///as the values of the record.
            await connAsync.InsertAsync(new Note { noteTitle = title, noteText = text, subjectID = subjectID, noteAudio = audio, noteVideo = video, noteDate = currentDateTime, noteID = noteID });


        }


        //-------------------------------------------------------------------

        ///--------- Lesson object methods ---------------

        /// <summary>
        /// Public method definition.
        /// This method accepts 0 parameters.
        /// This method is defined "async".
        /// This method is used, for the purposes of this prototype, to create Lesson objects that will be used to build the student's timetable
        /// This method is called when the user navigates to the Calendar page, once per app execution.
        /// </summary>
        /// <returns>The method returns a "Threading.Tasks.Task" object, representing the thread that this asynchronous task
        /// is being executed on.</returns>
        public void PopulateLessons()
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            Init();

            ///Using the "DeleteAllAsync" method on a specific "Table" property of the "connAsync" object, delete all records from the "Lesson" table
            connSync.DeleteAll<Lesson>();


            ///Declare and instantiate a new "Random" object called randomiser. This object will be used to select random subjects, tutors and classrooms for each timetabled
            ///lesson that will be added to the calendar
            Random randomiser = new Random();

            ///Declare and instantiate a new DateTime object called workingDate. This object will be used to assign a value to the "lessonDate" property of newly created Lesson objects
            ///The initial value for "workingDate" is 50 days before the current date and time (obtained by calling the "AddDays" method (passing a value of -50)
            ///on the DateTime object that is returned when the "Now" method of the DateTime class is called)
            DateTime workingDate = DateTime.Now.AddDays(-50);


            ///For loop.
            ///Iterator = i
            ///Initial value of i = 0
            ///Increment value = 1
            ///Condition = value of i is less than 100
            for (int i = 0;i< 100;i++)
            {
                ///This for loop represents 100 days. This method will populate 100 days worth of timetabled lessons, around the current date

                ///While loop
                ///Condition = while the "DayOfWeek" property of the "workingDate" object is equal to the enum value of "DayOfWeek.Saturday" or "DayOfWeek.Sunday"
                while (workingDate.DayOfWeek == DayOfWeek.Saturday || workingDate.DayOfWeek == DayOfWeek.Sunday)
                {
                    ///If the While loop condition is met, the "AddDays" method is called on the "workingDate" object, passing 1 as a parameter. Then this 
                    ///new value is re-assigned to the workingDate object. This will advance the current 
                    ///date assigned to "workingDate" by 1 day.
                    workingDate = workingDate.AddDays(1);

                    ///This while loop will ensure that the date value of "workingDate" is not on a weekend.
                }


                ///For loop.
                ///Iterator = j
                ///Initial value of j = 0
                ///Increment value = 1
                ///Condition = value of j is less than 7
                for (int j = 0;j<7;j++)
                {

                    ///This for loop represents 7 lessons within a day. This method will populate 7 timetabled lessons per day

                    ///Using the Random object created earlier in the method definition, values for the properties for the Lesson object that will be created
                    ///are assigned here.
                    ///"subjectID" is assigned a random integer between 0 and 2. This represents 1 of the 3 subjects that exist in this prototype version of the app.
                    ///"tutor" is assigned the string value that corresponds to the value contained within the index of the "tutors" List that is referenced by a random integer between 0 and 4
                    ///"classroom" is assigned the string value that corresponds to the value contained within the index of the "classrooms" List that is referenced by a random integer between 0 and 6
                    int subjectID = randomiser.Next(0,3);
                    string tutor = tutors[randomiser.Next(0,5)];
                    string classroom = classrooms[randomiser.Next(0,7)];


                    ///First, create a new "Lesson" object, using 6 values as the properties of the new object. These values are:
                    ///------The string value returned when the "GetName" method is called on the Subject object that is referenced by the object in the "subjectID" index of the "allSubjects" ObservableCollection
                    ///------The integer value that was randomly generated and assigned to "subjectID"
                    ///------The string value that was retrieved from the "tutors" List using a randomly generated integer, and then assigned to "tutor"
                    ///------The string value that was retrieved from the "classrooms" List using a randomly generated integer, and then assigned to "classroom"
                    ///------The current value of "workingDate" (representing the date of the lesson)
                    ///------The current value of "j" (representing the lesson period for the lesson)
                    ///Then, using the "InsertASync" method of the "connAsync" object, insert a new record into the "Lesson" table in the SQLite database, using the properties of the new Lesson object
                    ///as the values of the record.
                    connSync.Insert(new Lesson { lessonTitle = allSubjects[subjectID].GetName(), subjectID = subjectID, lessonTutor = tutor, lessonClassroom = classroom, lessonDate = workingDate, lessonTimePeriod = j });
                }

                //--Increment the value of "workingDate" by 1, by calling the "AddDays" method and passing a value of 1. This will cause the next iteration of the outer for loop
                //--to create Lesson objects for the next date in the calendar.
                workingDate = workingDate.AddDays(1);
            }

            
        }


        /// <summary>
        /// Public method definition.
        /// This method accepts 2 parameters.
        /// This method is defined "async".
        /// This method is used to perform a SELECT query on the "Note" table in the database, filter the returned records, then return the filtered records as a List of "Lesson" objects.
        /// This method is called when the "Calendar.xaml.cs" requests all lessons from the database that are timetabled within a specific calendar month.
        /// </summary>
        /// <param name="month">This integer parameter represents the calendar month that the user currently has displayed on the Calendar Page</param>
        /// <param name="year">This integer parameter represents the calendar year that the user currently has displayed on the Calendar Page</param>
        /// <returns>The method returns a List of Lesson objects, stored within a "Threading.Tasks.Task" object.</returns>
        public List<Lesson> GetLessonsForMonth(int month, int year)
        {
            ///Call the Init method to instantiate the database connection object, if not already instantiated, and create the database tables, if 
            ///not already created
            Init();
            
            //Create and instantiate a new List object, called "lessonsThisMonth", which will contain "Lesson" objects
            List<Lesson> lessonsThisMonth = new List<Lesson>();

            ///Using the "ToListAsync" method on a specific "Table" property of the "connAsync" object, retrieve all of the records in the "Lesson"
            ///table, create a "Lesson" object for each record, then create a List containing all of these "Lesson" objects.            
            List<Lesson> allLessons = connSync.Table<Lesson>().ToList();


            ///Foreach loop.
            ///Loops through each index in the "allLessons" List, and on each iteration, assigns the "Lesson" object referenced by the index
            ///to the "lesson" Lesson object
            foreach (Lesson lesson in allLessons)
            {
                //For each Lesson in the allLessons List

                ///If statement
                ///First, get the integer value of the Month property (of the "lessonDate" property) of the lesson object.
                ///Then, get the integer value of the Year property (of the "lessonDate" property) of the lesson object.
                ///If the returned integer for Month is equal to the "month" parameter and the the returned integer for Year is equal to the "year" parameter, 
                ///then the Lesson object currently referenced by "lesson" is lesson within the current calendar month
                if (lesson.lessonDate.Month == month && lesson.lessonDate.Year == year)
                {
                    ///If the Lesson object currently referenced by "lesson" is lesson within the current calendar month, 
                    ///add it to the "lessonsThisMonth" list
                    lessonsThisMonth.Add(lesson);
                }
            }

            ///return the "lessonsThisMonth" List, which contains all of the Lesson objects that are timetabled within the current calendar month
            return lessonsThisMonth;
            

        }

    }
}
