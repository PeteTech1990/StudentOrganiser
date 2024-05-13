using StudentOrganiser.Classes;
using Color = System.Drawing.Color;

namespace StudentOrganiser.Pages
{
    public partial class ToDoList : ContentPage
    {

        
        List<ToDoTaskGroup> toDoTaskGroups = new List<ToDoTaskGroup>();
        List<TodoTaskView> todoTaskViews = new List<TodoTaskView>();

        public ToDoList()
        {
            InitializeComponent();

            GetSortAndDisplayAllTasks();

            AddTask.Clicked += NewTask;
            this.NavigatedTo += NavToEvent;

            sortSelect.Items.Add("Date");
            sortSelect.Items.Add("Subject");
            sortSelect.Items.Add("Priority");

            sortSelect.SelectedIndex = 0;

            sortLabel.Text = $"Sorted By: {sortSelect.SelectedItem.ToString()}";
            //Counter.Clicked -= OnCounterClicked; To Unsubscribe
        }

        private class ToDoTaskGroup(string title)
        {
            private string title = title;
            private List<ToDoListTask> todoTasks = new List<ToDoListTask>();
            

            public void AddTask(ToDoListTask taskToAdd)
            {
                todoTasks.Add(taskToAdd);
            }

            public string GetTitle()
            {
                return title;
            }

            public List<ToDoListTask> GetTasks()
            {
                return todoTasks;
            }
        }

        private async void NewTask(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new AddTaskModal());

            
        }

        public async void GetSortAndDisplayAllTasks()
        {
            List<ToDoListTask> allToDoTasks = await App.databaseConnector.GetAllToDoListTasks();

            SortTasks(allToDoTasks, sortSelect.SelectedItem.ToString());

            this.allTasks.Children.Clear();
            

            foreach (ToDoTaskGroup taskGroup in toDoTaskGroups)
            {
                VerticalStackLayout taskGroupView = new VerticalStackLayout();
                Label groupLabel = new Label();
                groupLabel.Text = taskGroup.GetTitle();
                taskGroupView.Children.Add(groupLabel);
                taskGroupView.Spacing = 5;

                foreach (ToDoListTask task in taskGroup.GetTasks())                
                {                  
                    
                    TodoTaskView newTaskView = new TodoTaskView(this, task);
                    taskGroupView.Children.Add(newTaskView.GetView());                    
                }

                this.allTasks.Children.Add(taskGroupView);
            }

        }

        private void SortTasks(List<ToDoListTask> allToDoTasks, string sortType)
            {

            toDoTaskGroups.Clear();

            switch (sortType) 
            {
                case "Date":
                    allToDoTasks = allToDoTasks.OrderBy(t => t.GetDueDate()).ToList();
                    break;
                case "Subject":
                    allToDoTasks = allToDoTasks.OrderBy(t => t.GetSubjectName()).ThenBy(t => t.GetDueDate()).ToList();
                    break;
                case "Priority":
                    allToDoTasks = allToDoTasks.OrderBy(t => t.GetImportanceValue()).ThenBy(t => t.GetDueDate()).ToList();
                    break;
            }
                
            foreach(ToDoListTask task in allToDoTasks) 
            {
                ToDoTaskGroup taskGroup = null;

                if (sortType == "Priority")
                {
                    var group = from t in toDoTaskGroups
                                where t.GetTitle() == (task.GetImportance() ? "Important" : "Normal")
                                select t;
                    if(group.Count() < 1) 
                    {
                        ToDoTaskGroup newGroup = new ToDoTaskGroup(task.GetImportance() ? "Important" : "Normal");
                        taskGroup = newGroup;
                        toDoTaskGroups.Add(newGroup);
                    }
                    else
                    {
                        taskGroup = group.FirstOrDefault();
                    }

                }

                if (sortType == "Date")
                {
                    var group = from t in toDoTaskGroups
                                where t.GetTitle() == (task.GetDueDate() > DateTime.Today.AddDays(7) ? "Future" : "This Week")
                                select t;
                    if (group.Count() < 1)
                    {
                        ToDoTaskGroup newGroup = new ToDoTaskGroup(task.GetDueDate() > DateTime.Today.AddDays(7) ? "Future" : "This Week");
                        taskGroup = newGroup;
                        toDoTaskGroups.Add(newGroup);
                    }
                    else
                    {
                        taskGroup = group.FirstOrDefault();
                    }

                }

                if (sortType == "Subject")
                {
                    var group = from t in toDoTaskGroups
                                where t.GetTitle() == (task.GetSubjectName())
                                select t;
                    if (group.Count() < 1)
                    {
                        ToDoTaskGroup newGroup = new ToDoTaskGroup(task.GetSubjectName());
                        taskGroup = newGroup;
                        toDoTaskGroups.Add(newGroup);
                    }
                    else
                    {
                        taskGroup = group.FirstOrDefault();
                    }

                }

                taskGroup.AddTask(task);


            }

            }

        private void NavToEvent(object sender, NavigatedToEventArgs e)
        {
            GetSortAndDisplayAllTasks();
        }

        public async void ClearTask(int idToClear)
        {

            int indexNo = 0;

            foreach (TodoTaskView task in todoTaskViews)
            {
                ToDoListTask ToDoTask = task.GetToDoTask();

                if(ToDoTask.GetID() == idToClear)
                {
                    if(ToDoTask.GetRecurrence() != 0)
                    {
                        await App.databaseConnector.AddTaskToDatabase(ToDoTask.GetTitle(), ToDoTask.GetDescription(), ToDoTask.GetImportance(), ToDoTask.GetSubjectID(), ToDoTask.GetDueDate().AddDays(ToDoTask.GetRecurrence()), ToDoTask.GetRecurrence()); ;
                    }
                    await App.databaseConnector.RemoveTaskFromDatabase(idToClear);
                    this.allTasks.Children.RemoveAt(indexNo);
                    todoTaskViews.RemoveAt(indexNo);
                    break;
                }
                indexNo++;
            }
        }

        public void SortSelectionChanged(object sender, EventArgs e)
        {
            sortLabel.Text = $"Sorted By: {sortSelect.SelectedItem.ToString()}";

            GetSortAndDisplayAllTasks();
        }
    }

}
