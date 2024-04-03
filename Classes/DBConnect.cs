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

namespace StudentOrganiser.Classes
{
    public class DBConnect
    {
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
            allSubjects.Add(new Subject(0, "Science", Color.FromRgb(255, 0, 0)));
            allSubjects.Add(new Subject(0, "PE", Color.FromRgb(255, 255, 0)));
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
        //public async Task<List<MapLocation>> GetAllLocations()
        //{
        //    await Init();

        //    return await conn.Table<MapLocation>().ToListAsync();
        //}

        //public async Task AddMapLocationToDatabase(string label, string address, double locationPoint1, double locationPoint2)
        //{
        //    int result = 0;
        //    await Init();

        //    result = await conn.InsertAsync(new MapLocation { label = label, address = address, locationPoint1 = locationPoint1, locationPoint2 = locationPoint2 });


        //}

    }
}
