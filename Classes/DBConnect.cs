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

namespace StudentOrganiser.Classes
{
    public class DBConnect
    {
        public List<string> classrooms = new List<string>() { "C110", "D110", "E110", "F110", "G110", "H110", "I110" };
        public List<string> tutors = new List<string>() { "Mr Griffiths", "Mrs Rutter", "Mr Gilmartin", "Mr Jones", "Mrs Summers" };

        private SQLiteAsyncConnection conn;
        string dbPath;
        private ObservableCollection<Subject> allSubjects = new ObservableCollection<Subject>();

        public DBConnect(string dbPath) 
        {
            this.dbPath = dbPath;
            PopulateSubjects();
        }

        //https://learn.microsoft.com/en-us/training/modules/store-local-data/4-exercise-store-data-locally-with-sqlite
        public async Task Init()
        {
            if (conn != null)
                return;

            conn = new SQLiteAsyncConnection(dbPath);

            await conn.CreateTableAsync<ToDoListTask>();
            await conn.CreateTableAsync<Note>();
            await conn.CreateTableAsync<Lesson>();
        }

        public async Task AddTaskToDatabase(string title, string description, bool importance, int subjectID, DateTime dueDate, int recurrenceAddition)
        {
            int result = 0;
            await Init();

            result = await conn.InsertAsync(new ToDoListTask { taskTitle = title, taskDescription = description, taskImportance = importance, subjectID = subjectID, taskDueDate = dueDate, recurrenceAddition = recurrenceAddition });


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
            Random subjectRandomiser = new Random();
            Random tutorRandomiser = new Random();
            Random classroomRandomiser = new Random();

            DateTime lessonDateAssigned = Convert.ToDateTime("03/01/2024");

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

                lessonDateAssigned.AddDays(1);
            }

            
        }

        public async Task<List<Lesson>> GetLessonsForMonth(int month, int year)
        {
            await Init();

            

           var lessons = from t in conn.Table<Lesson>()
                       where t.lessonDate.Month == month && t.lessonDate.Year == year
                       select t;
            List<Lesson> result = await lessons.ToListAsync();
            return result;
            

        }



    }
}
