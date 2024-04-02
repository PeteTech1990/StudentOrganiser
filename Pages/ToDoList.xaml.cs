using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages
{
    public partial class ToDoList : ContentPage
    {
        
        //AllTasks allToDos = new AllTasks();
        List<TodoTaskView> todoTaskViews = new List<TodoTaskView>();

        public ToDoList()
        {
            InitializeComponent();

            GetAllTasks();

            AddTask.Clicked += NewTask;
            //Counter.Clicked -= OnCounterClicked; To Unsubscribe
        }

        private async void NewTask(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new AddTaskModal());

            await App.databaseConnector.AddTaskToDatabase("Clean the Fridge", "Remove all the mould, throw old food", true, "Food Studies", DateTime.Now.AddDays(7));
            
            GetAllTasks();
            
        }

        public async void GetAllTasks()
        {
            List<ToDoListTask> allTasks = await App.databaseConnector.GetAllToDoListTasks();

            this.allTasks.Children.Clear();

            foreach (ToDoListTask task in allTasks)
            {
                TodoTaskView newTaskView = new TodoTaskView(this, task);
                this.allTasks.Children.Add(newTaskView.GetView());
                todoTaskViews.Add(newTaskView);
            }


        }

        public async void ClearTask(int idToClear)
        {

            int indexNo = 0;

            foreach (TodoTaskView task in todoTaskViews)
            {
                if(task.GetTaskID() == idToClear)
                {
                    await App.databaseConnector.RemoveTaskFromDatabase(idToClear);
                    this.allTasks.Children.RemoveAt(indexNo);
                    todoTaskViews.RemoveAt(indexNo);
                    break;
                }
                indexNo++;
            }
        }

        
    }

}
